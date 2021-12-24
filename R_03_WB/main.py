
from library.core import (
    PBM_FileStruct,
    PBM_Wrangler, 
    Holder, 
    Path
)

def main()->None:
    root:Path    = './src'
    pfs          = PBM_FileStruct()
    holder       = Holder()
    offset:float = .0
    
    pw = PBM_Wrangler(pfs, root, holder, offset)
    pw.work('./data/wb.db', 'wb')

if __name__ == '__main__':
    main()