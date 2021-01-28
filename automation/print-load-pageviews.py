
# LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-000000' 
# INTO TABLE pageviews_jan20
# PARTITION (ts='2021-01-20:00')

import os
base_dir='/home/hayden/revature/projects/one/data/pageviews_jan20_select/' 

files = [filename for filename in os.listdir(base_dir)]
files.sort()

for f in files:
    hour = f.split('-')[2][:-4]
    print(f"""
LOAD DATA LOCAL INPATH '{base_dir + f}' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T{hour}');""")