-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: new_receibtdb
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customerstbl`
--

DROP TABLE IF EXISTS `customerstbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerstbl` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `customerdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phonenumber` char(14) NOT NULL,
  `mailingaddress` varchar(100) NOT NULL,
  `shippingaddress` varchar(100) NOT NULL,
  `loyaltynum` char(8) NOT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerstbl`
--

LOCK TABLES `customerstbl` WRITE;
/*!40000 ALTER TABLE `customerstbl` DISABLE KEYS */;
INSERT INTO `customerstbl` VALUES (1,'Larry','Logan','larry@gci.net','2018-05-18 00:00:00','','','',''),(2,'Mary','Morgan','mary@cvt.com','2018-04-13 00:00:00','','','',''),(3,'Nancy','Nordquist','nancy@att.net','2018-02-12 00:00:00','','','','');
/*!40000 ALTER TABLE `customerstbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstbl`
--

DROP TABLE IF EXISTS `productstbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productstbl` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `sku` char(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `model` varchar(45) NOT NULL,
  `listprice` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  UNIQUE KEY `sku_UNIQUE` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstbl`
--

LOCK TABLES `productstbl` WRITE;
/*!40000 ALTER TABLE `productstbl` DISABLE KEYS */;
INSERT INTO `productstbl` VALUES (1,'57489-62541','3-Person Tent','coleman','XR-32',129.99),(2,'54125-35987','Butane Cookstove','Happy Trails','BI-24',149.95),(3,'72514-36748','12x18 Tarp','Happy Trails','69tarp',24.95),(4,'37584-91235','Fire Starting Kit','Coleman','2502',19.95),(5,'46585-66557','Waterproofing Spray','Redwing','Spray45',9.95);
/*!40000 ALTER TABLE `productstbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiptstbl`
--

DROP TABLE IF EXISTS `receiptstbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receiptstbl` (
  `receiptid` int(11) NOT NULL,
  `customerfk` int(11) NOT NULL,
  `salesperson` int(11) NOT NULL,
  `receiptdate` date NOT NULL,
  `employeefk` int(11) DEFAULT NULL,
  PRIMARY KEY (`receiptid`),
  KEY `customerfk` (`customerfk`),
  KEY `employeefk` (`employeefk`),
  CONSTRAINT `receiptscustomerfk` FOREIGN KEY (`customerfk`) REFERENCES `customerstbl` (`customerid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiptsemployeefk` FOREIGN KEY (`employeefk`) REFERENCES `salespersonstbl` (`employeeid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiptstbl`
--

LOCK TABLES `receiptstbl` WRITE;
/*!40000 ALTER TABLE `receiptstbl` DISABLE KEYS */;
INSERT INTO `receiptstbl` VALUES (1,1,14,'2018-04-12',NULL),(2,3,11,'2018-04-12',NULL),(3,1,11,'2018-04-12',NULL),(4,2,12,'2018-04-12',NULL),(5,3,14,'2018-04-13',NULL),(6,2,14,'2018-04-13',NULL),(7,2,11,'2018-04-13',NULL),(8,1,12,'2018-04-13',NULL),(9,1,13,'2018-04-13',NULL),(10,3,13,'2018-04-14',NULL);
/*!40000 ALTER TABLE `receiptstbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salespersonstbl`
--

DROP TABLE IF EXISTS `salespersonstbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salespersonstbl` (
  `employeeid` int(11) NOT NULL AUTO_INCREMENT,
  `employeenum` char(8) NOT NULL,
  `empfirstname` varchar(45) NOT NULL,
  `emplastname` varchar(45) NOT NULL,
  `department` varchar(15) NOT NULL,
  `startdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enddate` date NOT NULL,
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salespersonstbl`
--

LOCK TABLES `salespersonstbl` WRITE;
/*!40000 ALTER TABLE `salespersonstbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `salespersonstbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salestbl`
--

DROP TABLE IF EXISTS `salestbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salestbl` (
  `saleid` int(11) NOT NULL AUTO_INCREMENT,
  `receiptfk` int(11) NOT NULL,
  `productfk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sellingprice` decimal(8,2) NOT NULL,
  PRIMARY KEY (`saleid`),
  KEY `salesreceiptfk_idx` (`receiptfk`),
  KEY `productreceiptfk_idx` (`productfk`),
  CONSTRAINT `productreceiptfk` FOREIGN KEY (`productfk`) REFERENCES `productstbl` (`productid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesreceiptfk` FOREIGN KEY (`receiptfk`) REFERENCES `receiptstbl` (`receiptid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salestbl`
--

LOCK TABLES `salestbl` WRITE;
/*!40000 ALTER TABLE `salestbl` DISABLE KEYS */;
INSERT INTO `salestbl` VALUES (1,1,2,2,149.95),(2,2,1,1,129.95),(3,7,5,1,9.95),(4,1,4,3,19.95),(5,4,2,1,130.00),(6,9,3,2,24.95),(7,3,1,4,129.95),(8,4,5,1,19.95),(9,3,4,2,19.95),(10,2,3,1,24.95),(11,6,1,3,129.95),(12,3,2,2,145.00),(13,4,1,2,129.95),(14,7,2,1,129.95),(15,8,4,1,19.95),(16,7,3,1,24.95),(17,6,5,2,9.95),(18,5,4,3,15.00),(19,10,2,4,149.95),(20,5,2,1,149.95);
/*!40000 ALTER TABLE `salestbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-19 19:41:54
