-- MySQL dump 10.13  Distrib 5.5.16, for osx10.5 (i386)
--
-- Host: localhost    Database: mysqlTest_development
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Current Database: `mysqlTest_development`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysqltest_development` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mysqlTest_development`;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colleges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (11,'PES Institute of Technology','100ft Ring Road, Hosakerehally','Banashankari 3rd Stage','Bangalore','Karnataka','India','560085',1,'919535890448','admin@pes.edu','','2012-10-25 16:52:03','2012-10-25 16:52:03'),(12,'PESSE','100ft Ring Road, Hosakerehally','Banashankari 3rd Stage','Bangalore','Karnataka','India','560085',1,'919535890448','admin@pes.edu','','2012-10-25 20:13:36','2012-10-25 20:13:36'),(13,'PESSE-MBA','100ft Ring Road, Hosakerehally','Banashankari 3rd Stage','Bangalore','Karnataka','India','560085',1,'919535890448','admin@pes.edu','','2012-10-25 20:13:49','2012-10-25 20:13:49'),(14,'BMS College of Engineering','Near Dodda Ganesha Temple','Basavanagudi','Bangalore','Karnataka','India','560004',1,'2233221','admin@bms.edu','www.bmsce.com','2013-06-12 09:47:53','2013-06-12 09:47:53');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `micropost_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (97,'hello',364,1,'2012-10-26 03:05:47','2012-10-26 03:05:47'),(99,'comment 2',387,1,'2012-10-28 15:01:53','2012-10-28 15:01:53');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (25,'ECE Dept',1,11,'2012-10-25 16:52:38','2012-10-25 16:52:38'),(26,'TCE Dept',1,11,'2012-10-25 16:53:20','2012-10-25 16:53:20'),(27,'Computer Science and Engineering',1,14,'2013-06-12 09:50:32','2013-06-12 09:50:32');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (7,11,25,'4B',1,'2012-10-25 16:52:52','2012-10-25 16:52:52'),(8,11,25,'4A',1,'2012-10-25 16:55:16','2012-10-25 16:55:16'),(9,11,25,'4A',1,'2012-10-25 16:57:27','2012-10-25 16:57:27'),(10,14,27,'1st SEM',1,'2013-06-12 09:51:16','2013-06-12 09:51:16');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microposts`
--

DROP TABLE IF EXISTS `microposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `college_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_microposts_on_user_id_and_created_at` (`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microposts`
--

LOCK TABLES `microposts` WRITE;
/*!40000 ALTER TABLE `microposts` DISABLE KEYS */;
INSERT INTO `microposts` VALUES (364,'mnjvnfb',1,'2012-10-25 18:39:39','2012-10-25 18:39:39',NULL,NULL,NULL),(387,'s ',1,'2012-10-28 07:30:05','2012-10-28 07:30:05',NULL,NULL,NULL),(388,'hello',1,'2012-11-13 10:29:29','2012-11-13 10:29:29',NULL,NULL,NULL),(389,'The first post for college-level ',1,'2013-06-12 05:37:13','2013-06-12 05:37:13',11,NULL,NULL),(390,'Post from class level ',1,'2013-06-12 08:52:40','2013-06-12 08:52:40',11,25,7);
/*!40000 ALTER TABLE `microposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(11) DEFAULT NULL,
  `followed_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_relationships_on_follower_id_and_followed_id` (`follower_id`,`followed_id`),
  KEY `index_relationships_on_follower_id` (`follower_id`),
  KEY `index_relationships_on_followed_id` (`followed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES (1,1,3,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(2,1,4,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(3,1,5,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(5,1,7,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(6,1,8,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(7,1,9,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(8,1,10,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(10,1,12,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(11,1,13,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(12,1,14,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(13,1,15,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(14,1,16,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(15,1,17,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(18,1,20,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(19,1,21,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(20,1,22,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(21,1,23,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(22,1,24,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(23,1,25,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(24,1,26,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(25,1,27,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(26,1,28,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(27,1,29,'2012-10-10 05:18:54','2012-10-10 05:18:54'),(28,1,30,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(29,1,31,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(30,1,32,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(31,1,33,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(32,1,34,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(33,1,35,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(34,1,36,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(35,1,37,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(36,1,38,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(37,1,39,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(38,1,40,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(39,1,41,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(40,1,42,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(41,1,43,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(42,1,44,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(43,1,45,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(44,1,46,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(45,1,47,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(46,1,48,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(47,1,49,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(48,1,50,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(49,1,51,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(50,4,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(51,5,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(52,6,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(53,7,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(54,8,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(55,9,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(56,10,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(57,11,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(58,12,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(59,13,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(60,14,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(61,15,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(62,16,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(63,17,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(64,18,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(65,19,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(66,20,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(67,21,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(68,22,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(69,23,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(70,24,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(71,25,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(72,26,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(73,27,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(74,28,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(75,29,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(76,30,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(77,31,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(78,32,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(79,33,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(80,34,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(81,35,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(82,36,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(83,37,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(84,38,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(85,39,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(86,40,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(87,41,1,'2012-10-10 05:18:55','2012-10-10 05:18:55'),(88,103,1,'2013-01-20 13:16:56','2013-01-20 13:16:56');
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120928215603'),('20120929103713'),('20120929112637'),('20120929211953'),('20120930003422'),('20121001052103'),('20121004104204'),('20121007020252'),('20121007022618'),('20121007023247'),('20121011162407'),('20121011165105');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_colleges`
--

DROP TABLE IF EXISTS `user_colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_colleges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  `college_priv` smallint(5) unsigned DEFAULT '0',
  `department_id` int(11) DEFAULT NULL,
  `dept_priv` smallint(5) unsigned DEFAULT '0',
  `group_id` int(11) DEFAULT NULL,
  `group_priv` smallint(5) unsigned DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_colleges`
--

LOCK TABLES `user_colleges` WRITE;
/*!40000 ALTER TABLE `user_colleges` DISABLE KEYS */;
INSERT INTO `user_colleges` VALUES (25,1,11,4,25,4,7,4,'2012-10-25 16:52:03','2012-10-25 16:52:03',NULL,NULL),(26,1,11,0,26,4,NULL,0,'2012-10-25 16:53:20','2012-10-25 16:53:20',NULL,NULL),(27,1,11,0,25,0,9,4,'2012-10-25 16:57:27','2012-10-25 16:57:27',NULL,NULL),(28,1,12,4,NULL,0,NULL,0,'2012-10-25 20:13:36','2012-10-25 20:13:36',NULL,NULL),(29,1,13,4,NULL,0,NULL,0,'2012-10-25 20:13:49','2012-10-25 20:13:49',NULL,NULL),(30,1,11,0,NULL,0,NULL,0,'2012-11-14 16:40:47','2012-11-14 16:40:47',NULL,NULL),(31,1,11,0,NULL,0,NULL,0,'2012-11-14 17:54:27','2012-11-14 17:54:27',NULL,NULL),(32,1,11,0,25,0,8,0,'2012-11-14 18:01:30','2012-11-14 18:01:30',NULL,NULL),(33,1,14,4,27,4,10,4,'2013-06-12 09:47:53','2013-06-12 09:47:53',NULL,NULL),(34,2,14,0,27,0,10,0,'2013-06-12 09:54:48','2013-06-12 09:54:48',NULL,NULL);
/*!40000 ALTER TABLE `user_colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  KEY `index_users_on_remember_token` (`remember_token`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Shiva','example@railstutorial.org','2012-10-10 05:18:46','2012-10-10 05:18:46','$2a$10$0CuDmJWgQDheAxyfuKyJOO4cjCPN5njGX8t189tZnqdhuHw8uDdL6','ea5b8b2acb149b35db5ba1f3149167a9d3698a7380d20f71b8811ca3d05a897fe6fb3ff9b1f2b7588caa46cc18553440ba003068c9300128bd5446cc61748f21'),(2,'Gunnar Upton','example-1@railstutorial.org','2012-10-10 05:18:46','2012-10-10 05:18:46','$2a$10$da0JIFs6IqWqqR4H9O4j6uvC1c4gFAzfrAuXUp4u5xiomekwM6qHu','4dd5f7685f0c959aff0d71f23fa227a13dde265149c1cce2d89c34c7963d6ec5fd6ca2e799507a4c2755918da46f9f0c993d278c68c33f35f0b3f374a4feccb9'),(3,'Mittie Feeney','example-2@railstutorial.org','2012-10-10 05:18:46','2012-10-10 05:18:46','$2a$10$NGTlUpENpS38./MOfb7qYeddq9E.u.d0Hhh/fqRGVSCLIiAIYFemC','0e2acd58ba7fc1ce164c6a220d2c784ad694feae6cfa138d350be18d1e59743715de2237a9034599fc2e5c0b3763d1ada51e03926768e9b4575934d3de20c01c'),(4,'Brendon Johns','example-3@railstutorial.org','2012-10-10 05:18:46','2012-10-10 05:18:46','$2a$10$BeWGdp315K.gOM5r2VjbxOv1c.nsdpPf6uxbKQIw.JyhMtga8rVbK','76d48ca295bbc8a63dbe7be05aa067e3dad6acef1aa7cf1eb5cb1e5ef5091702fa5762a6267a4ff348b7d749795b37a4d92ff370267ed75447e16b6e5e63c50e'),(5,'Dameon VonRueden PhD','example-4@railstutorial.org','2012-10-10 05:18:46','2012-10-10 05:18:46','$2a$10$o9/Jotodp76n3rFjnTrGv.Pox0oSwBFpXvzMJLuk3YSHRSMmFH7Ce','49eb14ee94ef9cb34b20ddcf7c2cb848b465bf3816b8ee41d3c697a46cedfa3f4c08bbc12bf956ea4d57bec37332092bdcf1b649490efec2397dc36290153544'),(6,'Euna Bernhard','example-5@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$/0Cvlo3HTZBFogL0BbLWUO.38S3KkzrSbRJBNmEU8BekGcx.pxcbO','721987234274dd3e99284f088d1e46f454ac9908c306ed416e7d903d234a5a4fef3e0187756fedd4a97a8695d114c130d90cf4702095470e6c9f74a570da3d6c'),(7,'Shayne Heaney V','example-6@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$mXkggnYFGKB67kuJrJ6LDuSVtcskmv45pQYVYXJMKFcj4FbHowxF6','eb7ef5c4815fb67f3920652b67ab25b5d026851497784748a9f8749b60c11be58960236e09763e614d93612bb189f097d62244112aad547e85574c9291d1e046'),(8,'Ernestine Hane','example-7@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$RTpoL7WFM01iDRQFShD2K.8xkb/VlPb3jyN/zlxmiyQslfqNcybcq','6643d587271e565c3dfcd7e6ceee48e48550a5a6235d66b35b8308beb63317e4779da4e0cca6a387c57e456e278924a095beceb0a758d15b67a07c8421b1f19d'),(9,'Ms. Desmond Leannon','example-8@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$Ps/6q7hcmaspY5g79fYC0eYIHo7Cn2o6rXvTyAH13yFDBTgrDqoyy','303e6ef0d395009b2c36f21c3a7b770cf939623352ceced43cc1f4c8be8a9e1999cf56f17fbccc32697696a49e909d87cbb2a4a4e2ef0ba13920429e44d165a2'),(10,'Era Kling','example-9@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$jTKF6qfPRrOgVpBTKuqHRuxuHwbNWB9o0Yk5w46ubpsxGKC9ALagS','2ceccfa4cc4478b99a1fa35db494cdd288bd49bb1ce3961fca21ac58db04269da86a54a0007388fee33b877832bb9b9b2caba4b1d04f370881f201877ad9e579'),(11,'Violet Kilback','example-10@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$6rGA.t59colFFYhwAUXnm.DUMYvdJ1BdW/y4gTu2pcXpH3nrr/tii','aa9d344b99696280c4a12e2339ae75e55e1aa46c44fc42e1d247c374945c5ad37ce616d8d7ec7f83cb7dd60e91e70bee7a3d2543c2f671220258ae4ff8fe39ef'),(12,'Joshuah Bechtelar II','example-11@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$vs.fVfpDbWyGuOQgQDzjeO3hqJwLdw5Z6IRQPmHROpf0mPw7YpBCO','703aa79a392c03bbedcadc25a2ae0c16b736bc3f65d68584a51e74f97dcf0a27ee8d01749fa18f822e4da463a22446ca5eacc84acd69f0669e3845f2b07984a7'),(13,'Isac Baumbach IV','example-12@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$xjrkYo4pCfHXCav4g75bDu/ZaZgueRw2OIV3Gtzh02YkX/C5KtEhK','362694ac7ce8c5258aecb3d211c345fe2b09d4ecee97046b13e41c5cbcc1eac24cfbb074d30cc5a13ef32aa35e8ba9b834e46cd2eb91f0d3e6849302695c9002'),(14,'Golden Mosciski','example-13@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$RvMS2R8z2iCcFVGmexb/vOEarCMFgJzumsnqQnhtmfw/sr87SxK02','c6b90aa859878bb7f5198316af7c62933b17a2a5eafa644c2f364368eff673302a983e2789f2af66777ef81eebd73865fa85af33636087b6c6bdf71850a6d9ff'),(15,'Edwardo Roob','example-14@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$y.mWq6whrxdtL7jRB9Ys3.gJmtqFebCS3UTs6laJx8dc19JOfAgr.','5afea2b7365f43432c5ac3887fab85fde9f77b83ffeeb81a6581425b69f21108340e0b6a7ccef220daf03c4e42c67e8fd7e1c4fb555acb71fef89d52637b4807'),(16,'Johann Lowe','example-15@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$Edq6yIZSQq7H2umNRo/7c.A5MxV6XajDt8O.WtxWIIhu2QPaSETVi','df820d53288582d7e90413e1d3a32f4114e5dbfcb3e4fb41d754c1f0c40f3cec76481aeb05fda432ab003a0ba3e57fb4744d278cec60c7d49d06c0c73845ddbb'),(17,'Wyatt Farrell','example-16@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$3QnS0PcEzAEtZzobNCXF3.05CHAsqqhwkQ1.AwWbSLnMgv2FfGvwa','0e2b7e488d4439e79b81d3e1b1e4b8314f150e596dfdff8e7d3e793c71f1500fb07a48f19176493bf41680735311329a5911e4140547231aeff78bb8d561c8aa'),(18,'Omari Kovacek','example-17@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$YfZlldgF/iQWJ1L38QJlZ.vmrarp8usyUL0gWypQ2jf7x7Rt.QovC','da30f3cc51d8eda937503c9d27ded2fff14bc95041fe033f714f7e8f40d4bca8b3a6379ba84b4c13687688c48b6396a410368a737f0c8007d313fc7157dcc67c'),(19,'Anika Romaguera','example-18@railstutorial.org','2012-10-10 05:18:47','2012-10-10 05:18:47','$2a$10$Kf/qyWIxNaQtLd26lOfhFuGENCHqYiVvgfFmH0PG16R7t0pZlM9mu','e26e2ae7ec3237497cd4b740fedbcbbda3900d7c602eba4d4fc72964f02dfd3ed3befa5bec186de39b30764f8fd41214c1aad4898f7d55bb1f488ff8c344bfdd'),(20,'Deanna Effertz','example-19@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$fXHsLPukunS5KI.KWXa32.Te.7A8eC2IlfbkK8aNJCCJOUhMg1S1.','fa29a53c44a42fadc5ecd44d35bd6b6aea775f87117de7703a5454cca5d4ec6fd8a53ad7299e24ef7bcd400a84402b97bb0719fef0f633bd3eb37a2a799caaa7'),(21,'Erica Satterfield','example-20@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$WZODNqiCLZMVsX7gP3fa.Ops4Xk7GFktdqnFOOctGB6lyqPeWrUKe','0d0ac7c38b12d32a60a67254bb76fc76e3a9e8416c6658f2a0721c46a1f40c263fca48ca46b910bf00de0fd932dcb670f1fc9b04d2992ca40cc181f3d3cfa410'),(22,'Giles Auer','example-21@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$pFNosyagO1TtVkQeYcHdweFwxngz7DsG9IwJ13WhICON6/qL142Im','7a125c40981e075387ba7aabc8564537ceb1039c396739834277dd938a6aa728fe236e87f177d9128258d88d3247fb97520667ddec2079bdac295b560a666ac8'),(23,'Lon Heller','example-22@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$N9/eeTLEOiqv1DBBBMQSUO50EJEhDON3VUM/CVv0rQ/.8jeQOvggK','17e9c5b6ccac002694d71af89d446a813a448fdf5dfce28ed01ffbbb4789db7296f0cedb260d65d4833c7bfd814be67717ff5e7b5965413b61b770f9a55e441c'),(24,'Uriel Ernser PhD','example-23@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$Uo4GyFBZMb2eqsXCutv9EuhCar1Fzsv83gbI2FbZNlI0Q1prBH7Gy','e4542cb22bf8cc9ca57b5c5c3f513edc27b6c18efa363bdd82d2ac77168e71aedc6143bd557df387b4ab3002fbe5ec4453651fd9badca6337af417b0f7892e49'),(25,'Alda Schaefer','example-24@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$jeFpXNUMtpOOAxrVtc6ZweEc3VA3nRs87.6mngMqQHbnSvt4ZRYxS','9dda7e897c6a4a832587fc04d32eccea9c83e65ff8c67de0b6fc718a7acf3d9dde5a0694fdf42aeffed369a7fb4050b03abeea83f9e6fc72c0c95573fe189734'),(26,'Nyah Kuvalis Jr.','example-25@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$WdIyLlLc4srNSIY5PGFjkeUeXbO6sDYP7v1q1aSD5G0teXCuSgQBi','bb69b1b42f0c0b8a2fa7ce936093e02b2cdc1d85261438b24abb1b6c2dfb2a2ffb8d94c13ca6a35d191e6abba8f8306edd2f3f93082db93235f18dd78f966a4e'),(27,'Baylee Walter','example-26@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$PaeRCQ4ORhqQrqD1f25LKu3ukIBsi3RclkIQvvO0kAJU2X2WrL4GO','396075799e7cf7386d5b7f0aefbedc7d51358d788be839248b49182f3d79566037f0d56cf74885bfe16a945c4a2b42b14e320f2e0b24deb0263094a16961ff89'),(28,'Ms. Tyrel Walsh','example-27@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$/xNJxJ7Bpe4Pjy0yBzR6peptCZO/vKBWQ7WBxwsEnrDexS0S5kwRe','83542f2c4f8b873448e2e52fc7498cbbd5485a47d421d8a75138ba7b38d12e658c1bbab49e114b2fefaf1c58ef5f317b0cc7fb0ecfb5a90ad0af92cc3e4304f6'),(29,'Ruben Renner','example-28@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$y4p9OnxU9P/lZiS0yZdtAeMq49knrvDNLPo8dmPrdrMbme99EKCrW','f1f8551606742b1a36d4a8d9274f689de61d25911cb6a4fb78b887a171d8f0c0084acf6199b837eef1a13a69e0f8b620c445da261e49ccf8a809dece0b077a6f'),(30,'Misty Treutel','example-29@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$V6Mckn81J9PkU7qC0gvHEOZosUuEdFGIsBg3wfaxsWqeFAl5xeY.W','e72be3551a566f2753781313dfeb2420ae8ab811dd50b00f217e91f25cffde34515934b7e860aee8c60d0b157de1a98340b1511583c41fb6249b972fe6c7009b'),(31,'Mr. Onie Auer','example-30@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$UzmH7OhRsWpWmYUHn7xBx.c8UI7FBkdJO.aStV3cxQk2qXHMQ3IIu','5e5183670fb41ad91a0865a08ea8fa6d1cb77eb994817545e24180e88a85e9b2307e8c0014e9bc565833e0936df662db138f519ffe65752be71f5c10aed688b6'),(32,'Doug Crooks','example-31@railstutorial.org','2012-10-10 05:18:48','2012-10-10 05:18:48','$2a$10$qJcXdphJZQ4WGcJMM21efOAa/SQCFoCAW1qjEVicwoq6LE9m9P47C','f4ff4dc4ca1f25ee58fc0c7c08dc0c37265ffcbf4658947a433f3205eff398076f818b7938c04673db98d5490a09b8e087d059f6b502c243696c6321551b39e5'),(33,'Friedrich Kshlerin','example-32@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$YVyb71ponBTXqpFym/3KcOD80OUJah2On8Y7NECZjRzMBOepJq2aa','0c0eec98f3ba9400c3348a5401ebc3110f34ff48a1ec2bba516c578f94ff272a6dda510b1be3956c6016d3b3b6b472a14eb02df57061c310197e61c2101b45ad'),(34,'Ericka Watsica MD','example-33@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$2ci/sSDToDotjjuxjVPn3eb01WK22wDkEsL9.n7ppitmCklfz/AJG','113320ad3d5572e9759ee418b5283ff387b0fa2e0e537744abb45069c09460ba225886f5201c9c8e6dfcba9c506c3d8b3b82d30bd8f057a8f605ad2c7e7a275b'),(35,'Margaretta Stamm','example-34@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$a8QPXtbfFqXXvUA.rUt6j.nks.NRpf4OtcB3gtCYsTIijtnfY0zMW','f1cc8b3aed6dfe81a886749490be41e2462c5b6a8f33bc067b656a9f12cfadfc9b20732d0d5054c50158d84b8489b12cc7e8bb44f5a3c225bdd9c3d78ba1003a'),(36,'Jaquan Bernhard','example-35@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$FPih/XrDTiQqzyGMONHz8.nZboqxHS3Cc/8IRCh98iv7.qa0ES07W','48b3fc4b10dd16ed72ae3d5e8f07f018028de15d9eec31cfbe4c263fbb743f7521f16408f5a5fc0fd66b17acc97a112e26f10966ca0aeeacd55ecc81d58a3502'),(37,'Mckenna Johnston MD','example-36@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$uEyH9wAYfPZeFLabe.8ae.EPx.cjwcDYbthYFEkGLQ5M2Zv7vBsl6','ccf189ab24ca8dd4741afa86a5b88de8f0a79b47ed41d25f0414e0f0c72a3658532f9ac1973d87f3e7773bf2b0795c80e073182ded2ff555fbd30b9f41d35b66'),(38,'Verla Hammes','example-37@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$DZguhAb0fxe9EqT4Wo.nkuShkLpwx5Kl8w0EOuiPz2UFrmuOIve/G','dda9a30b0bbbaea72afcaff0b2f3e66b3de1b649b68547f58f6c19cfc364f914942568e3154ca51f40f1e77b870c37dc91d551ee72baffd28c827277d2e259c8'),(39,'Marcos Bailey','example-38@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$6UHpFOLvOsMPKF0waV47j.VvT3kGzOTG5Dd4CMrWXcVbfsa2g/1Dm','6396cc6e55a3b1016886bdb0ac9d6b41ac1e0e9ca7afa80c1d39869be5ede6844b7e9a80d73f813b5a3128188d4ab3a91b297098ba6cca8acac211aeb53b7817'),(40,'Camila Towne','example-39@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$rYaCZwC5hvtqXBsF3.LXte3N0OOLSlwej7cFRCMi2HbFRvNPInxRu','413d974b6b58aa7ac544d343b85e86ecf08d21fff14c81294fefe7b35ed1ad2e1ca12a2f30e2b0d62bcedc6fe5d5dd669a096bba0b110a78456bbe5f1995003c'),(41,'Garnet Feest Jr.','example-40@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$neuzFoatEvMY0gYGwR2BkeQIsczcJdZMHg6UlTmCDRJ71qVlYrGlW','5c6fb8f64f772827a5f2d86058956f865b5c33a93d707e48ee56aa7635307a84e7bd5657d2f97217e87f6f4c6506a28bf4d99a9a2dc505fe28b6e66f6b3801aa'),(42,'Khalid Osinski','example-41@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$bdV.kQVtoODi67/49/kgJelZI2TGulMdVgR4nYPhF8Sz7EOlRJAqO','4af6e21eea39352b8bb6fdc2ad92e1d7cca8e6132ecdcf180daa21a8bb682211a3dc775543a485fde78a7e277453d9541f51e47a41f36681d8613f2305d9d26e'),(43,'Elvie Kemmer','example-42@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$q9KZed75.Ui5.VuTGTmKAuB32dHKKIYeiUoY0NvgretIUsjiNCC/m','af6148c153ba0a25ee14796d4def0e257063f32dc8a99c0712640afc34044bcf32584dd8a172db11a3ac3c99ea0d9ffe74763792e40897ee500516b536850e74'),(44,'Cristobal Senger','example-43@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$5rTzdY4HK09G52tjGw7J8OiBV9OeSJMuJNjuCsrzvApdU2GpQsjgG','33a41ac7d0183fdf32e02df685d57356b61f079667d6f8b7503ba2e14ee1566d01665d976e8c1f0aedceee553a83b9a3ed9aba0ae80ce75aa8fb2acc6b7de323'),(45,'Claud Schamberger MD','example-44@railstutorial.org','2012-10-10 05:18:49','2012-10-10 05:18:49','$2a$10$7To//Zp9uJRM51rRCDe40eeHR7.HXnxlM4Wer9G6KktBcWo9rC/AO','00a13209578359630c3c2a6aff4860ea575bd137e2ecdb60a46d064faffa1f1c37f91cc8094e008cd14b0bc5ebb548605e5817328ed17b04092df1db847d0469'),(46,'Moses Abernathy','example-45@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$NHgzgSyZP4tpn1ReFh6wVuKqIW5wo2gefpgl7nElZuNA91TAraXwW','9af3362a85ec213e93139e76b7946dd31c4f515272e4564b88972f2f5b1c9d8c4eb2ebca1876cdac68c6382f9c177597cbff44f41da494718000606c3f89fc78'),(47,'Daphnee Hyatt','example-46@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$NEVFhwhcQE9AsAAbsfbLy.cdqSbNltaJ0X4OyNnakiENGMrOANjhK','6104c99c7832710513b3fcab55e5c284b3f5125d89dc8ae8645b3f563e7bd6d648918102531f7055d28c8c86b3e0c1755ccc1b35d9002bde051a6e5a18c5e89a'),(48,'Susan Kihn','example-47@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$BhmewyuowNmM3lgILYgCrOp7nieMPOXUxSxOSy3gnuwpP3t/lPriS','3e8a14b2b6f5baa84106aff8b11014872ea75479ab57ab32464609a26ea1707350edff3e6bcf3e4541b0a9322d541cea2a87c33e70f314725a67b04065d51767'),(49,'Dr. Cassandra Lubowitz','example-48@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$xzF8nzI2D92dX2aDc7JBCOonQovemGzhjI8NVdWxGbgsq4zolAaq.','7a79e6ccc6504674182350b8c77da29f864b62319affd927b04f6aefecf52c0dd0b8f2dcd917d806cb66f0a3995170420139515f81562ea6e06444f85183cdbe'),(50,'Vinnie Schmeler','example-49@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$cl9vdezegguS.br2DRk.ruGFctD22Is3jNsS61CVqOwFTP9D/lgh2','747c2f7f450b0f85d074f7078449e8dab706e54713b70326ab4985f9bfeec3afe01106ba2bb6be905189c04fe60fbdbf93ac185de9c291631dc8b6b2ccd3b149'),(51,'Rowena Kreiger','example-50@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$S8FZ29tr99B4JUFjTzzMEuSsH5jeHILFfXIg9c15Hj07p/F9iTGwK','15d0716f34a5480de814bb116271a00c82ab5c684ea29bbdb3b176d0a60fe5862632bd41be5c634130d330a8e0580f1c013e6b86884379df2544efaf0ee4cb4d'),(52,'Carolanne Johnston','example-51@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$cTW7zXeOfbG12IvgQxwXJeo8P1H9qG59iPhyPgPlbFuD/gxDYUaGW','08043b356d15b4ed3a9d7311c831a1f6245ecfe6998d9f0095f3a2fcc520ecd53a7279b73f897c74b803666314902e2b157635bb51de13b61a0c07d9cf296349'),(53,'Mr. Clotilde Hegmann','example-52@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$0n4PuzwTnrHY/eh.gmiDluJKuf3lKA8gSkYaqzSejiYmUfKWyto4y','066837c603d006c83d584d96a3cbe2422f987586ad82b3cd9e7a901bd6211d15b85e63a3759906f4ddb47700f8ab19ebc985945767432dac8b50c3f3daafdf97'),(54,'Dawn Doyle','example-53@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$pWx8rUJUgnoZSog5qWDa4.dyb7djkYTs9D0BmURuXCRw/l7KwydLq','c68eb31a5cdb0a12011cf79bc55daf9d43c9c0e2b06624c9f4602114c563acaaccb51308876166b2e17d8fef9289f9b603fd14442d0326c796d340d4053bde3d'),(55,'Mr. Gilbert White','example-54@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$m95ZZUOE/QAU1p6.fIj.H.a7Q8rD5/d4LF1QMop4aUHUou6kPE1Be','4041daf21ad58bf61f8db236764d9195b946d1ce194eb85aec3d4037e01e5e7d2deea105fdb06563fd424a1c5242ebad35b261a2ac6e32f13f4a927d345624d6'),(56,'Jermain Langworth','example-55@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$fgvLP7UrLU4T7A0qm3K49OA7ayCkQpHTyvcaTjQ.41Hmh1./J1nuW','e8de14bda955cf0a4021728cebd2091cc3f7aaaa6a1f089861bfc4864ab6fdbe7c483bc51ce09a782d87ca23cd39f73ea75d15ce75ce2632c35d584eb5551e2a'),(57,'Savion Goyette','example-56@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$44Jmmh90bweW0BMtgrj1fu5fHRNAzGWTt3OnJVmT8f78RiyMjGO5u','ab3324c735dfe16703cbfd324e035122db7f4abbb023f979dec69ab0c570474102baefb70ede9df3030d5ce99850e3dd5905efdbe0a9f4956fe4d402137aa862'),(58,'Chance Lubowitz','example-57@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$uH/J9rCa05XPVElcU1zbb.k3Mmd/NdQacRuO67qHC8OoSfyTe15am','939c9a32145d34883a5e3d1e3ef25f1808cb10aed732d5780c298bd4e2d9b3d75c5030fae811f886a7cb02f234ca46f6dca7017353b10a594665fd9e8f623dd0'),(59,'Emerald Considine','example-58@railstutorial.org','2012-10-10 05:18:50','2012-10-10 05:18:50','$2a$10$PPXNu98/GiqMwkMXfP8gUOK8USuPK.JZZrj5jNq7LaXPfj0I8cRP6','07c0b1c9baebffede7c52c7224602bbf2a80d3fd711b53baf9f0a1fdafb9ed408425700fa74cb7a424dbc01c3dfd73a9cf608b79dd2d6e192b7e9f2471458e62'),(60,'Darby Wiza','example-59@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$Rtbwb4u/2WJEmc1ur.jLpeFiaBy359kqYhxHJfEpA0v7Vp2ZHaoIm','682c08735dcd312a9e4f3c0638217210c5aa8bd07323c1245c193bb57e9da2973b2c63f1cf44ba9d33603df3e6444fbf1ef0121398471fa804f3d5cf5bb457b5'),(61,'Briana Torphy PhD','example-60@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$mAiKlwMkjYQDGnulqufaXu0pCP538u.dHUqKYMLrSK0iGIQ1Rmt/m','38683b4728f8217b668bda38d0c1ba79cd8df6733b3064170dc39d7bb873c20c5d51b75609a64c6d3fad1cb5f7953a3f9aa0d8c3ea891eec1044074f329077ac'),(62,'Dusty D\'Amore','example-61@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$UWm2M/dZKS3A10RcTqy95eqiyp3i1S.91dfoVe11xIllysiMjGOEK','78f3ad99f07a40d8b8797f131a149903fec00396f460f0b6bb1e20d6a6fcf5c1143b24eb3e46d8388b11ee77aff263277fd97408d5b9b1b7b68e1304abc3a1f5'),(63,'Mr. Rubie Runolfsdottir','example-62@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$BRDNL.Se1e7S0MnZ5gIuw.qHJReqMe0.kIGKuh6CmRew63E7WLPY6','cb569d3c4b7a99672ad6310d2e47858eba10c74d5d492079c3e070c3146934449d0b4d3b6fadee23d2e44fcac27e8de468385ec3947379b6d5ba1ba71cf4a83d'),(64,'Keira Stehr','example-63@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$OTCHj7yLoqXiMSmoHrz1d.EYbJv.nX49hYOHUh5pd1mQNCXpHjvum','8073c47b6eda24f67cd4311289d8aef0f87004cdf718fa7b1f139034331adfd2e21b8bae1ff8fe10a723c7bf296b99ef169f11b85b1513ea5e9ec42865aec890'),(65,'Ms. Wilma Upton','example-64@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$3qaOzESum/0.2FmF8dHlX.fzXeKSd06yTJ0uxtlthxTJ8T.nkb4Sy','92afaefb3cf99325e8b63cb4b99b677fff47183727e47feaec52ede8eed3b7177b65618bc7b49457541fd4d25b2c768e74d3f697ab159aee68193dfb986ba141'),(66,'Tiara Lowe','example-65@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$s0zKN7KXK8KmxyBYZsEvfurj1cECNybuGnsbFSEPGSpjdPDf4gqVe','c0d22f3a1a32f236d9cc0a8a4584e0ccdc85f1000905517dc0ec98eec95be0468412f13894082237003b2b3162e7455e5a2035f1751d5feee6228a463940bce8'),(67,'Mrs. Janick Rippin','example-66@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$8g0.fTo1TW/soWsVYn4ByeqeDHEmZsYFAdzbdPwMj7/fYMX6GQRly','0c847a25d6004867dcad47f84dd297953e209c2f3dd3f7364e0364be6a33ee6b204f83c85d8de4f0a347696855db6789516bad7b5c9137d8bdbbf0739b66f748'),(68,'Ryley Halvorson','example-67@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$ek.J2Wc6QJi6loaVEMEloeGQRIyp7CIbxaempWho9V8B8RzvKt.ay','f35a08c47b33d9c3229d0fc8a24b24d396e26e2a3a28a6f548772b75103fa636f5870b0243e6191d45736d9ab27879d972782963a8063d364c2d7e470c10d96c'),(69,'Mr. Sabina Kuphal','example-68@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$o3Y7/oL3VuJlSVXfWJUtR.G7pCSJv69SoOkdrhMLvp20bWzhDr2au','c908f491c24178b06c1443bdbc8096aace1af2c6bf5b1f7c48393f8842482a19b02e6f6f17b67f712103ca3599712452c9ceda899af4972c2c06255d158ca44c'),(70,'Jerrold Sporer','example-69@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$9YUIWJQ1o0frFa488oItxeCBbkznz.1R4wcp76r1aA1GosB85Dhjy','a45796f0cdf38215a61986327dc1683b087accfacf68e7270a82524b21bf06dd94a6de532b741c3e07dbead427d155bf6e88a67fd2e8b5acc6b39b13ce83d983'),(71,'Jaron Bogan','example-70@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$45Bz3tw/Sw8X.eAoXSUct.ZdiC8ZTboFp.BDYOmhlxdn5lDb9aXpG','c40f909aa4f0261a0c4f040554d71bad98ebd16b20b195aa69294802ce23c2147e9c8daa768f1632c12c8f89f846737caa4668f3a6b89e8637bd08a53bf02a9d'),(72,'Kurt Kulas','example-71@railstutorial.org','2012-10-10 05:18:51','2012-10-10 05:18:51','$2a$10$Gchh6/COrIxbVjxbz6tiZ.J2Ep4lFu/hNx347ks04WU7hFpolWniq','ca0195c8ee42a0d1109e8bfd7b1ea348ac6e21a2f0411edb65ce0ace519149c698c1b2a4d26fa71ea4b9d3f5956a0b34100fe753e802488f3042d8ab8be9e1e4'),(73,'Cade Pfannerstill Sr.','example-72@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$39NKcrMCRV7esWYBJsbFceYU7mfO0XXvO5RyxGr.lR7o5RePl1gte','9fbdf61f9daca322e6e7227c39ab9021c2afc6ec8001236c729613768df9b780618165c4bbecfb054de32cf26dd88c4400f86df6a35db6fdfab9a4c5d064e2be'),(74,'Melody Schamberger','example-73@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$Icz.TbCW8oLxVLGYQ36D6eldfxwYRY/m6Pflug.bYL97whg1lQgAC','e3b04df820dfeee8b7bc41891f952a85b396c3c25b138c0b039efdc75acd57f33de423b6a55a712d740179d899861b8a5e84dd499184396356971763db2e5921'),(75,'Janae Hammes IV','example-74@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$qJpKdLNIu31xsJyjM0Zm0eFj8K.xnuhA0mnrb.LLKh1KO6mluwS0y','499ebca41a55742107cdc419678e0c7d12f4ad7014fa29022c4eb99abe81c52b2c7f96ed8378e4f6864d17da5e90b93c5983f1e7a9c95eeaef33bc2aa55887db'),(76,'Madisen Buckridge','example-75@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$FUm3knL3YlynbkM3Ti0Plea5XL1zCdI0369aa56PAZh0RJN4icET2','57865a288b0c9a4cc0fcc134f51b3cac39a6a1a39ab4428e450af68e755e33f3d7686585232ae3169b4e4aad83ee2809eac257fdbde8e02638ac9a1ba973d6df'),(77,'Gaetano Kulas','example-76@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$lVfUGWrucAT9F1RlvZKPw.7UjMaZ2yBgrFT8n/lgW62B3q.OPOcoe','cbcfbc652de80ebf5754bc9cefdb5bec95094cfd27bb8cc432f91f6f8bb6b7dac0d2c682cecf047f95338a7f6486c72c8a64b93c74021abe0f56b377c829b039'),(78,'Claudie Ledner','example-77@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$VBJnPQYY..tkdUnfJ4OB7eyEePd9nRHRDLSImiz1MxF8zEVv5PCVK','2d11a199f1060881e77eaf78f516cad1e36830c494dbe866751f832f3ef645dd65c8865fe1eb0588f956466a3640709b3e3e28a9cb54c353cd44042823088442'),(79,'Allene Berge I','example-78@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$0sJV.6hiT7ID5018YBQHDOpQO/WTk08ojo1wYxQTgeExmh7wt1hUO','1790032f2c40a14c87780220ef628025722ee5bbdcac613fa45eadeb620fe8b306a85a5f68dd367a803f6339ccdc783d718d945d6627a64773d4ebab11a4e9af'),(80,'Charles Thiel','example-79@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$LaLhELWM40.YgYyVvCt69.OPxPlAbh9cmsoFBOfy6cUVFiCl05yHy','2ab5720f0a72f4565aa3d742e7e4baced6cb851c3b0bec9d21f9fc7607ca53ddd6594998cc60d1832724e20296cc6a63fe0f8c1d71c0ee2a312510bc42ec2825'),(81,'Saul Gaylord','example-80@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$HWTkNF8srqwj1ADewk/e1ODJa8WCOEW.7hCfvUOguAORZwuOgC8kq','2b1b26c55834acc7a780589324d3475bbf761f12834250a6beaee1818fa87be87de4648eba4bd83af83fc9e7b32b06fdcf17463025e870d793e75497c426fc93'),(82,'Gussie Bruen','example-81@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$t0rteK7.BaSN8faRlgVvduxg34QrgE5zArTBAvXqoQb7CScRjFAp6','250b5373cb85c8af28eb8fc4011c60107f2f81424a3123c70fa32dec917b58f7b6e759385b80675a3765f65c0796fba5f101574c9fe508b2e104253514f0f6b8'),(83,'Niko Emard','example-82@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$XGM277T7alj4e65iQ17OE.OxXnOF7afGawo.LcixQn2Z82hORRMQa','f18fac45120c17a3c6cb0363d11f255752399ebc8c140fda76c8694efd7184978c07c8cf2fc9da75261a3564bcec6273a9b82e968ca68f7512746b10c6ec64e8'),(84,'Nyah Runolfsdottir','example-83@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$2Hm9vWo4cRXpXIJEmKjjzeDHQPNFr8lblu9XAT.0AgqJIVCYxL8pq','547868c133d09e8af5521a0468b8f5c8a7da213952dedbc8ed0a435a5bcc748c4f6e537cf8b33f67076619d22ad1acc6046c03bae6844ba9e26ca0a1c2348e67'),(85,'Dale Bailey','example-84@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$be1S3l2W5TFlZerVNaWbauPxbmAYFW6YE2yca2d/hfmI6JFfyrhzy','63afe6fbed6a73868cddb9c78c43d9330f64897d423ceaff52e5839b73dd668ff20e09c1674fe8d1e002d39937ed38bba0d0fb13b3b25b174d2877ef63163e8f'),(86,'Irving Kuhlman','example-85@railstutorial.org','2012-10-10 05:18:52','2012-10-10 05:18:52','$2a$10$EfG/1/1PC3JjLfoOFFdtHupP545JFQeiYLlxysdghmw.eSwBXqLY2','e2cb2e63edc5a6e985e7dfcecd0c7a31c3db81f060e63513ef51f1a8d4a18eb2b982ac1534d73e08f3f7caf27f4f1c0e445d7897bb4be18a800b447f8c9cf888'),(87,'Dr. Emily Krajcik','example-86@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$V468F1QL1N.lfhCOAq9plOW2buybQn6JRjjedvNAbif8Y8wFX8gh.','b1757e74caae050a88c0f20ff62c542e63826f607bc910ac31d76d72b54b4d115786034680c22c1a8296e07b145ba7a1dad52673011e04b2946410426a1cebbb'),(88,'Mr. Theo Reichert','example-87@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$HXay/1OSZYFvDJBBnhNiNeBY88ebXpu9Q9D5a.wrevJTe9cJcdbYu','31235e9b77a2e97cd246d315cdda8c0542fc44e0e44e4d711bc4304f3e714e86bc553f2c71a28740e0393fb6f79db07ea9a6608f3a4db3d989ef19a4864be0fd'),(89,'Devyn Schamberger','example-88@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$zl9zw0aPQoaiJVkWbJqoLeUdMjoFqS//PpvfY8U6EIBB5rg6uomBu','c278bce451a79b56cc8129e31d9d74a2f702d76b932e2dfbaff1bfd9733b165e6f1e04b3fa6b279ee7668a8e64be5a24988dd91218eabc7f647caa78e52df12b'),(90,'Ms. Gerald Friesen','example-89@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$n.zs2nLzMGxtvAjWYePT7.4F6Cn3fpPTkWB11lg2GG6UnRvvaPpGm','8c5ada4d664bb40253f8fdecffb8061b60cc2c5b774ca54efbbdee1ef379f680389b032f08b38a589e54ee9a34abe714a6d6908a40881e5e0b30a6ca230206e4'),(91,'Edythe Cruickshank DVM','example-90@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$XbnriKqMWXI47mSkSkhkc./vAb4I1M7FlAOhcUo9aprqZ.sxij4oi','3fd00da9f54a4bc3b730cebd9d6041e1a04ec8d3cbcdf3b7f9b839addc59a8a204eba7975ba8b343eed065bb80c86b5f84b7b9f41363c1b4e2218102f8b4dee9'),(92,'Norene Funk','example-91@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$eviJJWET6LPo1wr6dMe7rems9uVjguVcqGiSi4We/jQWj.NWXWNRy','4da63bc82aa433a434d49280a5a555088c9a8a033f56e7cb3e2d24d0941f0e08264452e66bd9d618e3bcb09aa2750591bf05b3a66d372da6f59d757b6cf77f47'),(93,'Terrill Abshire','example-92@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$eFqE35jWy3HX1QPQie2Kv.KdhyItFgXwgOaAX.za6nkna.Llhcv8C','f5f0ddb4f1e632462fd845077b56e6ba3c8d812c5fb2474250762e4ea1c1348f1bc78698ceb330fd132b34bbfd0f29c8ab99f681909339f52a5a560225573064'),(94,'Raphael Conroy','example-93@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$nn30Nh/AM0iHUr7Qe0htX.IXF.8mERfhjGR2k8BPMd5fT2baXjeE6','2b55d770aa20a12d9a5d84203bffb653d9b1559a9b5fda2e89478be59deadeb6c43d3e81de56fd71366d811454236afd3f7f39be4de04315d34762eebbf4d605'),(95,'Zetta Lind','example-94@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$DEgnqQmp05TyqzjfigqES.WRX6cGgXAFYSuaO2cc7RmvldFlm5Pay','90fbc39925d7e2dbf69daf2080e0aa2df04f5e3b56d5eb22113e22c8a56cf69c4f06dc8a2e2a5965a9e1e64da71e4688766a904a710c9ed752ee0970a61ec3df'),(96,'Mrs. Sterling Marvin','example-95@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$.rQ4Bug998Ak7dOJdND1E.yxIzBgIEF8pqagW6nUYXHGDxN6c3zLW','61a653153009530fd3c0c6d41c0fdd81159d807c5c84997ca62fbc1c141aa7c7148f2c108fcf132802f812a3c1ac764a4b9acaf1c07692485cf1754f48a889d7'),(97,'Alexandre Schuster','example-96@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$r6IKwTPk6JXgHPs7QLEkSe1F/XGxMsKEW7ZXy3E8.yujMn.JT5sca','dcf6d47c6f93809622170caa6c60210313adba58ee1a1a1473d94fda45d24cd2cd8bd011770fef172effd37dd30c41a93d369018291e0571131c6e3a4447dc98'),(98,'Tito Bogan','example-97@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$ax.WivdKqUzvBQsOtkodX.XSO7q2FQaaSyMK4KfIxHik.9wwEmYtS','26e8ccb822dcfd0f9f2e9c9465beb014435856ebad27223cfc560ec288543a35705a9d0f97484fbc8c7ad859441f73d5541083cbdbd4a32496de65d229d0819a'),(99,'Miss Germaine Blick','example-98@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$WBK2IB52i.JViD86gHhw4.SoA6/I6w9SJqCa6ArQJzSWevU/2CzH.','2a179fb1e8044474f40ccddf46f80c1b0c5da7e0aa614dd58599b634453884fe588f5ac37434c7a933c0404bd8e72c77ed49eba023a13038145cbe5331cf0fb9'),(100,'Haven Kilback MD','example-99@railstutorial.org','2012-10-10 05:18:53','2012-10-10 05:18:53','$2a$10$lqqZehHW7SU7ElwlcFjWgOHvdhg4RhjqwG7K7PUbj2kX8EgcM8lky','d2c73bce9a7b1cd06f73c4b054a8c3589a133de46e42a2bb7c28bb9aa597834af3753e84a3ef68ca5dbbc6406af6134e56e8755812c6346bed76a8bc0586d7ac'),(103,'Shiva Kumar','shiva.n404@gmail.com','2013-01-20 12:53:36','2013-01-20 12:53:36','$2a$10$y7RIW1Ahlaa/otGnwOMJRu3AXwHuaJ92ul.9i06XkrirulS0ToGZu','9eb4b9546c9cab2ee3e95682b4db6d6d01bbf71ebe2562fe05199a66e42f013861cb87ad6fad3ea547f0e71f15130a30e843797aa76ab9b68273dc02e71ae616'),(104,'Shiva Kumar','shivakumar.pesit@gmail.com','2013-06-12 09:18:27','2013-06-12 09:18:27','$2a$10$kTuTLjh3YRNm.wVv58cAZuM1lJAkepQk7Ol2LfiP65byn00G6koGG','1a4e800c9c8bad5af3e23bcfcbe7088dc5615da39423691d1c30adf5836bf4e2d73dd87b3409c6c40697043e7d65d3094a61c522b36147c21f6ee5a6bb9add49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-12 20:14:47
