CREATE TABLE clickstream (
  referrer STRING,
  resource STRING,
  type STRING,
  occurrences INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE

-- TODO change this to a local path
LOAD DATA INPATH '/user/hayden/wiki-data/clickstream-enwiki-2020-12.tsv' INTO TABLE clickstream;

-- DROP TABLE clickstream_samp

CREATE TABLE clickstream_samp
  AS
SELECT * FROM clickstream 
DISTRIBUTE BY rand()
SORT BY rand()
LIMIT 500000

DROP TABLE clickstream_en_daily

CREATE TABLE clickstream_en_daily
 AS
SELECT referrer, ROUND(SUM(occurrences) / 31) AS total_internal_links FROM clickstream -- Divide by 31 to convert monthly totals into a daily average
WHERE referrer != "other-external" -- TODO come up with a cleaner solution for these filters
  AND referrer != "other-empty"
  AND referrer != "other-other"
  AND referrer != "other-internal"
  AND referrer != "other-search"
  AND referrer != "Main_Page"
GROUP BY referrer
ORDER BY total_internal_links DESC 

DROP TABLE inlinks_per_pageview

CREATE TABLE inlinks_per_pageview
  AS
SELECT page_title, total_internal_links, count_views, ROUND((CAST(total_internal_links AS FLOAT) / count_views), 2) AS inlinks_per_pageview 
FROM clickstream_en_daily c 
JOIN pageviews_dec25_aggregated p 
  ON c.referrer=p.page_title 
WHERE count_views > 100
ORDER BY inlinks_per_pageview DESC


 
 
 
