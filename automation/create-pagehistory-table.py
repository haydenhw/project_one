import re

f = open("pagehistory-headings.txt", "r")

lines = f.readlines()

for l in lines:

    output = re.sub(r".*\"(.*)\".*", r"\1 STRING,", l)
    print(output, end='')

f.close()