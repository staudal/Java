-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
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
INSERT INTO `cakes` VALUES ('12af6b72-b3b4-4503-9267-c026ebcda134','458cfc88-b14c-46a3-811e-a06938152ce7','Mandel','Blåbær',7,5),('1672dd4d-ccde-47c0-abfc-28abbf703208','6968c5fb-94ed-43da-b3dd-42d694c220b2','Chokolade','Chokolade',5,5),('190e9aea-5989-41e3-9833-ab8ac61a83ad','458cfc88-b14c-46a3-811e-a06938152ce7','Pistacie','Hindbær',6,5),('5e5cb2b5-ae2b-4618-aa07-8c4762285073','3e0c05d4-e2a0-48c8-893c-4667b63a5308','Chokolade','Chokolade',5,5),('660b0bca-70c7-483e-b49b-294beb91cc8e','6968c5fb-94ed-43da-b3dd-42d694c220b2','Mandel','Citron',7,8),('66f09c5d-01ba-4374-80f7-bb656936af88','b9e702dd-494a-4662-bbe7-32c3159fbba3','Chokolade','Chokolade',5,5),('78495f0e-ee53-40b7-b413-38b493e0c4a7','458cfc88-b14c-46a3-811e-a06938152ce7','Chokolade','Chokolade',5,5),('82685f71-a635-4104-a628-e35c18afe498','301111b4-55e4-42e5-8a48-695052b22462','Vanilje','Blåbær',5,5),('c468e91b-23a7-49aa-8612-dd10c056f931','2471f858-ba8f-4d62-81d0-ba25fbaa4a5c','Chokolade','Chokolade',5,5),('ca308d39-eefa-4560-8c5f-f8de8b7f50d8','2769d7c6-ad83-46ba-b1da-0ea7f1ee0e2a','Vanilje','Blåbær',5,5),('cc2e7abc-58be-4bb2-841f-be42668e8bbf','2471f858-ba8f-4d62-81d0-ba25fbaa4a5c','Vanilje','Blåbær',5,5),('eb6ae124-f2c9-4f20-9c7d-0af345c7ae06','6968c5fb-94ed-43da-b3dd-42d694c220b2','Vanilje','Hindbær',5,5);
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
INSERT INTO `orders` VALUES ('2471f858-ba8f-4d62-81d0-ba25fbaa4a5c','b04de574-0f81-4c5b-a706-db8c44909e72','12 Nov 2022',25,'Modtaget'),('2769d7c6-ad83-46ba-b1da-0ea7f1ee0e2a','b04de574-0f81-4c5b-a706-db8c44909e72','12 Nov 2022',15,'Modtaget'),('301111b4-55e4-42e5-8a48-695052b22462','b04de574-0f81-4c5b-a706-db8c44909e72','12 Nov 2022',15,'Modtaget'),('3e0c05d4-e2a0-48c8-893c-4667b63a5308','b04de574-0f81-4c5b-a706-db8c44909e72','12 Nov 2022',15,'Modtaget'),('458cfc88-b14c-46a3-811e-a06938152ce7','b04de574-0f81-4c5b-a706-db8c44909e72','12 Nov 2022',38,'Modtaget'),('6968c5fb-94ed-43da-b3dd-42d694c220b2','b04de574-0f81-4c5b-a706-db8c44909e72','12 Nov 2022',40,'Modtaget'),('b9e702dd-494a-4662-bbe7-32c3159fbba3','b04de574-0f81-4c5b-a706-db8c44909e72','12 Nov 2022',15,'Modtaget');
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
INSERT INTO `users` VALUES ('115e6243-b292-4396-8869-db322a19b398','customer','Mette','Staudal','mstaudal@gmail.com','12345',0),('b04de574-0f81-4c5b-a706-db8c44909e72','customer','Jakob','Staudal','jakobstaudal@outlook.com','abelabe',1947);
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

-- Dump completed on 2022-11-12 23:33:24
