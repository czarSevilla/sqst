-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: sqst
-- ------------------------------------------------------
-- Server version	5.7.19

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add project',7,'add_project'),(20,'Can change project',7,'change_project'),(21,'Can delete project',7,'delete_project'),(22,'Can add entry',8,'add_entry'),(23,'Can change entry',8,'change_entry'),(24,'Can delete entry',8,'delete_entry'),(25,'Can add metric',9,'add_metric'),(26,'Can change metric',9,'change_metric'),(27,'Can delete metric',9,'delete_metric');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$QmKlPxqZx8ul$u8qdEaQBcXCnzskPPkFMBTov//c1WYmuycqNMlo829A=','2017-08-26 04:38:29.647114',1,'admin','','','czar.sevilla@gmail.com',1,1,'2017-08-18 05:08:53.005390');
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
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-08-18 05:18:58.463706','1','Project object',1,'[{\"added\": {}}]',7,1),(2,'2017-08-18 05:19:17.194670','1','Metric object',1,'[{\"added\": {}}]',9,1),(3,'2017-08-18 05:19:32.405216','2','Metric object',1,'[{\"added\": {}}]',9,1),(4,'2017-08-18 05:21:46.063143','4','Vulnerabilities',1,'[{\"added\": {}}]',9,1),(5,'2017-08-18 05:22:10.341461','5','Code Smells',1,'[{\"added\": {}}]',9,1),(6,'2017-08-18 05:22:38.936398','6','Duplicated Block',1,'[{\"added\": {}}]',9,1),(7,'2017-08-18 05:23:35.990647','7','Complexity',1,'[{\"added\": {}}]',9,1),(8,'2017-08-18 05:26:47.319956','1','Entry object',1,'[{\"added\": {}}]',8,1),(9,'2017-08-18 05:30:07.948507','2','Remarketing / Code Smells / 2017-08-04 12:12:00+00:00 / 6854',1,'[{\"added\": {}}]',8,1),(10,'2017-08-18 05:30:36.991268','3','Remarketing / Complexity / 2017-08-04 12:12:00+00:00 / 16712',1,'[{\"added\": {}}]',8,1),(11,'2017-08-18 05:31:06.305623','4','Remarketing / Duplicated Block / 2017-08-04 12:12:00+00:00 / 859',1,'[{\"added\": {}}]',8,1),(12,'2017-08-18 05:31:35.502149','5','Remarketing / Size / 2017-08-04 12:12:00+00:00 / 107851',1,'[{\"added\": {}}]',8,1),(13,'2017-08-18 05:32:02.867917','6','Remarketing / Vulnerabilities / 2017-08-04 12:12:00+00:00 / 754',1,'[{\"added\": {}}]',8,1),(14,'2017-08-18 05:34:01.823873','2','Subastador',1,'[{\"added\": {}}]',7,1),(15,'2017-08-18 05:34:51.907213','7','Subastador / Bugs / 2017-08-04 12:24:00+00:00 / 112',1,'[{\"added\": {}}]',8,1),(16,'2017-08-18 05:35:18.231821','8','Subastador / Code Smells / 2017-08-04 12:24:00+00:00 / 1994',1,'[{\"added\": {}}]',8,1),(17,'2017-08-18 05:35:45.558487','9','Subastador / Complexity / 2017-08-04 12:24:00+00:00 / 6043',1,'[{\"added\": {}}]',8,1),(18,'2017-08-18 05:36:16.094851','10','Subastador / Duplicated Block / 2017-08-04 12:24:00+00:00 / 161',1,'[{\"added\": {}}]',8,1),(19,'2017-08-18 05:36:55.292648','11','Subastador / Size / 2017-08-04 12:24:00+00:00 / 29735',1,'[{\"added\": {}}]',8,1),(20,'2017-08-18 05:37:27.166436','12','Subastador / Vulnerabilities / 2017-08-04 12:24:00+00:00 / 143',1,'[{\"added\": {}}]',8,1),(21,'2017-08-18 05:39:47.515533','3','mbims',1,'[{\"added\": {}}]',7,1),(22,'2017-08-18 05:40:32.398874','13','mbims / Bugs / 2017-08-04 12:43:00+00:00 / 197',1,'[{\"added\": {}}]',8,1),(23,'2017-08-18 05:41:06.387147','14','mbims / Code Smells / 2017-08-04 12:43:00+00:00 / 1076',1,'[{\"added\": {}}]',8,1),(24,'2017-08-18 05:41:35.414900','15','mbims / Complexity / 2017-08-04 12:43:00+00:00 / 6407',1,'[{\"added\": {}}]',8,1),(25,'2017-08-18 05:42:01.025475','16','mbims / Duplicated Block / 2017-08-04 12:43:00+00:00 / 133',1,'[{\"added\": {}}]',8,1),(26,'2017-08-18 05:42:28.775697','17','mbims / Size / 2017-08-04 12:43:00+00:00 / 29530',1,'[{\"added\": {}}]',8,1),(27,'2017-08-18 05:43:16.324290','18','mbims / Vulnerabilities / 2017-08-04 12:43:00+00:00 / 41',1,'[{\"added\": {}}]',8,1),(28,'2017-08-18 05:44:59.408245','4','DFSIP',1,'[{\"added\": {}}]',7,1),(29,'2017-08-18 05:45:32.369652','19','DFSIP / Bugs / 2017-08-04 12:27:00+00:00 / 181',1,'[{\"added\": {}}]',8,1),(30,'2017-08-18 05:45:54.360429','20','DFSIP / Code Smells / 2017-08-04 12:27:00+00:00 / 3955',1,'[{\"added\": {}}]',8,1),(31,'2017-08-18 05:46:18.590534','21','DFSIP / Complexity / 2017-08-04 12:27:00+00:00 / 13851',1,'[{\"added\": {}}]',8,1),(32,'2017-08-18 05:46:51.775479','22','DFSIP / Duplicated Block / 2017-08-04 12:27:00+00:00 / 549',1,'[{\"added\": {}}]',8,1),(33,'2017-08-18 05:47:17.976146','23','DFSIP / Size / 2017-08-04 12:27:00+00:00 / 72287',1,'[{\"added\": {}}]',8,1),(34,'2017-08-18 05:47:44.408942','24','DFSIP / Vulnerabilities / 2017-08-04 12:27:00+00:00 / 329',1,'[{\"added\": {}}]',8,1),(35,'2017-08-18 05:48:47.235553','5','sitioDistribuidores',1,'[{\"added\": {}}]',7,1),(36,'2017-08-18 05:50:07.212444','25','sitioDistribuidores / Bugs / 2017-08-04 12:45:00+00:00 / 856',1,'[{\"added\": {}}]',8,1),(37,'2017-08-18 05:50:30.743098','26','sitioDistribuidores / Code Smells / 2017-08-04 12:45:00+00:00 / 16224',1,'[{\"added\": {}}]',8,1),(38,'2017-08-18 05:51:01.683733','27','sitioDistribuidores / Complexity / 2017-08-04 12:45:00+00:00 / 51836',1,'[{\"added\": {}}]',8,1),(39,'2017-08-18 05:51:23.475169','28','sitioDistribuidores / Duplicated Block / 2017-08-04 12:45:00+00:00 / 4439',1,'[{\"added\": {}}]',8,1),(40,'2017-08-18 05:52:21.864294','29','sitioDistribuidores / Size / 2017-08-04 12:45:00+00:00 / 291813',1,'[{\"added\": {}}]',8,1),(41,'2017-08-18 05:52:46.703720','30','sitioDistribuidores / Vulnerabilities / 2017-08-04 12:45:00+00:00 / 1037',1,'[{\"added\": {}}]',8,1),(42,'2017-08-18 05:54:43.960474','6','Timer',1,'[{\"added\": {}}]',7,1),(43,'2017-08-18 05:55:46.623583','31','Timer / Bugs / 2017-08-04 13:00:00+00:00 / 181',1,'[{\"added\": {}}]',8,1),(44,'2017-08-18 05:56:13.406262','32','Timer / Code Smells / 2017-08-04 13:00:00+00:00 / 4852',1,'[{\"added\": {}}]',8,1),(45,'2017-08-18 05:57:02.844772','33','Timer / Complexity / 2017-08-04 13:00:00+00:00 / 16126',1,'[{\"added\": {}}]',8,1),(46,'2017-08-18 05:57:26.679682','34','Timer / Duplicated Block / 2017-08-04 13:00:00+00:00 / 787',1,'[{\"added\": {}}]',8,1),(47,'2017-08-18 05:57:55.040673','35','Timer / Size / 2017-08-04 13:00:00+00:00 / 83689',1,'[{\"added\": {}}]',8,1),(48,'2017-08-18 05:58:22.361595','36','Timer / Vulnerabilities / 2017-08-04 13:00:00+00:00 / 510',1,'[{\"added\": {}}]',8,1),(49,'2017-08-18 05:59:34.903959','7','GoLegal',1,'[{\"added\": {}}]',7,1),(50,'2017-08-18 06:00:38.920951','37','GoLegal / Bugs / 2017-08-04 12:51:00+00:00 / 107',1,'[{\"added\": {}}]',8,1),(51,'2017-08-18 06:01:05.444628','38','GoLegal / Code Smells / 2017-08-04 12:51:00+00:00 / 2017',1,'[{\"added\": {}}]',8,1),(52,'2017-08-18 06:01:37.005969','39','GoLegal / Complexity / 2017-08-04 12:51:00+00:00 / 8421',1,'[{\"added\": {}}]',8,1),(53,'2017-08-18 06:02:10.460331','40','GoLegal / Duplicated Block / 2017-08-04 12:51:00+00:00 / 248',1,'[{\"added\": {}}]',8,1),(54,'2017-08-18 06:02:38.240166','41','GoLegal / Size / 2017-08-04 12:51:00+00:00 / 35991',1,'[{\"added\": {}}]',8,1),(55,'2017-08-18 06:03:12.517024','42','GoLegal / Vulnerabilities / 2017-08-04 12:51:00+00:00 / 56',1,'[{\"added\": {}}]',8,1),(56,'2017-08-18 06:04:04.967108','8','SAUPP',1,'[{\"added\": {}}]',7,1),(57,'2017-08-18 06:04:47.748785','43','SAUPP / Bugs / 2017-08-04 12:43:00+00:00 / 97',1,'[{\"added\": {}}]',8,1),(58,'2017-08-18 06:05:53.039645','44','SAUPP / Code Smells / 2017-08-04 12:43:00+00:00 / 2525',1,'[{\"added\": {}}]',8,1),(59,'2017-08-18 06:06:22.652448','45','SAUPP / Complexity / 2017-08-04 12:43:00+00:00 / 6875',1,'[{\"added\": {}}]',8,1),(60,'2017-08-18 06:06:47.296018','46','SAUPP / Duplicated Block / 2017-08-04 12:43:00+00:00 / 239',1,'[{\"added\": {}}]',8,1),(61,'2017-08-18 06:07:06.923368','47','SAUPP / Size / 2017-08-04 12:43:00+00:00 / 30055',1,'[{\"added\": {}}]',8,1),(62,'2017-08-18 06:07:52.196745','48','SAUPP / Vulnerabilities / 2017-08-04 12:43:00+00:00 / 65',1,'[{\"added\": {}}]',8,1),(63,'2017-08-18 06:09:30.922716','9','sitioClientes_v2_movil',1,'[{\"added\": {}}]',7,1),(64,'2017-08-18 06:10:20.039090','49','sitioClientes_v2_movil / Bugs / 2017-08-04 17:22:00+00:00 / 342',1,'[{\"added\": {}}]',8,1),(65,'2017-08-18 06:10:43.385795','50','sitioClientes_v2_movil / Code Smells / 2017-08-04 17:22:00+00:00 / 7378',1,'[{\"added\": {}}]',8,1),(66,'2017-08-18 06:11:12.367811','51','sitioClientes_v2_movil / Complexity / 2017-08-04 17:22:00+00:00 / 18328',1,'[{\"added\": {}}]',8,1),(67,'2017-08-18 06:11:46.507211','52','sitioClientes_v2_movil / Duplicated Block / 2017-08-04 17:22:00+00:00 / 1437',1,'[{\"added\": {}}]',8,1),(68,'2017-08-18 06:12:13.579277','53','sitioClientes_v2_movil / Size / 2017-08-04 17:22:00+00:00 / 99931',1,'[{\"added\": {}}]',8,1),(69,'2017-08-18 06:12:42.953500','54','sitioClientes_v2_movil / Vulnerabilities / 2017-08-04 17:22:00+00:00 / 296',1,'[{\"added\": {}}]',8,1),(70,'2017-08-18 15:42:02.881521','10','EfilesAutos',1,'[{\"added\": {}}]',7,1),(71,'2017-08-18 15:42:59.264705','55','EfilesAutos / Bugs / 2017-08-04 13:33:00+00:00 / 379',1,'[{\"added\": {}}]',8,1),(72,'2017-08-18 15:56:26.656167','56','EfilesAutos / Code Smells / 2017-08-04 13:33:00+00:00 / 1983',1,'[{\"added\": {}}]',8,1),(73,'2017-08-18 15:57:05.882387','57','EfilesAutos / Complexity / 2017-08-04 13:33:00+00:00 / 8430',1,'[{\"added\": {}}]',8,1),(74,'2017-08-18 15:57:34.641777','58','EfilesAutos / Duplicated Block / 2017-08-04 13:33:00+00:00 / 204',1,'[{\"added\": {}}]',8,1),(75,'2017-08-18 15:58:07.776157','59','EfilesAutos / Size / 2017-08-04 13:33:00+00:00 / 28622',1,'[{\"added\": {}}]',8,1),(76,'2017-08-18 15:58:54.281793','60','EfilesAutos / Vulnerabilities / 2017-08-04 13:33:00+00:00 / 2',1,'[{\"added\": {}}]',8,1),(77,'2017-08-18 17:48:15.567509','11','IC',1,'[{\"added\": {}}]',7,1),(78,'2017-08-18 17:48:52.906933','61','IC / Bugs / 2017-08-08 14:25:00+00:00 / 71',1,'[{\"added\": {}}]',8,1),(79,'2017-08-18 17:49:28.975595','62','IC / Code Smells / 2017-08-08 14:25:00+00:00 / 3292',1,'[{\"added\": {}}]',8,1),(80,'2017-08-18 17:49:53.797202','63','IC / Complexity / 2017-08-08 14:25:00+00:00 / 1065',1,'[{\"added\": {}}]',8,1),(81,'2017-08-18 17:50:22.321718','64','IC / Duplicated Block / 2017-08-08 14:25:00+00:00 / 21',1,'[{\"added\": {}}]',8,1),(82,'2017-08-18 17:50:45.699135','65','IC / Size / 2017-08-08 14:25:00+00:00 / 7839',1,'[{\"added\": {}}]',8,1),(83,'2017-08-18 17:51:11.649611','66','IC / Vulnerabilities / 2017-08-08 14:25:00+00:00 / 3',1,'[{\"added\": {}}]',8,1),(84,'2017-08-18 17:56:49.412205','12','Cotizador',1,'[{\"added\": {}}]',7,1),(85,'2017-08-18 17:57:14.388674','13','Itv',1,'[{\"added\": {}}]',7,1),(86,'2017-08-18 17:57:36.741227','14','OnOffBoarding',1,'[{\"added\": {}}]',7,1),(87,'2017-08-18 17:57:50.424910','15','ProductManager',1,'[{\"added\": {}}]',7,1),(88,'2017-08-18 17:58:06.503830','16','SitioProveedores',1,'[{\"added\": {}}]',7,1),(89,'2017-08-18 18:00:35.667693','67','Cotizador / Bugs / 2017-08-11 09:25:00+00:00 / 693',1,'[{\"added\": {}}]',8,1),(90,'2017-08-18 18:01:00.605363','68','Cotizador / Code Smells / 2017-08-11 09:25:00+00:00 / 9426',1,'[{\"added\": {}}]',8,1),(91,'2017-08-18 18:01:23.411432','69','Cotizador / Complexity / 2017-08-11 09:25:00+00:00 / 20440',1,'[{\"added\": {}}]',8,1),(92,'2017-08-18 18:01:46.714387','70','Cotizador / Duplicated Block / 2017-08-11 09:25:00+00:00 / 4752',1,'[{\"added\": {}}]',8,1),(93,'2017-08-18 18:02:13.163340','71','Cotizador / Size / 2017-08-11 09:25:00+00:00 / 104636',1,'[{\"added\": {}}]',8,1),(94,'2017-08-18 18:02:38.459570','72','Cotizador / Vulnerabilities / 2017-08-11 09:25:00+00:00 / 141',1,'[{\"added\": {}}]',8,1),(95,'2017-08-18 18:06:38.696648','73','Itv / Bugs / 2017-08-11 10:07:00+00:00 / 132',1,'[{\"added\": {}}]',8,1),(96,'2017-08-18 18:07:07.290266','74','Itv / Code Smells / 2017-08-11 10:07:00+00:00 / 2421',1,'[{\"added\": {}}]',8,1),(97,'2017-08-18 18:07:37.162065','75','Itv / Complexity / 2017-08-11 10:07:00+00:00 / 6925',1,'[{\"added\": {}}]',8,1),(98,'2017-08-18 18:08:04.517581','76','Itv / Duplicated Block / 2017-08-11 10:07:00+00:00 / 226',1,'[{\"added\": {}}]',8,1),(99,'2017-08-18 18:08:28.212551','77','Itv / Size / 2017-08-11 10:07:00+00:00 / 47507',1,'[{\"added\": {}}]',8,1),(100,'2017-08-18 18:09:19.169362','78','Itv / Vulnerabilities / 2017-08-11 10:07:00+00:00 / 37',1,'[{\"added\": {}}]',8,1),(101,'2017-08-18 18:10:22.770473','79','OnOffBoarding / Bugs / 2017-08-11 09:38:00+00:00 / 110',1,'[{\"added\": {}}]',8,1),(102,'2017-08-18 18:10:46.111468','80','OnOffBoarding / Code Smells / 2017-08-11 09:38:00+00:00 / 5236',1,'[{\"added\": {}}]',8,1),(103,'2017-08-18 18:11:10.472649','81','OnOffBoarding / Complexity / 2017-08-11 09:38:00+00:00 / 10795',1,'[{\"added\": {}}]',8,1),(104,'2017-08-18 18:11:36.656109','82','OnOffBoarding / Duplicated Block / 2017-08-11 09:38:00+00:00 / 723',1,'[{\"added\": {}}]',8,1),(105,'2017-08-18 18:12:04.869339','83','OnOffBoarding / Size / 2017-08-11 09:38:00+00:00 / 71678',1,'[{\"added\": {}}]',8,1),(106,'2017-08-18 18:12:34.542934','84','OnOffBoarding / Vulnerabilities / 2017-08-11 09:38:00+00:00 / 157',1,'[{\"added\": {}}]',8,1),(107,'2017-08-18 18:13:48.849952','85','ProductManager / Bugs / 2017-08-11 09:52:00+00:00 / 335',1,'[{\"added\": {}}]',8,1),(108,'2017-08-18 18:14:08.538715','86','ProductManager / Code Smells / 2017-08-11 09:52:00+00:00 / 6500',1,'[{\"added\": {}}]',8,1),(109,'2017-08-18 18:14:38.915945','87','ProductManager / Complexity / 2017-08-11 09:52:00+00:00 / 16712',1,'[{\"added\": {}}]',8,1),(110,'2017-08-18 18:15:02.201930','88','ProductManager / Duplicated Block / 2017-08-11 09:52:00+00:00 / 1419',1,'[{\"added\": {}}]',8,1),(111,'2017-08-18 18:16:08.084597','89','ProductManager / Size / 2017-08-11 09:52:00+00:00 / 114455',1,'[{\"added\": {}}]',8,1),(112,'2017-08-18 18:16:29.031187','90','ProductManager / Vulnerabilities / 2017-08-11 09:52:00+00:00 / 184',1,'[{\"added\": {}}]',8,1),(113,'2017-08-18 18:18:01.349788','91','SitioProveedores / Bugs / 2017-08-11 10:01:00+00:00 / 402',1,'[{\"added\": {}}]',8,1),(114,'2017-08-18 18:18:44.355651','92','SitioProveedores / Code Smells / 2017-08-11 10:01:00+00:00 / 1389',1,'[{\"added\": {}}]',8,1),(115,'2017-08-18 18:19:32.001122','93','SitioProveedores / Complexity / 2017-08-11 10:01:00+00:00 / 7207',1,'[{\"added\": {}}]',8,1),(116,'2017-08-18 18:19:56.439655','94','SitioProveedores / Duplicated Block / 2017-08-11 10:01:00+00:00 / 117',1,'[{\"added\": {}}]',8,1),(117,'2017-08-18 18:20:21.743421','95','SitioProveedores / Size / 2017-08-11 10:01:00+00:00 / 22614',1,'[{\"added\": {}}]',8,1),(118,'2017-08-18 18:20:45.479107','96','SitioProveedores / Vulnerabilities / 2017-08-11 10:01:00+00:00 / 114',1,'[{\"added\": {}}]',8,1),(119,'2017-08-18 18:23:01.157859','97','sitioDistribuidores / Bugs / 2017-08-16 14:43:00+00:00 / 851',1,'[{\"added\": {}}]',8,1),(120,'2017-08-18 18:23:29.874799','98','sitioDistribuidores / Code Smells / 2017-08-16 14:43:00+00:00 / 15745',1,'[{\"added\": {}}]',8,1),(121,'2017-08-18 18:23:54.534606','99','sitioDistribuidores / Complexity / 2017-08-16 14:43:00+00:00 / 51784',1,'[{\"added\": {}}]',8,1),(122,'2017-08-18 18:24:24.507371','100','sitioDistribuidores / Duplicated Block / 2017-08-16 14:43:00+00:00 / 4640',1,'[{\"added\": {}}]',8,1),(123,'2017-08-18 18:24:51.350293','101','sitioDistribuidores / Size / 2017-08-16 14:43:00+00:00 / 292029',1,'[{\"added\": {}}]',8,1),(124,'2017-08-18 18:25:16.319474','102','sitioDistribuidores / Vulnerabilities / 2017-08-16 14:43:00+00:00 / 542',1,'[{\"added\": {}}]',8,1),(125,'2017-08-18 18:26:04.779633','101','sitioDistribuidores / Size / 2017-08-16 14:43:00+00:00 / 292020',2,'[{\"changed\": {\"fields\": [\"value\"]}}]',8,1),(126,'2017-08-18 18:28:44.468115','103','Subastador / Bugs / 2017-08-18 11:53:00+00:00 / 113',1,'[{\"added\": {}}]',8,1),(127,'2017-08-18 18:29:11.944723','104','Subastador / Code Smells / 2017-08-18 11:53:00+00:00 / 1796',1,'[{\"added\": {}}]',8,1),(128,'2017-08-18 18:29:34.900021','105','Subastador / Complexity / 2017-08-18 11:53:00+00:00 / 6302',1,'[{\"added\": {}}]',8,1),(129,'2017-08-18 18:30:13.689144','106','Subastador / Duplicated Block / 2017-08-18 11:53:00+00:00 / 102',1,'[{\"added\": {}}]',8,1),(130,'2017-08-18 18:30:50.044736','107','Subastador / Size / 2017-08-18 11:53:00+00:00 / 31931',1,'[{\"added\": {}}]',8,1),(131,'2017-08-18 18:31:10.820951','108','Subastador / Vulnerabilities / 2017-08-18 11:53:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(132,'2017-08-18 18:33:23.015937','109','Remarketing / Bugs / 2017-08-17 17:02:00+00:00 / 155',1,'[{\"added\": {}}]',8,1),(133,'2017-08-18 18:33:48.069320','110','Remarketing / Code Smells / 2017-08-17 17:02:00+00:00 / 6526',1,'[{\"added\": {}}]',8,1),(134,'2017-08-18 18:34:19.851840','111','Remarketing / Complexity / 2017-08-17 17:05:00+00:00 / 16714',1,'[{\"added\": {}}]',8,1),(135,'2017-08-18 18:34:51.279208','112','Remarketing / Duplicated Block / 2017-08-17 17:02:00+00:00 / 804',1,'[{\"added\": {}}]',8,1),(136,'2017-08-18 18:35:16.574569','113','Remarketing / Size / 2017-08-17 17:02:00+00:00 / 96985',1,'[{\"added\": {}}]',8,1),(137,'2017-08-18 18:35:48.725793','114','Remarketing / Vulnerabilities / 2017-08-17 17:02:00+00:00 / 532',1,'[{\"added\": {}}]',8,1),(138,'2017-08-18 18:38:37.486231','115','EfilesAutos / Bugs / 2017-08-18 11:13:00+00:00 / 375',1,'[{\"added\": {}}]',8,1),(139,'2017-08-18 18:39:07.309013','116','EfilesAutos / Code Smells / 2017-08-18 11:13:00+00:00 / 1980',1,'[{\"added\": {}}]',8,1),(140,'2017-08-18 18:39:55.256207','117','EfilesAutos / Complexity / 2017-08-18 11:13:00+00:00 / 8466',1,'[{\"added\": {}}]',8,1),(141,'2017-08-18 18:40:17.990191','118','EfilesAutos / Duplicated Block / 2017-08-18 11:13:00+00:00 / 202',1,'[{\"added\": {}}]',8,1),(142,'2017-08-18 18:48:20.502039','119','EfilesAutos / Size / 2017-08-18 11:13:00+00:00 / 28746',1,'[{\"added\": {}}]',8,1),(143,'2017-08-18 18:48:44.709397','120','EfilesAutos / Vulnerabilities / 2017-08-18 11:13:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(144,'2017-08-18 18:50:49.171349','9','sitioClientes',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',7,1),(145,'2017-08-18 19:15:11.914100','121','sitioClientes / Bugs / 2017-08-18 10:48:00+00:00 / 901',1,'[{\"added\": {}}]',8,1),(146,'2017-08-18 19:15:34.158319','122','sitioClientes / Code Smells / 2017-08-18 10:48:00+00:00 / 7889',1,'[{\"added\": {}}]',8,1),(147,'2017-08-18 19:16:37.926630','123','sitioClientes / Complexity / 2017-08-18 10:48:00+00:00 / 25223',1,'[{\"added\": {}}]',8,1),(148,'2017-08-18 19:17:02.135096','124','sitioClientes / Duplicated Block / 2017-08-18 10:48:00+00:00 / 1438',1,'[{\"added\": {}}]',8,1),(149,'2017-08-18 19:17:52.052573','125','sitioClientes / Size / 2017-08-18 10:48:00+00:00 / 99904',1,'[{\"added\": {}}]',8,1),(150,'2017-08-18 19:18:22.834220','126','sitioClientes / Vulnerabilities / 2017-08-18 10:48:00+00:00 / 239',1,'[{\"added\": {}}]',8,1),(151,'2017-08-18 20:01:36.489656','127','Timer / Bugs / 2017-08-18 13:35:00+00:00 / 181',1,'[{\"added\": {}}]',8,1),(152,'2017-08-18 20:01:56.377684','128','Timer / Code Smells / 2017-08-18 13:35:00+00:00 / 4775',1,'[{\"added\": {}}]',8,1),(153,'2017-08-18 20:02:19.668588','129','Timer / Complexity / 2017-08-18 13:35:00+00:00 / 16086',1,'[{\"added\": {}}]',8,1),(154,'2017-08-18 20:02:36.899553','130','Timer / Duplicated Block / 2017-08-18 13:35:00+00:00 / 708',1,'[{\"added\": {}}]',8,1),(155,'2017-08-18 20:02:59.418729','131','Timer / Size / 2017-08-18 13:35:00+00:00 / 83262',1,'[{\"added\": {}}]',8,1),(156,'2017-08-18 20:03:29.374475','132','Timer / Vulnerabilities / 2017-08-18 13:35:00+00:00 / 353',1,'[{\"added\": {}}]',8,1),(157,'2017-08-18 20:09:23.999468','133','Cotizador / Bugs / 2017-08-18 14:50:00+00:00 / 687',1,'[{\"added\": {}}]',8,1),(158,'2017-08-18 20:09:45.211154','134','Cotizador / Code Smells / 2017-08-18 14:50:00+00:00 / 9361',1,'[{\"added\": {}}]',8,1),(159,'2017-08-18 20:10:40.736474','135','Cotizador / Complexity / 2017-08-18 14:50:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(160,'2017-08-18 20:11:35.734051','136','Cotizador / Duplicated Block / 2017-08-18 14:50:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(161,'2017-08-18 20:12:56.093848','137','Cotizador / Size / 2017-08-18 14:50:00+00:00 / 104629',1,'[{\"added\": {}}]',8,1),(162,'2017-08-18 20:13:17.769283','138','Cotizador / Vulnerabilities / 2017-08-18 14:50:00+00:00 / 95',1,'[{\"added\": {}}]',8,1),(163,'2017-08-18 21:10:16.258305','136','Cotizador / Duplicated Block / 2017-08-18 14:50:00+00:00 / 4760',2,'[{\"changed\": {\"fields\": [\"value\"]}}]',8,1),(164,'2017-08-18 21:12:14.003287','135','Cotizador / Complexity / 2017-08-18 14:50:00+00:00 / 20445',2,'[{\"changed\": {\"fields\": [\"value\"]}}]',8,1),(165,'2017-08-20 07:35:15.264393','111','Remarketing / Complexity / 2017-08-17 17:02:00+00:00 / 16714',2,'[{\"changed\": {\"fields\": [\"date\"]}}]',8,1),(166,'2017-08-20 07:44:04.090839','5','sitioDistribuidores',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(167,'2017-08-20 07:44:21.871045','9','sitioClientes',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(168,'2017-08-20 07:44:38.597323','12','Cotizador',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(169,'2017-08-20 07:44:59.782429','2','Subastador',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(170,'2017-08-20 07:45:18.930058','16','SitioProveedores',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(171,'2017-08-20 07:45:36.800961','6','Timer',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(172,'2017-08-20 07:45:58.511427','4','DFSIP',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(173,'2017-08-20 07:46:13.222131','4','DFSIP',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(174,'2017-08-20 07:46:45.123206','1','Remarketing',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(175,'2017-08-20 07:47:02.961470','14','OnOffBoarding',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(176,'2017-08-20 07:47:21.686943','3','mbims',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(177,'2017-08-20 07:47:52.328920','8','SAUPP',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(178,'2017-08-20 07:48:03.736597','7','GoLegal',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(179,'2017-08-20 07:49:38.377311','15','ProductManager',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(180,'2017-08-20 07:49:51.282635','13','Itv',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(181,'2017-08-20 07:50:07.538334','10','EfilesAutos',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(182,'2017-08-20 07:50:13.344491','11','IC',2,'[{\"changed\": {\"fields\": [\"priority\"]}}]',7,1),(183,'2017-08-20 08:11:17.491027','139','sitioDistribuidores / Bugs / 2017-08-18 15:35:00+00:00 / 844',1,'[{\"added\": {}}]',8,1),(184,'2017-08-20 08:12:01.084063','140','sitioDistribuidores / Code Smells / 2017-08-18 15:35:00+00:00 / 15091',1,'[{\"added\": {}}]',8,1),(185,'2017-08-20 08:12:33.040604','141','sitioDistribuidores / Complexity / 2017-08-18 15:35:00+00:00 / 51545',1,'[{\"added\": {}}]',8,1),(186,'2017-08-20 08:13:01.305867','142','sitioDistribuidores / Duplicated Block / 2017-08-18 15:35:00+00:00 / 4508',1,'[{\"added\": {}}]',8,1),(187,'2017-08-20 08:13:35.720383','143','sitioDistribuidores / Size / 2017-08-18 15:35:00+00:00 / 264286',1,'[{\"added\": {}}]',8,1),(188,'2017-08-20 08:13:58.453965','144','sitioDistribuidores / Vulnerabilities / 2017-08-18 15:35:00+00:00 / 474',1,'[{\"added\": {}}]',8,1),(189,'2017-08-25 15:15:29.686559','145','sitioClientes / Bugs / 2017-08-24 17:19:00+00:00 / 899',1,'[{\"added\": {}}]',8,1),(190,'2017-08-25 15:15:51.672696','146','sitioClientes / Code Smells / 2017-08-24 17:19:00+00:00 / 7658',1,'[{\"added\": {}}]',8,1),(191,'2017-08-25 15:16:15.505615','147','sitioClientes / Complexity / 2017-08-24 17:19:00+00:00 / 25233',1,'[{\"added\": {}}]',8,1),(192,'2017-08-25 15:16:36.086388','148','sitioClientes / Duplicated Block / 2017-08-24 17:19:00+00:00 / 1461',1,'[{\"added\": {}}]',8,1),(193,'2017-08-25 15:17:01.640508','149','sitioClientes / Size / 2017-08-24 17:19:00+00:00 / 99996',1,'[{\"added\": {}}]',8,1),(194,'2017-08-25 15:17:17.864614','150','sitioClientes / Vulnerabilities / 2017-08-24 17:19:00+00:00 / 181',1,'[{\"added\": {}}]',8,1),(195,'2017-08-25 15:17:57.925218','151','IC / Bugs / 2017-08-24 17:47:00+00:00 / 5',1,'[{\"added\": {}}]',8,1),(196,'2017-08-25 15:18:10.964972','152','IC / Code Smells / 2017-08-24 17:47:00+00:00 / 12',1,'[{\"added\": {}}]',8,1),(197,'2017-08-25 15:18:28.941757','153','IC / Complexity / 2017-08-24 17:47:00+00:00 / 1032',1,'[{\"added\": {}}]',8,1),(198,'2017-08-25 15:18:45.258635','154','IC / Duplicated Block / 2017-08-24 17:47:00+00:00 / 9',1,'[{\"added\": {}}]',8,1),(199,'2017-08-25 15:18:59.055548','155','IC / Size / 2017-08-24 17:47:00+00:00 / 7600',1,'[{\"added\": {}}]',8,1),(200,'2017-08-25 15:19:13.999361','156','IC / Vulnerabilities / 2017-08-24 17:47:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(201,'2017-08-25 15:20:04.846991','157','sitioDistribuidores / Bugs / 2017-08-25 08:29:00+00:00 / 851',1,'[{\"added\": {}}]',8,1),(202,'2017-08-25 15:20:17.222265','158','sitioDistribuidores / Code Smells / 2017-08-25 08:29:00+00:00 / 15433',1,'[{\"added\": {}}]',8,1),(203,'2017-08-25 15:20:33.118679','159','sitioDistribuidores / Complexity / 2017-08-25 08:29:00+00:00 / 51780',1,'[{\"added\": {}}]',8,1),(204,'2017-08-25 15:20:47.655507','160','sitioDistribuidores / Duplicated Block / 2017-08-25 08:29:00+00:00 / 4688',1,'[{\"added\": {}}]',8,1),(205,'2017-08-25 15:21:01.878404','161','sitioDistribuidores / Size / 2017-08-25 08:29:00+00:00 / 292221',1,'[{\"added\": {}}]',8,1),(206,'2017-08-25 15:21:17.990049','162','sitioDistribuidores / Vulnerabilities / 2017-08-25 08:29:00+00:00 / 339',1,'[{\"added\": {}}]',8,1),(207,'2017-08-25 15:22:00.054648','163','EfilesAutos / Bugs / 2017-08-24 17:13:00+00:00 / 370',1,'[{\"added\": {}}]',8,1),(208,'2017-08-25 15:22:17.806259','164','EfilesAutos / Code Smells / 2017-08-24 17:13:00+00:00 / 1004',1,'[{\"added\": {}}]',8,1),(209,'2017-08-25 15:22:35.100963','165','EfilesAutos / Complexity / 2017-08-24 17:13:00+00:00 / 6535',1,'[{\"added\": {}}]',8,1),(210,'2017-08-25 15:22:50.574625','166','EfilesAutos / Duplicated Block / 2017-08-24 17:13:00+00:00 / 50',1,'[{\"added\": {}}]',8,1),(211,'2017-08-25 15:23:05.246886','167','EfilesAutos / Size / 2017-08-24 17:13:00+00:00 / 17207',1,'[{\"added\": {}}]',8,1),(212,'2017-08-25 15:23:19.686497','168','EfilesAutos / Vulnerabilities / 2017-08-24 17:13:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(213,'2017-08-25 15:24:01.400288','169','Remarketing / Bugs / 2017-08-25 09:20:00+00:00 / 154',1,'[{\"added\": {}}]',8,1),(214,'2017-08-25 15:24:13.237775','170','Remarketing / Code Smells / 2017-08-25 09:20:00+00:00 / 5997',1,'[{\"added\": {}}]',8,1),(215,'2017-08-25 15:24:26.477587','171','Remarketing / Complexity / 2017-08-25 09:20:00+00:00 / 16671',1,'[{\"added\": {}}]',8,1),(216,'2017-08-25 15:24:38.435574','172','Remarketing / Duplicated Block / 2017-08-25 09:20:00+00:00 / 805',1,'[{\"added\": {}}]',8,1),(217,'2017-08-25 15:24:51.915610','173','Remarketing / Size / 2017-08-25 09:20:00+00:00 / 97014',1,'[{\"added\": {}}]',8,1),(218,'2017-08-25 15:25:05.092278','174','Remarketing / Vulnerabilities / 2017-08-25 09:20:00+00:00 / 56',1,'[{\"added\": {}}]',8,1),(219,'2017-08-25 15:25:37.491545','175','Subastador / Bugs / 2017-08-25 09:28:00+00:00 / 113',1,'[{\"added\": {}}]',8,1),(220,'2017-08-25 15:25:49.614913','176','Subastador / Code Smells / 2017-08-25 09:28:00+00:00 / 1796',1,'[{\"added\": {}}]',8,1),(221,'2017-08-25 15:26:01.836520','177','Subastador / Complexity / 2017-08-25 09:28:00+00:00 / 6302',1,'[{\"added\": {}}]',8,1),(222,'2017-08-25 15:26:31.900283','178','Subastador / Duplicated Block / 2017-08-25 09:28:00+00:00 / 102',1,'[{\"added\": {}}]',8,1),(223,'2017-08-25 15:26:42.740254','179','Subastador / Size / 2017-08-25 09:28:00+00:00 / 31931',1,'[{\"added\": {}}]',8,1),(224,'2017-08-25 15:26:55.677648','180','Subastador / Vulnerabilities / 2017-08-25 09:28:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(225,'2017-08-25 15:42:36.351248','181','GoLegal / Bugs / 2017-08-23 16:30:00+00:00 / 106',1,'[{\"added\": {}}]',8,1),(226,'2017-08-25 15:42:53.609157','182','GoLegal / Code Smells / 2017-08-23 16:30:00+00:00 / 2016',1,'[{\"added\": {}}]',8,1),(227,'2017-08-25 15:43:12.327525','183','GoLegal / Complexity / 2017-08-23 16:30:00+00:00 / 8409',1,'[{\"added\": {}}]',8,1),(228,'2017-08-25 15:43:31.093829','184','GoLegal / Duplicated Block / 2017-08-23 16:30:00+00:00 / 242',1,'[{\"added\": {}}]',8,1),(229,'2017-08-25 15:43:49.160933','185','GoLegal / Size / 2017-08-23 16:30:00+00:00 / 35970',1,'[{\"added\": {}}]',8,1),(230,'2017-08-25 15:44:06.646433','186','GoLegal / Vulnerabilities / 2017-08-23 16:30:00+00:00 / 0',1,'[{\"added\": {}}]',8,1),(231,'2017-08-25 19:00:19.588373','187','SAUPP / Bugs / 2017-08-25 13:48:00+00:00 / 97',1,'[{\"added\": {}}]',8,1),(232,'2017-08-25 19:00:32.044535','188','SAUPP / Code Smells / 2017-08-25 13:48:00+00:00 / 2502',1,'[{\"added\": {}}]',8,1),(233,'2017-08-25 19:00:45.872516','189','SAUPP / Complexity / 2017-08-25 13:48:00+00:00 / 6875',1,'[{\"added\": {}}]',8,1),(234,'2017-08-25 19:00:57.910374','190','SAUPP / Duplicated Block / 2017-08-25 13:48:00+00:00 / 242',1,'[{\"added\": {}}]',8,1),(235,'2017-08-25 19:01:11.854451','191','SAUPP / Size / 2017-08-25 13:48:00+00:00 / 29917',1,'[{\"added\": {}}]',8,1),(236,'2017-08-25 19:01:25.916964','192','SAUPP / Vulnerabilities / 2017-08-25 13:48:00+00:00 / 40',1,'[{\"added\": {}}]',8,1),(237,'2017-08-25 23:28:23.790406','193','Timer / Bugs / 2017-08-25 12:08:00+00:00 / 181',1,'[{\"added\": {}}]',8,1),(238,'2017-08-25 23:28:35.701656','194','Timer / Code Smells / 2017-08-25 12:08:00+00:00 / 4532',1,'[{\"added\": {}}]',8,1),(239,'2017-08-25 23:28:50.343830','195','Timer / Complexity / 2017-08-25 12:08:00+00:00 / 16086',1,'[{\"added\": {}}]',8,1),(240,'2017-08-25 23:29:03.412891','196','Timer / Duplicated Block / 2017-08-25 12:08:00+00:00 / 733',1,'[{\"added\": {}}]',8,1),(241,'2017-08-25 23:29:16.198776','197','Timer / Size / 2017-08-25 12:08:00+00:00 / 83519',1,'[{\"added\": {}}]',8,1),(242,'2017-08-25 23:31:26.421576','198','Timer / Vulnerabilities / 2017-08-25 12:08:00+00:00 / 22',1,'[{\"added\": {}}]',8,1),(243,'2017-08-26 04:40:22.842830','199','Cotizador / Complexity / 2017-08-25 18:40:00+00:00 / 20445',1,'[{\"added\": {}}]',8,1),(244,'2017-08-26 04:40:52.574620','200','Cotizador / Bugs / 2017-08-25 18:40:00+00:00 / 687',1,'[{\"added\": {}}]',8,1),(245,'2017-08-26 04:41:11.508106','201','Cotizador / Code Smells / 2017-08-25 18:40:00+00:00 / 9337',1,'[{\"added\": {}}]',8,1),(246,'2017-08-26 04:41:32.723938','202','Cotizador / Duplicated Block / 2017-08-25 18:40:00+00:00 / 4760',1,'[{\"added\": {}}]',8,1),(247,'2017-08-26 04:41:51.082360','203','Cotizador / Size / 2017-08-25 18:40:00+00:00 / 104655',1,'[{\"added\": {}}]',8,1),(248,'2017-08-26 04:42:07.943476','204','Cotizador / Vulnerabilities / 2017-08-25 18:40:00+00:00 / 83',1,'[{\"added\": {}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'viewer','entry'),(9,'viewer','metric'),(7,'viewer','project');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-18 04:48:02.373417'),(2,'auth','0001_initial','2017-08-18 04:48:13.266666'),(3,'admin','0001_initial','2017-08-18 04:48:15.665208'),(4,'admin','0002_logentry_remove_auto_add','2017-08-18 04:48:15.710746'),(5,'contenttypes','0002_remove_content_type_name','2017-08-18 04:48:17.092238'),(6,'auth','0002_alter_permission_name_max_length','2017-08-18 04:48:17.935402'),(7,'auth','0003_alter_user_email_max_length','2017-08-18 04:48:19.323492'),(8,'auth','0004_alter_user_username_opts','2017-08-18 04:48:19.361510'),(9,'auth','0005_alter_user_last_login_null','2017-08-18 04:48:19.926888'),(10,'auth','0006_require_contenttypes_0002','2017-08-18 04:48:19.968423'),(11,'auth','0007_alter_validators_add_error_messages','2017-08-18 04:48:20.032656'),(12,'auth','0008_alter_user_username_max_length','2017-08-18 04:48:20.679644'),(13,'sessions','0001_initial','2017-08-18 04:48:21.246023'),(14,'viewer','0001_initial','2017-08-18 05:05:49.678865'),(15,'viewer','0002_project_priority','2017-08-20 07:39:55.324485');
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
INSERT INTO `django_session` VALUES ('0l9twch0h58wb03qf9zgcoa04g2cfhmp','ZTcxODA0NzIwZjI1NjNhMjUxNDhhZjYzZmQyMmRhNjU5OWM3ZTNhMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0YWRhOTU5OWEzZjNkYWI3NDViYTkxMTVkNjY2ZWExOWQ5ZjQyNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-04 15:46:04.505709'),('by8encv5sn7thaqww2k2x4g3qgyw3y45','MmIxMWVkZjVjNmUzYzY5ZWFiMTk2MGZmMjkyYzE3MGZkZWZiYmM4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNGFkYTk1OTlhM2YzZGFiNzQ1YmE5MTE1ZDY2NmVhMTlkOWY0MjY5In0=','2017-09-01 05:10:14.740096'),('fingow5ja94j7wsv9hma87mr31cxiw8r','ZTcxODA0NzIwZjI1NjNhMjUxNDhhZjYzZmQyMmRhNjU5OWM3ZTNhMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0YWRhOTU5OWEzZjNkYWI3NDViYTkxMTVkNjY2ZWExOWQ5ZjQyNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-09 04:38:29.651602'),('pz2f7eqy2njfa2lz26oe7dt56orzqjzg','ZTcxODA0NzIwZjI1NjNhMjUxNDhhZjYzZmQyMmRhNjU5OWM3ZTNhMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0YWRhOTU5OWEzZjNkYWI3NDViYTkxMTVkNjY2ZWExOWQ5ZjQyNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-08 15:13:58.345515');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewer_entry`
--

LOCK TABLES `viewer_entry` WRITE;
/*!40000 ALTER TABLE `viewer_entry` DISABLE KEYS */;
INSERT INTO `viewer_entry` VALUES (1,'2017-08-04 12:12:00.000000',152,2,1),(2,'2017-08-04 12:12:00.000000',6854,5,1),(3,'2017-08-04 12:12:00.000000',16712,7,1),(4,'2017-08-04 12:12:00.000000',859,6,1),(5,'2017-08-04 12:12:00.000000',107851,1,1),(6,'2017-08-04 12:12:00.000000',754,4,1),(7,'2017-08-04 12:24:00.000000',112,2,2),(8,'2017-08-04 12:24:00.000000',1994,5,2),(9,'2017-08-04 12:24:00.000000',6043,7,2),(10,'2017-08-04 12:24:00.000000',161,6,2),(11,'2017-08-04 12:24:00.000000',29735,1,2),(12,'2017-08-04 12:24:00.000000',143,4,2),(13,'2017-08-04 12:43:00.000000',197,2,3),(14,'2017-08-04 12:43:00.000000',1076,5,3),(15,'2017-08-04 12:43:00.000000',6407,7,3),(16,'2017-08-04 12:43:00.000000',133,6,3),(17,'2017-08-04 12:43:00.000000',29530,1,3),(18,'2017-08-04 12:43:00.000000',41,4,3),(19,'2017-08-04 12:27:00.000000',181,2,4),(20,'2017-08-04 12:27:00.000000',3955,5,4),(21,'2017-08-04 12:27:00.000000',13851,7,4),(22,'2017-08-04 12:27:00.000000',549,6,4),(23,'2017-08-04 12:27:00.000000',72287,1,4),(24,'2017-08-04 12:27:00.000000',329,4,4),(25,'2017-08-04 12:45:00.000000',856,2,5),(26,'2017-08-04 12:45:00.000000',16224,5,5),(27,'2017-08-04 12:45:00.000000',51836,7,5),(28,'2017-08-04 12:45:00.000000',4439,6,5),(29,'2017-08-04 12:45:00.000000',291813,1,5),(30,'2017-08-04 12:45:00.000000',1037,4,5),(31,'2017-08-04 13:00:00.000000',181,2,6),(32,'2017-08-04 13:00:00.000000',4852,5,6),(33,'2017-08-04 13:00:00.000000',16126,7,6),(34,'2017-08-04 13:00:00.000000',787,6,6),(35,'2017-08-04 13:00:00.000000',83689,1,6),(36,'2017-08-04 13:00:00.000000',510,4,6),(37,'2017-08-04 12:51:00.000000',107,2,7),(38,'2017-08-04 12:51:00.000000',2017,5,7),(39,'2017-08-04 12:51:00.000000',8421,7,7),(40,'2017-08-04 12:51:00.000000',248,6,7),(41,'2017-08-04 12:51:00.000000',35991,1,7),(42,'2017-08-04 12:51:00.000000',56,4,7),(43,'2017-08-04 12:43:00.000000',97,2,8),(44,'2017-08-04 12:43:00.000000',2525,5,8),(45,'2017-08-04 12:43:00.000000',6875,7,8),(46,'2017-08-04 12:43:00.000000',239,6,8),(47,'2017-08-04 12:43:00.000000',30055,1,8),(48,'2017-08-04 12:43:00.000000',65,4,8),(49,'2017-08-04 17:22:00.000000',342,2,9),(50,'2017-08-04 17:22:00.000000',7378,5,9),(51,'2017-08-04 17:22:00.000000',18328,7,9),(52,'2017-08-04 17:22:00.000000',1437,6,9),(53,'2017-08-04 17:22:00.000000',99931,1,9),(54,'2017-08-04 17:22:00.000000',296,4,9),(55,'2017-08-04 13:33:00.000000',379,2,10),(56,'2017-08-04 13:33:00.000000',1983,5,10),(57,'2017-08-04 13:33:00.000000',8430,7,10),(58,'2017-08-04 13:33:00.000000',204,6,10),(59,'2017-08-04 13:33:00.000000',28622,1,10),(60,'2017-08-04 13:33:00.000000',2,4,10),(61,'2017-08-08 14:25:00.000000',71,2,11),(62,'2017-08-08 14:25:00.000000',3292,5,11),(63,'2017-08-08 14:25:00.000000',1065,7,11),(64,'2017-08-08 14:25:00.000000',21,6,11),(65,'2017-08-08 14:25:00.000000',7839,1,11),(66,'2017-08-08 14:25:00.000000',3,4,11),(67,'2017-08-11 09:25:00.000000',693,2,12),(68,'2017-08-11 09:25:00.000000',9426,5,12),(69,'2017-08-11 09:25:00.000000',20440,7,12),(70,'2017-08-11 09:25:00.000000',4752,6,12),(71,'2017-08-11 09:25:00.000000',104636,1,12),(72,'2017-08-11 09:25:00.000000',141,4,12),(73,'2017-08-11 10:07:00.000000',132,2,13),(74,'2017-08-11 10:07:00.000000',2421,5,13),(75,'2017-08-11 10:07:00.000000',6925,7,13),(76,'2017-08-11 10:07:00.000000',226,6,13),(77,'2017-08-11 10:07:00.000000',47507,1,13),(78,'2017-08-11 10:07:00.000000',37,4,13),(79,'2017-08-11 09:38:00.000000',110,2,14),(80,'2017-08-11 09:38:00.000000',5236,5,14),(81,'2017-08-11 09:38:00.000000',10795,7,14),(82,'2017-08-11 09:38:00.000000',723,6,14),(83,'2017-08-11 09:38:00.000000',71678,1,14),(84,'2017-08-11 09:38:00.000000',157,4,14),(85,'2017-08-11 09:52:00.000000',335,2,15),(86,'2017-08-11 09:52:00.000000',6500,5,15),(87,'2017-08-11 09:52:00.000000',16712,7,15),(88,'2017-08-11 09:52:00.000000',1419,6,15),(89,'2017-08-11 09:52:00.000000',114455,1,15),(90,'2017-08-11 09:52:00.000000',184,4,15),(91,'2017-08-11 10:01:00.000000',402,2,16),(92,'2017-08-11 10:01:00.000000',1389,5,16),(93,'2017-08-11 10:01:00.000000',7207,7,16),(94,'2017-08-11 10:01:00.000000',117,6,16),(95,'2017-08-11 10:01:00.000000',22614,1,16),(96,'2017-08-11 10:01:00.000000',114,4,16),(97,'2017-08-16 14:43:00.000000',851,2,5),(98,'2017-08-16 14:43:00.000000',15745,5,5),(99,'2017-08-16 14:43:00.000000',51784,7,5),(100,'2017-08-16 14:43:00.000000',4640,6,5),(101,'2017-08-16 14:43:00.000000',292020,1,5),(102,'2017-08-16 14:43:00.000000',542,4,5),(103,'2017-08-18 11:53:00.000000',113,2,2),(104,'2017-08-18 11:53:00.000000',1796,5,2),(105,'2017-08-18 11:53:00.000000',6302,7,2),(106,'2017-08-18 11:53:00.000000',102,6,2),(107,'2017-08-18 11:53:00.000000',31931,1,2),(108,'2017-08-18 11:53:00.000000',0,4,2),(109,'2017-08-17 17:02:00.000000',155,2,1),(110,'2017-08-17 17:02:00.000000',6526,5,1),(111,'2017-08-17 17:02:00.000000',16714,7,1),(112,'2017-08-17 17:02:00.000000',804,6,1),(113,'2017-08-17 17:02:00.000000',96985,1,1),(114,'2017-08-17 17:02:00.000000',532,4,1),(115,'2017-08-18 11:13:00.000000',375,2,10),(116,'2017-08-18 11:13:00.000000',1980,5,10),(117,'2017-08-18 11:13:00.000000',8466,7,10),(118,'2017-08-18 11:13:00.000000',202,6,10),(119,'2017-08-18 11:13:00.000000',28746,1,10),(120,'2017-08-18 11:13:00.000000',0,4,10),(121,'2017-08-18 10:48:00.000000',901,2,9),(122,'2017-08-18 10:48:00.000000',7889,5,9),(123,'2017-08-18 10:48:00.000000',25223,7,9),(124,'2017-08-18 10:48:00.000000',1438,6,9),(125,'2017-08-18 10:48:00.000000',99904,1,9),(126,'2017-08-18 10:48:00.000000',239,4,9),(127,'2017-08-18 13:35:00.000000',181,2,6),(128,'2017-08-18 13:35:00.000000',4775,5,6),(129,'2017-08-18 13:35:00.000000',16086,7,6),(130,'2017-08-18 13:35:00.000000',708,6,6),(131,'2017-08-18 13:35:00.000000',83262,1,6),(132,'2017-08-18 13:35:00.000000',353,4,6),(133,'2017-08-18 14:50:00.000000',687,2,12),(134,'2017-08-18 14:50:00.000000',9361,5,12),(135,'2017-08-18 14:50:00.000000',20445,7,12),(136,'2017-08-18 14:50:00.000000',4760,6,12),(137,'2017-08-18 14:50:00.000000',104629,1,12),(138,'2017-08-18 14:50:00.000000',95,4,12),(139,'2017-08-18 15:35:00.000000',844,2,5),(140,'2017-08-18 15:35:00.000000',15091,5,5),(141,'2017-08-18 15:35:00.000000',51545,7,5),(142,'2017-08-18 15:35:00.000000',4508,6,5),(143,'2017-08-18 15:35:00.000000',264286,1,5),(144,'2017-08-18 15:35:00.000000',474,4,5),(145,'2017-08-24 17:19:00.000000',899,2,9),(146,'2017-08-24 17:19:00.000000',7658,5,9),(147,'2017-08-24 17:19:00.000000',25233,7,9),(148,'2017-08-24 17:19:00.000000',1461,6,9),(149,'2017-08-24 17:19:00.000000',99996,1,9),(150,'2017-08-24 17:19:00.000000',181,4,9),(151,'2017-08-24 17:47:00.000000',5,2,11),(152,'2017-08-24 17:47:00.000000',12,5,11),(153,'2017-08-24 17:47:00.000000',1032,7,11),(154,'2017-08-24 17:47:00.000000',9,6,11),(155,'2017-08-24 17:47:00.000000',7600,1,11),(156,'2017-08-24 17:47:00.000000',0,4,11),(157,'2017-08-25 08:29:00.000000',851,2,5),(158,'2017-08-25 08:29:00.000000',15433,5,5),(159,'2017-08-25 08:29:00.000000',51780,7,5),(160,'2017-08-25 08:29:00.000000',4688,6,5),(161,'2017-08-25 08:29:00.000000',292221,1,5),(162,'2017-08-25 08:29:00.000000',339,4,5),(163,'2017-08-24 17:13:00.000000',370,2,10),(164,'2017-08-24 17:13:00.000000',1004,5,10),(165,'2017-08-24 17:13:00.000000',6535,7,10),(166,'2017-08-24 17:13:00.000000',50,6,10),(167,'2017-08-24 17:13:00.000000',17207,1,10),(168,'2017-08-24 17:13:00.000000',0,4,10),(169,'2017-08-25 09:20:00.000000',154,2,1),(170,'2017-08-25 09:20:00.000000',5997,5,1),(171,'2017-08-25 09:20:00.000000',16671,7,1),(172,'2017-08-25 09:20:00.000000',805,6,1),(173,'2017-08-25 09:20:00.000000',97014,1,1),(174,'2017-08-25 09:20:00.000000',56,4,1),(175,'2017-08-25 09:28:00.000000',113,2,2),(176,'2017-08-25 09:28:00.000000',1796,5,2),(177,'2017-08-25 09:28:00.000000',6302,7,2),(178,'2017-08-25 09:28:00.000000',102,6,2),(179,'2017-08-25 09:28:00.000000',31931,1,2),(180,'2017-08-25 09:28:00.000000',0,4,2),(181,'2017-08-23 16:30:00.000000',106,2,7),(182,'2017-08-23 16:30:00.000000',2016,5,7),(183,'2017-08-23 16:30:00.000000',8409,7,7),(184,'2017-08-23 16:30:00.000000',242,6,7),(185,'2017-08-23 16:30:00.000000',35970,1,7),(186,'2017-08-23 16:30:00.000000',0,4,7),(187,'2017-08-25 13:48:00.000000',97,2,8),(188,'2017-08-25 13:48:00.000000',2502,5,8),(189,'2017-08-25 13:48:00.000000',6875,7,8),(190,'2017-08-25 13:48:00.000000',242,6,8),(191,'2017-08-25 13:48:00.000000',29917,1,8),(192,'2017-08-25 13:48:00.000000',40,4,8),(193,'2017-08-25 12:08:00.000000',181,2,6),(194,'2017-08-25 12:08:00.000000',4532,5,6),(195,'2017-08-25 12:08:00.000000',16086,7,6),(196,'2017-08-25 12:08:00.000000',733,6,6),(197,'2017-08-25 12:08:00.000000',83519,1,6),(198,'2017-08-25 12:08:00.000000',22,4,6),(199,'2017-08-25 18:40:00.000000',20445,7,12),(200,'2017-08-25 18:40:00.000000',687,2,12),(201,'2017-08-25 18:40:00.000000',9337,5,12),(202,'2017-08-25 18:40:00.000000',4760,6,12),(203,'2017-08-25 18:40:00.000000',104655,1,12),(204,'2017-08-25 18:40:00.000000',83,4,12);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-28  9:58:53
