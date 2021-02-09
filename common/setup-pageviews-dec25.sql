CREATE TABLE pageviews_dec25 (
  domain_code STRING,
  page_title STRING,
  count_views INT,
  total_response_size INT
)
PARTITIONED BY (ts STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ' '
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-000000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T00');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-020000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T02');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-040000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T04');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-060000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T06');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-080000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T08');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-100000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T10');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-120000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T12');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-140000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T14');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-160000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T16');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-180000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T18');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-200000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T20');

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/pageviews_dec25_select/pageviews-20201225-220000' 
INTO TABLE pageviews_dec25
PARTITION (ts='2020-12-25T22');


CREATE TABLE pageviews_dec25_en
AS
SELECT * FROM pageviews_dec25 
WHERE domain_code LIKE "en%";


CREATE TABLE pageviews_dec25_en_test
AS
SELECT * FROM pageviews_dec25_en
WHERE count_views > 1000
DISTRIBUTE BY rand()
SORT BY rand()
LIMIT 1000;


CREATE TABLE pageviews_dec25_adjusted
AS
SELECT 
  ts, 
  page_title,
  count_views*2 AS count_views_adj 
FROM pageviews_dec25_en; 


CREATE TABLE pageviews_dec25_aggregated
AS
SELECT 
  page_title, 
  SUM(count_views_adj) as count_views 
FROM pageviews_dec25_adjusted 
GROUP BY page_title;