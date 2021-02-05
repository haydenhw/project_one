package example

import sys.process._
import scalaz._
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
    List.range(0, pathRange + 1),
    pathDepth
  )

  combinations foreach println

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
  def printSummary(paths: List[(List[String], Float)]): Unit = {
    println
    paths
      .sortWith(_._2 > _._2)
      .foreach(p => println(s"${p._1.toList.mkString("-> ")}\t${p._2}"))
  }

  def aggregatePath(path: List[Page]) = {
    path.foldLeft((List[String](), 1f)) { (res, cur) =>
      (cur.source :: res._1, res._2 * cur.linkCount)
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

    println(s"\nclickstream: referrer-> $referrer, offset-> ${offsetSequence(n)}")
    println(s"combination: $offsetSequence\n")

    val nextSource =
      DAO.findNthGreatestLinkSource(referrer, offsetSequence(n))

    (nextSource :: clickstream).reverse foreach println
    println

    findPathByReferrer(
      nextSource.source,
      offsetSequence,
      nextSource :: clickstream
    )
  }
}

object DAO {
  def findNthGreatestLinkSource(referrer: String, n: Int): Page = {
    val memoized: ((String, Int)) => Page = Memo.mutableHashMapMemo {
      case (referrer, n) => {
        val cmd =
        n match {
          case 0 => s"""
            hive -S -e "SELECT * FROM sorted_links_per_pageview WHERE referrer='$referrer' LIMIT 1" 
          """
          case _ => s"""
            hive -S -e "SELECT * FROM sorted_links_per_pageview WHERE referrer='$referrer' LIMIT 1 OFFSET $n" 
          """
        }
        

        println(s"\nExecuting query... ${cmd}\n")

        var stdout = new StringBuilder
        val stderr = new StringBuilder
        val status = cmd ! ProcessLogger(stdout append _, stderr append _)

        val parsedOutput = stdout.toString().split('\t').toList
        
        println(s"Query result:")
        parsedOutput foreach print
        println

        if (parsedOutput.length == 3) {
          val source = parsedOutput(1)
          val linkCount = parsedOutput(2).toFloat
          Page(referrer, source, linkCount)
        } else {
          Page("Error", "Error", 0f)
        }
      }
    }

    memoized(referrer, n)
  }
}

case class Page(
    val referrer: String,
    val source: String,
    val linkCount: Float
) {}
