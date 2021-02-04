CREATE TABLE pageviews_jan20_hi
  AS
SELECT * FROM pageviews_jan20 

CREATE TABLE pageviews_hi_by_hour
  AS
SELECT ts, SUM(count_views) AS page_views_by_hour FROM pageviews_jan20_hi
GROUP BY ts
ORDER BY ts ASC

CREATE TABLE pageviews_en_by_hour
  AS
SELECT ts, SUM(count_views) AS page_views_by_hour FROM pageviews_jan20_en
GROUP BY ts
ORDER BY ts ASC

DROP TABLE pageview_popularity_utc22

SET hive.strict.checks.cartesian.product=false 

CREATE TABLE pageview_popularity_utc22
  AS
SELECT pv.ts, pv.page_title, pv.count_views, pvbr.page_views_by_hour, (pv.count_views / pvbr.page_views_by_hour * 1000) AS popularity_index
  FROM pageviews_jan20_en pv
JOIN pageviews_en_by_hour pvbr 
  ON pv.ts=pvbr.ts
WHERE pv.ts='2021-01-20T22'
ORDER BY popularity_index DESC


select * from pageview_popularity_utc22 limit 100

DROP TABLE pageview_popularity_utc08

CREATE TABLE pageview_popularity_utc08
  AS
SELECT pv.ts, pv.page_title, pv.count_views, pvbr.page_views_by_hour, (pv.count_views / pvbr.page_views_by_hour * 1000) AS popularity_index
  FROM pageviews_jan20_en pv
JOIN pageviews_en_by_hour pvbr 
  ON pv.ts=pvbr.ts
WHERE pv.ts='2021-01-20T08'
ORDER BY popularity_index DESC

select * from pageview_popularity_utc08 limit 100

CREATE TABLE pageview_popularity_change_india_vs_americas
  AS
  
SELECT india.page_title, india.popularity_index - americas.popularity_index AS popularity_change
  FROM pageview_popularity_utc22 americas
JOIN pageview_popularity_utc08 india
  ON india.page_title=americas.page_title 
ORDER BY popularity_change desc

select * from pageview_popularity_change_india_vs_americas limit 100