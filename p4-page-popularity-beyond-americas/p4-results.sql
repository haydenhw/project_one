SELECT * FROM pageview_popularity_change_india_vs_americas
WHERE page_title!='Main_Page'
 AND page_title!='Special:Search'
ORDER BY popularity_change ASC
limit 20

--page_title                             |popularity_change  |
-----------------------------------------|-------------------|
--Kamala_Harris,                         |  -16.35714047282125|
--Joe_Biden,                             |  -7.064974171927234|
--Doug_Emhoff,                           |  -6.529588753911723|
--Family_of_Kamala_Harris,               |  -5.901607043899819|
--Joe_Biden,                             |    -5.5203412478767|
--G-Eazy,                                |  -5.360717911841585|
--Number_One_Observatory_Circle,         |  -4.212810314647145|
--Meena_Harris,                          |  3.1453188262852914|
--Maya_Harris,                           |   -3.03971995198836|
--Kerstin_Emhoff,                        | -2.8869694742521816|
--Beau_Biden,                            |  -2.874245772872838|
--Joe_Biden,                             | -2.8597502237104826|
--Amanda_Gorman,                         | -2.8595595660578446|
--Jill_Biden,                            | -2.4853655779330985|
--Donald_Trump,                          |  -2.461304927040061|
--Ashley_Biden,                          | -2.3941396927413856|
--Donald_J._Harris,                      |  -2.290813419644446|
--Hunter_Biden,                          |  -2.134788034924499|

SELECT * FROM pageview_popularity_change_india_vs_americas
WHERE page_title!='Main_Page'
 AND page_title!='Special:Search'
ORDER BY popularity_change DESC
limit 100

--page_title                                                                       |popularity_change  |
-----------------------------------------------------------------------------------|-------------------|
--Lil_Wayne                                                                        | 1.5247083154094812|
--List_of_people_granted_executive_clemency_by_Donald_Trump                        | 1.4798937616056385|
--Kwame_Kilpatrick                                                                 | 0.9974030305921657|
--Steve_Bannon                                                                     | 0.8792259996875224|
--Kodak_Black                                                                      | 0.8626097044170019|
--The_Land_of_Gorch                                                                | 0.8483631474971691|
--Richard_Ramirez                                                                  | 0.8363727240955213|
--The_Land_of_Gorch                                                                | 0.6328565341874598|
--Joe_Exotic                                                                       | 0.5403865178376241|
--XXXX                                                                             |  0.503107821409121|
--Bible                                                                            | 0.4973998647535597|
--List_of_people_granted_executive_clemency_by_Barack_Obama                        | 0.4860437199686215|
--Cleopatra                                                                        |0.46231024242138447|
--BF                                                                               | 0.4362691756434264|
--Lil_Wayne                                                                        |0.43078491235144095|
--List_of_people_granted_executive_clemency_by_Barack_Obama                        |0.39142151227481237|
--Federal_pardons_in_the_United_States                                             |0.37172436135375503|
--Joe_Exotic                                                                       |0.35653722832728446|
--Steve_Bannon                                                                     | 0.3543897243170421|
--Federal_pardons_in_the_United_States                                             |0.31860312194670426|
--Maro_Itoje                                                                       | 0.3115982434248494|
--Elon_Musk                                                                        | 0.2948743730756968|
--Priti_Patel                                                                      | 0.2892670712789205|
--QAnon                                                                            | 0.2796428685198708|
--Melania_Trump                                                                    |0.25997693244195924|
--Pardon                                                                           |0.25752035458535016|
--Michael_Boulos                                                                   | 0.2471725541692231|
--Kellyanne_Conway                                                                 | 0.2459237519330371|
--List_of_people_pardoned_or_granted_clemency_by_the_president_of_the_United_States|0.24196263217236924|
--Megyn_Kelly                                                                      |0.23338267595900758|
--Border–Gavaskar_Trophy                                                           |0.23020859662852078|