CREATE DATABASE  IF NOT EXISTS `sqst` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sqst`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sqst
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add project',7,'add_project'),(20,'Can change project',7,'change_project'),(21,'Can delete project',7,'delete_project'),(22,'Can add entry',8,'add_entry'),(23,'Can change entry',8,'change_entry'),(24,'Can delete entry',8,'delete_entry'),(25,'Can add metric',9,'add_metric'),(26,'Can change metric',9,'change_metric'),(27,'Can delete metric',9,'delete_metric'),(28,'Can add issue status',10,'add_issuestatus'),(29,'Can change issue status',10,'change_issuestatus'),(30,'Can delete issue status',10,'delete_issuestatus'),(31,'Can add issue',11,'add_issue'),(32,'Can change issue',11,'change_issue'),(33,'Can delete issue',11,'delete_issue'),(34,'Can add project status',12,'add_projectstatus'),(35,'Can change project status',12,'change_projectstatus'),(36,'Can delete project status',12,'delete_projectstatus'),(37,'Can add member',13,'add_member'),(38,'Can change member',13,'change_member'),(39,'Can delete member',13,'delete_member'),(40,'Can add issue priority',14,'add_issuepriority'),(41,'Can change issue priority',14,'change_issuepriority'),(42,'Can delete issue priority',14,'delete_issuepriority'),(43,'Can add customer',15,'add_customer'),(44,'Can change customer',15,'change_customer'),(45,'Can delete customer',15,'delete_customer'),(46,'Can add project',16,'add_project'),(47,'Can change project',16,'change_project'),(48,'Can delete project',16,'delete_project'),(49,'Can add issue severity',17,'add_issueseverity'),(50,'Can change issue severity',17,'change_issueseverity'),(51,'Can delete issue severity',17,'delete_issueseverity'),(52,'Can add issue resolution',18,'add_issueresolution'),(53,'Can change issue resolution',18,'change_issueresolution'),(54,'Can delete issue resolution',18,'delete_issueresolution');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$QmKlPxqZx8ul$u8qdEaQBcXCnzskPPkFMBTov//c1WYmuycqNMlo829A=','2017-08-18 05:10:14.683241',1,'admin','','','czar.sevilla@gmail.com',1,1,'2017-08-18 05:08:53.005390');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-08-18 05:18:58.463706','1','Project object',1,'[{\"added\": {}}]',7,1),(2,'2017-08-18 05:19:17.194670','1','Metric object',1,'[{\"added\": {}}]',9,1),(3,'2017-08-18 05:19:32.405216','2','Metric object',1,'[{\"added\": {}}]',9,1),(4,'2017-08-18 05:21:46.063143','4','Vulnerabilities',1,'[{\"added\": {}}]',9,1),(5,'2017-08-18 05:22:10.341461','5','Code Smells',1,'[{\"added\": {}}]',9,1),(6,'2017-08-18 05:22:38.936398','6','Duplicated Block',1,'[{\"added\": {}}]',9,1),(7,'2017-08-18 05:23:35.990647','7','Complexity',1,'[{\"added\": {}}]',9,1),(8,'2017-08-18 05:26:47.319956','1','Entry object',1,'[{\"added\": {}}]',8,1),(9,'2017-08-18 05:30:07.948507','2','Remarketing / Code Smells / 2017-08-04 12:12:00+00:00 / 6854',1,'[{\"added\": {}}]',8,1),(10,'2017-08-18 05:30:36.991268','3','Remarketing / Complexity / 2017-08-04 12:12:00+00:00 / 16712',1,'[{\"added\": {}}]',8,1),(11,'2017-08-18 05:31:06.305623','4','Remarketing / Duplicated Block / 2017-08-04 12:12:00+00:00 / 859',1,'[{\"added\": {}}]',8,1),(12,'2017-08-18 05:31:35.502149','5','Remarketing / Size / 2017-08-04 12:12:00+00:00 / 107851',1,'[{\"added\": {}}]',8,1),(13,'2017-08-18 05:32:02.867917','6','Remarketing / Vulnerabilities / 2017-08-04 12:12:00+00:00 / 754',1,'[{\"added\": {}}]',8,1),(14,'2017-08-18 05:34:01.823873','2','Subastador',1,'[{\"added\": {}}]',7,1),(15,'2017-08-18 05:34:51.907213','7','Subastador / Bugs / 2017-08-04 12:24:00+00:00 / 112',1,'[{\"added\": {}}]',8,1),(16,'2017-08-18 05:35:18.231821','8','Subastador / Code Smells / 2017-08-04 12:24:00+00:00 / 1994',1,'[{\"added\": {}}]',8,1),(17,'2017-08-18 05:35:45.558487','9','Subastador / Complexity / 2017-08-04 12:24:00+00:00 / 6043',1,'[{\"added\": {}}]',8,1),(18,'2017-08-18 05:36:16.094851','10','Subastador / Duplicated Block / 2017-08-04 12:24:00+00:00 / 161',1,'[{\"added\": {}}]',8,1),(19,'2017-08-18 05:36:55.292648','11','Subastador / Size / 2017-08-04 12:24:00+00:00 / 29735',1,'[{\"added\": {}}]',8,1),(20,'2017-08-18 05:37:27.166436','12','Subastador / Vulnerabilities / 2017-08-04 12:24:00+00:00 / 143',1,'[{\"added\": {}}]',8,1),(21,'2017-08-18 05:39:47.515533','3','mbims',1,'[{\"added\": {}}]',7,1),(22,'2017-08-18 05:40:32.398874','13','mbims / Bugs / 2017-08-04 12:43:00+00:00 / 197',1,'[{\"added\": {}}]',8,1),(23,'2017-08-18 05:41:06.387147','14','mbims / Code Smells / 2017-08-04 12:43:00+00:00 / 1076',1,'[{\"added\": {}}]',8,1),(24,'2017-08-18 05:41:35.414900','15','mbims / Complexity / 2017-08-04 12:43:00+00:00 / 6407',1,'[{\"added\": {}}]',8,1),(25,'2017-08-18 05:42:01.025475','16','mbims / Duplicated Block / 2017-08-04 12:43:00+00:00 / 133',1,'[{\"added\": {}}]',8,1),(26,'2017-08-18 05:42:28.775697','17','mbims / Size / 2017-08-04 12:43:00+00:00 / 29530',1,'[{\"added\": {}}]',8,1),(27,'2017-08-18 05:43:16.324290','18','mbims / Vulnerabilities / 2017-08-04 12:43:00+00:00 / 41',1,'[{\"added\": {}}]',8,1),(28,'2017-08-18 05:44:59.408245','4','DFSIP',1,'[{\"added\": {}}]',7,1),(29,'2017-08-18 05:45:32.369652','19','DFSIP / Bugs / 2017-08-04 12:27:00+00:00 / 181',1,'[{\"added\": {}}]',8,1),(30,'2017-08-18 05:45:54.360429','20','DFSIP / Code Smells / 2017-08-04 12:27:00+00:00 / 3955',1,'[{\"added\": {}}]',8,1),(31,'2017-08-18 05:46:18.590534','21','DFSIP / Complexity / 2017-08-04 12:27:00+00:00 / 13851',1,'[{\"added\": {}}]',8,1),(32,'2017-08-18 05:46:51.775479','22','DFSIP / Duplicated Block / 2017-08-04 12:27:00+00:00 / 549',1,'[{\"added\": {}}]',8,1),(33,'2017-08-18 05:47:17.976146','23','DFSIP / Size / 2017-08-04 12:27:00+00:00 / 72287',1,'[{\"added\": {}}]',8,1),(34,'2017-08-18 05:47:44.408942','24','DFSIP / Vulnerabilities / 2017-08-04 12:27:00+00:00 / 329',1,'[{\"added\": {}}]',8,1),(35,'2017-08-18 05:48:47.235553','5','sitioDistribuidores',1,'[{\"added\": {}}]',7,1),(36,'2017-08-18 05:50:07.212444','25','sitioDistribuidores / Bugs / 2017-08-04 12:45:00+00:00 / 856',1,'[{\"added\": {}}]',8,1),(37,'2017-08-18 05:50:30.743098','26','sitioDistribuidores / Code Smells / 2017-08-04 12:45:00+00:00 / 16224',1,'[{\"added\": {}}]',8,1),(38,'2017-08-18 05:51:01.683733','27','sitioDistribuidores / Complexity / 2017-08-04 12:45:00+00:00 / 51836',1,'[{\"added\": {}}]',8,1),(39,'2017-08-18 05:51:23.475169','28','sitioDistribuidores / Duplicated Block / 2017-08-04 12:45:00+00:00 / 4439',1,'[{\"added\": {}}]',8,1),(40,'2017-08-18 05:52:21.864294','29','sitioDistribuidores / Size / 2017-08-04 12:45:00+00:00 / 291813',1,'[{\"added\": {}}]',8,1),(41,'2017-08-18 05:52:46.703720','30','sitioDistribuidores / Vulnerabilities / 2017-08-04 12:45:00+00:00 / 1037',1,'[{\"added\": {}}]',8,1),(42,'2017-08-18 05:54:43.960474','6','Timer',1,'[{\"added\": {}}]',7,1),(43,'2017-08-18 05:55:46.623583','31','Timer / Bugs / 2017-08-04 13:00:00+00:00 / 181',1,'[{\"added\": {}}]',8,1),(44,'2017-08-18 05:56:13.406262','32','Timer / Code Smells / 2017-08-04 13:00:00+00:00 / 4852',1,'[{\"added\": {}}]',8,1),(45,'2017-08-18 05:57:02.844772','33','Timer / Complexity / 2017-08-04 13:00:00+00:00 / 16126',1,'[{\"added\": {}}]',8,1),(46,'2017-08-18 05:57:26.679682','34','Timer / Duplicated Block / 2017-08-04 13:00:00+00:00 / 787',1,'[{\"added\": {}}]',8,1),(47,'2017-08-18 05:57:55.040673','35','Timer / Size / 2017-08-04 13:00:00+00:00 / 83689',1,'[{\"added\": {}}]',8,1),(48,'2017-08-18 05:58:22.361595','36','Timer / Vulnerabilities / 2017-08-04 13:00:00+00:00 / 510',1,'[{\"added\": {}}]',8,1),(49,'2017-08-18 05:59:34.903959','7','GoLegal',1,'[{\"added\": {}}]',7,1),(50,'2017-08-18 06:00:38.920951','37','GoLegal / Bugs / 2017-08-04 12:51:00+00:00 / 107',1,'[{\"added\": {}}]',8,1),(51,'2017-08-18 06:01:05.444628','38','GoLegal / Code Smells / 2017-08-04 12:51:00+00:00 / 2017',1,'[{\"added\": {}}]',8,1),(52,'2017-08-18 06:01:37.005969','39','GoLegal / Complexity / 2017-08-04 12:51:00+00:00 / 8421',1,'[{\"added\": {}}]',8,1),(53,'2017-08-18 06:02:10.460331','40','GoLegal / Duplicated Block / 2017-08-04 12:51:00+00:00 / 248',1,'[{\"added\": {}}]',8,1),(54,'2017-08-18 06:02:38.240166','41','GoLegal / Size / 2017-08-04 12:51:00+00:00 / 35991',1,'[{\"added\": {}}]',8,1),(55,'2017-08-18 06:03:12.517024','42','GoLegal / Vulnerabilities / 2017-08-04 12:51:00+00:00 / 56',1,'[{\"added\": {}}]',8,1),(56,'2017-08-18 06:04:04.967108','8','SAUPP',1,'[{\"added\": {}}]',7,1),(57,'2017-08-18 06:04:47.748785','43','SAUPP / Bugs / 2017-08-04 12:43:00+00:00 / 97',1,'[{\"added\": {}}]',8,1),(58,'2017-08-18 06:05:53.039645','44','SAUPP / Code Smells / 2017-08-04 12:43:00+00:00 / 2525',1,'[{\"added\": {}}]',8,1),(59,'2017-08-18 06:06:22.652448','45','SAUPP / Complexity / 2017-08-04 12:43:00+00:00 / 6875',1,'[{\"added\": {}}]',8,1),(60,'2017-08-18 06:06:47.296018','46','SAUPP / Duplicated Block / 2017-08-04 12:43:00+00:00 / 239',1,'[{\"added\": {}}]',8,1),(61,'2017-08-18 06:07:06.923368','47','SAUPP / Size / 2017-08-04 12:43:00+00:00 / 30055',1,'[{\"added\": {}}]',8,1),(62,'2017-08-18 06:07:52.196745','48','SAUPP / Vulnerabilities / 2017-08-04 12:43:00+00:00 / 65',1,'[{\"added\": {}}]',8,1),(63,'2017-08-18 06:09:30.922716','9','sitioClientes_v2_movil',1,'[{\"added\": {}}]',7,1),(64,'2017-08-18 06:10:20.039090','49','sitioClientes_v2_movil / Bugs / 2017-08-04 17:22:00+00:00 / 342',1,'[{\"added\": {}}]',8,1),(65,'2017-08-18 06:10:43.385795','50','sitioClientes_v2_movil / Code Smells / 2017-08-04 17:22:00+00:00 / 7378',1,'[{\"added\": {}}]',8,1),(66,'2017-08-18 06:11:12.367811','51','sitioClientes_v2_movil / Complexity / 2017-08-04 17:22:00+00:00 / 18328',1,'[{\"added\": {}}]',8,1),(67,'2017-08-18 06:11:46.507211','52','sitioClientes_v2_movil / Duplicated Block / 2017-08-04 17:22:00+00:00 / 1437',1,'[{\"added\": {}}]',8,1),(68,'2017-08-18 06:12:13.579277','53','sitioClientes_v2_movil / Size / 2017-08-04 17:22:00+00:00 / 99931',1,'[{\"added\": {}}]',8,1),(69,'2017-08-18 06:12:42.953500','54','sitioClientes_v2_movil / Vulnerabilities / 2017-08-04 17:22:00+00:00 / 296',1,'[{\"added\": {}}]',8,1),(70,'2017-08-18 15:42:02.881521','10','EfilesAutos',1,'[{\"added\": {}}]',7,1),(71,'2017-08-18 15:42:59.264705','55','EfilesAutos / Bugs / 2017-08-04 13:33:00+00:00 / 379',1,'[{\"added\": {}}]',8,1),(72,'2017-08-18 15:56:26.656167','56','EfilesAutos / Code Smells / 2017-08-04 13:33:00+00:00 / 1983',1,'[{\"added\": {}}]',8,1),(73,'2017-08-18 15:57:05.882387','57','EfilesAutos / Complexity / 2017-08-04 13:33:00+00:00 / 8430',1,'[{\"added\": {}}]',8,1),(74,'2017-08-18 15:57:34.641777','58','EfilesAutos / Duplicated Block / 2017-08-04 13:33:00+00:00 / 204',1,'[{\"added\": {}}]',8,1),(75,'2017-08-18 15:58:07.776157','59','EfilesAutos / Size / 2017-08-04 13:33:00+00:00 / 28622',1,'[{\"added\": {}}]',8,1),(76,'2017-08-18 15:58:54.281793','60','EfilesAutos / Vulnerabilities / 2017-08-04 13:33:00+00:00 / 2',1,'[{\"added\": {}}]',8,1),(77,'2017-08-18 17:48:15.567509','11','IC',1,'[{\"added\": {}}]',7,1),(78,'2017-08-18 17:48:52.906933','61','IC / Bugs / 2017-08-08 14:25:00+00:00 / 71',1,'[{\"added\": {}}]',8,1),(79,'2017-08-18 17:49:28.975595','62','IC / Code Smells / 2017-08-08 14:25:00+00:00 / 3292',1,'[{\"added\": {}}]',8,1),(80,'2017-08-18 17:49:53.797202','63','IC / Complexity / 2017-08-08 14:25:00+00:00 / 1065',1,'[{\"added\": {}}]',8,1),(81,'2017-08-18 17:50:22.321718','64','IC / Duplicated Block / 2017-08-08 14:25:00+00:00 / 21',1,'[{\"added\": {}}]',8,1),(82,'2017-08-18 17:50:45.699135','65','IC / Size / 2017-08-08 14:25:00+00:00 / 7839',1,'[{\"added\": {}}]',8,1),(83,'2017-08-18 17:51:11.649611','66','IC / Vulnerabilities / 2017-08-08 14:25:00+00:00 / 3',1,'[{\"added\": {}}]',8,1),(84,'2017-08-18 17:56:49.412205','12','Cotizador',1,'[{\"added\": {}}]',7,1),(85,'2017-08-18 17:57:14.388674','13','Itv',1,'[{\"added\": {}}]',7,1),(86,'2017-08-18 17:57:36.741227','14','OnOffBoarding',1,'[{\"added\": {}}]',7,1),(87,'2017-08-18 17:57:50.424910','15','ProductManager',1,'[{\"added\": {}}]',7,1),(88,'2017-08-18 17:58:06.503830','16','SitioProveedores',1,'[{\"added\": {}}]',7,1),(89,'2017-08-18 18:00:35.667693','67','Cotizador / Bugs / 2017-08-11 09:25:00+00:00 / 693',1,'[{\"added\": {}}]',8,1),(90,'2017-08-18 18:01:00.605363','68','Cotizador / Code Smells / 2017-08-11 09:25:00+00:00 / 9426',1,'[{\"added\": {}}]',8,1),(91,'2017-08-18 18:01:23.411432','69','Cotizador / Complexity / 2017-08-11 09:25:00+00:00 / 20440',1,'[{\"added\": {}}]',8,1),(92,'2017-08-18 18:01:46.714387','70','Cotizador / Duplicated Block / 2017-08-11 09:25:00+00:00 / 4752',1,'[{\"added\": {}}]',8,1),(93,'2017-08-18 18:02:13.163340','71','Cotizador / Size / 2017-08-11 09:25:00+00:00 / 104636',1,'[{\"added\": {}}]',8,1),(94,'2017-08-18 18:02:38.459570','72','Cotizador / Vulnerabilities / 2017-08-11 09:25:00+00:00 / 141',1,'[{\"added\": {}}]',8,1),(95,'2017-08-18 18:06:38.696648','73','Itv / Bugs / 2017-08-11 10:07:00+00:00 / 132',1,'[{\"added\": {}}]',8,1),(96,'2017-08-18 18:07:07.290266','74','Itv / Code Smells / 2017-08-11 10:07:00+00:00 / 2421',1,'[{\"added\": {}}]',8,1),(97,'2017-08-18 18:07:37.162065','75','Itv / Complexity / 2017-08-11 10:07:00+00:00 / 6925',1,'[{\"added\": {}}]',8,1),(98,'2017-08-18 18:08:04.517581','76','Itv / Duplicated Block / 2017-08-11 10:07:00+00:00 / 226',1,'[{\"added\": {}}]',8,1),(99,'2017-08-18 18:08:28.212551','77','Itv / Size / 2017-08-11 10:07:00+00:00 / 47507',1,'[{\"added\": {}}]',8,1),(100,'2017-08-18 18:09:19.169362','78','Itv / Vulnerabilities / 2017-08-11 10:07:00+00:00 / 37',1,'[{\"added\": {}}]',8,1),(101,'2017-08-18 18:10:22.770473','79','OnOffBoarding / Bugs / 2017-08-11 09:38:00+00:00 / 110',1,'[{\"added\": {}}]',8,1),(102,'2017-08-18 18:10:46.111468','80','OnOffBoarding / Code Smells / 2017-08-11 09:38:00+00:00 / 5236',1,'[{\"added\": {}}]',8,1),(103,'2017-08-18 18:11:10.472649','81','OnOffBoarding / Complexity / 2017-08-11 09:38:00+00:00 / 10795',1,'[{\"added\": {}}]',8,1),(104,'2017-08-18 18:11:36.656109','82','OnOffBoarding / Duplicated Block / 2017-08-11 09:38:00+00:00 / 723',1,'[{\"added\": {}}]',8,1),(105,'2017-08-18 18:12:04.869339','83','OnOffBoarding / Size / 2017-08-11 09:38:00+00:00 / 71678',1,'[{\"added\": {}}]',8,1),(106,'2017-08-18 18:12:34.542934','84','OnOffBoarding / Vulnerabilities / 2017-08-11 09:38:00+00:00 / 157',1,'[{\"added\": {}}]',8,1),(107,'2017-08-18 18:13:48.849952','85','ProductManager / Bugs / 2017-08-11 09:52:00+00:00 / 335',1,'[{\"added\": {}}]',8,1),(108,'2017-08-18 18:14:08.538715','86','ProductManager / Code Smells / 2017-08-11 09:52:00+00:00 / 6500',1,'[{\"added\": {}}]',8,1),(109,'2017-08-18 18:14:38.915945','87','ProductManager / Complexity / 2017-08-11 09:52:00+00:00 / 16712',1,'[{\"added\": {}}]',8,1),(110,'2017-08-18 18:15:02.201930','88','ProductManager / Duplicated Block / 2017-08-11 09:52:00+00:00 / 1419',1,'[{\"added\": {}}]',8,1),(111,'2017-08-18 18:16:08.084597','89','ProductManager / Size / 2017-08-11 09:52:00+00:00 / 114455',1,'[{\"added\": {}}]',8,1),(112,'2017-08-18 18:16:29.031187','90','ProductManager / Vulnerabilities / 2017-08-11 09:52:00+00:00 / 184',1,'[{\"added\": {}}]',8,1),(113,'2017-08-18 18:18:01.349788','91','SitioProveedores / Bugs / 2017-08-11 10:01:00+00:00 / 402',1,'[{\"added\": {}}]',8,1),(114,'2017-08-18 18:18:44.355651','92','SitioProveedores / Code Smells / 2017-08-11 10:01:00+00:00 / 1389',1,'[{\"added\": {}}]',8,1),(115,'2017-08-18 18:19:32.001122','93','SitioProveedores / Complexity / 2017-08-11 10:01:00+00:00 / 7207',1,'[{\"added\": {}}]',8,1),(116,'2017-08-18 18:19:56.439655','94','SitioProveedores / Duplicated Block / 2017-08-11 10:01:00+00:00 / 117',1,'[{\"added\": {}}]',8,1),(117,'2017-08-18 18:20:21.743421','95','SitioProveedores / Size / 2017-08-11 10:01:00+00:00 / 22614',1,'[{\"added\": {}}]',8,1),(118,'2017-08-18 18:20:45.479107','96','SitioProveedores / Vulnerabilities / 2017-08-11 10:01:00+00:00 / 114',1,'[{\"added\": {}}]',8,1),(119,'2017-08-18 18:23:01.157859','97','sitioDistribuidores / Bugs / 2017-08-16 14:43:00+00:00 / 851',1,'[{\"added\": {}}]',8,1),(120,'2017-08-18 18:23:29.874799','98','sitioDistribuidores / Code Smells / 2017-08-16 14:43:00+00:00 / 15745',1,'[{\"added\": {}}]',8,1),(121,'2017-08-18 18:23:54.534606','99','sitioDistribuidores / Complexity / 2017-08-16 14:43:00+00:00 / 51784',1,'[{\"added\": {}}]',8,1),(122,'2017-08-18 18:24:24.507371','100','sitioDistribuidores / Duplicated Block / 2017-08-16 14:43:00+00:00 / 4640',1,'[{\"added\": {}}]',8,1),(123,'2017-08-18 18:24:51.350293','101','sitioDistribuidores / Size / 2017-08-16 14:43:00+00:00 / 292029',1,'[{\"added\": {}}]',8,1),(124,'2017-08-18 18:25:16.319474','102','sitioDistribuidores / Vulnerabilities / 2017-08-16 14:43:00+00:00 / 542',1,'[{\"added\": {}}]',8,1),(125,'2017-08-18 18:26:04.779633','101','sitioDistribuidores / Size / 2017-08-16 14:43:00+00:00 / 292020',2,'[{\"changed\": {\"fields\": [\"value\"]}}]',8,1),(126,'2017-08-18 18:28:44.468115','103','Subastador / Bugs / 2017-08-18 11:53:00+00:00 / 113',1,'[{\"added\": {}}]',8,1),(127,'2017-08-18 18:29:11.944723','104','Subastador / Code Smells / 2017-08-18 11:53:00+00:00 / 1796',1,'[{\"added\": {}}]',8,1),(128,'2017-08-18 18:29:34.900021','105','Subastador / Complexity / 2017-08-18 11:53:00+00:00 / 6302',1,'[{\"added\": {}}]',8,1),(129,'2017-08-18 18:30:13.689144','106','Subastador / Duplicated Block / 2017-08-18 11:53:00+00:00 / 102',1,'[{\"added\": {}}]',8,1),(130,'2017-08-18 18:30:50.044736','107','Subastador / Size / 2017-08-18 11:53:00+00:00 / 31931',1,'[{\"added\": {}}]',8,1),(131,'2017-08-18 18:31:10.820951','108','Subastador / Vulnerabilities / 2017-08-18 11:53:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(132,'2017-08-18 18:33:23.015937','109','Remarketing / Bugs / 2017-08-17 17:02:00+00:00 / 155',1,'[{\"added\": {}}]',8,1),(133,'2017-08-18 18:33:48.069320','110','Remarketing / Code Smells / 2017-08-17 17:02:00+00:00 / 6526',1,'[{\"added\": {}}]',8,1),(134,'2017-08-18 18:34:19.851840','111','Remarketing / Complexity / 2017-08-17 17:05:00+00:00 / 16714',1,'[{\"added\": {}}]',8,1),(135,'2017-08-18 18:34:51.279208','112','Remarketing / Duplicated Block / 2017-08-17 17:02:00+00:00 / 804',1,'[{\"added\": {}}]',8,1),(136,'2017-08-18 18:35:16.574569','113','Remarketing / Size / 2017-08-17 17:02:00+00:00 / 96985',1,'[{\"added\": {}}]',8,1),(137,'2017-08-18 18:35:48.725793','114','Remarketing / Vulnerabilities / 2017-08-17 17:02:00+00:00 / 532',1,'[{\"added\": {}}]',8,1),(138,'2017-08-18 18:38:37.486231','115','EfilesAutos / Bugs / 2017-08-18 11:13:00+00:00 / 375',1,'[{\"added\": {}}]',8,1),(139,'2017-08-18 18:39:07.309013','116','EfilesAutos / Code Smells / 2017-08-18 11:13:00+00:00 / 1980',1,'[{\"added\": {}}]',8,1),(140,'2017-08-18 18:39:55.256207','117','EfilesAutos / Complexity / 2017-08-18 11:13:00+00:00 / 8466',1,'[{\"added\": {}}]',8,1),(141,'2017-08-18 18:40:17.990191','118','EfilesAutos / Duplicated Block / 2017-08-18 11:13:00+00:00 / 202',1,'[{\"added\": {}}]',8,1),(142,'2017-08-18 18:48:20.502039','119','EfilesAutos / Size / 2017-08-18 11:13:00+00:00 / 28746',1,'[{\"added\": {}}]',8,1),(143,'2017-08-18 18:48:44.709397','120','EfilesAutos / Vulnerabilities / 2017-08-18 11:13:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(144,'2017-08-18 18:50:49.171349','9','sitioClientes',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',7,1),(145,'2017-08-18 19:15:11.914100','121','sitioClientes / Bugs / 2017-08-18 10:48:00+00:00 / 901',1,'[{\"added\": {}}]',8,1),(146,'2017-08-18 19:15:34.158319','122','sitioClientes / Code Smells / 2017-08-18 10:48:00+00:00 / 7889',1,'[{\"added\": {}}]',8,1),(147,'2017-08-18 19:16:37.926630','123','sitioClientes / Complexity / 2017-08-18 10:48:00+00:00 / 25223',1,'[{\"added\": {}}]',8,1),(148,'2017-08-18 19:17:02.135096','124','sitioClientes / Duplicated Block / 2017-08-18 10:48:00+00:00 / 1438',1,'[{\"added\": {}}]',8,1),(149,'2017-08-18 19:17:52.052573','125','sitioClientes / Size / 2017-08-18 10:48:00+00:00 / 99904',1,'[{\"added\": {}}]',8,1),(150,'2017-08-18 19:18:22.834220','126','sitioClientes / Vulnerabilities / 2017-08-18 10:48:00+00:00 / 239',1,'[{\"added\": {}}]',8,1),(151,'2017-08-18 20:01:36.489656','127','Timer / Bugs / 2017-08-18 13:35:00+00:00 / 181',1,'[{\"added\": {}}]',8,1),(152,'2017-08-18 20:01:56.377684','128','Timer / Code Smells / 2017-08-18 13:35:00+00:00 / 4775',1,'[{\"added\": {}}]',8,1),(153,'2017-08-18 20:02:19.668588','129','Timer / Complexity / 2017-08-18 13:35:00+00:00 / 16086',1,'[{\"added\": {}}]',8,1),(154,'2017-08-18 20:02:36.899553','130','Timer / Duplicated Block / 2017-08-18 13:35:00+00:00 / 708',1,'[{\"added\": {}}]',8,1),(155,'2017-08-18 20:02:59.418729','131','Timer / Size / 2017-08-18 13:35:00+00:00 / 83262',1,'[{\"added\": {}}]',8,1),(156,'2017-08-18 20:03:29.374475','132','Timer / Vulnerabilities / 2017-08-18 13:35:00+00:00 / 353',1,'[{\"added\": {}}]',8,1),(157,'2017-08-18 20:09:23.999468','133','Cotizador / Bugs / 2017-08-18 14:50:00+00:00 / 687',1,'[{\"added\": {}}]',8,1),(158,'2017-08-18 20:09:45.211154','134','Cotizador / Code Smells / 2017-08-18 14:50:00+00:00 / 9361',1,'[{\"added\": {}}]',8,1),(159,'2017-08-18 20:10:40.736474','135','Cotizador / Complexity / 2017-08-18 14:50:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(160,'2017-08-18 20:11:35.734051','136','Cotizador / Duplicated Block / 2017-08-18 14:50:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(161,'2017-08-18 20:12:56.093848','137','Cotizador / Size / 2017-08-18 14:50:00+00:00 / 104629',1,'[{\"added\": {}}]',8,1),(162,'2017-08-18 20:13:17.769283','138','Cotizador / Vulnerabilities / 2017-08-18 14:50:00+00:00 / 95',1,'[{\"added\": {}}]',8,1),(163,'2017-08-18 21:10:16.258305','136','Cotizador / Duplicated Block / 2017-08-18 14:50:00+00:00 / 4760',2,'[{\"changed\": {\"fields\": [\"value\"]}}]',8,1),(164,'2017-08-18 21:12:14.003287','135','Cotizador / Complexity / 2017-08-18 14:50:00+00:00 / 20445',2,'[{\"changed\": {\"fields\": [\"value\"]}}]',8,1),(165,'2017-08-20 07:35:15.264393','111','Remarketing / Complexity / 2017-08-17 17:02:00+00:00 / 16714',2,'[{\"changed\": {\"fields\": [\"date\"]}}]',8,1),(166,'2017-08-20 07:44:04.090839','5','sitioDistribuidores',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(167,'2017-08-20 07:44:21.871045','9','sitioClientes',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(168,'2017-08-20 07:44:38.597323','12','Cotizador',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(169,'2017-08-20 07:44:59.782429','2','Subastador',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(170,'2017-08-20 07:45:18.930058','16','SitioProveedores',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(171,'2017-08-20 07:45:36.800961','6','Timer',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(172,'2017-08-20 07:45:58.511427','4','DFSIP',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(173,'2017-08-20 07:46:13.222131','4','DFSIP',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(174,'2017-08-20 07:46:45.123206','1','Remarketing',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(175,'2017-08-20 07:47:02.961470','14','OnOffBoarding',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(176,'2017-08-20 07:47:21.686943','3','mbims',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(177,'2017-08-20 07:47:52.328920','8','SAUPP',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(178,'2017-08-20 07:48:03.736597','7','GoLegal',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(179,'2017-08-20 07:49:38.377311','15','ProductManager',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(180,'2017-08-20 07:49:51.282635','13','Itv',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(181,'2017-08-20 07:50:07.538334','10','EfilesAutos',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(182,'2017-08-20 07:50:13.344491','11','IC',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(183,'2017-08-20 08:11:17.491027','139','sitioDistribuidores / Bugs / 2017-08-18 15:35:00+00:00 / 844',1,'[{\"added\": {}}]',8,1),(184,'2017-08-20 08:12:01.084063','140','sitioDistribuidores / Code Smells / 2017-08-18 15:35:00+00:00 / 15091',1,'[{\"added\": {}}]',8,1),(185,'2017-08-20 08:12:33.040604','141','sitioDistribuidores / Complexity / 2017-08-18 15:35:00+00:00 / 51545',1,'[{\"added\": {}}]',8,1),(186,'2017-08-20 08:13:01.305867','142','sitioDistribuidores / Duplicated Block / 2017-08-18 15:35:00+00:00 / 4508',1,'[{\"added\": {}}]',8,1),(187,'2017-08-20 08:13:35.720383','143','sitioDistribuidores / Size / 2017-08-18 15:35:00+00:00 / 264286',1,'[{\"added\": {}}]',8,1),(188,'2017-08-20 08:13:58.453965','144','sitioDistribuidores / Vulnerabilities / 2017-08-18 15:35:00+00:00 / 474',1,'[{\"added\": {}}]',8,1),(189,'2017-08-27 09:32:52.307471','1','Daimler',1,'[{\"added\": {}}]',15,1),(190,'2017-08-27 09:33:12.024764','2','Quality and Knowledge',1,'[{\"added\": {}}]',15,1),(191,'2017-08-27 09:33:45.635298','3','Stratus / Banamex',1,'[{\"added\": {}}]',15,1),(192,'2017-08-27 09:33:55.937185','4','Bocar',1,'[{\"added\": {}}]',15,1),(193,'2017-08-27 09:34:09.577812','5','Zucarmex',1,'[{\"added\": {}}]',15,1),(194,'2017-08-27 09:34:25.420349','6','Eximagen',1,'[{\"added\": {}}]',15,1),(195,'2017-08-27 10:16:24.226734','1','Daimler',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',15,1),(196,'2017-08-27 10:25:54.013249','2','Quality and Knowledge',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',15,1),(197,'2017-08-27 10:42:16.476346','3','Stratus / Banamex',2,'[]',15,1),(198,'2017-08-27 10:42:24.315759','4','Bocar',2,'[]',15,1),(199,'2017-08-27 10:43:27.933692','4','Bocar',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',15,1),(200,'2017-08-27 11:06:05.438680','1','Por iniciar',1,'[{\"added\": {}}]',12,1),(201,'2017-08-27 11:06:11.325155','2','En proceso',1,'[{\"added\": {}}]',12,1),(202,'2017-08-27 11:06:22.997470','3','Terminado',1,'[{\"added\": {}}]',12,1),(203,'2017-08-27 11:07:08.026427','1','Alta',1,'[{\"added\": {}}]',14,1),(204,'2017-08-27 11:07:12.954737','2','Normal',1,'[{\"added\": {}}]',14,1),(205,'2017-08-27 11:07:17.676018','3','Baja',1,'[{\"added\": {}}]',14,1),(206,'2017-08-27 11:07:23.986887','4','Muy baja',1,'[{\"added\": {}}]',14,1),(207,'2017-08-27 11:07:50.057393','1','Abierta',1,'[{\"added\": {}}]',10,1),(208,'2017-08-27 11:07:56.721757','2','Asignada',1,'[{\"added\": {}}]',10,1),(209,'2017-08-27 11:08:03.711578','3','Resuelta',1,'[{\"added\": {}}]',10,1),(210,'2017-08-27 11:08:10.470976','4','Cerrada',1,'[{\"added\": {}}]',10,1),(211,'2017-08-27 11:08:18.918279','5','Re-abierta',1,'[{\"added\": {}}]',10,1),(212,'2017-08-27 11:08:32.178321','6','Out of scope',1,'[{\"added\": {}}]',10,1),(213,'2017-08-27 11:11:17.657219','1','BusBuilder',1,'[{\"added\": {}}]',16,1),(214,'2017-08-27 11:12:13.470370','2','Plan de Acción WEB',1,'[{\"added\": {}}]',16,1),(215,'2017-08-27 11:13:11.577779','3','Plan de Acción MOVIL',1,'[{\"added\": {}}]',16,1),(216,'2017-08-27 11:14:17.254467','4','QERP',1,'[{\"added\": {}}]',16,1),(217,'2017-08-27 11:14:58.801235','5','Evaluaciones',1,'[{\"added\": {}}]',16,1),(218,'2017-08-27 11:16:01.723466','6','iAcepta Movil',1,'[{\"added\": {}}]',16,1),(219,'2017-08-27 11:16:47.073905','7','Tuux',1,'[{\"added\": {}}]',16,1),(220,'2017-08-27 11:17:36.450944','8','SIGB',1,'[{\"added\": {}}]',16,1),(221,'2017-08-27 11:18:22.504518','9','Pedidos',1,'[{\"added\": {}}]',16,1),(222,'2017-08-27 11:19:04.547567','10','Cotizador Multiplataforma',1,'[{\"added\": {}}]',16,1),(223,'2017-08-27 11:19:43.742032','11','Actualización del Order Entry',1,'[{\"added\": {}}]',16,1),(224,'2017-08-27 11:44:05.819554','1','BusBuilder',2,'[{\"changed\": {\"fields\": [\"start\", \"end\"]}}]',16,1),(225,'2017-08-27 11:44:58.412776','2','Plan de Acción WEB',2,'[{\"changed\": {\"fields\": [\"start\", \"end\"]}}]',16,1),(226,'2017-08-27 11:45:18.648367','3','Plan de Acción MOVIL',2,'[{\"changed\": {\"fields\": [\"start\", \"end\"]}}]',16,1),(227,'2017-08-27 11:45:50.079589','5','Evaluaciones',2,'[{\"changed\": {\"fields\": [\"start\", \"end\"]}}]',16,1),(228,'2017-08-27 15:26:04.019452','6','iAcepta Movil',2,'[{\"changed\": {\"fields\": [\"start\"]}}]',16,1),(229,'2017-08-27 15:26:32.452413','8','SIGB',2,'[{\"changed\": {\"fields\": [\"start\"]}}]',16,1),(230,'2017-08-27 15:26:44.570362','9','Pedidos',2,'[{\"changed\": {\"fields\": [\"start\"]}}]',16,1),(231,'2017-08-27 15:45:36.682612','5','Evaluaciones',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',16,1),(232,'2017-08-27 15:52:01.820698','4','QERP',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',16,1),(233,'2017-08-27 16:56:32.633069','1','bloqueo',1,'[{\"added\": {}}]',17,1),(234,'2017-08-27 16:56:37.836303','2','mayor',1,'[{\"added\": {}}]',17,1),(235,'2017-08-27 16:56:43.303747','3','funcionalidad',1,'[{\"added\": {}}]',17,1),(236,'2017-08-27 16:56:48.346979','4','menor',1,'[{\"added\": {}}]',17,1),(237,'2017-08-27 16:56:53.019046','5','ajuste',1,'[{\"added\": {}}]',17,1),(238,'2017-08-27 16:57:02.184259','6','texto',1,'[{\"added\": {}}]',17,1),(239,'2017-08-27 17:19:30.487783','5','Urgente',1,'[{\"added\": {}}]',14,1),(240,'2017-08-27 18:09:39.269798','1','Corregida',1,'[{\"added\": {}}]',18,1),(241,'2017-08-27 18:09:45.739697','2','No corregida',1,'[{\"added\": {}}]',18,1),(242,'2017-08-27 18:09:52.354662','3','Duplicada',1,'[{\"added\": {}}]',18,1),(243,'2017-08-27 18:09:58.650761','4','Incompleta',1,'[{\"added\": {}}]',18,1),(244,'2017-08-27 18:10:09.459924','5','No se puede reproducir',1,'[{\"added\": {}}]',18,1),(245,'2017-08-27 18:11:11.232096','6','Out of scope',3,'',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(15,'quality','customer'),(11,'quality','issue'),(14,'quality','issuepriority'),(18,'quality','issueresolution'),(17,'quality','issueseverity'),(10,'quality','issuestatus'),(13,'quality','member'),(16,'quality','project'),(12,'quality','projectstatus'),(6,'sessions','session'),(8,'viewer','entry'),(9,'viewer','metric'),(7,'viewer','project');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-18 04:48:02.373417'),(2,'auth','0001_initial','2017-08-18 04:48:13.266666'),(3,'admin','0001_initial','2017-08-18 04:48:15.665208'),(4,'admin','0002_logentry_remove_auto_add','2017-08-18 04:48:15.710746'),(5,'contenttypes','0002_remove_content_type_name','2017-08-18 04:48:17.092238'),(6,'auth','0002_alter_permission_name_max_length','2017-08-18 04:48:17.935402'),(7,'auth','0003_alter_user_email_max_length','2017-08-18 04:48:19.323492'),(8,'auth','0004_alter_user_username_opts','2017-08-18 04:48:19.361510'),(9,'auth','0005_alter_user_last_login_null','2017-08-18 04:48:19.926888'),(10,'auth','0006_require_contenttypes_0002','2017-08-18 04:48:19.968423'),(11,'auth','0007_alter_validators_add_error_messages','2017-08-18 04:48:20.032656'),(12,'auth','0008_alter_user_username_max_length','2017-08-18 04:48:20.679644'),(13,'sessions','0001_initial','2017-08-18 04:48:21.246023'),(14,'viewer','0001_initial','2017-08-18 05:05:49.678865'),(15,'viewer','0002_project_priority','2017-08-20 07:39:55.324485'),(16,'quality','0001_initial','2017-08-27 09:20:53.899302'),(17,'quality','0002_auto_20170827_0624','2017-08-27 11:24:55.460752'),(18,'quality','0002_auto_20170827_0636','2017-08-27 11:42:14.473547'),(19,'quality','0003_auto_20170827_1030','2017-08-27 15:30:32.411597'),(20,'quality','0004_auto_20170827_1033','2017-08-27 15:33:49.745780'),(21,'quality','0002_auto_20170827_1308','2017-08-27 18:09:00.490509');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('by8encv5sn7thaqww2k2x4g3qgyw3y45','MmIxMWVkZjVjNmUzYzY5ZWFiMTk2MGZmMjkyYzE3MGZkZWZiYmM4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNGFkYTk1OTlhM2YzZGFiNzQ1YmE5MTE1ZDY2NmVhMTlkOWY0MjY5In0=','2017-09-01 05:10:14.740096');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_customer`
--

DROP TABLE IF EXISTS `quality_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_customer`
--

LOCK TABLES `quality_customer` WRITE;
/*!40000 ALTER TABLE `quality_customer` DISABLE KEYS */;
INSERT INTO `quality_customer` VALUES (1,'Daimler','daimler.jpg'),(2,'Quality and Knowledge','qacg.png'),(3,'Stratus / Banamex','stratus_banamex.png'),(4,'Bocar','bocar.png'),(5,'Zucarmex','zucarmex.png'),(6,'Eximagen','eximagen.png');
/*!40000 ALTER TABLE `quality_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_issue`
--

DROP TABLE IF EXISTS `quality_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  `created` date NOT NULL,
  `resolved` date DEFAULT NULL,
  `closed` date DEFAULT NULL,
  `assignee_id` int(11) NOT NULL,
  `priority_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `severity_id` int(11) NOT NULL,
  `resolution_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quality_issue_assignee_id_701bbf1b_fk_quality_member_id` (`assignee_id`),
  KEY `quality_issue_priority_id_01f20de5_fk_quality_issuepriority_id` (`priority_id`),
  KEY `quality_issue_project_id_2b3827ce_fk_quality_project_id` (`project_id`),
  KEY `quality_issue_reporter_id_cbc2cd14_fk_quality_member_id` (`reporter_id`),
  KEY `quality_issue_status_id_d5402359_fk_quality_issuestatus_id` (`status_id`),
  KEY `quality_issue_severity_id_38d2382a_fk_quality_issueseverity_id` (`severity_id`),
  KEY `quality_issue_resolution_id_ccb3ab2a_fk_quality_i` (`resolution_id`),
  CONSTRAINT `quality_issue_assignee_id_701bbf1b_fk_quality_member_id` FOREIGN KEY (`assignee_id`) REFERENCES `quality_member` (`id`),
  CONSTRAINT `quality_issue_priority_id_01f20de5_fk_quality_issuepriority_id` FOREIGN KEY (`priority_id`) REFERENCES `quality_issuepriority` (`id`),
  CONSTRAINT `quality_issue_project_id_2b3827ce_fk_quality_project_id` FOREIGN KEY (`project_id`) REFERENCES `quality_project` (`id`),
  CONSTRAINT `quality_issue_reporter_id_cbc2cd14_fk_quality_member_id` FOREIGN KEY (`reporter_id`) REFERENCES `quality_member` (`id`),
  CONSTRAINT `quality_issue_resolution_id_ccb3ab2a_fk_quality_i` FOREIGN KEY (`resolution_id`) REFERENCES `quality_issueresolution` (`id`),
  CONSTRAINT `quality_issue_severity_id_38d2382a_fk_quality_issueseverity_id` FOREIGN KEY (`severity_id`) REFERENCES `quality_issueseverity` (`id`),
  CONSTRAINT `quality_issue_status_id_d5402359_fk_quality_issuestatus_id` FOREIGN KEY (`status_id`) REFERENCES `quality_issuestatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_issue`
--

LOCK TABLES `quality_issue` WRITE;
/*!40000 ALTER TABLE `quality_issue` DISABLE KEYS */;
INSERT INTO `quality_issue` VALUES (1,'Fallo: Actualizando la Version la información se borra y las celdas no se bloquean','2017-07-03','2017-08-17','2017-08-17',10,1,8,6,4,2,1),(2,'Fallo No Hay versiones en Proyectado','2017-07-03','2017-08-17','2017-08-17',10,2,8,6,4,3,1),(3,'Fallo La Version en Tipo de Monto Presupuesto esta bloqueada y no trae ninguna','2017-07-03','2017-08-17','2017-08-17',10,2,8,6,4,2,1),(4,'En la barra dentro de el Reporte viene en Ingles','2017-07-07','2017-08-03',NULL,10,3,8,6,3,4,NULL),(5,'Etiquetas de Barra de busqueda se empalman con Celdas','2017-07-07','2017-08-03',NULL,10,3,8,6,3,4,NULL),(6,'Menú de la aplicación se torno blanco y las etiquetas dejaron de verse','2017-07-18','2017-07-26','2017-07-26',2,1,2,1,4,4,1),(7,'En el nombre de Chasis de Lo no tiene funcionalidad','2017-07-18',NULL,NULL,4,1,1,6,1,5,NULL),(8,'Icono de Información no tiene funcionalidad','2017-07-18','2017-08-02','2017-08-02',2,1,2,1,4,3,1),(9,'Las etiquetas del modelo OC500 no son funcionales','2017-07-18',NULL,NULL,4,1,1,6,1,5,NULL),(10,'Nombre de la Etiqueta actividades y su interfaz','2017-07-18','2017-07-26','2017-07-26',2,2,2,1,4,4,1),(11,'Se encuentra error de mayuscula en una etiqueta','2017-07-18',NULL,NULL,4,3,1,6,1,4,NULL),(12,'Filtro sin Funcionalidad en la Interfaz Mis Visitas','2017-07-18','2017-07-26','2017-07-26',2,1,2,1,4,3,1),(13,'Interfaz con error en la pantalla de carga','2017-07-18','2017-07-26','2017-07-26',2,1,2,1,4,3,1),(14,'No Edita las Actividades','2017-07-18','2017-07-28','2017-07-28',2,1,2,1,4,3,1),(15,'Icono de Subir imágenes o archivo sin funcionalidad','2017-07-18','2017-07-26','2017-07-26',2,1,2,1,4,3,1),(16,'En celda de Nombre de cliente se pueden colocar mas de 255 caracteres','2017-07-20',NULL,NULL,4,2,1,6,1,4,NULL),(17,'El campo de captura de cantidad permite captura mayor a 11 caracteres','2017-07-20',NULL,NULL,4,2,1,6,1,4,NULL),(18,'Fucionalidad en boton Eliminar Firma','2017-07-24','2017-07-26','2017-07-26',2,1,2,1,4,4,1),(19,'Calendario no se muestra completo en tablet con versión diferente','2017-07-24','2017-07-26','2017-07-26',2,1,2,1,4,4,1),(20,'No hay una correcta validación','2017-07-24','2017-08-01','2017-08-01',2,1,2,1,4,4,1),(21,'Confundible la colocación del icono que borra firma','2017-07-25','2017-07-26','2017-07-26',2,1,2,1,4,4,1),(22,'No edita las actividades','2017-07-25','2017-07-28','2017-07-28',2,1,2,1,4,4,1),(23,'En pantalla de acceso Accion esta mal escrito','2017-07-25','2017-07-25','2017-07-25',2,3,2,6,4,4,1),(24,'Despues de cerrar sesion, se muestra el usuario mfranco','2017-07-25','2017-08-22','2017-08-22',2,1,2,6,4,2,1),(25,'Preguntas Calificadas no tienen restriccion','2017-07-25','2017-07-26','2017-07-26',2,1,2,1,4,3,1),(26,'No hay mismo diseño en fechas','2017-07-25','2017-07-26','2017-07-26',2,1,2,1,4,4,1),(27,'Guarda la imagen cuando no hay ninguna pregunta contestada','2017-07-25','2017-07-26','2017-07-26',2,1,2,1,4,4,1),(28,'No se cierra la sesión','2017-07-26','2017-08-22','2017-08-22',2,1,2,1,4,4,1),(29,'Cambia de nombre la etiqueta de Actividades','2017-07-26','2017-07-28','2017-07-28',2,1,2,1,4,4,1),(30,'Falta de orden en registros Mis Visitas','2017-07-27','2017-07-28','2017-07-28',2,1,2,1,4,4,1),(31,'Las visitas en el mes de julio no aparecen todas','2017-07-27','2017-07-27','2017-07-27',7,1,2,6,4,3,1),(32,'No edita actividad, manda mensaje error','2017-07-27','2017-07-28','2017-07-28',2,1,2,1,4,4,1),(33,'Agenda Visita sin validar bien los campos','2017-07-28','2017-07-28','2017-07-28',2,1,2,1,4,4,1),(34,'No cambia etiqueta \"Todos los Supervisores\"','2017-07-28','2017-08-01','2017-08-01',2,1,2,1,4,4,1),(35,'falta validación en el modulo Agregar Actividad','2017-07-31','2017-08-01','2017-08-01',2,1,2,1,4,3,1),(36,'No actualiza en automático Nueva Visita','2017-07-31','2017-08-01','2017-08-01',2,1,2,1,4,4,1),(37,'La busqueda arroja como resultado una visita pendiente','2017-07-31','2017-08-02','2017-08-02',2,1,2,6,4,3,1),(38,'No muestra las Actividades correspondientes al usuario','2017-07-31','2017-08-01','2017-08-01',2,1,2,1,4,3,1),(39,'Guarda sin estar correctamente validado el Modulo','2017-07-31','2017-08-01','2017-08-01',2,1,2,1,4,3,1),(40,'En el calendario se coloca + en lugar del icono de filtro y la i no aparece en ocasiones','2017-07-31','2017-08-02','2017-08-02',2,1,2,6,4,5,1),(41,'Formulario con función recarga, innecesaria','2017-07-31','2017-08-01','2017-08-01',2,1,2,1,4,4,1),(42,'Falta validar campo Correo Electronico','2017-07-31','2017-08-01','2017-08-01',2,1,2,1,4,4,1),(43,'Aparece fecha de año 2013 cuando realiza la carga de cotizacion anterior','2017-07-31',NULL,NULL,4,2,1,6,1,4,NULL),(44,'Etiqueta en Calendario dice Inicio','2017-08-01','2017-08-02','2017-08-02',2,3,2,6,4,6,1),(45,'Se cierra la aplicación al seleccionar Área','2017-08-01','2017-08-01','2017-08-01',2,1,2,1,4,4,1),(46,'No se muestra mensaje de advertencia al cerrar visita no realizada','2017-08-02','2017-08-08','2017-08-08',2,2,2,6,4,5,1),(47,'Falta validación en modulo Calendario','2017-08-02','2017-08-08','2017-08-08',2,1,2,1,4,4,1),(48,'Falta correcta validación en campo nombre','2017-08-02','2017-08-08','2017-08-08',2,1,2,1,4,4,1),(49,'No hay una correcta validación en campo correo','2017-08-03','2017-08-09','2017-08-09',2,1,2,1,4,4,1),(50,'Falta correcta validación en campo correo','2017-08-03','2017-08-09','2017-08-09',2,1,2,1,4,4,1),(51,'Permite seleccionar Pregunta cuando no debería','2017-08-07','2017-08-15','2017-08-15',2,1,2,1,4,4,1),(52,'Acción de Recarga no tiene un uso','2017-08-07','2017-08-09','2017-08-09',2,1,2,1,4,4,1),(53,'Etiqueta rubro desaparece al aplicar filtro','2017-08-07','2017-08-10','2017-08-10',2,1,2,1,4,4,1),(54,'Permite selecionar todas las opciones en \"Sistema neumatico\"','2017-08-07',NULL,NULL,4,1,1,6,1,5,NULL),(55,'Se empalman las opciones de conguración sobre imagenes de chasis','2017-08-07',NULL,NULL,4,3,1,6,1,5,NULL),(56,'Se detectan faltas ortograficas en modulos','2017-08-07',NULL,NULL,4,3,1,6,1,6,NULL),(57,'Al actualizar app no se actualizan las visitas y ya se borraron','2017-08-08','2017-08-08','2017-08-08',2,1,2,6,4,2,1),(58,'No deja cambiar fecha','2017-08-08','2017-08-15','2017-08-15',2,1,2,1,4,4,1),(59,'Despues de Selecionar rango de fechas se mantiene la selección','2017-08-08','2017-08-11','2017-08-11',2,2,2,6,4,5,1),(60,'Se detentan saltos de selección en modelos de llantas del chasis LO 916/45','2017-08-08','2017-08-21',NULL,4,2,1,6,1,3,NULL),(61,'Se detecta empalme en las gráficas de Performance','2017-08-08',NULL,NULL,4,3,1,6,1,4,NULL),(62,'Se detecta una separación menor entre las etiquetas de Performance','2017-08-08',NULL,NULL,4,3,1,6,1,4,NULL),(63,'Se detectan faltas ortográficas en el modulo de motor.','2017-08-08',NULL,NULL,4,3,1,6,1,4,NULL),(64,'Se detecta que al seleccionar un tipo de camión, este cambia el modelo de chasis.','2017-08-09',NULL,NULL,4,2,1,6,1,4,NULL),(65,'Del menú principal se recomienda poner el acento en la palabra configuración','2017-08-09','2017-08-10',NULL,5,3,10,5,3,4,NULL),(66,'Se recomienda para estandarización poner las primeras letras de cada palabra en mayúscula','2017-08-09','2017-08-11',NULL,5,2,10,5,3,4,NULL),(67,'En la ventana de pedidos Se sugiere colocar el acento a la palabra Almacén','2017-08-09','2017-08-11',NULL,5,2,10,5,3,4,NULL),(68,'Pedidos/Se sugiere colocar el acento a la palabra Almacén','2017-08-09','2017-08-11',NULL,5,3,10,5,3,4,NULL),(69,'Resumen de pedido/Se recomienda por estandarización poner con mayúscula la letra P en la palabra Pedido','2017-08-09',NULL,NULL,11,3,10,5,2,4,NULL),(70,'Se seleccionan dos opciones en modulo preguntas','2017-08-09','2017-08-15','2017-08-15',2,1,2,1,4,4,1),(71,'Pedido/Resumen: EN la ventana de Resumen del pedido no se esta mostrando el precio de maniobra que se ingreso','2017-08-09',NULL,NULL,11,2,10,5,2,4,NULL),(72,'En el resumen del pedido no se muestra el precio de maniobra y no lo está considerando en el total','2017-08-09',NULL,NULL,11,2,10,5,2,4,NULL),(73,'En el resumen del pedido no se muestra el precio de maniobra y no lo está considerando en el total','2017-08-09',NULL,NULL,11,2,10,5,2,4,NULL),(74,'Pedidos/Al finalizar el pedido y darle el botón guardar sale un mensaje con el texto \"NULL\" y no guarda el pedido','2017-08-09',NULL,NULL,11,1,10,5,2,1,NULL),(75,'Pedidos/ En la pantalla de mis pedidos el filtro sale sobre expuesto en la columna de Cancelación','2017-08-09',NULL,NULL,11,3,10,5,2,4,NULL),(76,'Al agendar una visita como pendiente Aparece Abierta','2017-08-09','2017-08-10','2017-08-10',7,1,2,6,4,3,1),(77,'Pedidos/Al entrar a la ventana de Almacén Origen, la palabra Almacén no trae acento y en la descripción  dice “cliente”','2017-08-09','2017-08-11',NULL,5,2,10,5,3,4,NULL),(78,'Pedidos/Al entrar a la ventana de Almacén Origen, la palabra Almacén no trae acento y en la descripción  dice “cliente”','2017-08-09','2017-08-11',NULL,5,2,10,5,3,4,NULL),(79,'Pedidos/Al entrar a la ventana de Almacén Origen, la palabra Almacén no trae acento y en la descripción  dice “cliente”','2017-08-09','2017-08-22','2017-08-22',11,2,10,5,4,4,4),(80,'Despues de Refrescar calendario no aparecen visitas, pero en calendario quedan marcadas','2017-08-09','2017-08-15','2017-08-15',2,2,2,6,4,5,1),(81,'Se detecta que al intentar iniciar sesión en la aplicación manda mensaje de error.','2017-08-10','2017-08-17','2017-08-17',8,1,6,6,4,3,1),(82,'Se detecta que al intentar iniciar sesión en la aplicación manda mensaje de error.','2017-08-10','2017-08-14','2017-08-14',9,5,6,6,4,3,1),(83,'Se detecta que el mensaje de error que muestra la aplicación no se ve completo.','2017-08-10','2017-08-16','2017-08-16',8,3,6,6,4,4,1),(84,'Se detecta que al ingresar el usuario y dar clic en el botón de Enter realiza un salto de línea dentro de campo de usuario.','2017-08-10','2017-08-15','2017-08-15',3,3,6,6,4,4,1),(85,'Falta validación en visita rechazada','2017-08-11','2017-08-15','2017-08-15',2,1,2,1,4,4,1),(86,'Se detecta que el contador de los meses pasa de 0 a 12 cuando se gira a la derecha','2017-08-11','2017-08-16','2017-08-16',9,2,6,8,4,4,1),(87,'Se detecta que no puedes ingresar en el importe un punto como inicio','2017-08-14','2017-08-17','2017-08-17',8,2,6,8,4,4,1),(88,'Se detecta que no se puede hacer el pago.','2017-08-14',NULL,NULL,3,1,6,8,2,2,NULL),(89,'Se detecta que al realizar una cancelación con estatus rechazada, en el historial se muestra como aprobada','2017-08-14','2017-08-16','2017-08-16',12,1,6,8,4,2,2),(90,'Se detecta que en ocaciones no se muestra el historial de las transacciones.','2017-08-14','2017-08-17','2017-08-17',12,2,6,8,4,4,2),(91,'Se detecta que al realizar una devolución con datos no reales esta se aprueba','2017-08-14','2017-08-16','2017-08-16',12,1,6,8,4,2,2),(92,'Se detecta que al cambiar la pantalla de horizontal a vertical una parte se muestra negra.','2017-08-14',NULL,NULL,9,3,6,8,1,4,NULL),(93,'Se detecta que existen diferencias entre el tutorial de Android e IOS','2017-08-14','2017-08-14',NULL,3,2,6,8,5,4,NULL),(94,'Se detecta que en ocasiones la aplicación se traba.','2017-08-14','2017-08-17','2017-08-17',8,2,6,8,4,4,1),(95,'Se repite subrubro en el modulo calificación visita','2017-08-15','2017-08-15','2017-08-15',2,1,2,1,4,4,1),(96,'La visita creada no aparece en mis visitas','2017-08-15','2017-08-15','2017-08-15',2,1,2,1,4,4,1),(97,'Se detecta que el correo electrónico que se manda al realizar un pago no esta llegando de forma correcta la ubicación.','2017-08-15',NULL,NULL,9,2,6,8,1,4,NULL),(98,'Se detecta que al hacer un pago y seleccionar los MSI te da la opción de elegir hasta 24 meses','2017-08-16','2017-08-17','2017-08-17',8,2,6,8,4,4,1),(99,'Se detecta que al negar los permisos necesarios para realizar un pago la flecha atrás pierde su función.','2017-08-16','2017-08-18','2017-08-18',8,1,6,8,4,2,1),(100,'Se detecta que se puede realizar un pago sin haber activado el micrófono y la localización','2017-08-16','2017-08-16','2017-08-16',8,1,6,8,4,2,1),(101,'Se detecta que al no aceptar los permisos de ubicación y micrófono la aplicación se traba','2017-08-16','2017-08-17','2017-08-17',8,1,6,8,4,2,1),(102,'Menu sigue siendo funcional aun con mensaje emergente','2017-08-17',NULL,NULL,10,2,8,6,1,4,NULL),(103,'Se detecta que al ingresar por primera vez en la app de iAcepta algunas etiquetas están fuera de posición','2017-08-17',NULL,NULL,9,2,6,8,1,4,NULL),(104,'Se detecta que al rechazar los permisos de ubicación al insertar el Walker la aplicación te regresa a la pagina anterior','2017-08-17','2017-08-22',NULL,8,2,6,8,3,4,NULL),(105,'Se detecta que al rechazar el permiso de ubicación y seguir con el pago al momento de mostrar el Voucher te bota a ajustes','2017-08-17',NULL,NULL,3,1,6,8,2,2,NULL),(106,'Se detecta que no permite regresarte atrás en el modulo de devolución y cancelación al no aceptar el permiso de ubicación','2017-08-18','2017-08-22',NULL,8,2,6,8,3,4,NULL),(107,'Se detecta que al intentar procesar un pago con una tarjeta tipo monedero la aplicación se cierra dramáticamente.','2017-08-21',NULL,NULL,9,1,6,8,2,2,NULL),(108,'Se detecta que al realizar un multipago con una tarjeta monedero naranja esta se procesa de forma correcta','2017-08-21',NULL,NULL,9,1,6,8,2,2,NULL);
/*!40000 ALTER TABLE `quality_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_issuepriority`
--

DROP TABLE IF EXISTS `quality_issuepriority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_issuepriority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_issuepriority`
--

LOCK TABLES `quality_issuepriority` WRITE;
/*!40000 ALTER TABLE `quality_issuepriority` DISABLE KEYS */;
INSERT INTO `quality_issuepriority` VALUES (1,'Alta'),(3,'Baja'),(4,'Muy baja'),(2,'Normal'),(5,'Urgente');
/*!40000 ALTER TABLE `quality_issuepriority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_issueresolution`
--

DROP TABLE IF EXISTS `quality_issueresolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_issueresolution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_issueresolution`
--

LOCK TABLES `quality_issueresolution` WRITE;
/*!40000 ALTER TABLE `quality_issueresolution` DISABLE KEYS */;
INSERT INTO `quality_issueresolution` VALUES (1,'Corregida'),(3,'Duplicada'),(4,'Incompleta'),(2,'No corregida'),(5,'No se puede reproducir');
/*!40000 ALTER TABLE `quality_issueresolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_issueseverity`
--

DROP TABLE IF EXISTS `quality_issueseverity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_issueseverity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_issueseverity`
--

LOCK TABLES `quality_issueseverity` WRITE;
/*!40000 ALTER TABLE `quality_issueseverity` DISABLE KEYS */;
INSERT INTO `quality_issueseverity` VALUES (5,'ajuste'),(1,'bloqueo'),(3,'funcionalidad'),(2,'mayor'),(4,'menor'),(6,'texto');
/*!40000 ALTER TABLE `quality_issueseverity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_issuestatus`
--

DROP TABLE IF EXISTS `quality_issuestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_issuestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_issuestatus`
--

LOCK TABLES `quality_issuestatus` WRITE;
/*!40000 ALTER TABLE `quality_issuestatus` DISABLE KEYS */;
INSERT INTO `quality_issuestatus` VALUES (1,'Abierta'),(2,'Asignada'),(4,'Cerrada'),(5,'Re-abierta'),(3,'Resuelta');
/*!40000 ALTER TABLE `quality_issuestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_member`
--

DROP TABLE IF EXISTS `quality_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_member`
--

LOCK TABLES `quality_member` WRITE;
/*!40000 ALTER TABLE `quality_member` DISABLE KEYS */;
INSERT INTO `quality_member` VALUES (1,'angel.pimentel'),(2,'carlos.perez'),(3,'christian.gonzalez'),(4,'edgar.martinez'),(5,'eduardo.obregon'),(6,'Isaias.cortes'),(7,'jorge.dominguez'),(8,'juan.padilla'),(9,'luis.perez'),(10,'miguel.longinos'),(11,'victor.cruz'),(12,'victor.hernandez');
/*!40000 ALTER TABLE `quality_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_project`
--

DROP TABLE IF EXISTS `quality_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quality_project_customer_id_f663e4ea_fk_quality_customer_id` (`customer_id`),
  KEY `quality_project_status_id_2afbaabf_fk_quality_projectstatus_id` (`status_id`),
  CONSTRAINT `quality_project_customer_id_f663e4ea_fk_quality_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `quality_customer` (`id`),
  CONSTRAINT `quality_project_status_id_2afbaabf_fk_quality_projectstatus_id` FOREIGN KEY (`status_id`) REFERENCES `quality_projectstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_project`
--

LOCK TABLES `quality_project` WRITE;
/*!40000 ALTER TABLE `quality_project` DISABLE KEYS */;
INSERT INTO `quality_project` VALUES (1,'BusBuilder','2017-07-10','2017-09-15',1,2,'common.png'),(2,'Plan de Acción WEB','2017-07-14','2017-08-18',1,3,'common.png'),(3,'Plan de Acción MOVIL','2017-07-14','2017-08-18',1,3,'common.png'),(4,'QERP',NULL,NULL,2,1,'qerp.png'),(5,'Evaluaciones','2017-08-23','2017-09-18',2,2,'ev.png'),(6,'iAcepta Movil','2017-08-10',NULL,3,2,'common.png'),(7,'Tuux',NULL,NULL,3,1,'common.png'),(8,'SIGB','2017-08-23',NULL,4,2,'common.png'),(9,'Pedidos','2017-08-07',NULL,5,2,'common.png'),(10,'Cotizador Multiplataforma',NULL,NULL,6,1,'common.png'),(11,'Actualización del Order Entry',NULL,NULL,6,1,'common.png');
/*!40000 ALTER TABLE `quality_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_projectstatus`
--

DROP TABLE IF EXISTS `quality_projectstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_projectstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_projectstatus`
--

LOCK TABLES `quality_projectstatus` WRITE;
/*!40000 ALTER TABLE `quality_projectstatus` DISABLE KEYS */;
INSERT INTO `quality_projectstatus` VALUES (2,'En proceso'),(1,'Por iniciar'),(3,'Terminado');
/*!40000 ALTER TABLE `quality_projectstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewer_entry`
--

DROP TABLE IF EXISTS `viewer_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewer_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `value` int(11) NOT NULL,
  `metric_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewer_entry_metric_id_a5fe70a3_fk_viewer_metric_id` (`metric_id`),
  KEY `viewer_entry_project_id_8d4febe2_fk_viewer_project_id` (`project_id`),
  CONSTRAINT `viewer_entry_metric_id_a5fe70a3_fk_viewer_metric_id` FOREIGN KEY (`metric_id`) REFERENCES `viewer_metric` (`id`),
  CONSTRAINT `viewer_entry_project_id_8d4febe2_fk_viewer_project_id` FOREIGN KEY (`project_id`) REFERENCES `viewer_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewer_entry`
--

LOCK TABLES `viewer_entry` WRITE;
/*!40000 ALTER TABLE `viewer_entry` DISABLE KEYS */;
INSERT INTO `viewer_entry` VALUES (1,'2017-08-04 12:12:00.000000',152,2,1),(2,'2017-08-04 12:12:00.000000',6854,5,1),(3,'2017-08-04 12:12:00.000000',16712,7,1),(4,'2017-08-04 12:12:00.000000',859,6,1),(5,'2017-08-04 12:12:00.000000',107851,1,1),(6,'2017-08-04 12:12:00.000000',754,4,1),(7,'2017-08-04 12:24:00.000000',112,2,2),(8,'2017-08-04 12:24:00.000000',1994,5,2),(9,'2017-08-04 12:24:00.000000',6043,7,2),(10,'2017-08-04 12:24:00.000000',161,6,2),(11,'2017-08-04 12:24:00.000000',29735,1,2),(12,'2017-08-04 12:24:00.000000',143,4,2),(13,'2017-08-04 12:43:00.000000',197,2,3),(14,'2017-08-04 12:43:00.000000',1076,5,3),(15,'2017-08-04 12:43:00.000000',6407,7,3),(16,'2017-08-04 12:43:00.000000',133,6,3),(17,'2017-08-04 12:43:00.000000',29530,1,3),(18,'2017-08-04 12:43:00.000000',41,4,3),(19,'2017-08-04 12:27:00.000000',181,2,4),(20,'2017-08-04 12:27:00.000000',3955,5,4),(21,'2017-08-04 12:27:00.000000',13851,7,4),(22,'2017-08-04 12:27:00.000000',549,6,4),(23,'2017-08-04 12:27:00.000000',72287,1,4),(24,'2017-08-04 12:27:00.000000',329,4,4),(25,'2017-08-04 12:45:00.000000',856,2,5),(26,'2017-08-04 12:45:00.000000',16224,5,5),(27,'2017-08-04 12:45:00.000000',51836,7,5),(28,'2017-08-04 12:45:00.000000',4439,6,5),(29,'2017-08-04 12:45:00.000000',291813,1,5),(30,'2017-08-04 12:45:00.000000',1037,4,5),(31,'2017-08-04 13:00:00.000000',181,2,6),(32,'2017-08-04 13:00:00.000000',4852,5,6),(33,'2017-08-04 13:00:00.000000',16126,7,6),(34,'2017-08-04 13:00:00.000000',787,6,6),(35,'2017-08-04 13:00:00.000000',83689,1,6),(36,'2017-08-04 13:00:00.000000',510,4,6),(37,'2017-08-04 12:51:00.000000',107,2,7),(38,'2017-08-04 12:51:00.000000',2017,5,7),(39,'2017-08-04 12:51:00.000000',8421,7,7),(40,'2017-08-04 12:51:00.000000',248,6,7),(41,'2017-08-04 12:51:00.000000',35991,1,7),(42,'2017-08-04 12:51:00.000000',56,4,7),(43,'2017-08-04 12:43:00.000000',97,2,8),(44,'2017-08-04 12:43:00.000000',2525,5,8),(45,'2017-08-04 12:43:00.000000',6875,7,8),(46,'2017-08-04 12:43:00.000000',239,6,8),(47,'2017-08-04 12:43:00.000000',30055,1,8),(48,'2017-08-04 12:43:00.000000',65,4,8),(49,'2017-08-04 17:22:00.000000',342,2,9),(50,'2017-08-04 17:22:00.000000',7378,5,9),(51,'2017-08-04 17:22:00.000000',18328,7,9),(52,'2017-08-04 17:22:00.000000',1437,6,9),(53,'2017-08-04 17:22:00.000000',99931,1,9),(54,'2017-08-04 17:22:00.000000',296,4,9),(55,'2017-08-04 13:33:00.000000',379,2,10),(56,'2017-08-04 13:33:00.000000',1983,5,10),(57,'2017-08-04 13:33:00.000000',8430,7,10),(58,'2017-08-04 13:33:00.000000',204,6,10),(59,'2017-08-04 13:33:00.000000',28622,1,10),(60,'2017-08-04 13:33:00.000000',2,4,10),(61,'2017-08-08 14:25:00.000000',71,2,11),(62,'2017-08-08 14:25:00.000000',3292,5,11),(63,'2017-08-08 14:25:00.000000',1065,7,11),(64,'2017-08-08 14:25:00.000000',21,6,11),(65,'2017-08-08 14:25:00.000000',7839,1,11),(66,'2017-08-08 14:25:00.000000',3,4,11),(67,'2017-08-11 09:25:00.000000',693,2,12),(68,'2017-08-11 09:25:00.000000',9426,5,12),(69,'2017-08-11 09:25:00.000000',20440,7,12),(70,'2017-08-11 09:25:00.000000',4752,6,12),(71,'2017-08-11 09:25:00.000000',104636,1,12),(72,'2017-08-11 09:25:00.000000',141,4,12),(73,'2017-08-11 10:07:00.000000',132,2,13),(74,'2017-08-11 10:07:00.000000',2421,5,13),(75,'2017-08-11 10:07:00.000000',6925,7,13),(76,'2017-08-11 10:07:00.000000',226,6,13),(77,'2017-08-11 10:07:00.000000',47507,1,13),(78,'2017-08-11 10:07:00.000000',37,4,13),(79,'2017-08-11 09:38:00.000000',110,2,14),(80,'2017-08-11 09:38:00.000000',5236,5,14),(81,'2017-08-11 09:38:00.000000',10795,7,14),(82,'2017-08-11 09:38:00.000000',723,6,14),(83,'2017-08-11 09:38:00.000000',71678,1,14),(84,'2017-08-11 09:38:00.000000',157,4,14),(85,'2017-08-11 09:52:00.000000',335,2,15),(86,'2017-08-11 09:52:00.000000',6500,5,15),(87,'2017-08-11 09:52:00.000000',16712,7,15),(88,'2017-08-11 09:52:00.000000',1419,6,15),(89,'2017-08-11 09:52:00.000000',114455,1,15),(90,'2017-08-11 09:52:00.000000',184,4,15),(91,'2017-08-11 10:01:00.000000',402,2,16),(92,'2017-08-11 10:01:00.000000',1389,5,16),(93,'2017-08-11 10:01:00.000000',7207,7,16),(94,'2017-08-11 10:01:00.000000',117,6,16),(95,'2017-08-11 10:01:00.000000',22614,1,16),(96,'2017-08-11 10:01:00.000000',114,4,16),(97,'2017-08-16 14:43:00.000000',851,2,5),(98,'2017-08-16 14:43:00.000000',15745,5,5),(99,'2017-08-16 14:43:00.000000',51784,7,5),(100,'2017-08-16 14:43:00.000000',4640,6,5),(101,'2017-08-16 14:43:00.000000',292020,1,5),(102,'2017-08-16 14:43:00.000000',542,4,5),(103,'2017-08-18 11:53:00.000000',113,2,2),(104,'2017-08-18 11:53:00.000000',1796,5,2),(105,'2017-08-18 11:53:00.000000',6302,7,2),(106,'2017-08-18 11:53:00.000000',102,6,2),(107,'2017-08-18 11:53:00.000000',31931,1,2),(108,'2017-08-18 11:53:00.000000',0,4,2),(109,'2017-08-17 17:02:00.000000',155,2,1),(110,'2017-08-17 17:02:00.000000',6526,5,1),(111,'2017-08-17 17:02:00.000000',16714,7,1),(112,'2017-08-17 17:02:00.000000',804,6,1),(113,'2017-08-17 17:02:00.000000',96985,1,1),(114,'2017-08-17 17:02:00.000000',532,4,1),(115,'2017-08-18 11:13:00.000000',375,2,10),(116,'2017-08-18 11:13:00.000000',1980,5,10),(117,'2017-08-18 11:13:00.000000',8466,7,10),(118,'2017-08-18 11:13:00.000000',202,6,10),(119,'2017-08-18 11:13:00.000000',28746,1,10),(120,'2017-08-18 11:13:00.000000',0,4,10),(121,'2017-08-18 10:48:00.000000',901,2,9),(122,'2017-08-18 10:48:00.000000',7889,5,9),(123,'2017-08-18 10:48:00.000000',25223,7,9),(124,'2017-08-18 10:48:00.000000',1438,6,9),(125,'2017-08-18 10:48:00.000000',99904,1,9),(126,'2017-08-18 10:48:00.000000',239,4,9),(127,'2017-08-18 13:35:00.000000',181,2,6),(128,'2017-08-18 13:35:00.000000',4775,5,6),(129,'2017-08-18 13:35:00.000000',16086,7,6),(130,'2017-08-18 13:35:00.000000',708,6,6),(131,'2017-08-18 13:35:00.000000',83262,1,6),(132,'2017-08-18 13:35:00.000000',353,4,6),(133,'2017-08-18 14:50:00.000000',687,2,12),(134,'2017-08-18 14:50:00.000000',9361,5,12),(135,'2017-08-18 14:50:00.000000',20445,7,12),(136,'2017-08-18 14:50:00.000000',4760,6,12),(137,'2017-08-18 14:50:00.000000',104629,1,12),(138,'2017-08-18 14:50:00.000000',95,4,12),(139,'2017-08-18 15:35:00.000000',844,2,5),(140,'2017-08-18 15:35:00.000000',15091,5,5),(141,'2017-08-18 15:35:00.000000',51545,7,5),(142,'2017-08-18 15:35:00.000000',4508,6,5),(143,'2017-08-18 15:35:00.000000',264286,1,5),(144,'2017-08-18 15:35:00.000000',474,4,5),(145,'2017-08-08 13:01:00.000000',1,1,5),(146,'2017-08-08 13:01:00.000000',1,2,5),(147,'2017-08-08 13:01:00.000000',1,4,5),(148,'2017-08-08 13:01:00.000000',1,5,5),(149,'2017-08-08 13:01:00.000000',1,6,5),(150,'2017-08-08 13:01:00.000000',1,7,5);
/*!40000 ALTER TABLE `viewer_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewer_metric`
--

DROP TABLE IF EXISTS `viewer_metric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewer_metric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewer_metric`
--

LOCK TABLES `viewer_metric` WRITE;
/*!40000 ALTER TABLE `viewer_metric` DISABLE KEYS */;
INSERT INTO `viewer_metric` VALUES (2,'Bugs'),(5,'Code Smells'),(7,'Complexity'),(6,'Duplicated Block'),(1,'Size'),(4,'Vulnerabilities');
/*!40000 ALTER TABLE `viewer_metric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewer_project`
--

DROP TABLE IF EXISTS `viewer_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewer_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewer_project`
--

LOCK TABLES `viewer_project` WRITE;
/*!40000 ALTER TABLE `viewer_project` DISABLE KEYS */;
INSERT INTO `viewer_project` VALUES (1,'Remarketing',1,9),(2,'Subastador',1,13),(3,'mbims',1,7),(4,'DFSIP',1,10),(5,'sitioDistribuidores',1,16),(6,'Timer',1,11),(7,'GoLegal',1,4),(8,'SAUPP',1,5),(9,'sitioClientes',1,15),(10,'EfilesAutos',1,2),(11,'IC',1,1),(12,'Cotizador',1,14),(13,'Itv',1,3),(14,'OnOffBoarding',1,8),(15,'ProductManager',1,6),(16,'SitioProveedores',1,12);
/*!40000 ALTER TABLE `viewer_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sqst'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-29 14:49:16
