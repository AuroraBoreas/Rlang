"""
a simple class which temporally holds buffers

Author:
- @ZL, 20211224

"""

import pandas as pd
import contextlib
import sqlite3
from .utility import (
    ABC, abstractmethod, 
    DataFrame, List,
    Path, Cursor,
    logging
)

@contextlib.contextmanager
def dml(table_name:str, cur:Cursor, act:str)->None:
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS {0}(
            LEVEL INTEGER,
            R INTEGER,
            G INTEGER,
            B INTEGER,
            x_calc DECIMAL,
            y_calc DECIMAL,
            Ycalc DECIMAL,
            x_target DECIMAL,
            y_target DECIMAL,
            Ytarget DECIMAL,
            STATUS TEXT,
            picmode TEXT,
            ser TEXT,
            date TEXT,

            UNIQUE(LEVEL, R, G, B, picmode, ser, date) ON CONFLICT IGNORE
        );
        """.format(table_name))
    try:
        yield
    finally:
        logging.info(f'SQL {act} completed')

class IHolder(ABC):
    @abstractmethod
    def reset(self, how:str=None)->None:
        raise NotImplementedError()
    
class Holder(IHolder):
    df_temp:DataFrame            = None
    df_temps:List[DataFrame]     = []
    df_cools:List[DataFrame]     = []
    df_neutrals:List[DataFrame]  = []
    df_warms:List[DataFrame]     = []
    df_expert1s:List[DataFrame]  = []
    df_cts:List[List[DataFrame]] = [df_cools, df_neutrals, df_warms, df_expert1s] # note: match with color_temps
    color_temps:List[str]        = ['COOL', 'NEUTRAL', 'WARM', 'EXPERT1']

    def __init__(self, how:str='all') -> None:
        self.reset(how)

    def reset(self, how:str=None) -> None:
        self.df_temp = None
        if how == 'all':
            self.df_temps.clear()
            for df in self.df_cts: df.clear()

    def to_sql(self, dstDB:Path, table_name:str)->None:
        heads = [
            'LEVEL',
            'R',
            'G',
            'B',
            'x_calc',
            'y_calc',
            'Ycalc',
            'x_target',
            'y_target',
            'Ytarget',
            'STATUS',
            'picmode',
            'ser',
            'date',
        ]

        if self.df_temps:
            df:DataFrame = pd.concat(self.df_temps, sort=False, ignore_index=True)
            df.columns = heads
            with sqlite3.connect(dstDB) as conn:
                cur = conn.cursor()
                with dml(table_name, cur, 'update'):
                    df.to_sql(table_name, conn, if_exists='append', index=False)

    def to_csv(self, dstPath:Path)->None:
        df:DataFrame = pd.concat(self.df_temps, sort=False, ignore_index=True)
        df.to_csv(dstPath, index=False)

    def agg(self, val:DataFrame)->None:
        self.df_temps.append(val)

    @property
    def temporary(self)->DataFrame:
        return self.df_temp

    @temporary.setter
    def temporary(self, val:DataFrame)->None:
        self.df_temp = val

    @property
    def colorTemps(self)->List[List[DataFrame]]:
        return self.df_cts

    @property
    def colors(self)->List[str]:
        return self.color_temps