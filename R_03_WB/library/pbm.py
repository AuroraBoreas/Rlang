"""
a simple class which abstracts all useful properties of PBM_*.CSV files.

Author:
- @ZL, 20211224

"""

from .utility import dataclass, List

@dataclass
class PBM_FileStruct:
    ser_idx:int      = 3
    fn_sep:str       = '_'
    fn_prefix:str    = 'PBM_'
    fn_ext:str       = 'CSV'
    head_x:str       = 'x(calc)'
    head_y:str       = 'y(calc)'
    head_ser:str     = 'ser'
    head_picmode:str = 'picmode'
    head_level:str   = 'LEVEL'
    head_u:str       = 'u'
    head_v:str       = 'v'
    levels:int       = 57

    @property
    def head_xy(self)->List[str]:
        return [self.head_x, self.head_y, self.head_ser, self.head_level]
    
    @property
    def head_uv(self)->List[str]:
        return [self.head_u, self.head_v, self.head_ser, self.head_level]

    @property
    def dummy_rows(self)->List[int]:
        return [i for i in range(33)] + [92, 93] + [152, 153] + [212, 213] + [272, 273] # may change overtime..

    @property
    def temp_names(self)->List[str]:
        return ['COOL'] * self.levels + ['NEUTRAL'] * self.levels + ['WARM'] * self.levels + ['EXPERT1'] * self.levels + ['PHOTO'] * self.levels

    @property
    def ires(self)->List[int]:
        return [12, 23, 34, 45]