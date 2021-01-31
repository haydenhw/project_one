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

-- DROP TABLE clickstream_samp

CREATE TABLE clickstream_samp
AS
SELECT * FROM clickstream 
DISTRIBUTE BY rand()
SORT BY rand()
LIMIT 500000;

DROP TABLE clickstream_en_daily

CREATE TABLE clickstream_en_daily
AS
-- Divide by 31 to convert monthly totals into a daily average
SELECT referrer, ROUND(SUM(occurrences) / 31) AS total_internal_links FROM clickstream
WHERE referrer != "other-external"
AND referrer != "other-empty"
AND referrer != "other-other"
AND referrer != "other-internal"
AND referrer != "other-search"
AND referrer != "Main_Page"
GROUP BY referrer
ORDER BY total_internal_links DESC 


 SELECT page_title, total_internal_links, count_views, ROUND(total_internal_links / count_views) 
 AS internal_link_per_pageview 
 FROM clickstream_en_daily c 
 JOIN pagviews_jan20_aggregated p 
 ON c.referrer=p.page_title 
 WHERE count_views > 100
 ORDER BY internal_link_per_pageview DESC 

 select * from clickstream
 order by occurrences desc
