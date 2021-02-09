-- Depends on common/setup-clickstream.sql

SELECT * FROM inlinks_per_pageview 
WHERE count_views > 10000
LIMIT 20;

--page_title                              |total_internal_links|count_views|inlinks_per_pageview|
------------------------------------------|--------------------|-----------|--------------------|
--Elliot_Page                             |             73860.0|      19310|                3.82|
--Selena                                  |             56413.0|      23456|                2.41|
--Mank                                    |             22887.0|      10164|                2.25|
--The_Crown_(TV_series)                   |             52988.0|      24752|                2.14|
--2020_United_States_presidential_election|             66022.0|      33862|                1.95|
--2016_United_States_presidential_election|             19216.0|      10990|                1.75|
--Henry_VIII                              |             22072.0|      14210|                1.55|
--The_Sound_of_Music_(film)               |             21757.0|      14382|                1.51|
--Marvel_Cinematic_Universe:_Phase_Four   |             15816.0|      10596|                1.49|
--Marvel_Cinematic_Universe               |             16452.0|      11090|                1.48|
--List_of_American_films_of_2020          |             16790.0|      11392|                1.47|
--BTS                                     |             23498.0|      16196|                1.45|
--The_Office_(American_TV_series)         |             14103.0|      10154|                1.39|
--Virgin_River_(TV_series)                |             16209.0|      11670|                1.39|
--Diana,_Princess_of_Wales                |             52583.0|      40886|                1.29|
--Grey's_Anatomy                          |             16931.0|      13132|                1.29|
--George_V                                |             25450.0|      19680|                1.29|
--Taylor_Swift                            |             23764.0|      19218|                1.24|
--The_Great_British_Bake_Off              |             14104.0|      11370|                1.24|
--Schitt's_Creek                          |             28264.0|      23430|                1.21|

SELECT * FROM inlinks_per_pageview 
WHERE count_views > 1000
LIMIT 20;

--page_title                                     |total_internal_links|count_views|inlinks_per_pageview|
-------------------------------------------------|--------------------|-----------|--------------------|
--Gilligan's_Island                              |             20841.0|       2196|                9.49|
--Kubrat_Pulev                                   |              7095.0|       1038|                6.84|
--Giovanna_Fletcher                              |              6913.0|       1290|                5.36|
--NXT_TakeOver:_WarGames_(2020)                  |              8277.0|       1710|                4.84|
--2020_Formula_2_Championship                    |              8042.0|       1742|                4.62|
--List_of_pornographic_performers_by_decade      |             13178.0|       3082|                4.28|
--List_of_premature_professional_wrestling_deaths|              4815.0|       1152|                4.18|
--Selena:_The_Series                             |             12552.0|       3044|                4.12|
--Kim_Ki-duk                                     |              4420.0|       1082|                4.09|
--Selena_y_Los_Dinos                             |             11871.0|       2986|                3.98|
--Lloyd_Austin                                   |              5904.0|       1538|                3.84|
--Elliot_Page                                    |             73860.0|      19310|                3.82|
--2022_FIFA_World_Cup_qualification_(UEFA)       |              4387.0|       1154|                 3.8|
--Dawn_Wells                                     |              5087.0|       1396|                3.64|
--G�rard_Houllier                               |              4317.0|       1262|                3.42|
--2020_AFC_Champions_League                      |              3401.0|       1002|                3.39|
--UFC_256                                        |             19795.0|       5858|                3.38|
--E_Street_Band                                  |              7465.0|       2216|                3.37|
--List_of_serial_killers_in_the_United_States    |             14231.0|       4242|                3.35|
--List_of_death_row_inmates_in_the_United_States |              4484.0|       1348|                3.33|