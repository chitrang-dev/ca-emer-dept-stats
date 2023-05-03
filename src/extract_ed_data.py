import glob
import pandas as pd
#from IPython.display import display

dir_path = '/home/chitrang/Nextcloud/Home/src/EMER/data/*.xls?'

for file in glob.glob(dir_path, recursive=True):
    df = pd.read_excel(file, engine="openpyxl", sheet_name='Data', header=[0])
    #display(df.head(10))
    df.to_json(file + '.json', orient='records')
    print(file)
    #break
