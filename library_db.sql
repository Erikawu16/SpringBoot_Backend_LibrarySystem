CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Introduction` text,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('ISBN123456','Book1','Author1','Introduction to Book1...'),('ISBN345678','Book3','Author3','Introduction to Book3...'),('ISBN789012','Book2','Author2','Introduction to Book2...'),('ISBN901234','Book4','Author4','Introduction to Book4...');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowingrecord`
--

DROP TABLE IF EXISTS `borrowingrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowingrecord` (
  `RecordId` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `InventoryId` int DEFAULT NULL,
  `BorrowingTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `ReturnTime` datetime DEFAULT NULL,
  PRIMARY KEY (`RecordId`),
  KEY `UserId` (`UserId`),
  KEY `InventoryId` (`InventoryId`),
  CONSTRAINT `borrowingrecord_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `borrowingrecord_ibfk_2` FOREIGN KEY (`InventoryId`) REFERENCES `inventory` (`InventoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowingrecord`
--

LOCK TABLES `borrowingrecord` WRITE;
/*!40000 ALTER TABLE `borrowingrecord` DISABLE KEYS */;
INSERT INTO `borrowingrecord` VALUES (1,10,1,NULL,'2024-01-21 14:37:02'),(2,10,2,NULL,'2024-01-21 14:38:43'),(3,10,1,NULL,'2024-01-21 14:37:02'),(4,10,1,NULL,'2024-01-21 14:37:02'),(5,10,2,NULL,'2024-01-21 14:38:43'),(6,10,3,NULL,'2024-01-20 22:21:26'),(7,10,3,NULL,'2024-01-20 22:21:26'),(8,10,1,NULL,'2024-01-21 14:37:02'),(9,10,1,'2024-01-20 21:51:21','2024-01-21 14:37:02'),(10,10,1,'2024-01-20 21:57:35','2024-01-21 14:37:02'),(11,10,2,'2024-01-20 21:57:41','2024-01-21 14:38:43'),(12,10,3,'2024-01-20 21:59:57','2024-01-20 22:21:26'),(13,10,4,'2024-01-20 22:06:53','2024-01-20 22:15:50'),(14,10,3,'2024-01-20 22:06:55','2024-01-20 22:21:26'),(15,10,2,'2024-01-20 22:06:56','2024-01-21 14:38:43'),(16,10,1,'2024-01-20 22:06:56','2024-01-21 14:37:02'),(17,10,4,'2024-01-20 22:15:44','2024-01-20 22:15:50'),(18,10,3,'2024-01-20 22:15:45','2024-01-20 22:21:26'),(19,10,2,'2024-01-20 22:15:45','2024-01-21 14:38:43'),(20,10,1,'2024-01-20 22:15:46','2024-01-21 14:37:02'),(21,10,1,'2024-01-20 22:16:13','2024-01-21 14:37:02'),(22,10,3,'2024-01-20 22:16:13','2024-01-20 22:21:26'),(23,10,2,'2024-01-20 22:21:23','2024-01-21 14:38:43'),(24,10,1,'2024-01-20 22:21:28','2024-01-21 14:37:02'),(25,16,3,'2024-01-21 10:28:50','2024-01-21 14:44:29'),(30,16,1,'2024-01-21 14:27:00','2024-01-21 14:36:18'),(31,16,2,'2024-01-21 14:27:10','2024-01-21 14:31:06'),(32,16,3,'2024-01-21 14:30:50','2024-01-21 14:44:29'),(33,16,4,'2024-01-21 14:30:54','2024-01-21 14:36:07'),(34,16,4,'2024-01-21 14:31:00','2024-01-21 14:36:07'),(35,16,3,'2024-01-21 14:31:01','2024-01-21 14:44:29'),(36,16,2,'2024-01-21 14:31:02','2024-01-21 14:31:06'),(37,16,4,'2024-01-21 14:31:38','2024-01-21 14:36:07'),(38,16,1,'2024-01-21 14:35:17','2024-01-21 14:36:18'),(39,16,1,'2024-01-21 14:35:59','2024-01-21 14:36:18'),(40,16,4,'2024-01-21 14:36:05','2024-01-21 14:36:07'),(41,16,4,'2024-01-21 14:36:05','2024-01-21 14:36:07'),(42,16,1,'2024-01-21 14:36:09','2024-01-21 14:36:18'),(43,16,1,'2024-01-21 14:36:10','2024-01-21 14:36:18'),(44,16,1,'2024-01-21 14:36:15','2024-01-21 14:36:18'),(45,16,3,'2024-01-21 14:38:15','2024-01-21 14:44:29'),(46,10,2,'2024-01-21 14:38:59',NULL),(47,10,2,'2024-01-21 14:39:08',NULL),(51,10,2,'2024-01-21 14:44:10',NULL),(52,16,3,'2024-01-21 14:44:26','2024-01-21 14:44:29'),(53,18,1,'2024-01-21 14:45:56','2024-01-21 14:46:08'),(54,18,2,'2024-01-21 14:46:00','2024-01-21 14:46:10'),(55,18,3,'2024-01-21 14:46:05',NULL),(56,16,1,'2024-01-21 14:46:22',NULL);
/*!40000 ALTER TABLE `borrowingrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `InventoryId` int NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(20) DEFAULT NULL,
  `StoreTime` datetime DEFAULT NULL,
  `Status` enum('在庫','出借中','整理中','遺失','損毀','廢棄') DEFAULT NULL,
  PRIMARY KEY (`InventoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'ISBN123456','2024-01-01 09:45:00','出借中'),(2,'ISBN789012','2024-01-02 14:20:00','在庫'),(3,'ISBN345678','2024-01-03 15:30:00','出借中'),(4,'ISBN901234','2024-01-04 11:00:00','在庫');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(20) NOT NULL,
  `Password` int NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `RegistrationTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `LastLoginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'0000000000',0,'amy','2024-01-20 11:51:02','2024-01-21 11:05:06'),(16,'1111111111',111,'betty','2024-01-21 10:27:46','2024-01-21 14:46:17'),(17,'0916696151',12345,'user1','2024-01-21 14:18:42','2024-01-21 14:18:55'),(18,'0916062217',12345,'user3','2024-01-21 14:45:38','2024-01-21 14:46:34');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'library'
--

--
-- Dumping routines for database 'library'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddBorrowRecordProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `AddBorrowRecordProcedure`( IN p_UserId INT,IN p_InventoryId INT)
BEGIN
    INSERT INTO borrowingrecord (UserId, InventoryId) VALUES (p_UserId, p_InventoryId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addNewUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `addNewUser`(
    IN p_UserName VARCHAR(255), 
    IN p_PhoneNumber VARCHAR(255), 
    IN p_Password VARCHAR(255)
)
BEGIN
    INSERT INTO user (UserName, PhoneNumber, Password) VALUES (p_UserName, p_PhoneNumber, p_Password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `addUser`(IN p_UserName VARCHAR(255), IN p_PhoneNumber VARCHAR(255), IN p_Password VARCHAR(255))
BEGIN
    INSERT INTO user (UserName, PhoneNumber, Password) VALUES (p_UserName, p_PhoneNumber, p_Password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FindBookByInventoryIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `FindBookByInventoryIdProcedure`(IN p_InventoryId INT)
BEGIN
    SELECT InventoryId, ISBN, StoreTime, Status
    FROM Inventory
    WHERE InventoryId = p_InventoryId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FindBorrowRecordByUserIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `FindBorrowRecordByUserIdProcedure`(IN p_UserId INT)
BEGIN
    SELECT br.UserId, br.InventoryId, br.BorrowingTime, br.ReturnTime, inv.ISBN, b.Name
    FROM borrowingrecord br
    JOIN inventory inv ON br.InventoryId = inv.InventoryId
    JOIN book b ON inv.ISBN = b.ISBN
    WHERE br.UserId = p_UserId AND br.ReturnTime IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FindCanBorrowBookProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `FindCanBorrowBookProcedure`()
BEGIN
    SELECT i.InventoryId, i.ISBN, i.StoreTime, i.Status, b.Name, b.Author, b.Introduction
    FROM inventory i
    LEFT JOIN book b ON i.ISBN = b.ISBN
    WHERE i.Status = '在庫';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findUserByUserPhoneNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `findUserByUserPhoneNumber`(IN p_PhoneNumber VARCHAR(255))
BEGIN
    SELECT UserId, UserName, PhoneNumber, Password, RegistrationTime, LastLoginTime
    FROM user
    WHERE PhoneNumber = p_PhoneNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBorrowStatusToBorrowedProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `UpdateBorrowStatusToBorrowedProcedure`(IN p_InventoryId INT)
BEGIN
    UPDATE inventory SET Status = '出借中' WHERE InventoryId = p_InventoryId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBorrowStatusToCanBorrowProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `UpdateBorrowStatusToCanBorrowProcedure`(IN p_InventoryId INT)
BEGIN
    UPDATE inventory SET Status = '在庫' WHERE InventoryId = p_InventoryId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateLoginTimeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `UpdateLoginTimeProcedure`(IN p_LastLoginTime DATETIME, IN p_PhoneNumber VARCHAR(255))
BEGIN
    UPDATE user SET LastLoginTime = p_LastLoginTime WHERE PhoneNumber = p_PhoneNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateReturnTimeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`web`@`%` PROCEDURE `UpdateReturnTimeProcedure`(IN p_InventoryId INT, IN p_UserId INT, IN p_ReturnTime DATETIME)
BEGIN
    UPDATE borrowingrecord SET ReturnTime = p_ReturnTime WHERE InventoryId = p_InventoryId AND UserId = p_UserId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-21 23:17:06
