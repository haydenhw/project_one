SELECT * FROM pageviews_per_hour

--pageviews_per_hour|
--------------------|
--        9698853.75|

SELECT * FROM average_hours_to_revert_edit

--average_hours_to_revert_edit|
------------------------------|
--           28.93071199411348|

SET hive.strict.checks.cartesian.product=FALSE 

SELECT 
  (average_hours_to_revert_edit * pageviews_per_hour) AS average_pageviews_before_vandalism_revert  
FROM pageviews_per_hour, average_hours_to_revert_edit

--average_pageviews_before_vandalism_revert     |
------------------------------------------------|
--280594744.5142775                             |
