from aurora.utility.ctx import timer, logging
from typing import List, NewType, Tuple
import numpy as np
import pandas as pd
import pathlib

DataFrame = NewType('DataFrame', pd.DataFrame)
Path = NewType('Path', str)

class PBM_Wrangler:
    fn_prefix:str         = 'PBM_'
    fn_ext:str            = 'CSV'
    head_x:str            = 'x(calc)'
    head_y:str            = 'y(calc)'
    head_xy:List[str]     = [head_x, head_y]
    head_picmode:str      = 'picmode'
    head_level:str        = 'LEVEL'
    head_u:str            = 'u'
    head_v:str            = 'v'
    head_uv:List[str]     = [head_u, head_v]
    dummy_rows:List[int]  = [i for i in range(33)] + [92, 93] + [152, 153] + [212, 213] + [272, 273] # may change overtime..
    levels:int            = 57
    temps:List[str]       = ['COOL'] * levels + ['NEUTRAL'] * levels + ['WARM'] * levels + ['EXPERT1'] * levels + ['PHOTO'] * levels
    ires:List[int]        = [12, 23, 34, 45]

    df_temp:DataFrame           = None
    df_cools:List[DataFrame]    = []
    df_neutrals:List[DataFrame] = []
    df_warms:List[DataFrame]    = []
    df_expert1s:List[DataFrame] = []

    def __init__(self, src_folder:Path) -> None:
        self._src_folder = src_folder

    def _filter(self)->Path:
        for path in sorted(pathlib.Path(self._src_folder).glob(f'*.{self.fn_ext}')):
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

    def __read(self)->None:
        for pbm_file in self._filter():
            df:DataFrame = pd.read_csv(pbm_file, skiprows=self.dummy_rows, engine='python')
            df[self.head_picmode] = self.temps
            self.df_temp = df[np.isin(df[self.head_level], self.ires)]

    def __categorize(self, color_temp:str, dst_df:List[DataFrame])->None:
        df:DataFrame = self.df_temp[self.df_temp[self.head_picmode] == color_temp].loc[:, [self.head_x, self.head_y]]
        df[self.head_u] = df.apply(lambda x: self.xy2u(x[self.head_x], x[self.head_y]), axis=1)
        df[self.head_v] = df.apply(lambda x: self.xy2v(x[self.head_x], x[self.head_y]), axis=1)
        fixed_df = df.loc[:, self.head_uv]
        dst_df.append(fixed_df)
    
    def __wrangle(self)->None:
        self.__categorize('COOL', self.df_cools)
        self.__categorize('NEUTRAL', self.df_neutrals)
        self.__categorize('WARM', self.df_warms)
        self.__categorize('EXPERT1', self.df_expert1s)

    def __concat(self, color_temp:str, src_df:List[DataFrame])->None:
        df:DataFrame = pd.concat(src_df, ignore_index=True, sort=False)
        df.to_csv(f'./src/{color_temp}.csv', index=False)

    def __tocsv(self)->None:
        self.__concat('COOL', self.df_cools)
        self.__concat('NEUTRAL', self.df_neutrals)
        self.__concat('WARM', self.df_warms)
        self.__concat('EXPERT1', self.df_expert1s)
        
    @timer
    def work(self)->None:
        logging.info('start working..')
        self.__read()
        self.__wrangle()
        self.__tocsv()
        logging.info('successed.')