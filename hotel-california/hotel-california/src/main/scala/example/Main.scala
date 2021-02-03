package example

import sys.process._
import scala.language.postfixOps
import scala.collection.mutable.ArrayBuffer

case class Page(val referrer: String, val source: String, val linkCount: Int) {}

object DAO {
  def findNthGreatestLinkSource(referrer: String, n: Int): Page = {
    println("Running query...")
    val cmd =
      s"""
        hive -S -e "select * from clickstream where referrer='$referrer' order by occurrences DESC limit 1 offset $n" 
      """

    var stdout = new StringBuilder
    val stderr = new StringBuilder
    val status = cmd ! ProcessLogger(stdout append _, stderr append _)

    val arr = stdout.toString().split('\t')
    print(s"shell output: ")
    arr.foreach(print)
    println()

    val source = arr(1)
    val linkCount = arr(3).toInt

    println(source, linkCount)

    Page(referrer, source, linkCount)
  }
}


object Main extends App {
  if (args.length != 2) {
    println("Usage: <page title> <combination range>")
    System.exit(-1)
  }

  val n = args(1).toInt
  val combinations = Util.permutationsWithRepetitions(
    List.range(1, n),
    n
  )

  val referrer = args(0)
  val paths = combinations
    .map(Clickstream.findPathByReferrer(referrer, _))
    .map(Clickstream.aggregatePath)
  Clickstream.printSummary(paths)

  val mockpaths = List(
    List(
      Page("foo", "bar", 100),
      Page("bar", "baz", 200),
      Page("baz", "bang", 300)
    ),
    List(
      Page("fred", "mary", 400),
      Page("mary", "brian", 300),
      Page("brian", "sally", 800)
    )
  )

}

object Clickstream {
  def printSummary(paths: List[(List[String], Int)]): Unit = {
    paths
      .sortWith(_._2 > _._2)
      .foreach(p =>
        println(s"Path: ${p._1.toList
          .mkString("-> ")} | LinksFollowed/PageViews: ${p._2}")
      )
  }

  def aggregatePath(path: List[Page]) = {
    path.foldLeft((List[String](), 0)) { (res, cur) =>
      (cur.source :: res._1, res._2 + cur.linkCount)
    }
  }

  def findPathByReferrer(
      referrer: String,
      offsetSequence: List[Int],
      clickstream: List[Page] = List()
  ): List[Page] = {
    val n = clickstream.length
    if (n == offsetSequence.length)
      return clickstream

    println(s"clickstream: referrer-> $referrer, offset-> ${offsetSequence(n)}")
    val nextSource =
      DAO.findNthGreatestLinkSource(referrer, offsetSequence(n))
    println(nextSource :: clickstream)

    findPathByReferrer(
      nextSource.source,
      offsetSequence,
      nextSource :: clickstream
    )
  }
}

object Util {
  def permutationsWithRepetitions[T](input: List[T], n: Int): List[List[T]] = {
    require(input.length > 0 && n > 0)
    n match {
      case 1 => for (el <- input) yield List(el)
      case _ =>
        for (el <- input; perm <- permutationsWithRepetitions(input, n - 1))
          yield el :: perm
    }
  }
}