
from library.core import PBM_Wrangler, Path

def main()->None:
    root:Path = './data'
    pw = PBM_Wrangler(root)
    pw.work()

if __name__ == '__main__':
    main()
