CREATE DATABASE  IF NOT EXISTS `appointments` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `appointments`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: appointments
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tasks` text,
  `time` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointments_users_idx` (`user_id`),
  CONSTRAINT `fk_appointments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,'first','01:00','pending','2016-03-29','2016-03-25 17:46:27','2016-03-25 17:46:27',1),(2,'kmdkdgdf','12:59',NULL,'2016-03-01','2016-03-25 17:48:21','2016-03-25 17:48:21',1),(3,'dasdasdas','01:00',NULL,'2016-03-29','2016-03-25 18:12:45','2016-03-25 18:12:45',1),(4,'THIS IS FIVE','01:44','pending','2016-05-01','2016-03-25 18:18:36','2016-03-25 19:33:40',1),(5,'12safsdfasdfas','01:00','Pending','2016-03-25','2016-03-25 18:53:19','2016-03-25 21:06:43',1),(6,'HEY','01:02','Missed','2016-03-29','2016-03-25 18:54:03','2016-03-25 19:51:35',1),(7,'','','Missed','','2016-03-25 19:52:26','2016-03-25 19:52:37',1),(8,'Appointment 1','04:01',NULL,'2016-03-28','2016-03-25 20:59:30','2016-03-25 20:59:30',2),(9,'WHAT?','13:02','pending','2016-03-25','2016-03-25 20:59:42','2016-03-25 21:02:58',2),(10,'WHY?','01:00',NULL,'2016-03-31','2016-03-25 21:11:32','2016-03-25 21:11:32',2),(11,'HOW?','02:01',NULL,'2016-03-16','2016-03-25 21:11:46','2016-03-25 21:11:46',2),(12,'TONIGHT','23:00',NULL,'2016-03-25','2016-03-25 21:12:17','2016-03-25 21:12:17',2),(13,'sadfassdfas','02:03','Missed','2016-03-25','2016-03-25 21:16:13','2016-03-25 21:16:21',1),(14,'WHAT??','02:02','Pending','2016-03-30','2016-03-25 21:24:41','2016-03-25 21:24:41',3),(15,'fine','14:01','Pending','2016-03-31','2016-03-25 21:25:52','2016-03-25 21:25:52',3),(16,'whats fskdfla;sd safs','','Pending','','2016-03-25 21:25:58','2016-03-25 21:25:58',3),(17,'sdfasdklfjaskldfjakldsfj  sf as dfa sd fa sdf ','02:01','Pending','2016-03-31','2016-03-25 21:26:49','2016-03-25 21:26:49',3),(18,'PENDING!!','00:01','Pending','2016-03-25','2016-03-25 21:27:22','2016-03-25 21:52:34',3),(20,'','','Pending','2016-03-26','2016-03-25 21:42:26','2016-03-25 21:42:26',3),(22,'WHAT','01:01','Pending','2016-03-31','2016-03-25 21:54:26','2016-03-25 21:54:26',3),(23,'Testing today 23','01:01','Missed','2016-03-25','2016-03-25 22:20:47','2016-03-25 22:21:30',4),(24,'2am? end of the month!','02:00','Pending','2016-03-31','2016-03-25 22:21:03','2016-03-25 22:21:03',4),(26,'noon','12:01','Missed','2016-03-25','2016-03-25 22:34:42','2016-03-25 22:34:48',5),(27,'Night','22:07','Done','2016-03-30','2016-03-25 22:35:03','2016-03-25 22:35:10',5),(28,'WHAT','04:00','Pending','2016-03-25','2016-03-25 22:35:38','2016-03-25 22:35:38',5),(29,'GOSH','01:01','Done','2016-04-25','2016-03-25 22:39:10','2016-03-25 22:39:19',6);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
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
  `password` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cory','coryjin@gmail.com','$2b$12$lTr5FpNfP1ssa0rHE.iiTOtc33VirblkTKLXPP0OAukiYt5V7e9Ai','1988-10-29','2016-03-25 17:23:46','2016-03-25 17:23:46'),(2,'Christina','christina@gmail.com','$2b$12$1ySiW1Bn6wQfrLE.4oziHu.qxTHFoFQmCRlXgLNrCsl38CvaVPRuW','1986-01-11','2016-03-25 20:47:14','2016-03-25 20:47:14'),(3,'Kaitlin','kaitlin@gmail.com','$2b$12$xsxyRaTxX0SVyCY1VrGT2O115wxOBoQZMYvhfvuHRY.KyhRPhDqye','1990-05-03','2016-03-25 21:23:41','2016-03-25 21:23:41'),(4,'Christine','christine@gmail.com','$2b$12$rjcjGglR4OYrq4f9GE1/heuo8hYEJFryLOa.Fq2XRQO1k78hDfQq.','1988-09-26','2016-03-25 22:20:35','2016-03-25 22:20:35'),(5,'Final','final@final.com','$2b$12$BErIumGVn4NhOeBYIEpxU.e6ZJS3FRhrgdvCyhWG97l2oAkNSgAQK','2016-03-26','2016-03-25 22:34:26','2016-03-25 22:34:26'),(6,'Rachel','rachel@gmail.com','$2b$12$EszHnK.rRP/.Y36pL0Oq3uU8hyZ5ETC4MCpjAbyY5nvFFk0o8zRl6','1988-03-07','2016-03-25 22:38:55','2016-03-25 22:38:55');
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

-- Dump completed on 2016-03-25 22:42:35
