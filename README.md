# Wikipedia Analytics

## Project Description
Using Big Data tools to perform analysis on datasets from Wikipedia

## Technologies Used

* Hive
* Hadoop
* Scala
* sbt

## Features

### Question 1
Which English wikipedia article got the most traffic on October 20, 2020?

### Question 2
What English wikipedia article has the largest fraction of its readers follow an internal link to another wikipedia article?

### Question 3
What series of wikipedia articles, starting with Hotel California, keeps the largest fraction of its readers clicking on internal links?

### Question 4
Find an example of an English wikipedia article that is relatively more popular in the Americas than elsewhere. There is no location data associated with the wikipedia pageviews data, but there are timestamps. You'll need to make some assumptions about internet usage over the hours of the day.

### Question 5
Analyze how many users will see the average vandalized wikipedia page before the offending edit is reversed.


## Prerequsites
* [Install Hadoop 2.7.7](https://hadoop.apache.org/docs/r2.7.7/hadoop-project-dist/hadoop-common/SingleCluster.html)
* [Install Hive 2.3.8](https://github.com/AdamDKing/210104-usf-bigdata/blob/main/hive-install.md)

## Installation
```sh
git clone https://github.com/haydenhw/wikipedia-analytics
cd wikipedia-analytics
```

## Usage
Create all tables in the `common/` directory

```sh
hive -f common/setup-clickstream.sql
hive -f common/setup-pageviews-dec25.sql
hive -f common/setup-pageviews-jan20.sql
```

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
