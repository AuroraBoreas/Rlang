"""
this module wrangles White Balance from SSVE inline production line.

it has the following functionalities.
- enumerate all source files from a given folder recursively
- clean dataframe
- convert CIE1931(xy) to CIE1976(u'v')
- segregate all-color-temperatures into 4 sub-dataframe per color temperature: COOL, NEUTRAL, WARM, EXPERT1
- dump cleaned dataframes into csv per color temperature

Author
- @ZL, 2021120

Changelog
- v0.01, initial build
- v0.02, refactor
- v0.03, add fieds: ser, Level to the final output *.csv files

"""

from aurora.utility.ctx import timer, logging
from typing import List, NewType, Tuple
import numpy as np
import pandas as pd
import pathlib

DataFrame = NewType('DataFrame', pd.DataFrame)
Path = NewType('Path', str)

class PBM_Wrangler:
    ser_idx:int           = 3
    fn_sep:str            = '_'
    fn_prefix:str         = 'PBM_'
    fn_ext:str            = 'CSV'
    head_x:str            = 'x(calc)'
    head_y:str            = 'y(calc)'
    head_ser:str          = 'ser'
    head_picmode:str      = 'picmode'
    head_level:str        = 'LEVEL'
    head_xy:List[str]     = [head_x, head_y, head_ser, head_level]
    head_u:str            = 'u'
    head_v:str            = 'v'
    head_uv:List[str]     = [head_u, head_v, head_ser, head_level]
    dummy_rows:List[int]  = [i for i in range(33)] + [92, 93] + [152, 153] + [212, 213] + [272, 273] # may change overtime..
    levels:int            = 57
    temp_names:List[str]  = ['COOL'] * levels + ['NEUTRAL'] * levels + ['WARM'] * levels + ['EXPERT1'] * levels + ['PHOTO'] * levels
    ires:List[int]        = [12, 23, 34, 45]
    color_temps:List[str] = ['COOL', 'NEUTRAL', 'WARM', 'EXPERT1']

    df_temp:DataFrame            = None
    df_cools:List[DataFrame]     = []
    df_neutrals:List[DataFrame]  = []
    df_warms:List[DataFrame]     = []
    df_expert1s:List[DataFrame]  = []
    df_cts:List[List[DataFrame]] = [df_cools, df_neutrals, df_warms, df_expert1s] # note: match with color_temps

    def __init__(self, src_folder:Path) -> None:
        """initialize an instance with a given folder with source PBM_*.CSV log files inside

        Args:
            src_folder (Path): a given folder with source PBM_*.CSV log files inside
        """
        self._src_folder = src_folder

    def _filter(self)->Path:
        for path in sorted(pathlib.Path(self._src_folder).rglob(f'*.{self.fn_ext}')):
            if path.name.startswith(self.fn_prefix):
                yield path.absolute()

    @staticmethod
    def xy2uv(x:float, y:float)->Tuple:
        u = (4 * x) / (12 * y - 2 * x + 3)
        v = (9 * y) / (12 * y - 2 * x + 3)
        return u, v

    def xy2u(self, x:float, y:float, offset:float=.0)->float:
        return (4 * x) / (12 * y - 2 * x + 3) + offset

    def xy2v(self, x:float, y:float, offset:float=.0)->float:
        return (9 * y) / (12 * y - 2 * x + 3) + offset

    def __read(self, pbm_file:Path)->None:
        df:DataFrame = pd.read_csv(pbm_file, skiprows=self.dummy_rows, engine='python')
        df[self.head_picmode] = self.temp_names
        df[self.head_ser] = self.__getSer(pbm_file)
        self.df_temp = df[np.isin(df[self.head_level], self.ires)]

    def __getSer(self, pbm_file:Path)->str:
        return pathlib.Path(pbm_file).name.split(self.fn_sep)[self.ser_idx]

    def __categorize(self, color_temp:str, dst_df:List[DataFrame])->None:
        df:DataFrame = self.df_temp[self.df_temp[self.head_picmode] == color_temp].loc[:, self.head_xy]
        df[self.head_u] = df.apply(lambda df: self.xy2u(df[self.head_x], df[self.head_y]), axis=1)
        df[self.head_v] = df.apply(lambda df: self.xy2v(df[self.head_x], df[self.head_y]), axis=1)
        fixed_df = df.loc[:, self.head_uv]
        dst_df.append(fixed_df)

    def __reset(self, how:str=None)->None:
        self.df_temp = None
        if how == 'all':
            for df in self.df_cts: df.clear()

    def __wrangle(self)->None:
        for color_temp, df_ct in zip(self.color_temps, self.df_cts):
            self.__categorize(color_temp, df_ct)
        self.__reset()

    def __concat(self, color_temp:str, src_df:List[DataFrame])->None:
        df:DataFrame = pd.concat(src_df, ignore_index=True, sort=False)
        df.to_csv(f'./src/{color_temp}.csv', index=False)

    def __tocsv(self)->None:
        for color_temp, df_ct in zip(self.color_temps, self.df_cts):
            if df_ct: self.__concat(color_temp, df_ct)

    @timer
    def work(self)->None:
        logging.info('start working..')
        for pbm_file in self._filter():
            self.__read(pbm_file)
            self.__wrangle()
        self.__tocsv()
        self.__reset(how='all')
        logging.info('successed.')
