-- TODO explain dependencies

SELECT * FROM inlinks_per_pageview 
WHERE count_views > 10000
LIMIT 20

--page_title                              |total_internal_links|count_views|inlinks_per_pageview|
------------------------------------------|--------------------|-----------|--------------------|
--Elliot_Page                             |             73860.0|      19310|                 4.0|
--The_Sound_of_Music_(film)               |             21757.0|      14382|                 2.0|
--2016_United_States_presidential_election|             19216.0|      10990|                 2.0|
--Henry_VIII                              |             22072.0|      14210|                 2.0|
--The_Crown_(TV_series)                   |             52988.0|      24752|                 2.0|
--2020_United_States_presidential_election|             66022.0|      33862|                 2.0|
--Mank                                    |             22887.0|      10164|                 2.0|
--Selena                                  |             56413.0|      23456|                 2.0|
--Franklin_D._Roosevelt                   |              8230.0|      14028|                 1.0|
--Zodiac_Killer                           |              9223.0|      12056|                 1.0|
--Breaking_Bad                            |              7779.0|      10206|                 1.0|
--Kamala_Harris                           |             11697.0|      19644|                 1.0|
--Sarah_Paulson                           |              7807.0|      10184|                 1.0|
--Bradley_Cooper                          |              7171.0|      13054|                 1.0|
--Margaret_Thatcher                       |             26697.0|      38914|                 1.0|
--Quentin_Tarantino                       |              6543.0|      10302|                 1.0|
--Queen_Victoria                          |             28822.0|      28402|                 1.0|
--Queen_Elizabeth_The_Queen_Mother        |             18967.0|      16486|                 1.0|
--Virgin_River_(TV_series)                |             16209.0|      11670|                 1.0|
--The_Queen's_Gambit_(miniseries)         |             61110.0|      76660|                 1.0|

SELECT * FROM inlinks_per_pageview 
WHERE count_views > 1000
LIMIT 20

--page_title                                     |total_internal_links|count_views|inlinks_per_pageview|
-------------------------------------------------|--------------------|-----------|--------------------|
--Gilligan's_Island                              |             20841.0|       2196|                 9.0|
--Kubrat_Pulev                                   |              7095.0|       1038|                 7.0|
--NXT_TakeOver:_WarGames_(2020)                  |              8277.0|       1710|                 5.0|
--2020_Formula_2_Championship                    |              8042.0|       1742|                 5.0|
--Giovanna_Fletcher                              |              6913.0|       1290|                 5.0|
--2022_FIFA_World_Cup_qualification_(UEFA)       |              4387.0|       1154|                 4.0|
--Lloyd_Austin                                   |              5904.0|       1538|                 4.0|
--List_of_premature_professional_wrestling_deaths|              4815.0|       1152|                 4.0|
--List_of_pornographic_performers_by_decade      |             13178.0|       3082|                 4.0|
--Selena:_The_Series                             |             12552.0|       3044|                 4.0|
--Dawn_Wells                                     |              5087.0|       1396|                 4.0|
--Kim_Ki-duk                                     |              4420.0|       1082|                 4.0|
--Elliot_Page                                    |             73860.0|      19310|                 4.0|
--Selena_y_Los_Dinos                             |             11871.0|       2986|                 4.0|
--2020_Formula_One_World_Championship            |             18483.0|       6812|                 3.0|
--Retribution_(professional_wrestling)           |              2753.0|       1034|                 3.0|
--2020–21_UEFA_Europa_League                     |              6775.0|       2288|                 3.0|
--Laverne_&_Shirley                              |              3928.0|       1400|                 3.0|
--2022_FIFA_World_Cup_qualification              |              5150.0|       1818|                 3.0|
--Arecibo_Observatory                            |              4832.0|       1460|                 3.0|

