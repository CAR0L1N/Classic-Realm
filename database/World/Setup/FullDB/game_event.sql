-- MySQL dump 10.13  Distrib 5.5.37, for Win32 (x86)
--
-- Host: 192.168.178.55    Database: classic_world
-- ------------------------------------------------------
-- Server version	5.7.43-log

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
-- Table structure for table `game_event`
--

DROP TABLE IF EXISTS `game_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event` (
  `entry` mediumint(8) unsigned NOT NULL COMMENT 'ID of the event.',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Global starting date for the event.',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Global ending date of the event.',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '86400' COMMENT 'Event periodicity (minutes).',
  `length` bigint(20) unsigned NOT NULL DEFAULT '43200' COMMENT 'Event duration (minutes).',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Holiday ID.',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event.',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_event`
--

LOCK TABLES `game_event` WRITE;
/*!40000 ALTER TABLE `game_event` DISABLE KEYS */;
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`) VALUES (1,'2023-06-20 19:00:00','2037-12-31 21:59:59',525600,20160,341,'Midsummer Fire Festival'),(2,'2023-12-14 22:00:00','2037-12-31 21:59:59',525600,27360,141,'Feast of Winter Veil'),(3,'2023-02-08 20:00:00','2037-12-31 03:59:59',1440,480,0,'Pyrewood Village - Worgen Curse'),(4,'2023-02-08 22:00:00','2037-12-31 21:59:59',96480,10080,374,'Darkmoon Faire (Elwynn)'),(5,'2023-01-07 22:00:00','2037-12-31 21:59:59',96480,10080,374,'Darkmoon Faire (Mulgore)'),(6,'2023-02-26 23:00:00','2037-12-31 21:59:59',525600,1440,0,'New Year\'s Eve'),(7,'2023-01-21 05:00:00','2037-02-04 04:59:59',525600,28800,327,'Lunar Festival'),(8,'2023-02-10 21:00:00','2037-12-31 21:59:59',525600,5760,335,'Love is in the Air'),(9,'2023-04-16 19:00:00','2037-12-31 21:59:59',524160,7200,181,'Noblegarden'),(10,'2023-05-01 19:00:00','2037-12-31 21:59:59',525600,11520,201,'Children\'s Week '),(12,'2023-10-18 19:00:00','2037-12-31 21:59:59',525600,21600,324,'Hallow\'s End'),(13,'0000-00-00 00:00:00','2020-12-31 22:59:59',525600,1,0,'Elemental Invasions'),(14,'2023-01-02 04:00:00','2037-12-31 21:59:59',10080,240,0,'Fishing Extravaganza Announce'),(15,'2023-01-01 10:00:00','2037-12-31 21:59:59',10080,120,301,'Fishing Extravaganza'),(16,'2023-12-31 22:00:00','2037-12-31 21:59:59',180,120,0,'Gurubashi Arena Booty Run'),(17,'0000-00-00 00:00:00','0000-00-00 00:00:00',525600,1,0,'Scourge Invasion'),(18,'2023-01-19 22:00:00','2037-12-31 21:59:59',40320,6240,283,'Call to Arms: Alterac Valley!'),(19,'2023-01-26 22:00:00','2037-12-31 21:59:59',40320,6240,284,'Call to Arms: Warsong Gulch!'),(20,'2023-01-05 22:00:00','2037-12-31 21:59:59',40320,6240,285,'Call to Arms: Arathi Basin!'),(21,'2023-12-25 15:00:00','2037-12-31 15:00:00',525600,11700,0,'Winter Veil: Gifts'),(22,'0000-00-00 00:00:00','0000-00-00 00:00:00',525600,1,0,'AQ War Effort'),(23,'2023-02-05 22:00:00','2037-12-31 21:59:59',131040,4320,374,'Darkmoon Faire Building (Elwynn)'),(24,'2023-10-18 18:01:07','2037-12-31 21:59:59',1440,600,0,'Hallow\'s End - Wickerman Ember\'s'),(25,'2023-10-18 17:30:00','2037-12-31 21:59:59',1440,45,0,'Hallow\'s End - Banshee Queen'),(27,'2023-01-01 18:00:00','2037-12-31 21:59:59',1440,720,0,'Nights'),(29,'2023-01-23 22:00:00','2037-12-31 21:59:59',86400,21600,0,'Edge of Madness, Gri\'lek'),(30,'2023-01-06 22:00:00','2037-12-31 21:59:59',86400,21600,0,'Edge of Madness, Hazza\'rah'),(31,'2023-01-20 22:00:00','2037-12-31 21:59:59',86400,21600,0,'Edge of Madness, Renataki'),(32,'2023-01-04 22:00:00','2037-12-31 21:59:59',86400,21600,0,'Edge of Madness, Wushoolay'),(33,'2023-10-05 21:00:00','2037-10-05 21:00:00',525600,10080,321,'Harvest Festival'),(34,'2023-01-01 05:00:00','2037-12-31 16:59:59',10080,180,0,'Fishing Extravaganza Turn-in'),(35,'2023-09-23 00:00:00','2037-12-30 22:00:00',525600,256320,0,'Winter Season Fishing'),(36,'2023-03-21 00:00:00','2037-12-30 22:00:00',525600,269280,0,'Summer Season Fishing'),(61,'2023-12-31 22:58:00','2037-12-30 22:00:00',30,10,0,'Stormwind City - Stockades Jail Break');
/*!40000 ALTER TABLE `game_event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-11  9:08:44
