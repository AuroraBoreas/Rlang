
from library.core import (
    PBM_FileStruct,
    PBM_Wrangler, 
    Holder, 
    Path
)

def main()->None:
    root:Path = './data'
    pfs       = PBM_FileStruct()
    holder    = Holder()
    
    pw = PBM_Wrangler(pfs, root, holder, .0)
    pw.work('./src/raw.db', 'wb')

if __name__ == '__main__':
    main()