package example

import sys.process._
import scala.language.postfixOps
import scala.collection.mutable.ArrayBuffer

object Main extends App {
  if (args.length != 3) {
    println("Usage: <page title> <path depth> <path range>")
    System.exit(-1)
  }

  val pathDepth = args(1).toInt
  val pathRange = args(2).toInt
  val combinations = Util.permutationsWithRepetitions(
    List.range(1, pathRange + 1),
    pathDepth
  )

  val referrer = args(0)
  val paths = combinations
    .map(Clickstream.findPathByReferrer(referrer, _))
    .map(Clickstream.aggregatePath)
  Clickstream.printSummary(paths)
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

object DAO {
  def findNthGreatestLinkSource(referrer: String, n: Int): Page = {
    val cmd =
      s"""
        hive -S -e "SELECT * FROM clickstream WHERE referrer='$referrer' ORDER BY occurrences DESC LIMIT 1 OFFSET $n" 
      """

    println(s"\nExecuting query... ${cmd}\n")

    var stdout = new StringBuilder
    val stderr = new StringBuilder
    val status = cmd ! ProcessLogger(stdout append _, stderr append _)

    val parsedOutput = stdout.toString().split('\t')

    val source = parsedOutput(1)
    val linkCount = parsedOutput(3).toInt

    println(source, linkCount)

    Page(referrer, source, linkCount)
  }
}

case class Page(val referrer: String, val source: String, val linkCount: Int) {}