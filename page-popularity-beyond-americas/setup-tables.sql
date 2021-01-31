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

CREATE TABLE pageview_popularity_utc22
AS
SELECT page_title, SUM(count_views) FROM pageviews_jan20_en
WHERE ts='2021-01-20T22'
GROUP BY page_title
ORDER BY page_title ASC

select * from pageview_popularity_utc22 limit 100

-- join english and hindi

SELECT en.ts, en.page_views_by_hour AS en_page_views, hi.page_views_by_hour AS hi_page_views, en.page_views_by_hour / hi.page_views_by_hour AS en_views_per_hi_view
FROM pageviews_en_by_hour en
JOIN pageviews_hi_by_hour hi
ON en.ts=hi.ts