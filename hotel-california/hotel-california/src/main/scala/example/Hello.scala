package example

case class Page(val referrer: String, val source: String, val linkCount: Int) {}

object DAO {
  def findNthGreatestLinkSource(referrer: String, n: Int): Page = {
    val r = scala.util.Random
    val referrer = "ref" + r.nextInt(100) 
    val source = "src" + r.nextInt(100)
    val linkCount = r.nextInt(10000)

    return Page(referrer, source, linkCount)
  }
}

/*
want a [
    [{ page: 'n1', viewcount: n1 }, { page: 'Don_Henely', viewcount: n2}, { page: 'Eagles_Band', viewcount: n3}],
    [{ page: 'n1', viewcount: n1 }, { page: 'n3', viewcount: n3}, { page: 'n4', viewcount: n4}],
    [{ page: 'n1', viewcount: n1 }, { page: 'n4', viewcount: n4}, { page: 'n5', viewcount: n5}],
]
 */

object Clickstream {
  def collectClickstream(
      referrer: String,
      offsetSequence: List[Int],
      clickstream: List[Page] = List()
  ): List[Page] = {
    val n = clickstream.length
    if (n == offsetSequence.length)
      return clickstream
    
    val nextSource = DAO.findNthGreatestLinkSource(referrer, offsetSequence(n))

    return collectClickstream(
      nextSource.referrer,
      offsetSequence,
      nextSource :: clickstream
    )
  }
}

object Main extends App {
  val offsets = List(1,2,1,1)
  val res = Clickstream.collectClickstream("Hotel_California", offsets)
  println(res.reverse)
}
