import time, logging
from abc import ABC, abstractmethod
from typing import Any, Callable, NewType, Tuple, List
from pandas import DataFrame
from sqlite3 import Cursor
from dataclasses import dataclass

Path = NewType('Path', str)

logging.basicConfig(level=logging.INFO, format='[%(levelname)s] %(asctime)s %(message)s')

def timer(func:Callable)->Callable:
    def timed(*args:Any, **kwargs:Any)->Any:
        b = time.perf_counter()
        r = func(*args, **kwargs)
        e = time.perf_counter()
        logging.info(f'time lapsed(s) : {e-b:,.2f}')
        return r
    return timed

class ColorSpace:
    '''CIE1931 to CIE196'''
    @staticmethod
    def xy2uv(x:float, y:float)->Tuple:
        u:float = (4 * x) / (12 * y - 2 * x + 3)
        v:float = (9 * y) / (12 * y - 2 * x + 3)
        return u, v

    @staticmethod
    def xy2u(x:float, y:float, offset:float=.0)->float:
        return (4 * x) / (12 * y - 2 * x + 3) + offset

    @staticmethod
    def xy2v(x:float, y:float, offset:float=.0)->float:
        return (9 * y) / (12 * y - 2 * x + 3) + offset