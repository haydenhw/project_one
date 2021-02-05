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