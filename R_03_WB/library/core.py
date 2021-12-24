"""
this module wrangles White Balance from SSVE inline production line.
it has the following functionalities.
- enumerate all source files from a given folder recursively
- clean dataframe
- convert CIE1931(xy) to CIE1976(u'v')
- segregate all-color-temperatures(5) into 4 sub-dataframe per color temperature: COOL, NEUTRAL, WARM, EXPERT1
- dump cleaned dataframes into csv per color temperature

Author
- @ZL, 20211220

Changelog
- v0.01, initial build
- v0.02, refactor categorize and concat functions
- v0.03, add fieds: ser, Level to the final output *.csv files
- v0.04, refactor design patter(Builder)
- v0.05, builder pipeline to dump all data into database

"""

from __future__ import annotations
import numpy as np
import pandas as pd
import pathlib
from .holder import Holder
from .pbm import PBM_FileStruct
from .utility import (
    List, Path, DataFrame,
    logging, timer,
    ColorSpace
)


class PBM_Wrangler:
    dst_folder:Path = './data'
    engine:str      = 'python'

    def __init__(self, pbm:PBM_FileStruct, src_folder:Path, holder:Holder, offset:float=None) -> None:
        """initialize an instance with a given folder with source PBM_*.CSV log files inside
        Args:
            src_folder (Path): a given folder with source PBM_*.CSV log files inside
        """
        self._src_folder  = src_folder
        self._pbm         = pbm
        self._holder      = holder
        self._offset      = offset

    def _filter(self)->Path:
        for path in sorted(pathlib.Path(self._src_folder).rglob(f'*{self._pbm.fn_ext}')):
            if path.name.startswith(self._pbm.fn_prefix):
                yield path.absolute()

    def __read(self, pbm_file:Path)->None:
        df:DataFrame               = pd.read_csv(pbm_file, skiprows=self._pbm.dummy_rows, engine=self.engine)
        df[self._pbm.head_picmode] = self._pbm.temp_names
        df[self._pbm.head_ser]     = self.__parse(pbm_file, self._pbm.idx_ser)
        df[self._pbm.head_date]    = self.__parse(pbm_file, self._pbm.idx_date)
        self._holder.temporary     = df[np.isin(df[self._pbm.head_level], self._pbm.ires)]
        self._holder.agg(df)

    def __parse(self, pbm_file:Path, idx:int)->str:
        emptyStr:str = ''
        return pathlib.Path(pbm_file).name.replace(self._pbm.fn_ext, emptyStr).split(self._pbm.fn_sep)[idx]

    def __categorize(self, color_temp:str, dst_df:List[DataFrame])->None:
        df:DataFrame         = self._holder.temporary[self._holder.temporary[self._pbm.head_picmode] == color_temp].loc[:, self._pbm.head_xy]
        df[self._pbm.head_u] = df.apply(lambda df: ColorSpace.xy2u(df[self._pbm.head_x], df[self._pbm.head_y], self._offset), axis=1)
        df[self._pbm.head_v] = df.apply(lambda df: ColorSpace.xy2v(df[self._pbm.head_x], df[self._pbm.head_y], self._offset), axis=1)
        fixed_df:DataFrame   = df.loc[:, self._pbm.head_uv]
        dst_df.append(fixed_df)

    def __wrangle(self)->None:
        for color_temp, df_ct in zip(self._holder.colors, self._holder.colorTemps):
            self.__categorize(color_temp, df_ct)
        self._holder.reset()

    def __concat(self, color_temp:str, src_df:List[DataFrame])->None:
        df:DataFrame = pd.concat(src_df, ignore_index=True, sort=False)
        df.to_csv(f'{self.dst_folder}/{color_temp}.csv', index=False)

    def __to_csv(self)->None:
        for color_temp, df_ct in zip(self._holder.colors, self._holder.colorTemps):
            if df_ct: self.__concat(color_temp, df_ct)

    @timer
    def work(self, dstDB:Path, table_name:str)->None:
        logging.info('start working..')
        for pbm_file in self._filter():
            self.__read(pbm_file)
            self.__wrangle()
        self.__to_csv()
        self._holder.to_sql(dstDB, table_name)
        # self._holder.to_csv('./src/raw.csv')
        self._holder.reset(how='all')
        logging.info('successed.')
