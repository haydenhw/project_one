
from keras.utils import get_file
import requests
from bs4 import BeautifulSoup
base_url = 'https://dumps.wikimedia.org/other/pageviews/2021/2021-01/'
index = requests.get(base_url).text
soup_index = BeautifulSoup(index, 'html.parser')

# Find the links on the page
dumps = [a['href'] for a in soup_index.find_all('a') if 
         a.has_attr('href')]

# Download all pageviews files for Jan 20, 2021  
for d in dumps:
    file = d.split('-')

    if len(file) > 2:
        type_ = file[0]
        date = file[1]
        if date == '20210120' and type_== 'pageviews':
            file = ('-'.join(file))
            get_file(file, base_url + file)
