-- MariaDB dump 10.19  Distrib 10.5.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	10.5.13-MariaDB-0ubuntu0.21.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account-number` int(11) NOT NULL AUTO_INCREMENT,
  `branch-name` varchar(250) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`account-number`),
  KEY `fk_branchNameAcc` (`branch-name`),
  CONSTRAINT `fk_branchNameAcc` FOREIGN KEY (`branch-name`) REFERENCES `branch` (`branch-name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (10,'Pasir Kaliki',250),(11,'Leuwigajah',100),(12,'chelyabinsk',900),(13,'NY',1000),(14,'NY',600),(15,'NY',100),(16,'Leuwigajah',600),(17,'Pasir Kaliki',1000),(18,'Pasir Kaliki',5000),(19,'NY',18000),(20,'NY',20000),(21,'chelyabinsk',20000),(22,'Greater Jakarta',10000);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower` (
  `customer-name` varchar(250) DEFAULT NULL,
  `loan-number` int(11) DEFAULT NULL,
  KEY `fk_borrowerCustomerName` (`customer-name`),
  KEY `fk_borrowerLoanNumberr` (`loan-number`),
  CONSTRAINT `fk_borrowerCustomerName` FOREIGN KEY (`customer-name`) REFERENCES `customer` (`customer-name`),
  CONSTRAINT `fk_borrowerLoanNumberr` FOREIGN KEY (`loan-number`) REFERENCES `loan` (`loan-number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES ('Ajat Sudrajat',13),('Bob',6),('Alice',5),('John',4),('Udin Saepudin',12);
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `branch-name` varchar(250) NOT NULL,
  `branch-city` varchar(250) DEFAULT NULL,
  `assets` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`branch-name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('Amandes','Brooklyn',5000000),('Anzio','Brooklyn',2500000),('chelyabinsk','chelyabinsk',1500000),('Ciacia','Brooklyn',4000000),('Dea','Brooklyn',10000000),('Dustira','Cimahi',10000000),('Greater Jakarta','Jakarta',9000000),('ITB','Bandung',10000000),('Lembang','Bandung',500000),('Leuwigajah','Cimahi',2500000),('Monaro','Brooklyn',3000000),('NY','New York',10000000),('Pasir Kaliki','Bandung',250000),('Pesantren','Cimahi',300000),('South NY','New York',9000000);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer-name` varchar(250) NOT NULL,
  `customer-street` text DEFAULT NULL,
  `customer-city` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`customer-name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Ajat Sudrajat','3, Jl. ABC','Bandung'),('Alice','12, Gatau Rd.','New York'),('Bayu Samudra','9, Jl. Setia Bakti','Cimahi'),('Bob','19, Heaver Rd.','New York'),('John','11, Gatau Rd.','New York'),('Udin Saepudin','11, Jl. Merdeka','Bandung'),('Ujang Supratman','10, Jl. Sudirman','Bandung');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositor`
--

DROP TABLE IF EXISTS `depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositor` (
  `customer-name` varchar(250) DEFAULT NULL,
  `account-number` int(11) DEFAULT NULL,
  KEY `fk_depositorCustomerName` (`customer-name`),
  KEY `fk_accountNumber` (`account-number`),
  CONSTRAINT `fk_accountNumber` FOREIGN KEY (`account-number`) REFERENCES `account` (`account-number`),
  CONSTRAINT `fk_depositorCustomerName` FOREIGN KEY (`customer-name`) REFERENCES `customer` (`customer-name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositor`
--

LOCK TABLES `depositor` WRITE;
/*!40000 ALTER TABLE `depositor` DISABLE KEYS */;
INSERT INTO `depositor` VALUES ('Ajat Sudrajat',22),('Bob',19),('Bayu Samudra',18),('Bayu Samudra',16),('Udin Saepudin',11);
/*!40000 ALTER TABLE `depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `loan-number` int(11) NOT NULL AUTO_INCREMENT,
  `branch-name` varchar(250) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`loan-number`),
  KEY `fk_branchName` (`branch-name`),
  CONSTRAINT `fk_branchName` FOREIGN KEY (`branch-name`) REFERENCES `branch` (`branch-name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,'chelyabinsk',250),(2,'chelyabinsk',100),(3,'chelyabinsk',900),(4,'Lembang',100),(5,'NY',1000),(6,'NY',5000),(7,'NY',1500),(8,'NY',3200),(9,'Greater Jakarta',1000),(10,'Greater Jakarta',500),(11,'Greater Jakarta',1000),(12,'Greater Jakarta',500),(13,'Pasir Kaliki',20),(14,'Dea',3000000000),(15,'Dea',6000000000),(16,'Ciacia',1000000000),(17,'Ciacia',1000000000),(18,'Ciacia',1000000000),(19,'Ciacia',1000000000),(20,'Ciacia',1000000000),(21,'Ciacia',1000000000),(22,'Pesantren',9000000000);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-29 10:46:16
