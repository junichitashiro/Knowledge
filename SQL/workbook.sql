-- MySQL dump 10.13  Distrib 5.6.10, for Win32 (x86)
--
-- Host: localhost    Database: workbook
-- ------------------------------------------------------
-- Server version	5.6.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_log`
--

DROP TABLE IF EXISTS `access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` char(5) DEFAULT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `access_date` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_log`
--

LOCK TABLES `access_log` WRITE;
/*!40000 ALTER TABLE `access_log` DISABLE KEYS */;
INSERT INTO `access_log` VALUES (1,'A0001','http://wings.msn.to/hamu/','192.168.0.253','2012-02-01 10:11:12'),(2,'A0001','http://wings.msn.to/hamu/','192.168.1.223','2012-02-12 07:15:14'),(3,'B0001','http://wings.msn.to/hamu/','192.168.21.18','2012-02-19 20:11:12'),(4,'A0001','http://wings.msn.to/hamu/','192.168.115.25','2012-03-01 21:14:18'),(5,'A0001','http://wings.msn.to/hamu/','192.168.29.208','2012-03-11 21:18:17'),(6,'A0001','http://wings.msn.to/hamu/','192.168.3.254','2012-03-19 20:10:14'),(7,'A0001','http://wings.msn.to/neko/','192.168.42.217','2012-03-19 20:11:12'),(8,'B0001','http://wings.msn.to/inu/','192.168.81.112','2012-04-01 21:14:18'),(9,'B0001','http://wings.msn.to/hamu/','192.168.165.27','2012-04-10 14:18:19'),(10,'B0002','http://wings.msn.to/neko/','192.168.29.207','2012-04-11 21:18:17'),(11,'B0003','http://wings.msn.to/neko/','192.168.4.257','2012-05-10 14:18:19'),(12,'A0001','http://wings.msn.to/hamu/','192.168.142.207','2012-05-21 21:11:17'),(13,'A0001','http://wings.msn.to/hamu/','192.168.41.102','2012-05-30 13:17:24'),(14,'D0001','http://wings.msn.to/hamu/','192.168.195.123','2012-06-01 21:22:12'),(15,'D0001','http://wings.msn.to/hamu/','192.168.209.247','2012-06-04 14:10:24'),(16,'B0004','http://wings.msn.to/saru/','192.168.16.209','2012-06-21 21:11:17'),(17,'A0001','http://wings.msn.to/hamu/','192.168.206.143','2012-06-30 01:11:14'),(18,'C0001','http://wings.msn.to/inu/','192.168.211.110','2012-06-30 13:17:24'),(19,'A0001','http://wings.msn.to/hamu/','192.168.165.20','2012-07-01 22:14:17'),(20,'A0001','http://wings.msn.to/hamu/','192.168.219.48','2012-07-06 08:14:14'),(21,'A0001','http://wings.msn.to/hamu/','192.168.31.204','2012-07-09 20:11:02'),(22,'A0001','http://wings.msn.to/hamu/','192.168.32.237','2012-07-11 23:11:12'),(23,'A0001','http://wings.msn.to/hamu/','192.168.64.92','2012-07-13 15:17:25'),(24,'D0001','http://wings.msn.to/hamu/','192.168.15.87','2012-07-18 09:11:46'),(25,'D0001','http://wings.msn.to/hamu/','192.168.69.177','2012-07-24 04:11:38'),(26,'C0002','http://wings.msn.to/neko/','192.168.14.215','2012-07-30 01:11:14'),(27,'A0001','http://wings.msn.to/hamu/','192.168.12.27','2012-08-01 21:28:39'),(28,'C0003','http://wings.msn.to/saru/','192.168.31.12','2012-08-01 22:14:17'),(29,'A0001','http://wings.msn.to/hamu/','192.168.15.126','2012-08-04 15:13:34'),(30,'A0001','http://wings.msn.to/hamu/','192.168.29.217','2012-08-07 23:11:12'),(31,'B0001','http://wings.msn.to/hamu/','192.168.1.253','2012-08-09 20:24:12'),(32,'A0001','http://wings.msn.to/hamu/','192.168.2.223','2012-08-13 23:10:57'),(33,'A0001','http://wings.msn.to/hamu/','192.168.22.18','2012-08-16 15:18:17'),(34,'C0004','http://wings.msn.to/neko/','192.168.116.25','2012-08-18 09:11:46'),(35,'A0001','http://wings.msn.to/hamu/','192.168.30.208','2012-08-21 20:17:15'),(36,'C0005','http://wings.msn.to/tori/','192.168.4.254','2012-08-24 04:11:38'),(37,'A0001','http://wings.msn.to/hamu/','192.168.43.217','2012-08-24 23:14:17'),(38,'A0001','http://wings.msn.to/hamu/','192.168.82.112','2012-08-25 11:24:18'),(39,'A0001','http://wings.msn.to/hamu/','192.168.166.27','2012-08-26 21:25:49'),(40,'A0001','http://wings.msn.to/hamu/','192.168.30.207','2012-08-27 14:13:12'),(41,'A0001','http://wings.msn.to/hamu/','192.168.152.200','2012-08-27 23:11:15'),(42,'D0004','http://wings.msn.to/neko/','192.168.152.207','2012-08-27 23:11:15'),(43,'A0001','http://wings.msn.to/hamu/','192.168.42.102','2012-08-29 07:17:19'),(44,'A0001','http://wings.msn.to/hamu/','192.168.185.123','2012-08-30 23:17:47'),(45,'D0001','http://wings.msn.to/neko/','192.168.210.247','2012-09-01 21:28:39'),(46,'A0001','http://wings.msn.to/hamu/','192.168.17.209','2012-09-01 22:25:12'),(47,'A0001','http://wings.msn.to/hamu/','192.168.207.143','2012-09-01 23:18:14'),(48,'B0001','http://wings.msn.to/hamu/','192.168.212.110','2012-09-02 07:11:17'),(49,'A0001','http://wings.msn.to/hamu/','192.168.166.20','2012-09-03 04:10:49'),(50,'D0002','http://wings.msn.to/inu/','192.168.220.48','2012-09-04 15:13:34'),(51,'A0001','http://wings.msn.to/hamu/','192.168.32.204','2012-09-05 11:16:12'),(52,'A0001','http://wings.msn.to/hamu/','192.168.31.237','2012-09-05 20:18:19'),(53,'A0001','http://wings.msn.to/hamu/','192.168.65.92','2012-09-06 21:18:11'),(54,'D0003','http://wings.msn.to/tori/','192.168.19.87','2012-09-07 23:11:12'),(55,'A0001','http://wings.msn.to/hamu/','192.168.70.177','2012-09-07 23:11:54'),(56,'A0001','http://wings.msn.to/hamu/','192.168.15.215','2012-09-09 21:14:18'),(57,'A0001','http://wings.msn.to/hamu/','192.168.13.27','2012-09-10 21:18:50'),(58,'D0001','http://wings.msn.to/hamu/','192.168.32.12','2012-09-15 23:17:48'),(59,'A0001','http://wings.msn.to/hamu/','192.168.16.126','2012-09-16 14:12:17'),(60,'A0001','http://wings.msn.to/hamu/','192.168.30.217','2012-09-16 23:10:12'),(61,'D0001','http://wings.msn.to/hamu/','192.168.0.242','2012-09-19 11:13:00'),(62,'A0001','http://wings.msn.to/hamu/','192.168.1.212','2012-09-21 14:18:41'),(63,'A0001','http://wings.msn.to/hamu/','192.168.21.07','2012-09-22 16:18:14'),(64,'A0001','http://wings.msn.to/hamu/','192.168.115.14','2012-09-23 20:19:11'),(65,'D0001','http://wings.msn.to/hamu/','192.168.29.197','2012-09-25 20:11:52'),(66,'D0001','http://wings.msn.to/hamu/','192.168.3.243','2012-09-27 05:11:17'),(67,'A0001','http://wings.msn.to/hamu/','192.168.42.206','2012-09-29 00:12:16'),(68,'A0001','http://wings.msn.to/kame/','192.168.81.101','2012-09-29 07:17:19'),(69,'B0001','http://wings.msn.to/saru/','192.168.16516','2012-09-30 23:17:47'),(70,'B0002','http://wings.msn.to/neko/','192.168.29.215','2012-10-01 22:25:12'),(71,'A0001','http://wings.msn.to/hamu/','192.168.4.246','2012-10-03 10:11:16'),(72,'A0001','http://wings.msn.to/hamu/','192.168.142.196','2012-10-09 20:24:12'),(73,'A0001','http://wings.msn.to/hamu/','192.168.41.93','2012-10-13 23:10:57'),(74,'C0001','http://wings.msn.to/hamu/','192.168.195.112','2012-10-16 15:18:17'),(75,'A0001','http://wings.msn.to/hamu/','192.168.209.236','2012-10-21 20:17:15'),(76,'A0001','http://wings.msn.to/hamu/','192.168.16.198','2012-10-24 23:14:17'),(77,'C0001','http://wings.msn.to/hamu/','192.168.206.132','2012-10-25 11:24:18'),(78,'A0001','http://wings.msn.to/hamu/','192.168.211.109','2012-10-26 21:25:49'),(79,'A0001','http://wings.msn.to/hamu/','192.168.165.19','2012-10-27 14:13:12'),(80,'D0001','http://wings.msn.to/hamu/','192.168.219.37','2012-10-27 23:11:15'),(81,'D0001','http://wings.msn.to/hamu/','192.168.31.193','2012-10-29 07:17:19'),(82,'A0001','http://wings.msn.to/hamu/','192.168.32.226','2012-10-30 23:17:47'),(83,'C0001','http://wings.msn.to/hamu/','192.168.64.81','2012-11-01 22:25:12'),(84,'A0001','http://wings.msn.to/hamu/','192.168.15.76','2012-11-01 23:18:14'),(85,'B0003','http://wings.msn.to/kame/','192.168.69.166','2012-11-01 23:18:14'),(86,'A0001','http://wings.msn.to/hamu/','192.168.14.204','2012-11-02 07:11:17'),(87,'A0001','http://wings.msn.to/hamu/','192.168.12.16','2012-11-03 04:10:49'),(88,'C0001','http://wings.msn.to/hamu/','192.168.31.11','2012-11-05 11:16:12'),(89,'A0001','http://wings.msn.to/hamu/','192.168.15.115','2012-11-05 20:18:19'),(90,'A0001','http://wings.msn.to/hamu/','192.168.29.206','2012-11-06 21:18:11'),(91,'C0001','http://wings.msn.to/hamu/','192.168.1.242','2012-11-07 23:11:54'),(92,'A0001','http://wings.msn.to/hamu/','192.168.2.212','2012-11-09 21:14:18'),(93,'C0001','http://wings.msn.to/hamu/','192.168.22.07','2012-11-10 21:18:50'),(94,'A0001',NULL,'192.168.116.14','2012-11-15 23:17:48'),(95,'A0001','http://wings.msn.to/hamu/','192.168.30.202','2012-11-16 14:12:17'),(96,'A0001','http://wings.msn.to/hamu/','192.168.4.243','2012-11-16 23:10:12'),(97,'D0001','http://wings.msn.to/hamu/','192.168.43.206','2012-11-19 11:13:00'),(98,'A0001','http://wings.msn.to/hamu/','192.168.82.101','2012-11-21 14:18:41'),(99,'C0001','http://wings.msn.to/hamu/','192.168.166.16','2012-11-22 16:18:14'),(100,'A0001','http://wings.msn.to/hamu/','192.168.30.206','2012-11-23 20:19:11'),(101,'A0001','http://wings.msn.to/hamu/','192.168.5.241','2012-11-25 20:11:52'),(102,'A0001','http://wings.msn.to/hamu/','192.168.152.200','2012-11-27 05:11:17'),(103,'C0001','http://wings.msn.to/hamu/','192.168.42.118','2012-11-29 00:12:16'),(104,'A0001','http://wings.msn.to/hamu/','192.168.185.112','2012-12-09 20:24:12'),(105,'A0001','http://wings.msn.to/hamu/','192.168.210.236','2012-12-13 23:10:57'),(106,'A0001','http://wings.msn.to/hamu/','192.168.17.207','2012-12-16 15:18:17'),(107,'A0001','http://wings.msn.to/hamu/','192.168.207.132','2012-12-21 20:17:15'),(108,'C0001','http://wings.msn.to/hamu/','192.168.212.109','2012-12-24 23:14:17'),(109,'A0001','http://wings.msn.to/hamu/','192.168.166.19','2012-12-25 11:24:18'),(110,'A0001','http://wings.msn.to/hamu/','192.168.220.37','2012-12-26 21:25:49'),(111,'A0001','http://wings.msn.to/hamu/','192.168.32.214','2012-12-27 14:13:12'),(112,'A0001',NULL,'192.168.31.226','2012-12-27 23:11:15'),(113,'C0001','http://wings.msn.to/hamu/','192.168.65.81','2012-12-29 07:17:19'),(114,'A0001','http://wings.msn.to/hamu/','192.168.19.76','2012-12-30 23:17:47'),(115,'B0004','http://wings.msn.to/neko/','192.168.70.166','2013-01-01 12:25:12'),(116,'C0001','http://wings.msn.to/tori/','192.168.15.201','2013-01-01 13:18:14'),(117,'A0001','http://wings.msn.to/hamu/','192.168.13.16','2013-01-01 22:25:12'),(118,'C0001','http://wings.msn.to/hamu/','192.168.32.14','2013-01-01 23:18:14'),(119,'A0001','http://wings.msn.to/hamu/','192.168.16.115','2013-01-02 07:11:17'),(120,'C0002','http://wings.msn.to/neko/','192.168.30.206','2013-01-02 14:11:17'),(121,'A0001','http://wings.msn.to/hamu/','192.168.195.112','2013-01-03 04:10:49'),(122,'C0003','http://wings.msn.to/saru/','192.168.209.236','2013-01-03 14:10:49'),(123,'A0001','http://wings.msn.to/hamu/','192.168.16.198','2013-01-05 11:16:12'),(124,'C0004','http://wings.msn.to/kame/','192.168.206.132','2013-01-05 13:16:12'),(125,'C0005','http://wings.msn.to/neko/','192.168.211.109','2013-01-05 17:18:19'),(126,'C0001','http://wings.msn.to/hamu/','192.168.165.19','2013-01-05 20:18:19');
/*!40000 ALTER TABLE `access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `author_id` char(5) NOT NULL DEFAULT '',
  `name` varchar(30) DEFAULT NULL,
  `name_kana` varchar(100) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('A0001','有吉晴美','アリヨシハルミ','1985-02-15'),('K0001','川中智樹','カワナカトモキ','1986-03-12'),('M0001','守口靖男','モリグチヤスオ','1980-12-16'),('S0001','佐藤一郎','サトウイチロウ','1973-05-06'),('T0001','田中太郎','タナカタロウ','1975-11-01'),('Y0001','山田愛子','ヤマダアイコ','1970-04-06'),('Y0002','山田祥寛','ヤマダヨシヒロ','1960-12-04');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_books`
--

DROP TABLE IF EXISTS `author_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_books` (
  `isbn` char(13) NOT NULL DEFAULT '',
  `author_id` char(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`isbn`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_books`
--

LOCK TABLES `author_books` WRITE;
/*!40000 ALTER TABLE `author_books` DISABLE KEYS */;
INSERT INTO `author_books` VALUES ('4-0010-0000-0','Y0001'),('4-0010-0000-1','A0001'),('4-0010-0000-4','Y0001'),('4-0010-0000-9','M0001'),('4-7980-0522-3','Y0002'),('4-7980-0945-8','Y0002'),('4-7981-0722-0','Y0002'),('4-7981-0959-2','Y0002'),('4-8833-0000-1','S0001'),('4-8833-0000-2','K0001'),('4-8833-0000-3','T0001');
/*!40000 ALTER TABLE `author_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `isbn` char(17) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `publish` varchar(30) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `category_id` char(5) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('4-0010-0000-0','ハムスターの観察',900,'山田出版','2010-11-01','Z9999'),('4-0010-0000-1','PHPドリル',5100,'山田出版','2013-01-14','P1111'),('4-0010-0000-4','フェレットの観察',1000,'山田出版','2012-10-26','Z9999'),('4-0010-0000-5','らくだの観察日記',1100,'山田出版','2012-12-24','Z9999'),('4-0010-0000-6','あひるの観察日記',700,'山田出版','2012-11-15','A9999'),('4-0010-0000-7','かえるの観察日記',800,'山田出版','2013-01-15','H9999'),('4-0010-0000-9','SQL入門',5500,'山田出版','2012-10-30','S2222'),('4-7980-0522-3','JSPリファレンス',1800,'秀和システム','2010-04-19','J4444'),('4-7980-0945-8','PHP5サンプル集',3000,'秀和システム','2012-11-01','P1111'),('4-7981-0722-0','XML辞典',3300,'翔泳社','2011-09-16','X3333'),('4-7981-0959-2','PEAR入門',3000,'翔泳社','2012-09-08','P1111'),('4-8833-0000-1','SQLリファレンス',2500,'日経BP','2013-02-15','S2222'),('4-8833-0000-2','SQLプチブック',1600,'日経BP','2010-11-30','S2222'),('4-8833-0000-3','XMLリファレンス',3200,'日経BP','2012-11-24','X3333');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` char(5) NOT NULL DEFAULT '',
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('J4444','Java'),('P1111','PHP'),('S2222','SQL'),('X3333','XML'),('Z9999','未分類');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `c_id` char(4) NOT NULL DEFAULT '',
  `c_title` varchar(255) DEFAULT NULL,
  `next_id` char(4) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES ('A001','SQLについて','A011'),('A011','データの取得1','A012'),('A012','カラムの選択','A013'),('A013','WHERE句の記述','A014'),('A014','NULLと空白の扱い','A015'),('A015','あいまい検索','A016'),('A016','複数条件の連結（論理演算子）','A017'),('A017','重複レコードの除去','A021'),('A021','データの取得2','A022'),('A022','順位付け','A023'),('A023','ソート','A024'),('A024','グルーピング','A025'),('A025','グルーピング結果の絞り込み','A026'),('A026','クロス集計','A027'),('A027','サブクエリー','A028'),('A028','演算子による集計','A029'),('A029','複数表の結合','A031'),('A031','更新系SQL','A032'),('A032','レコードを1件挿入する','A033'),('A033','サブクエリで複数レコードを挿入する','A034'),('A034','全レコード一律の更新を行う','A035'),('A035','特定行の更新を行う','A036'),('A036','特定レコードの削除を行う','A037'),('A037','トランザクション','A041'),('A041','データベースの作成','A042'),('A042','データベースの作成／削除','A043'),('A043','制約条件','A044'),('A044','テーブルの作成／削除','A045'),('A045','テーブル情報の変更','A046'),('A046','インデックスの作成／削除','A047');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depart`
--

DROP TABLE IF EXISTS `depart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depart` (
  `depart_id` char(3) NOT NULL DEFAULT '',
  `depart_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depart`
--

LOCK TABLES `depart` WRITE;
/*!40000 ALTER TABLE `depart` DISABLE KEYS */;
INSERT INTO `depart` VALUES ('E01','第一営業部'),('E02','第二営業部'),('J01','人事部'),('S01','経営企画部'),('S02','総務部');
/*!40000 ALTER TABLE `depart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `s_id` char(7) NOT NULL DEFAULT '',
  `l_name` varchar(20) DEFAULT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `l_name_kana` varchar(100) DEFAULT NULL,
  `f_name_kana` varchar(100) DEFAULT NULL,
  `sex` smallint(6) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `depart_id` char(3) DEFAULT NULL,
  `b_id` char(7) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `retired` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('AI00001','相沢','聡','アイザワ','サトシ',1,'部長','S02',NULL,'2012-02-24',0),('DA00001','大門','一郎','ダイモン','イチロウ',1,'担当','J01','AI00001','2011-08-10',0),('FU00001','藤井','雄太','フジイ','ユウタ',1,'主任','E01','SE00001','2011-04-10',0),('FU00002','藤岡','幸太郎','フジオカ','コウタロウ',1,'担当','E01','FU00001','2011-06-12',0),('HA0001','速水','和幸','ハヤミ','カズユキ',1,'部長','E01',NULL,'2007-02-03',1),('HA0002','葉山','俊輔','ハヤマ','シュンスケ',1,'アシスタント','E01','FU00002','2012-12-11',0),('KA00001','川口','裕子','カワグチ','ユウコ',2,'アシスタント','S01','KI0001','2012-12-28',1),('KA00002','加藤','昭雄','カトウ','アキオ',1,'アシスタント','S01','KI0001','2011-11-11',0),('KA00003','神田','佐知子','カンダ','サチコ',1,'アシスタント','J01','KA00003','2012-01-28',0),('KI00001','木村','一郎','キムラ','イチロウ',1,'担当','S01','TA00001','2011-07-12',0),('NA00001','中澤','康代','ナカザワ','ヤスヨ',2,'アシスタント','S02','TO00002','2012-04-17',1),('NI00001','西','雄一','ニシ','ユウイチ',1,'アシスタント','B01',NULL,'2013-01-10',0),('NI00002','新渡戸','康治','ニトベ','コウジ',1,'アシスタント','B01',NULL,'2013-01-15',0),('NO00001','野上','利江','ノガミ','リエ',2,'アシスタント','S02','TO00002','2012-06-30',0),('SA00001','佐藤','智子','サトウ','トモコ',2,'部長','S01',NULL,'2010-02-01',0),('SE00001','妹尾','春樹','セノオ','ハルキ',1,'課長','E01','TE00001','2010-12-10',0),('SI00001','清水','春子','シミズ','ハルコ',2,'主任','J01','SI00001','2011-12-11',0),('TA00001','田中','真由子','タナカ','マユコ',2,'主任','S01','YA00001','2011-05-26',0),('TA00002','田辺','正一','タナベ','ショウイチ',1,'アシスタント','E01','HA0002','2012-12-19',0),('TE00001','寺岡','陽一','テラオカ','ヨウイチ',1,'部長','E01','HA0001','2009-12-11',0),('TI00001','近田','晃子','チカダ','アキコ',2,'課長','S02','AI00001','2012-03-01',0),('TO00001','遠山','真一','トオヤマ','シンイチ',1,'課長','J01','UE00001','2010-12-16',0),('TO00002','戸川','よしみ','トガワ','ヨシミ',2,'担当','S02','TU00001','2012-04-01',0),('TU00001','津村','知美','ツムラ','カズミ',2,'主任','S02','TI00001','2012-03-16',0),('UE00001','上田','一也','ウエダ','カズヤ',1,'部長','J01',NULL,'2011-11-12',0),('YA00001','山田','奈美','ヤマダ','ナミ',2,'課長','S01','SA00001','2012-10-15',0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `page_id` char(5) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `parent` char(5) DEFAULT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('A0001','ホーム',NULL),('B0001','WINGSについて','A0001'),('B0002','WINGSの歴史','B0001'),('B0003','WINGSメンバー紹介','B0001'),('B0004','WINGSメンバ募集','B0001'),('C0001','技術記事オンライン公開','A0001'),('C0002','最新インターネット記事','C0001'),('C0003','PHP関連記事','C0001'),('C0004','Java関連記事','C0001'),('C0005','ASP.NET関連記事','C0001'),('D0001','新刊案内','A0001'),('D0002','PHP関連新刊','D0001'),('D0003','Java関連新刊','D0001'),('D0004','ASP.NET関連新刊','D0001');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_desc`
--

DROP TABLE IF EXISTS `order_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_desc` (
  `po_id` int(11) NOT NULL DEFAULT '0',
  `p_id` char(10) NOT NULL DEFAULT '',
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`po_id`,`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_desc`
--

LOCK TABLES `order_desc` WRITE;
/*!40000 ALTER TABLE `order_desc` DISABLE KEYS */;
INSERT INTO `order_desc` VALUES (1,'PB00000001',200),(2,'PB00000002',300),(3,'DE00000001',20),(4,'TO00000001',10),(5,'TO00000002',10),(6,'TU00000001',2),(7,'IS00000001',3),(8,'PB00000001',100),(9,'PB00000002',150),(10,'DE00000001',10),(11,'TO00000001',5),(12,'TO00000002',5),(13,'PB00000001',1),(14,'PB00000002',50),(15,'DE00000001',50),(16,'TO00000001',5),(17,'TO00000002',5),(18,'PB00000001',100),(19,'PB00000002',100),(20,'DE00000001',10);
/*!40000 ALTER TABLE `order_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_main`
--

DROP TABLE IF EXISTS `order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_main` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` char(7) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`po_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_main`
--

LOCK TABLES `order_main` WRITE;
/*!40000 ALTER TABLE `order_main` DISABLE KEYS */;
INSERT INTO `order_main` VALUES (1,'A200405','2011-02-01','2011-02-07'),(2,'B200401','2011-03-02','2011-03-05'),(3,'B200402','2011-03-15','2011-03-18'),(4,'B200403','2011-04-15','2011-04-20'),(5,'B200404','2011-06-19','2011-06-30'),(6,'A200501','2011-08-05','2011-08-15'),(7,'A200501','2011-08-05','2011-08-15'),(8,'A200502','2011-08-24','2011-09-01'),(9,'A200503','2011-10-25','2011-11-01'),(10,'B200405','2011-12-04','2011-12-13'),(11,'A200501','2012-01-15','2012-01-19'),(12,'A200506','2012-02-14','2012-02-24'),(13,'B200501','2012-03-02','2012-03-05'),(14,'B200502','2012-04-05','2012-04-16'),(15,'B200503','2012-05-21','2012-05-30'),(16,'B200504','2012-06-04','2012-06-12'),(17,'B200501','2012-12-01','2012-12-08'),(18,'B200502','2012-12-14','2012-12-18'),(19,'B200503','2012-12-22',NULL),(20,'B200504','2012-12-25',NULL);
/*!40000 ALTER TABLE `order_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `p_id` char(10) NOT NULL DEFAULT '',
  `p_name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('DE00000001','電卓',600),('IS00000001','椅子',10000),('MA00000001','マウスパッド',1500),('PB00000001','黒ボールペン',100),('PB00000002','赤ボールペン',100),('TO00000001','トナー黒',1000),('TO00000002','トナー赤',1000),('TU00000001','机',15000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest`
--

DROP TABLE IF EXISTS `quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `name_kana` varchar(255) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `prefecture` varchar(10) NOT NULL,
  `age` int(11) DEFAULT '0',
  `answer1` int(11) DEFAULT NULL,
  `answer2` text,
  `answered` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest`
--

LOCK TABLES `quest` WRITE;
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
INSERT INTO `quest` VALUES (1,'山田太郎','ヤマダタロウ','男','東京都',30,3,'重宝しています。','2012-10-10 10:11:12'),(2,'井上茉莉','イノウエマリ','女','神奈川県',25,2,'面白いです。','2012-10-16 07:15:14'),(3,'上原遥','ウエハラハルカ','女','茨城県',26,1,'ちょっと難しいです。','2012-10-18 20:11:12'),(4,'江本修子','エモトシュウコ','女','東京都',32,3,'次回作に期待しています。','2012-10-24 21:14:18'),(5,'小野博美','オノヒロミ','女','神奈川県',40,2,'わかりやすいです。','2012-10-29 21:18:17'),(6,'河合太郎','カワイタロウ','男','東京都',22,1,'絵が少ない。','2012-11-01 20:10:14'),(7,'矢口一樹','ヤグチカズキ','男','茨城県',26,2,NULL,'2012-11-06 20:11:12'),(8,'有木守','アリキマモル','男','千葉県',35,3,'買ってよかった。','2012-11-10 21:14:18'),(9,'吉岡毅','ヨシオカツヨシ','男','埼玉県',18,3,NULL,'2012-11-21 14:18:19'),(10,'和田駿','ワダシュン','男','東京都',41,1,NULL,'2012-11-26 21:18:17'),(11,'清水一郎','シミズイチロウ','男','東京都',56,2,NULL,'2012-12-04 14:18:19'),(12,'南幸一','ミナミコウイチ','男','神奈川県',36,2,'','2012-12-16 21:11:17'),(13,'村井聡','ムライサトシ','男','茨城県',64,3,'文字が小さい。','2012-12-29 13:17:24'),(14,'森本雄二','モリモトユウジ','男','東京都',19,1,NULL,'2013-01-05 21:22:12'),(15,'西島泰治','ニシジマヤスハル','男','神奈川県',24,3,'読みやすいです。','2013-01-24 14:10:24'),(16,'根岸亜由美','ネギシアユミ','女','千葉県',34,3,'絵がかわいい。','2013-02-03 21:11:17');
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` char(7) DEFAULT NULL,
  `isbn` char(13) DEFAULT NULL,
  `rental_date` date DEFAULT NULL,
  `returned` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,'A200501','4-0010-0000-0','2011-12-01',1),(2,'A200403','4-8833-0000-2','2010-12-03',1),(3,'A200405','4-8833-0000-2','2011-03-20',1),(4,'B200403','4-8833-0000-2','2011-04-16',1),(5,'B200405','4-0010-0000-0','2012-01-16',1),(6,'A200502','4-8833-0000-2','2011-07-22',1),(7,'A200505','4-8833-0000-2','2011-08-23',1),(8,'B200501','4-8833-0000-2','2011-11-10',1),(9,'B200503','4-8833-0000-2','2012-01-20',1),(10,'B200504','4-0010-0000-0','2012-03-20',0),(11,'A200401','4-8833-0000-2','2012-02-11',1),(12,'A200402','4-8833-0000-2','2012-02-22',0),(13,'A200404','4-8833-0000-2','2012-03-19',1),(14,'A200405','4-0010-0000-0','2012-06-14',0),(15,'B200402','4-8833-0000-2','2012-08-27',1),(16,'B200404','4-8833-0000-2','2012-12-10',0),(17,'A200502','4-7980-0522-3','2011-10-25',1),(18,'A200506','4-7981-0722-0','2012-03-26',1),(19,'B200501','4-0010-0000-0','2012-09-15',1),(20,'B200503','4-8833-0000-1','2013-03-16',0),(21,'B200504','4-7980-0945-8','2013-01-14',0),(22,'B200505','4-7981-0959-2','2013-01-12',0),(23,'A200405','4-8833-0000-3','2012-12-22',0),(24,'B200403','4-0010-0000-9','2012-12-27',0),(25,'B200405','4-0010-0000-1','2013-03-10',0);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `s_id` char(5) NOT NULL DEFAULT '',
  `s_date` char(7) NOT NULL DEFAULT '0000-00',
  `s_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`,`s_date`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('H0001','2012-11',9975),('H0001','2012-12',9861),('K0001','2012-11',10142),('K0001','2012-12',11234),('K0002','2012-11',10124),('K0002','2012-12',10456),('M0001','2012-11',10784),('M0001','2012-12',11145),('M0002','2012-11',12032),('N0001','2012-11',9965),('N0001','2012-12',11023);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `s_id` char(5) NOT NULL DEFAULT '',
  `s_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES ('H0001','東桜町店'),('K0001','北花町駅前店'),('K0002','北花町東店'),('M0001','三吉町店'),('M0002','三吉町南店');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_card`
--

DROP TABLE IF EXISTS `time_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_card` (
  `s_id` char(7) NOT NULL DEFAULT '',
  `r_date` date NOT NULL DEFAULT '0000-00-00',
  `work_time` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`s_id`,`r_date`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_card`
--

LOCK TABLES `time_card` WRITE;
/*!40000 ALTER TABLE `time_card` DISABLE KEYS */;
INSERT INTO `time_card` VALUES ('DA00001','2012-11-01',9),('DA00001','2012-11-02',8),('DA00001','2012-11-03',10),('DA00001','2012-11-04',9),('DA00001','2012-11-07',8),('DA00001','2012-11-08',8),('DA00001','2012-11-09',8),('DA00001','2012-11-10',8),('DA00001','2012-11-11',9),('DA00001','2012-11-14',8),('DA00001','2012-11-15',10),('DA00001','2012-11-16',8),('DA00001','2012-11-17',8),('DA00001','2012-11-18',8),('DA00001','2012-11-21',8),('DA00001','2012-11-22',10),('DA00001','2012-11-23',8),('DA00001','2012-11-24',9),('DA00001','2012-11-25',8),('DA00001','2012-11-28',8),('DA00001','2012-11-29',9),('DA00001','2012-11-30',8),('DA00001','2012-12-01',8),('DA00001','2012-12-02',10),('DA00001','2012-12-05',8),('DA00001','2012-12-06',9),('DA00001','2012-12-07',8),('DA00001','2012-12-08',8),('DA00001','2012-12-09',9),('DA00001','2012-12-12',8),('DA00001','2012-12-13',10),('DA00001','2012-12-14',9),('DA00001','2012-12-15',8),('DA00001','2012-12-16',8),('DA00001','2012-12-19',8),('DA00001','2012-12-20',8),('DA00001','2012-12-21',9),('DA00001','2012-12-22',8),('DA00001','2012-12-23',10),('DA00001','2012-12-26',8),('DA00001','2012-12-27',8),('DA00001','2012-12-28',8),('FU00001','2012-11-01',8),('FU00001','2012-11-02',8),('FU00001','2012-11-03',9),('FU00001','2012-11-04',8),('FU00001','2012-11-07',10),('FU00001','2012-11-08',8),('FU00001','2012-11-09',8),('FU00001','2012-11-10',8),('FU00001','2012-11-11',8),('FU00001','2012-11-14',10),('FU00001','2012-11-15',8),('FU00001','2012-11-16',9),('FU00001','2012-11-17',8),('FU00001','2012-11-18',8),('FU00001','2012-11-21',9),('FU00001','2012-11-22',8),('FU00001','2012-11-23',10),('FU00001','2012-11-24',9),('FU00001','2012-11-25',8),('FU00001','2012-11-28',8),('FU00001','2012-11-29',8),('FU00001','2012-11-30',8),('FU00001','2012-12-01',8),('FU00001','2012-12-02',10),('FU00001','2012-12-05',8),('FU00001','2012-12-06',9),('FU00001','2012-12-07',8),('FU00001','2012-12-08',8),('FU00001','2012-12-09',9),('FU00001','2012-12-12',8),('FU00001','2012-12-13',10),('FU00001','2012-12-14',9),('FU00001','2012-12-15',8),('FU00001','2012-12-16',8),('FU00001','2012-12-19',8),('FU00001','2012-12-20',8),('FU00001','2012-12-21',9),('FU00001','2012-12-22',8),('FU00001','2012-12-23',10),('FU00001','2012-12-26',8),('FU00001','2012-12-27',8),('FU00001','2012-12-28',8),('FU00002','2012-11-01',9),('FU00002','2012-11-02',8),('FU00002','2012-11-03',10),('FU00002','2012-11-04',8),('FU00002','2012-11-07',8),('FU00002','2012-11-08',8),('FU00002','2012-11-09',8),('FU00002','2012-11-10',10),('FU00002','2012-11-11',8),('FU00002','2012-11-14',9),('FU00002','2012-11-15',8),('FU00002','2012-11-16',8),('FU00002','2012-11-17',9),('FU00002','2012-11-18',8),('FU00002','2012-11-21',10),('FU00002','2012-11-22',9),('FU00002','2012-11-23',8),('FU00002','2012-11-24',8),('FU00002','2012-11-25',8),('FU00002','2012-11-28',8),('FU00002','2012-11-29',9),('FU00002','2012-11-30',8),('FU00002','2012-12-01',8),('FU00002','2012-12-02',10),('FU00002','2012-12-05',8),('FU00002','2012-12-06',9),('FU00002','2012-12-07',8),('FU00002','2012-12-08',8),('FU00002','2012-12-09',9),('FU00002','2012-12-12',8),('FU00002','2012-12-13',10),('FU00002','2012-12-14',9),('FU00002','2012-12-15',8),('FU00002','2012-12-16',8),('FU00002','2012-12-19',8),('FU00002','2012-12-20',8),('FU00002','2012-12-21',9),('FU00002','2012-12-22',8),('FU00002','2012-12-23',10),('FU00002','2012-12-26',8),('FU00002','2012-12-27',8),('FU00002','2012-12-28',8),('HA0002','2012-11-01',10),('HA0002','2012-11-02',8),('HA0002','2012-11-03',8),('HA0002','2012-11-04',8),('HA0002','2012-11-07',8),('HA0002','2012-11-08',10),('HA0002','2012-11-09',8),('HA0002','2012-11-10',9),('HA0002','2012-11-11',8),('HA0002','2012-11-14',8),('HA0002','2012-11-15',9),('HA0002','2012-11-16',8),('HA0002','2012-11-17',10),('HA0002','2012-11-18',9),('HA0002','2012-11-21',8),('HA0002','2012-11-22',8),('HA0002','2012-11-23',8),('HA0002','2012-11-24',8),('HA0002','2012-11-25',9),('HA0002','2012-11-28',8),('HA0002','2012-11-29',10),('HA0002','2012-11-30',8),('HA0002','2012-12-01',8),('HA0002','2012-12-02',10),('HA0002','2012-12-05',8),('HA0002','2012-12-06',9),('HA0002','2012-12-07',8),('HA0002','2012-12-08',8),('HA0002','2012-12-09',9),('HA0002','2012-12-12',8),('HA0002','2012-12-13',10),('HA0002','2012-12-14',9),('HA0002','2012-12-15',8),('HA0002','2012-12-16',8),('HA0002','2012-12-19',8),('HA0002','2012-12-20',8),('HA0002','2012-12-21',9),('HA0002','2012-12-22',8),('HA0002','2012-12-23',10),('HA0002','2012-12-26',8),('HA0002','2012-12-27',8),('HA0002','2012-12-28',8),('KA00001','2012-11-01',10),('KA00001','2012-11-02',9),('KA00001','2012-11-03',8),('KA00001','2012-11-04',8),('KA00001','2012-11-07',8),('KA00001','2012-11-08',8),('KA00001','2012-11-09',9),('KA00001','2012-11-10',8),('KA00001','2012-11-11',10),('KA00001','2012-11-14',8),('KA00001','2012-11-15',8),('KA00001','2012-11-16',8),('KA00001','2012-11-17',8),('KA00001','2012-11-18',10),('KA00001','2012-11-21',8),('KA00001','2012-11-22',9),('KA00001','2012-11-23',8),('KA00001','2012-11-24',8),('KA00001','2012-11-25',9),('KA00001','2012-11-28',8),('KA00001','2012-11-29',10),('KA00001','2012-11-30',9),('KA00001','2012-12-01',8),('KA00001','2012-12-02',10),('KA00001','2012-12-05',8),('KA00001','2012-12-06',9),('KA00001','2012-12-07',8),('KA00001','2012-12-08',8),('KA00001','2012-12-09',9),('KA00001','2012-12-12',8),('KA00001','2012-12-13',10),('KA00001','2012-12-14',9),('KA00001','2012-12-15',8),('KA00001','2012-12-16',8),('KA00001','2012-12-19',8),('KA00001','2012-12-20',8),('KA00001','2012-12-21',9),('KA00001','2012-12-22',8),('KA00001','2012-12-23',10),('KA00001','2012-12-26',8),('KA00001','2012-12-27',8),('KA00001','2012-12-28',8),('KA00002','2012-11-01',8),('KA00002','2012-11-02',8),('KA00002','2012-11-03',8),('KA00002','2012-11-04',8),('KA00002','2012-11-07',9),('KA00002','2012-11-08',8),('KA00002','2012-11-09',10),('KA00002','2012-11-10',8),('KA00002','2012-11-11',8),('KA00002','2012-11-14',8),('KA00002','2012-11-15',8),('KA00002','2012-11-16',10),('KA00002','2012-11-17',8),('KA00002','2012-11-18',9),('KA00002','2012-11-21',8),('KA00002','2012-11-22',8),('KA00002','2012-11-23',9),('KA00002','2012-11-24',8),('KA00002','2012-11-25',10),('KA00002','2012-11-28',9),('KA00002','2012-11-29',8),('KA00002','2012-11-30',8),('KA00002','2012-12-01',8),('KA00002','2012-12-02',10),('KA00002','2012-12-05',8),('KA00002','2012-12-06',9),('KA00002','2012-12-07',8),('KA00002','2012-12-08',8),('KA00002','2012-12-09',9),('KA00002','2012-12-12',8),('KA00002','2012-12-13',10),('KA00002','2012-12-14',9),('KA00002','2012-12-15',8),('KA00002','2012-12-16',8),('KA00002','2012-12-19',8),('KA00002','2012-12-20',8),('KA00002','2012-12-21',9),('KA00002','2012-12-22',8),('KA00002','2012-12-23',10),('KA00002','2012-12-26',8),('KA00002','2012-12-27',8),('KA00002','2012-12-28',8),('KA00003','2012-11-01',10),('KA00003','2012-11-02',9),('KA00003','2012-11-03',8),('KA00003','2012-11-04',8),('KA00003','2012-11-07',8),('KA00003','2012-11-08',8),('KA00003','2012-11-09',9),('KA00003','2012-11-10',8),('KA00003','2012-11-11',10),('KA00003','2012-11-14',8),('KA00003','2012-11-15',8),('KA00003','2012-11-16',8),('KA00003','2012-11-17',8),('KA00003','2012-11-18',10),('KA00003','2012-11-21',8),('KA00003','2012-11-22',9),('KA00003','2012-11-23',8),('KA00003','2012-11-24',8),('KA00003','2012-11-25',9),('KA00003','2012-11-28',8),('KA00003','2012-11-29',10),('KA00003','2012-11-30',9),('KA00003','2012-12-01',8),('KA00003','2012-12-02',10),('KA00003','2012-12-05',8),('KA00003','2012-12-06',9),('KA00003','2012-12-07',8),('KA00003','2012-12-08',8),('KA00003','2012-12-09',9),('KA00003','2012-12-12',8),('KA00003','2012-12-13',10),('KA00003','2012-12-14',9),('KA00003','2012-12-15',8),('KA00003','2012-12-16',8),('KA00003','2012-12-19',8),('KA00003','2012-12-20',8),('KA00003','2012-12-21',9),('KA00003','2012-12-22',8),('KA00003','2012-12-23',10),('KA00003','2012-12-26',8),('KA00003','2012-12-27',8),('KA00003','2012-12-28',8),('KI00001','2012-11-01',9),('KI00001','2012-11-02',8),('KI00001','2012-11-03',10),('KI00001','2012-11-04',9),('KI00001','2012-11-07',8),('KI00001','2012-11-08',8),('KI00001','2012-11-09',8),('KI00001','2012-11-10',8),('KI00001','2012-11-11',9),('KI00001','2012-11-14',8),('KI00001','2012-11-15',10),('KI00001','2012-11-16',8),('KI00001','2012-11-17',8),('KI00001','2012-11-18',8),('KI00001','2012-11-21',8),('KI00001','2012-11-22',10),('KI00001','2012-11-23',8),('KI00001','2012-11-24',9),('KI00001','2012-11-25',8),('KI00001','2012-11-28',8),('KI00001','2012-11-29',9),('KI00001','2012-11-30',8),('KI00001','2012-12-01',8),('KI00001','2012-12-02',10),('KI00001','2012-12-05',8),('KI00001','2012-12-06',9),('KI00001','2012-12-07',8),('KI00001','2012-12-08',8),('KI00001','2012-12-09',9),('KI00001','2012-12-12',8),('KI00001','2012-12-13',10),('KI00001','2012-12-14',9),('KI00001','2012-12-15',8),('KI00001','2012-12-16',8),('KI00001','2012-12-19',8),('KI00001','2012-12-20',8),('KI00001','2012-12-21',9),('KI00001','2012-12-22',8),('KI00001','2012-12-23',10),('KI00001','2012-12-26',8),('KI00001','2012-12-27',8),('KI00001','2012-12-28',8),('NA00001','2012-11-01',9),('NA00001','2012-11-02',8),('NA00001','2012-11-03',10),('NA00001','2012-11-04',8),('NA00001','2012-11-07',8),('NA00001','2012-11-08',8),('NA00001','2012-11-09',8),('NA00001','2012-11-10',10),('NA00001','2012-11-11',8),('NA00001','2012-11-14',9),('NA00001','2012-11-15',8),('NA00001','2012-11-16',8),('NA00001','2012-11-17',9),('NA00001','2012-11-18',8),('NA00001','2012-11-21',10),('NA00001','2012-11-22',9),('NA00001','2012-11-23',8),('NA00001','2012-11-24',8),('NA00001','2012-11-25',8),('NA00001','2012-11-28',8),('NA00001','2012-11-29',9),('NA00001','2012-11-30',8),('NA00001','2012-12-01',8),('NA00001','2012-12-02',8),('NA00001','2012-12-05',9),('NA00001','2012-12-06',8),('NA00001','2012-12-07',10),('NA00001','2012-12-08',9),('NA00001','2012-12-09',8),('NA00001','2012-12-12',8),('NA00001','2012-12-13',8),('NA00001','2012-12-14',8),('NA00001','2012-12-15',9),('NA00001','2012-12-16',8),('NA00001','2012-12-19',10),('NA00001','2012-12-20',8),('NA00001','2012-12-21',8),('NA00001','2012-12-22',8),('NA00001','2012-12-23',8),('NA00001','2012-12-26',10),('NA00001','2012-12-27',8),('NA00001','2012-12-28',9),('NO00001','2012-11-01',10),('NO00001','2012-11-02',8),('NO00001','2012-11-03',8),('NO00001','2012-11-04',8),('NO00001','2012-11-07',8),('NO00001','2012-11-08',10),('NO00001','2012-11-09',8),('NO00001','2012-11-10',9),('NO00001','2012-11-11',8),('NO00001','2012-11-14',8),('NO00001','2012-11-15',9),('NO00001','2012-11-16',8),('NO00001','2012-11-17',10),('NO00001','2012-11-18',9),('NO00001','2012-11-21',8),('NO00001','2012-11-22',8),('NO00001','2012-11-23',8),('NO00001','2012-11-24',8),('NO00001','2012-11-25',9),('NO00001','2012-11-28',8),('NO00001','2012-11-29',10),('NO00001','2012-11-30',8),('NO00001','2012-12-01',8),('NO00001','2012-12-02',8),('NO00001','2012-12-05',9),('NO00001','2012-12-06',8),('NO00001','2012-12-07',10),('NO00001','2012-12-08',9),('NO00001','2012-12-09',8),('NO00001','2012-12-12',8),('NO00001','2012-12-13',8),('NO00001','2012-12-14',8),('NO00001','2012-12-15',9),('NO00001','2012-12-16',8),('NO00001','2012-12-19',10),('NO00001','2012-12-20',8),('NO00001','2012-12-21',8),('NO00001','2012-12-22',8),('NO00001','2012-12-23',8),('NO00001','2012-12-26',10),('NO00001','2012-12-27',8),('NO00001','2012-12-28',9),('SI00001','2012-11-01',8),('SI00001','2012-11-02',10),('SI00001','2012-11-03',8),('SI00001','2012-11-04',9),('SI00001','2012-11-07',8),('SI00001','2012-11-08',8),('SI00001','2012-11-09',9),('SI00001','2012-11-10',8),('SI00001','2012-11-11',10),('SI00001','2012-11-14',9),('SI00001','2012-11-15',8),('SI00001','2012-11-16',8),('SI00001','2012-11-17',8),('SI00001','2012-11-18',8),('SI00001','2012-11-21',9),('SI00001','2012-11-22',8),('SI00001','2012-11-23',10),('SI00001','2012-11-24',8),('SI00001','2012-11-25',8),('SI00001','2012-11-28',8),('SI00001','2012-11-29',8),('SI00001','2012-11-30',8),('SI00001','2012-12-01',8),('SI00001','2012-12-02',10),('SI00001','2012-12-05',8),('SI00001','2012-12-06',9),('SI00001','2012-12-07',8),('SI00001','2012-12-08',8),('SI00001','2012-12-09',9),('SI00001','2012-12-12',8),('SI00001','2012-12-13',10),('SI00001','2012-12-14',9),('SI00001','2012-12-15',8),('SI00001','2012-12-16',8),('SI00001','2012-12-19',8),('SI00001','2012-12-20',8),('SI00001','2012-12-21',9),('SI00001','2012-12-22',8),('SI00001','2012-12-23',10),('SI00001','2012-12-26',8),('SI00001','2012-12-27',8),('SI00001','2012-12-28',8),('TA00001','2012-11-01',8),('TA00001','2012-11-02',8),('TA00001','2012-11-03',9),('TA00001','2012-11-04',8),('TA00001','2012-11-07',10),('TA00001','2012-11-08',9),('TA00001','2012-11-09',8),('TA00001','2012-11-10',8),('TA00001','2012-11-11',8),('TA00001','2012-11-14',8),('TA00001','2012-11-15',9),('TA00001','2012-11-16',8),('TA00001','2012-11-17',10),('TA00001','2012-11-18',8),('TA00001','2012-11-21',8),('TA00001','2012-11-22',8),('TA00001','2012-11-23',8),('TA00001','2012-11-24',10),('TA00001','2012-11-25',8),('TA00001','2012-11-28',9),('TA00001','2012-11-29',8),('TA00001','2012-11-30',8),('TA00001','2012-12-01',10),('TA00001','2012-12-02',11),('TA00001','2012-12-05',10),('TA00001','2012-12-06',9),('TA00001','2012-12-07',10),('TA00001','2012-12-08',8),('TA00001','2012-12-09',8),('TA00001','2012-12-12',8),('TA00001','2012-12-13',8),('TA00001','2012-12-14',4),('TA00001','2012-12-15',8),('TA00001','2012-12-16',8),('TA00001','2012-12-19',10),('TA00001','2012-12-20',9),('TA00001','2012-12-21',9),('TA00001','2012-12-22',8),('TA00001','2012-12-23',11),('TA00001','2012-12-26',9),('TA00001','2012-12-27',8),('TA00001','2012-12-28',6),('TA00002','2012-11-01',8),('TA00002','2012-11-02',8),('TA00002','2012-11-03',8),('TA00002','2012-11-04',10),('TA00002','2012-11-07',8),('TA00002','2012-11-08',9),('TA00002','2012-11-09',8),('TA00002','2012-11-10',8),('TA00002','2012-11-11',9),('TA00002','2012-11-14',8),('TA00002','2012-11-15',10),('TA00002','2012-11-16',9),('TA00002','2012-11-17',8),('TA00002','2012-11-18',8),('TA00002','2012-11-21',8),('TA00002','2012-11-22',8),('TA00002','2012-11-23',9),('TA00002','2012-11-24',8),('TA00002','2012-11-25',10),('TA00002','2012-11-28',8),('TA00002','2012-11-29',8),('TA00002','2012-11-30',8),('TA00002','2012-12-01',8),('TA00002','2012-12-02',10),('TA00002','2012-12-05',8),('TA00002','2012-12-06',9),('TA00002','2012-12-07',8),('TA00002','2012-12-08',8),('TA00002','2012-12-09',9),('TA00002','2012-12-12',8),('TA00002','2012-12-13',10),('TA00002','2012-12-14',9),('TA00002','2012-12-15',8),('TA00002','2012-12-16',8),('TA00002','2012-12-19',8),('TA00002','2012-12-20',8),('TA00002','2012-12-21',9),('TA00002','2012-12-22',8),('TA00002','2012-12-23',10),('TA00002','2012-12-26',8),('TA00002','2012-12-27',8),('TA00002','2012-12-28',8),('TO00002','2012-11-01',8),('TO00002','2012-11-02',8),('TO00002','2012-11-03',9),('TO00002','2012-11-04',8),('TO00002','2012-11-07',10),('TO00002','2012-11-08',8),('TO00002','2012-11-09',8),('TO00002','2012-11-10',8),('TO00002','2012-11-11',8),('TO00002','2012-11-14',10),('TO00002','2012-11-15',8),('TO00002','2012-11-16',9),('TO00002','2012-11-17',8),('TO00002','2012-11-18',8),('TO00002','2012-11-21',9),('TO00002','2012-11-22',8),('TO00002','2012-11-23',10),('TO00002','2012-11-24',9),('TO00002','2012-11-25',8),('TO00002','2012-11-28',8),('TO00002','2012-11-29',8),('TO00002','2012-11-30',8),('TO00002','2012-12-01',8),('TO00002','2012-12-02',10),('TO00002','2012-12-05',8),('TO00002','2012-12-06',9),('TO00002','2012-12-07',8),('TO00002','2012-12-08',8),('TO00002','2012-12-09',9),('TO00002','2012-12-12',8),('TO00002','2012-12-13',10),('TO00002','2012-12-14',9),('TO00002','2012-12-15',8),('TO00002','2012-12-16',8),('TO00002','2012-12-19',8),('TO00002','2012-12-20',8),('TO00002','2012-12-21',9),('TO00002','2012-12-22',8),('TO00002','2012-12-23',10),('TO00002','2012-12-26',8),('TO00002','2012-12-27',8),('TO00002','2012-12-28',8),('TU00001','2012-11-01',8),('TU00001','2012-11-02',8),('TU00001','2012-11-03',8),('TU00001','2012-11-04',8),('TU00001','2012-11-07',9),('TU00001','2012-11-08',8),('TU00001','2012-11-09',10),('TU00001','2012-11-10',8),('TU00001','2012-11-11',8),('TU00001','2012-11-14',8),('TU00001','2012-11-15',8),('TU00001','2012-11-16',10),('TU00001','2012-11-17',8),('TU00001','2012-11-18',9),('TU00001','2012-11-21',8),('TU00001','2012-11-22',8),('TU00001','2012-11-23',9),('TU00001','2012-11-24',8),('TU00001','2012-11-25',10),('TU00001','2012-11-28',9),('TU00001','2012-11-29',8),('TU00001','2012-11-30',8),('TU00001','2012-12-01',8),('TU00001','2012-12-02',10),('TU00001','2012-12-05',8),('TU00001','2012-12-06',9),('TU00001','2012-12-07',8),('TU00001','2012-12-08',8),('TU00001','2012-12-09',9),('TU00001','2012-12-12',8),('TU00001','2012-12-13',10),('TU00001','2012-12-14',9),('TU00001','2012-12-15',8),('TU00001','2012-12-16',8),('TU00001','2012-12-19',8),('TU00001','2012-12-20',8),('TU00001','2012-12-21',9),('TU00001','2012-12-22',8),('TU00001','2012-12-23',10),('TU00001','2012-12-26',8),('TU00001','2012-12-27',8),('TU00001','2012-12-28',8);
/*!40000 ALTER TABLE `time_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr`
--

DROP TABLE IF EXISTS `usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usr` (
  `user_id` char(7) NOT NULL DEFAULT '',
  `l_name` varchar(20) DEFAULT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `l_name_kana` varchar(100) DEFAULT NULL,
  `f_name_kana` varchar(100) DEFAULT NULL,
  `prefecture` varchar(15) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `o_address` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp932;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr`
--

LOCK TABLES `usr` WRITE;
/*!40000 ALTER TABLE `usr` DISABLE KEYS */;
INSERT INTO `usr` VALUES ('A200401','井上','一郎','イノウエ','イチロウ','千葉県','東千葉市北町','2-4-1','040-111-0001','inoue@wings.msn.to'),('A200402','上原','幸一','ウエハラ','コウイチ','神奈川県','神奈川市南町','1-5-2','040-222-0002','uehara@wings.msn.to'),('A200403','江本','聡','エモト','サトシ','茨城県','茨城市西町','2-1-12','040-333-0003','emoto@wings.msn.to'),('A200404','小野','雄二','オノ','ユウジ','東京都','東京市南町','3-2-6','040-111-0004','ono@examples.com'),('A200405','河合','泰治','カワイ','ヤスハル','神奈川県','神奈川市北町','4-2-12','040-222-0005','kawai@wings.msn.to'),('A200501','山田','太郎','ヤマダ','タロウ','東京都','東京市西町','0-0-0','040-111-0031','taro_yama@wings.msn.to'),('A200502','木下','一樹','キノシタ','カズキ','茨城県','茨城市東町','5-1-10','040-333-0006','kino@wings.msn.to'),('A200503','久保田','守','クボタ','マモル','千葉県','東千葉市南町','2-1-21','040-111-0007','kubota@wings.msn.to'),('A200504','児玉','毅','コダマ','ツヨシ','埼玉県','西埼玉市東町','3-4-11','040-444-0008','kodama@wings.msn.to'),('A200505','坂口','駿','サカグチ','シュン','栃木県','北栃木市西町','6-2-4','040-555-0009','saka@examples.com'),('A200506','井上','一郎','イノウエ','イチロウ','静岡県','南静岡市花町','4-2-1','040-666-0010','shimi@wings.msn.to'),('B200401','矢口','亜由美','ヤグチ','アユミ','千葉県','東千葉市南町','3-4-6','040-111-0011','yaguchi@wings.msn.to'),('B200402','有木','茉莉','アリキ','マリ','神奈川県','神奈川市北町','1-4-5','040-222-0012','yuki@wings.msn.to'),('B200403','吉岡','遥','ヨシオカ','ハルカ','茨城県','茨城市東町','7-2-1','040-333-0013','yoshi@examples.com'),('B200404','和田','修子','ワダ','シュウコ','東京都','東京市北町','6-1-11','040-111-0014','wada@wings.msn.to'),('B200405','松本','博美','マツモト','ヒロミ','神奈川県','神奈川市南町','3-4-21','040-222-0015','matsu@wings.msn.to'),('B200501','南','沙恵','ミナミ','サエ','茨城県','茨城市西町','3-3-2','040-333-0016','minami@wings.msn.to'),('B200502','村井','佐知子','ムライ','サチコ','千葉県','東千葉市北町','4-1-13','040-111-0017','murai@wings.msn.to'),('B200503','森本','絵里','モリモト','エリ','埼玉県','西埼玉市西町','2-1-4','040-444-0018','morimo@examples.com'),('B200504','西島','文子','ニシジマ','フミコ','栃木県','北栃木市東町','2-5-7','040-555-0019','nishi@wings.msn.to'),('B200505','根岸','裕子','ネギシ','ユウコ','静岡県','南静岡市寺町','3-4-8','040-666-0020','negi@wings.msn.to');
/*!40000 ALTER TABLE `usr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-09 15:34:52
