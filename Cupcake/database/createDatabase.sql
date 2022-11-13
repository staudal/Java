CREATE DATABASE  IF NOT EXISTS `cupcakes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cupcakes`;
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
  `bottomPrice` int NOT NULL,
  `toppingPrice` int NOT NULL,
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
INSERT INTO `cakes` VALUES ('0d4534ae-c4d5-4847-9578-0ce3c985a7ac','bfb54bbd-3840-4963-b02d-e82ca947d1ac','Chokolade','Chokolade',5,5),('1672dd4d-ccde-47c0-abfc-28abbf703208','6968c5fb-94ed-43da-b3dd-42d694c220b2','Chokolade','Chokolade',5,5),('5093a425-abb3-4408-8fe0-8657a6996292','bfb54bbd-3840-4963-b02d-e82ca947d1ac','Muskatnød','Hindbær',5,5),('660b0bca-70c7-483e-b49b-294beb91cc8e','6968c5fb-94ed-43da-b3dd-42d694c220b2','Mandel','Citron',7,8),('8846b9e4-0c9e-49ef-a0a7-163b6000cd91','f2140e78-cde8-4dcd-8144-dfdb6626bddd','Muskatnød','Hindbær',5,5),('de8a7dac-d070-47d6-9ad3-81edfa34628a','f2140e78-cde8-4dcd-8144-dfdb6626bddd','Mandel','Blåbær',7,5),('eb6ae124-f2c9-4f20-9c7d-0af345c7ae06','6968c5fb-94ed-43da-b3dd-42d694c220b2','Vanilje','Hindbær',5,5),('fa7a590e-d2ec-467a-9fd2-57a4d1ac789e','f2140e78-cde8-4dcd-8144-dfdb6626bddd','Pistacie','Hindbær',6,5);
/*!40000 ALTER TABLE `cakes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderId_UNIQUE` (`orderId`),
  KEY `fk_orders_users_idx` (`userId`),
  CONSTRAINT `fk_orders_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('6968c5fb-94ed-43da-b3dd-42d694c220b2','b04de574-0f81-4c5b-a706-db8c44909e72','12 Nov 2022',40,'Modtaget'),('bfb54bbd-3840-4963-b02d-e82ca947d1ac','19921332-0b0f-42e1-b892-966183af8ab7','13 Nov 2022',25,'Modtaget'),('f2140e78-cde8-4dcd-8144-dfdb6626bddd','19921332-0b0f-42e1-b892-966183af8ab7','13 Nov 2022',38,'Modtaget');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` varchar(255) NOT NULL,
  `role` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `balance` int NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('115e6243-b292-4396-8869-db322a19b398','customer','Mette','Staudal','mstaudal@gmail.com','12345',0),('19921332-0b0f-42e1-b892-966183af8ab7','customer','Lars','Staudal','lars@staudal.dk','12345',932),('b04de574-0f81-4c5b-a706-db8c44909e72','admin','Jakob','Staudal','jakobstaudal@outlook.com','12345',1947);
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

-- Dump completed on 2022-11-13 14:10:35
