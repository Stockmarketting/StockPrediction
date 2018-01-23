-- MySQL dump 10.16  Distrib 10.1.28-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: crime
-- ------------------------------------------------------
-- Server version	10.1.28-MariaDB

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
-- Table structure for table `charge_sheet`
--

DROP TABLE IF EXISTS `charge_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_sheet` (
  `chrgshtNo` int(11) NOT NULL,
  `firNo` int(11) DEFAULT NULL,
  `witnessName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`chrgshtNo`),
  KEY `firNo` (`firNo`),
  CONSTRAINT `charge_sheet_ibfk_1` FOREIGN KEY (`firNo`) REFERENCES `fir` (`firNo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_sheet`
--

LOCK TABLES `charge_sheet` WRITE;
/*!40000 ALTER TABLE `charge_sheet` DISABLE KEYS */;
INSERT INTO `charge_sheet` VALUES (200,111,'Asha'),(201,112,'Adarsh'),(202,113,'Suhas'),(203,114,'Mary'),(204,115,'Rohan'),(205,116,'Namana'),(206,117,'Supriya'),(207,118,'Arpitha'),(208,119,'Sakshi'),(209,120,'Pooja');
/*!40000 ALTER TABLE `charge_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_reg`
--

DROP TABLE IF EXISTS `complaint_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_reg` (
  `compNo` int(11) NOT NULL,
  `cdate` date DEFAULT NULL,
  `crimeType` varchar(50) DEFAULT NULL,
  `complainerName` varchar(20) DEFAULT NULL,
  `suspect_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`compNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_reg`
--

LOCK TABLES `complaint_reg` WRITE;
/*!40000 ALTER TABLE `complaint_reg` DISABLE KEYS */;
INSERT INTO `complaint_reg` VALUES (100,'2017-10-10','chain snatch','Laxmi','Raju'),(101,'2017-05-01','murder','Adhiti','Antony'),(102,'2015-01-02','harrazment','Pratheeksha','Rakesh'),(103,'2013-05-10','murder','Deeksha','Kishore'),(104,'2017-10-06','Drug dealing','Sharanya','Swarup'),(105,'2016-10-08','Chain snatching','Swathi','Sharath'),(106,'2015-11-12','Murder','Pallavi','Aditya'),(107,'2011-10-12','Murder','Naveen','Charan'),(108,'2010-10-06','Murder','Nayana','Nisha'),(109,'2017-10-12','bank robbery','Narayan','Mahesh');
/*!40000 ALTER TABLE `complaint_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crime_report`
--

DROP TABLE IF EXISTS `crime_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crime_report` (
  `crimeNo` int(11) NOT NULL,
  `informant_name` varchar(50) DEFAULT NULL,
  `suspect_name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`crimeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime_report`
--

LOCK TABLES `crime_report` WRITE;
/*!40000 ALTER TABLE `crime_report` DISABLE KEYS */;
INSERT INTO `crime_report` VALUES (1,'Laxmi','Raju','Chain snatch in the vinayaka temple','2017-10-10'),(2,'Noothan','Sudheer','kidnapping a child','2017-11-02'),(3,'Ranjan','Sanyuktha','Attempt to murder','2017-10-03'),(4,'Karna','Joseph','Drugs dealing ','2017-09-08'),(5,'Saketh','Suman','Murder','2016-02-01'),(6,'Shashi','Sushma','Murder','2015-05-09'),(7,'Rekha','Shashank','kidnap','2014-01-10'),(8,'Sharmin','Shamshuddhin','murder','2013-10-10'),(9,'Akshatha','Sameer','chain snatch','2017-10-03'),(10,'Ramesh','Suresh','murder','2015-05-06');
/*!40000 ALTER TABLE `crime_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fir`
--

DROP TABLE IF EXISTS `fir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fir` (
  `firNo` int(11) NOT NULL,
  `compNo` int(11) DEFAULT NULL,
  `firDate` date DEFAULT NULL,
  `RcvTime` varchar(20) DEFAULT NULL,
  `crimeType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`firNo`),
  KEY `compNo` (`compNo`),
  CONSTRAINT `fir_ibfk_1` FOREIGN KEY (`compNo`) REFERENCES `complaint_reg` (`compNo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fir`
--

LOCK TABLES `fir` WRITE;
/*!40000 ALTER TABLE `fir` DISABLE KEYS */;
INSERT INTO `fir` VALUES (111,101,'2017-05-03','5.00PM','murder'),(112,100,'2017-10-12','10.30AM','chain snatch'),(113,102,'2015-01-03','9.00AM','harrazment'),(114,104,'2017-10-08','3.30PM','Drug dealing'),(115,106,'2017-11-12','2.00PM','murder'),(116,108,'2010-10-07','4.00PM','murder'),(117,109,'2017-10-13','4.30PM','bank robbery'),(118,107,'2011-10-14','8.30AM','murder'),(119,105,'2016-10-08','3.00PM','chain snatch'),(120,103,'2016-05-11','3.00PM','chain snatch');
/*!40000 ALTER TABLE `fir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_sheet`
--

DROP TABLE IF EXISTS `history_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_sheet` (
  `crimeNo` int(11) NOT NULL,
  `prisonerName` varchar(20) DEFAULT NULL,
  `crimeType` varchar(50) DEFAULT NULL,
  `date_of_occ` date DEFAULT NULL,
  `place_of_occ` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`crimeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_sheet`
--

LOCK TABLES `history_sheet` WRITE;
/*!40000 ALTER TABLE `history_sheet` DISABLE KEYS */;
INSERT INTO `history_sheet` VALUES (1,'Raju','chain snatch','2017-10-10','vinayaka temple'),(2,'Sudheer','Kidnap','2017-11-01','Udupi'),(3,'Sanyuktha','Attempt to murder','2017-10-03','Manipal'),(4,'Joseph','Drugs dealing','2017-09-08','Manglore'),(5,'Suman','Murder','2016-02-01','Kaup'),(6,'Sushma','Murder','2015-05-09','Banglore'),(7,'Shashank','kidnap','2014-01-10','Ujire'),(8,'Shamshuddhin','murder','2013-10-10','Manglore'),(9,'Sameer','chain snatch','2017-10-03','Kundapur'),(10,'Suresh','murder','2015-05-06','Kundapur');
/*!40000 ALTER TABLE `history_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('pavi','1234'),('paggu','123'),('paggu','123'),('pavi','1234'),('SWARUP','1235'),('poorvig','poo123'),('poorv','pp123');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prisoner_reg`
--

DROP TABLE IF EXISTS `prisoner_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prisoner_reg` (
  `prisonerNo` int(11) NOT NULL,
  `chrgshtNo` int(11) DEFAULT NULL,
  `prisonerName` varchar(20) DEFAULT NULL,
  `crimeType` varchar(50) DEFAULT NULL,
  `idMark` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`prisonerNo`),
  KEY `chrgshtNo` (`chrgshtNo`),
  CONSTRAINT `prisoner_reg_ibfk_1` FOREIGN KEY (`chrgshtNo`) REFERENCES `charge_sheet` (`chrgshtNo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prisoner_reg`
--

LOCK TABLES `prisoner_reg` WRITE;
/*!40000 ALTER TABLE `prisoner_reg` DISABLE KEYS */;
INSERT INTO `prisoner_reg` VALUES (1001,201,'Raju','chain snatch','moleon left palm','male'),(1002,202,'Sudheer','Kidnap','mole on right palm','male'),(1003,203,'Sanyuktha','attempt to  murder','blue eyes','female'),(1004,204,'Joseph','Drugs dealing','mole on nose','male'),(1005,205,'Suman','murder','brown eyes','male'),(1006,206,'Sushma','murder','mole on left cheek','female'),(1007,207,'Shashank','kidnap','6.3 ft tall','male'),(1008,208,'Shamshuddhin','murder','6 fingered hand','male'),(1009,209,'Sameer','chain snatch','mole on right arm','male');
/*!40000 ALTER TABLE `prisoner_reg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-24 10:37:43
