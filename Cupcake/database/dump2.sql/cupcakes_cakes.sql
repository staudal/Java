-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: cupcakes
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cakes`
--

DROP TABLE IF EXISTS `cakes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cakes` (
  `cakeId` varchar(255) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `bottomName` varchar(45) NOT NULL,
  `toppingName` varchar(45) NOT NULL,
  `bottomPrice` varchar(45) NOT NULL,
  `toppingPrice` varchar(45) NOT NULL,
  PRIMARY KEY (`cakeId`),
  UNIQUE KEY `cakeId_UNIQUE` (`cakeId`),
  KEY `fk_cakes_orders1` (`orderId`),
  CONSTRAINT `fk_cakes_orders1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cakes`
--

LOCK TABLES `cakes` WRITE;
/*!40000 ALTER TABLE `cakes` DISABLE KEYS */;
INSERT INTO `cakes` VALUES ('1f310257-f37b-4b87-bd32-5b19ec20a65e','0e70d255-3407-4bbd-b676-353b8a390ee9','Vanilje','Appelsin','5','8'),('3bfdd9cc-7942-470d-bffa-89126ae546e1','0832e7f1-e5c4-42df-bfde-0c5e969acd88','Chokolade','Blåbær','5','5'),('63011302-b8ed-417a-a18d-8b69720f87cb','33d7560c-4afc-4c00-921f-0c0a4efba30d','Chokolade','Blåbær','5','5'),('8a7deafe-60be-404f-b0fc-a1b230869f65','e5ed4212-44b0-41bb-ab06-36deed3f3c10','Vanilje','Chokolade','5','5'),('aec8f7d6-4b49-4e2c-862b-b7a25a0ce0d2','33d7560c-4afc-4c00-921f-0c0a4efba30d','Vanilje','Hindbær','5','5'),('af10b749-92be-493a-8b7d-5c1ea53742b3','0e70d255-3407-4bbd-b676-353b8a390ee9','Vanilje','Chokolade','5','5'),('ef49de89-f881-4d07-8fb0-85bb5cf3f547','dcf9e0a2-7886-429c-9700-42dc877e3295','Chokolade','Chokolade','5','5');
/*!40000 ALTER TABLE `cakes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-11 21:32:32
