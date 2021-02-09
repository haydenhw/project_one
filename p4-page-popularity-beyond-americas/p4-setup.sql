-- Depends on common/setup-pageviews-jan20.sql

-- TODO write comments to explain what's going on here
-- We find pages written in Hindu and use them as a proxy for when wikipedia gets the most traffic from India
CREATE TABLE pageviews_jan20_hi
AS
SELECT * FROM pageviews_jan20
WHERE domain_code LIKE "hi%"


CREATE TABLE pageviews_hi_by_hour
AS
SELECT 
  ts,
  SUM(count_views) AS page_views_by_hour 
FROM pageviews_jan20_hi
GROUP BY ts
ORDER BY ts ASC;


CREATE TABLE pageviews_en_by_hour
AS
SELECT 
  ts, 
  SUM(count_views) AS page_views_by_hour 
FROM pageviews_jan20_en
GROUP BY ts
ORDER BY ts ASC;


CREATE TABLE en_views_per_hi_view_hourly
AS
SELECT 
  ts,
  en.page_views_by_hour as en_page_views,
  hi.page_views_by_hour as hi_page_views,
  (en_page_views / hi_page_views) as en_views_per_hi_view
FROM pageviews_hi_by_hour hi
JOIN pageviews_en_by_hour en
  ON hi.page_views_by_hour=en.page_views_by_hour;



SET hive.strict.checks.cartesian.product=FALSE;
CREATE TABLE pageview_popularity_utc22
AS
SELECT 
  pv.ts, 
  pv.page_title, 
  pv.count_views, 
  pvbr.page_views_by_hour, 
  (pv.count_views / pvbr.page_views_by_hour * 1000) AS popularity_index
FROM pageviews_jan20_en pv
JOIN pageviews_en_by_hour pvbr 
  ON pv.ts=pvbr.ts
WHERE pv.ts='2021-01-20T22'
ORDER BY popularity_index DESC;


CREATE TABLE pageview_popularity_utc08
AS
SELECT 
  pv.ts, 
  pv.page_title, 
  pv.count_views, 
  pvbr.page_views_by_hour, 
  (pv.count_views / pvbr.page_views_by_hour * 1000) AS popularity_index
FROM pageviews_jan20_en pv
JOIN pageviews_en_by_hour pvbr 
  ON pv.ts=pvbr.ts
WHERE pv.ts='2021-01-20T08'
ORDER BY popularity_index DESC;


CREATE TABLE pageview_popularity_change_india_vs_americas
AS
SELECT 
  india.page_title, 
  india.popularity_index - americas.popularity_index AS popularity_change
FROM pageview_popularity_utc22 americas
JOIN pageview_popularity_utc08 india
  ON india.page_title=americas.page_title 
ORDER BY popularity_change DESC;


SELECT * FROM pageview_popularity_change_india_vs_americas
WHERE page_title!='Main_Page'
 AND page_title!='Special:Search'
ORDER BY popularity_change ASC
limit 100;