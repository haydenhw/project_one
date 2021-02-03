// import scala.collection.mutable.ArrayBuffer
/*
want a [
    [{ page: 'n1', viewcount: n1 }, { page: 'Don_Henely', viewcount: n2}, { page: 'Eagles_Band', viewcount: n3}],
    [{ page: 'n1', viewcount: n1 }, { page: 'n3', viewcount: n3}, { page: 'n4', viewcount: n4}],
    [{ page: 'n1', viewcount: n1 }, { page: 'n4', viewcount: n4}, { page: 'n5', viewcount: n5}],
]
 */

// need a function searchClickstreamByPageTitle calls hive query
// need a function that parses output from searchClickstreamByPageTitle
//      this function will extract the source, referrer, and pagecount
// we need to save number of link occurrences and the name of the referrer to an array
// then we take the source and call searchClickstreaByPagetTile with it
// we need to do this recursively or with a loop

/*
1.)
select * from clickstream
where referrer='Hotel_California'
order by occurrences DESC
limit 1
offset 2
2.)
select * from clickstream
where referrer='Don_Felder'
order by occurrences DESC
limit 1
offset 2
3.)
select * from clickstream
where referrer='Eagles_(Band)'
order by occurrences DESC
limit 1
offset 2
*/


case class Page(val referrer: String, val source: String, val linkCount: Int) {}

object App {
  val links = new ArrayBuffer[List[Page]]()
  def searchClickstreamByPageTitle: Unit = ???

  def generateLinkPaths(pageTitle: String, depth: Int): Unit = {
    if (depth == 0) {
        return links
    }

    List(referrer, source, viewcount) = searchClickstreamByPageTitle(source)
    links += Page(referrer, source, viewcount)

    generateLinkPaths(source, depth)
  }
}
