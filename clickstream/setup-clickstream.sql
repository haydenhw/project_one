CREATE TABLE clickstream (
  referrer STRING,
  resource STRING,
  type STRING,
  occurrences INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/hayden/wiki-data/clickstream-enwiki-2020-12.tsv' INTO TABLE clickstream;

CREATE TABLE clickstream_samp
AS
SELECT * FROM clickstream 
DISTRIBUTE BY rand()
SORT BY rand()
LIMIT 500000;

-- want to 