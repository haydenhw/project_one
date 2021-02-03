-- DROP TABLE pageviews_jan20

CREATE TABLE pageviews_jan20 (
  domain_code STRING,
  page_title STRING,
  count_views INT,
  total_response_size INT
)
PARTITIONED BY (ts STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ' '
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-000000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T00')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-020000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T02')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-040000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T04')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-060000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T06')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-080000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T08')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-100000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T10')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-120000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T12')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-140000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T14')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-160000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T16')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-180000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T18')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-200000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T20')

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_jan20_select/pageviews-20210120-220000' 
INTO TABLE pageviews_jan20
PARTITION (ts='2021-01-20T22')

-- DROP TABLE pageviews_jan20_en 

CREATE TABLE pageviews_jan20_en
AS
SELECT * FROM pageviews_jan20 
WHERE domain_code LIKE "en%"

DROP TABLE pageviews_jan20_en_test 

CREATE TABLE pageviews_jan20_en_test
AS
SELECT * FROM pageviews_jan20_en
WHERE count_views > 1000
DISTRIBUTE BY rand()
SORT BY rand()
LIMIT 1000;

-- DROP TABLE pageviews_jan20_adjusted

CREATE TABLE pageviews_jan20_adjusted
AS
SELECT ts, page_title, count_views*2 AS count_views_adj FROM pageviews_jan20_en 

-- DROP TABLE pageviews_jan20_aggregated

CREATE TABLE pageviews_jan20_aggregated
AS
SELECT page_title, SUM(count_views_adj) as count_views FROM pageviews_jan20_adjusted 
GROUP BY page_title 








