-- Depends on common/setup-pageviews_jan20.sql

SELECT * FROM pageviews_jan20_en_aggregated 
ORDER BY count_views DESC
LIMIT 20;

--page_title                                               |count_views|
-----------------------------------------------------------|-----------|
--Main_Page                                                |    6089670|
--Joe_Biden                                                |    2352754|
--Kamala_Harris                                            |    1847200|
--Amanda_Gorman                                            |    1623486|
--Special:Search                                           |    1331196|
--Donald_Trump                                             |     950302|
--Beau_Biden                                               |     792288|
--Doug_Emhoff                                              |     668586|
--Jill_Biden                                               |     598088|
---                                                        |     521628|
--President_of_the_United_States                           |     502446|
--Ashley_Biden                                             |     460456|
--Garth_Brooks                                             |     445986|
--List_of_people_granted_executive_clemency_by_Donald_Trump|     407430|
--Hunter_Biden                                             |     390710|
--Family_of_Kamala_Harris                                  |     346188|
--List_of_presidents_of_the_United_States                  |     335240|
--Family_of_Joe_Biden                                      |     317370|
--Tomb_of_the_Unknown_Soldier_(Arlington)                  |     314488|
--Number_One_Observatory_Circle                            |     313886|

--CSV
--"page_title","count_views"
--Main_Page,6089670
--Joe_Biden,2352754
--Kamala_Harris,1847200
--Amanda_Gorman,1623486
--Special:Search,1331196
--Donald_Trump,950302
--Beau_Biden,792288
--Doug_Emhoff,668586
--Jill_Biden,598088
---,521628
--President_of_the_United_States,502446
--Ashley_Biden,460456
--Garth_Brooks,445986
--List_of_people_granted_executive_clemency_by_Donald_Trump,407430
--Hunter_Biden,390710
--Family_of_Kamala_Harris,346188
--List_of_presidents_of_the_United_States,335240
--Family_of_Joe_Biden,317370
--Tomb_of_the_Unknown_Soldier_(Arlington),314488
--Number_One_Observatory_Circle,313886
