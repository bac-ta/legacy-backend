-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: entropy-tech-blog
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `ofCategory`
--

DROP TABLE IF EXISTS `ofCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofCategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofCategory`
--

LOCK TABLES `ofCategory` WRITE;
/*!40000 ALTER TABLE `ofCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofComment`
--

DROP TABLE IF EXISTS `ofComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofComment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postId` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofComment`
--

LOCK TABLES `ofComment` WRITE;
/*!40000 ALTER TABLE `ofComment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofConParticipant`
--

DROP TABLE IF EXISTS `ofConParticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofConParticipant` (
  `conversationID` bigint NOT NULL,
  `joinedDate` bigint NOT NULL,
  `leftDate` bigint DEFAULT NULL,
  `bareJID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jidResource` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `ofConParticipant_conv_idx` (`conversationID`,`bareJID`,`jidResource`,`joinedDate`),
  KEY `ofConParticipant_jid_idx` (`bareJID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofConParticipant`
--

LOCK TABLES `ofConParticipant` WRITE;
/*!40000 ALTER TABLE `ofConParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofConParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofConversation`
--

DROP TABLE IF EXISTS `ofConversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofConversation` (
  `conversationID` bigint NOT NULL,
  `room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isExternal` tinyint NOT NULL,
  `startDate` bigint NOT NULL,
  `lastActivity` bigint NOT NULL,
  `messageCount` int NOT NULL,
  PRIMARY KEY (`conversationID`),
  KEY `ofConversation_ext_idx` (`isExternal`),
  KEY `ofConversation_start_idx` (`startDate`),
  KEY `ofConversation_last_idx` (`lastActivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofConversation`
--

LOCK TABLES `ofConversation` WRITE;
/*!40000 ALTER TABLE `ofConversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofConversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofExtComponentConf`
--

DROP TABLE IF EXISTS `ofExtComponentConf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofExtComponentConf` (
  `subdomain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wildcard` tinyint NOT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subdomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofExtComponentConf`
--

LOCK TABLES `ofExtComponentConf` WRITE;
/*!40000 ALTER TABLE `ofExtComponentConf` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofExtComponentConf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofGroup`
--

DROP TABLE IF EXISTS `ofGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofGroup` (
  `groupName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofGroup`
--

LOCK TABLES `ofGroup` WRITE;
/*!40000 ALTER TABLE `ofGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofGroupProp`
--

DROP TABLE IF EXISTS `ofGroupProp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofGroupProp` (
  `groupName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `propValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`groupName`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofGroupProp`
--

LOCK TABLES `ofGroupProp` WRITE;
/*!40000 ALTER TABLE `ofGroupProp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofGroupProp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofGroupUser`
--

DROP TABLE IF EXISTS `ofGroupUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofGroupUser` (
  `groupName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrator` tinyint NOT NULL,
  PRIMARY KEY (`groupName`,`username`,`administrator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofGroupUser`
--

LOCK TABLES `ofGroupUser` WRITE;
/*!40000 ALTER TABLE `ofGroupUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofGroupUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofID`
--

DROP TABLE IF EXISTS `ofID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofID` (
  `idType` int NOT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofID`
--

LOCK TABLES `ofID` WRITE;
/*!40000 ALTER TABLE `ofID` DISABLE KEYS */;
INSERT INTO `ofID` VALUES (18,1),(19,21),(23,1),(25,4),(26,2),(27,1);
/*!40000 ALTER TABLE `ofID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMessageArchive`
--

DROP TABLE IF EXISTS `ofMessageArchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofMessageArchive` (
  `messageID` bigint DEFAULT NULL,
  `conversationID` bigint NOT NULL,
  `fromJID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromJIDResource` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toJID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `toJIDResource` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sentDate` bigint NOT NULL,
  `stanza` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `isPMforJID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `ofMessageArchive_con_idx` (`conversationID`),
  KEY `ofMessageArchive_fromjid_idx` (`fromJID`),
  KEY `ofMessageArchive_tojid_idx` (`toJID`),
  KEY `ofMessageArchive_sent_idx` (`sentDate`),
  KEY `ofMessageArchive_pm_idx` (`isPMforJID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMessageArchive`
--

LOCK TABLES `ofMessageArchive` WRITE;
/*!40000 ALTER TABLE `ofMessageArchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMessageArchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucAffiliation`
--

DROP TABLE IF EXISTS `ofMucAffiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofMucAffiliation` (
  `roomID` bigint NOT NULL,
  `jid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `affiliation` tinyint NOT NULL,
  PRIMARY KEY (`roomID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucAffiliation`
--

LOCK TABLES `ofMucAffiliation` WRITE;
/*!40000 ALTER TABLE `ofMucAffiliation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucAffiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucConversationLog`
--

DROP TABLE IF EXISTS `ofMucConversationLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofMucConversationLog` (
  `roomID` bigint NOT NULL,
  `messageID` bigint NOT NULL,
  `sender` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logTime` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stanza` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  KEY `ofMucConversationLog_time_idx` (`logTime`),
  KEY `ofMucConversationLog_msg_id` (`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucConversationLog`
--

LOCK TABLES `ofMucConversationLog` WRITE;
/*!40000 ALTER TABLE `ofMucConversationLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucConversationLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucMember`
--

DROP TABLE IF EXISTS `ofMucMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofMucMember` (
  `roomID` bigint NOT NULL,
  `jid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faqentry` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`roomID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucMember`
--

LOCK TABLES `ofMucMember` WRITE;
/*!40000 ALTER TABLE `ofMucMember` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucRoom`
--

DROP TABLE IF EXISTS `ofMucRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofMucRoom` (
  `serviceID` bigint NOT NULL,
  `roomID` bigint NOT NULL,
  `creationDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modificationDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `naturalName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lockedDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emptyDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canChangeSubject` tinyint NOT NULL,
  `maxUsers` int NOT NULL,
  `publicRoom` tinyint NOT NULL,
  `moderated` tinyint NOT NULL,
  `membersOnly` tinyint NOT NULL,
  `canInvite` tinyint NOT NULL,
  `roomPassword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canDiscoverJID` tinyint NOT NULL,
  `logEnabled` tinyint NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rolesToBroadcast` tinyint NOT NULL,
  `useReservedNick` tinyint NOT NULL,
  `canChangeNick` tinyint NOT NULL,
  `canRegister` tinyint NOT NULL,
  `allowpm` tinyint DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`name`),
  KEY `ofMucRoom_roomid_idx` (`roomID`),
  KEY `ofMucRoom_serviceid_idx` (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucRoom`
--

LOCK TABLES `ofMucRoom` WRITE;
/*!40000 ALTER TABLE `ofMucRoom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucRoom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucRoomProp`
--

DROP TABLE IF EXISTS `ofMucRoomProp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofMucRoomProp` (
  `roomID` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `propValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`roomID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucRoomProp`
--

LOCK TABLES `ofMucRoomProp` WRITE;
/*!40000 ALTER TABLE `ofMucRoomProp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucRoomProp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucService`
--

DROP TABLE IF EXISTS `ofMucService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofMucService` (
  `serviceID` bigint NOT NULL,
  `subdomain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isHidden` tinyint NOT NULL,
  PRIMARY KEY (`subdomain`),
  KEY `ofMucService_serviceid_idx` (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucService`
--

LOCK TABLES `ofMucService` WRITE;
/*!40000 ALTER TABLE `ofMucService` DISABLE KEYS */;
INSERT INTO `ofMucService` VALUES (1,'conference',NULL,0);
/*!40000 ALTER TABLE `ofMucService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofMucServiceProp`
--

DROP TABLE IF EXISTS `ofMucServiceProp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofMucServiceProp` (
  `serviceID` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `propValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`serviceID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofMucServiceProp`
--

LOCK TABLES `ofMucServiceProp` WRITE;
/*!40000 ALTER TABLE `ofMucServiceProp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofMucServiceProp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofOAuth2User`
--

DROP TABLE IF EXISTS `ofOAuth2User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofOAuth2User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `created_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Anonymous',
  `updated_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofOAuth2User`
--

LOCK TABLES `ofOAuth2User` WRITE;
/*!40000 ALTER TABLE `ofOAuth2User` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofOAuth2User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofOffline`
--

DROP TABLE IF EXISTS `ofOffline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofOffline` (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageID` bigint NOT NULL,
  `creationDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageSize` int NOT NULL,
  `stanza` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`,`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofOffline`
--

LOCK TABLES `ofOffline` WRITE;
/*!40000 ALTER TABLE `ofOffline` DISABLE KEYS */;
INSERT INTO `ofOffline` VALUES ('admin',1,'001622821843918',131,'<message from=\"entropy.com.vn\" to=\"admin@entropy.com.vn\"><body>A server or plugin update was found: Openfire 4.6.3</body></message>'),('admin',6,'001623598074392',131,'<message from=\"entropy.com.vn\" to=\"admin@entropy.com.vn\"><body>A server or plugin update was found: Openfire 4.6.3</body></message>'),('admin',11,'001623770875852',131,'<message from=\"entropy.com.vn\" to=\"admin@entropy.com.vn\"><body>A server or plugin update was found: Openfire 4.6.3</body></message>'),('admin',16,'001624194902073',131,'<message from=\"entropy.com.vn\" to=\"admin@entropy.com.vn\"><body>A server or plugin update was found: Openfire 4.6.4</body></message>');
/*!40000 ALTER TABLE `ofOffline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPermission`
--

DROP TABLE IF EXISTS `ofPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPermission` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPermission`
--

LOCK TABLES `ofPermission` WRITE;
/*!40000 ALTER TABLE `ofPermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPost`
--

DROP TABLE IF EXISTS `ofPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageTitleUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `created_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPost`
--

LOCK TABLES `ofPost` WRITE;
/*!40000 ALTER TABLE `ofPost` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPostCategory`
--

DROP TABLE IF EXISTS `ofPostCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPostCategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL,
  `categoryId` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Anonymous',
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPostCategory`
--

LOCK TABLES `ofPostCategory` WRITE;
/*!40000 ALTER TABLE `ofPostCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPostCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPostTag`
--

DROP TABLE IF EXISTS `ofPostTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPostTag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL,
  `tagId` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPostTag`
--

LOCK TABLES `ofPostTag` WRITE;
/*!40000 ALTER TABLE `ofPostTag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPostTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPresence`
--

DROP TABLE IF EXISTS `ofPresence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPresence` (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offlinePresence` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `offlineDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPresence`
--

LOCK TABLES `ofPresence` WRITE;
/*!40000 ALTER TABLE `ofPresence` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPresence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPrivacyList`
--

DROP TABLE IF EXISTS `ofPrivacyList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPrivacyList` (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDefault` tinyint NOT NULL,
  `list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`,`name`),
  KEY `ofPrivacyList_default_idx` (`username`,`isDefault`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPrivacyList`
--

LOCK TABLES `ofPrivacyList` WRITE;
/*!40000 ALTER TABLE `ofPrivacyList` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPrivacyList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofProfile`
--

DROP TABLE IF EXISTS `ofProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofProfile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth2UserId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth2Avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofProfile`
--

LOCK TABLES `ofProfile` WRITE;
/*!40000 ALTER TABLE `ofProfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofProfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofProperty`
--

DROP TABLE IF EXISTS `ofProperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofProperty` (
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `propValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encrypted` int DEFAULT NULL,
  `iv` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofProperty`
--

LOCK TABLES `ofProperty` WRITE;
/*!40000 ALTER TABLE `ofProperty` DISABLE KEYS */;
INSERT INTO `ofProperty` VALUES ('conversation.database.jid-columns-have-been-migrated','true',0,NULL),('passwordKey','oV84XihArfT3Ecw',0,NULL),('plugin.restapi.allowedIPs','',0,NULL),('plugin.restapi.enabled','true',0,NULL),('plugin.restapi.httpAuth','secret',0,NULL),('plugin.restapi.secret','46QUw5HcsuS8A9qe',0,NULL),('plugin.restapi.serviceLoggingEnabled','true',0,NULL),('provider.admin.className','org.jivesoftware.openfire.admin.DefaultAdminProvider',0,NULL),('provider.auth.className','org.jivesoftware.openfire.auth.DefaultAuthProvider',0,NULL),('provider.group.className','org.jivesoftware.openfire.group.DefaultGroupProvider',0,NULL),('provider.lockout.className','org.jivesoftware.openfire.lockout.DefaultLockOutProvider',0,NULL),('provider.securityAudit.className','org.jivesoftware.openfire.security.DefaultSecurityAuditProvider',0,NULL),('provider.user.className','org.jivesoftware.openfire.user.DefaultUserProvider',0,NULL),('provider.vcard.className','org.jivesoftware.openfire.vcard.DefaultVCardProvider',0,NULL),('route.all-resources','true',0,NULL),('update.lastCheck','1624194902802',0,NULL),('xmpp.auth.anonymous','false',0,NULL),('xmpp.domain','entropy.com.vn',0,NULL),('xmpp.socket.ssl.active','true',0,NULL);
/*!40000 ALTER TABLE `ofProperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubAffiliation`
--

DROP TABLE IF EXISTS `ofPubsubAffiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPubsubAffiliation` (
  `serviceID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nodeID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `affiliation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubAffiliation`
--

LOCK TABLES `ofPubsubAffiliation` WRITE;
/*!40000 ALTER TABLE `ofPubsubAffiliation` DISABLE KEYS */;
INSERT INTO `ofPubsubAffiliation` VALUES ('pubsub','','entropy.com.vn','owner');
/*!40000 ALTER TABLE `ofPubsubAffiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubDefaultConf`
--

DROP TABLE IF EXISTS `ofPubsubDefaultConf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPubsubDefaultConf` (
  `serviceID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `leaf` tinyint NOT NULL,
  `deliverPayloads` tinyint NOT NULL,
  `maxPayloadSize` int NOT NULL,
  `persistItems` tinyint NOT NULL,
  `maxItems` int NOT NULL,
  `notifyConfigChanges` tinyint NOT NULL,
  `notifyDelete` tinyint NOT NULL,
  `notifyRetract` tinyint NOT NULL,
  `presenceBased` tinyint NOT NULL,
  `sendItemSubscribe` tinyint NOT NULL,
  `publisherModel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriptionEnabled` tinyint NOT NULL,
  `accessModel` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replyPolicy` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `associationPolicy` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `maxLeafNodes` int NOT NULL,
  PRIMARY KEY (`serviceID`,`leaf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubDefaultConf`
--

LOCK TABLES `ofPubsubDefaultConf` WRITE;
/*!40000 ALTER TABLE `ofPubsubDefaultConf` DISABLE KEYS */;
INSERT INTO `ofPubsubDefaultConf` VALUES ('pubsub',0,0,0,0,0,1,1,1,0,0,'publishers',1,'open','English',NULL,'all',-1),('pubsub',1,1,5120,0,1,1,1,1,0,1,'publishers',1,'open','English',NULL,'all',-1);
/*!40000 ALTER TABLE `ofPubsubDefaultConf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubItem`
--

DROP TABLE IF EXISTS `ofPubsubItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPubsubItem` (
  `serviceID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nodeID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creationDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`serviceID`,`nodeID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubItem`
--

LOCK TABLES `ofPubsubItem` WRITE;
/*!40000 ALTER TABLE `ofPubsubItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPubsubItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubNode`
--

DROP TABLE IF EXISTS `ofPubsubNode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPubsubNode` (
  `serviceID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nodeID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `leaf` tinyint NOT NULL,
  `creationDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modificationDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliverPayloads` tinyint NOT NULL,
  `maxPayloadSize` int DEFAULT NULL,
  `persistItems` tinyint DEFAULT NULL,
  `maxItems` int DEFAULT NULL,
  `notifyConfigChanges` tinyint NOT NULL,
  `notifyDelete` tinyint NOT NULL,
  `notifyRetract` tinyint NOT NULL,
  `presenceBased` tinyint NOT NULL,
  `sendItemSubscribe` tinyint NOT NULL,
  `publisherModel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriptionEnabled` tinyint NOT NULL,
  `configSubscription` tinyint NOT NULL,
  `accessModel` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payloadType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bodyXSLT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataformXSLT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replyPolicy` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `associationPolicy` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maxLeafNodes` int DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubNode`
--

LOCK TABLES `ofPubsubNode` WRITE;
/*!40000 ALTER TABLE `ofPubsubNode` DISABLE KEYS */;
INSERT INTO `ofPubsubNode` VALUES ('pubsub','',0,'001622821807381','001622821807381',NULL,0,0,0,0,1,1,1,0,0,'publishers',1,0,'open','','','','entropy.com.vn','','English','',NULL,'all',-1);
/*!40000 ALTER TABLE `ofPubsubNode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubNodeGroups`
--

DROP TABLE IF EXISTS `ofPubsubNodeGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPubsubNodeGroups` (
  `serviceID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nodeID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rosterGroup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `ofPubsubNodeGroups_idx` (`serviceID`,`nodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubNodeGroups`
--

LOCK TABLES `ofPubsubNodeGroups` WRITE;
/*!40000 ALTER TABLE `ofPubsubNodeGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPubsubNodeGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubNodeJIDs`
--

DROP TABLE IF EXISTS `ofPubsubNodeJIDs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPubsubNodeJIDs` (
  `serviceID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nodeID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `associationType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubNodeJIDs`
--

LOCK TABLES `ofPubsubNodeJIDs` WRITE;
/*!40000 ALTER TABLE `ofPubsubNodeJIDs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPubsubNodeJIDs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofPubsubSubscription`
--

DROP TABLE IF EXISTS `ofPubsubSubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofPubsubSubscription` (
  `serviceID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nodeID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deliver` tinyint NOT NULL,
  `digest` tinyint NOT NULL,
  `digest_frequency` int NOT NULL,
  `expire` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `includeBody` tinyint NOT NULL,
  `showValues` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscriptionType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriptionDepth` tinyint NOT NULL,
  `keyword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofPubsubSubscription`
--

LOCK TABLES `ofPubsubSubscription` WRITE;
/*!40000 ALTER TABLE `ofPubsubSubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofPubsubSubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofRefreshToken`
--

DROP TABLE IF EXISTS `ofRefreshToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofRefreshToken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryDate` timestamp NOT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofRefreshToken`
--

LOCK TABLES `ofRefreshToken` WRITE;
/*!40000 ALTER TABLE `ofRefreshToken` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofRefreshToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofRemoteServerConf`
--

DROP TABLE IF EXISTS `ofRemoteServerConf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofRemoteServerConf` (
  `xmppDomain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remotePort` int DEFAULT NULL,
  `permission` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`xmppDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofRemoteServerConf`
--

LOCK TABLES `ofRemoteServerConf` WRITE;
/*!40000 ALTER TABLE `ofRemoteServerConf` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofRemoteServerConf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofReply`
--

DROP TABLE IF EXISTS `ofReply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofReply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentId` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofReply`
--

LOCK TABLES `ofReply` WRITE;
/*!40000 ALTER TABLE `ofReply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofReply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofRole`
--

DROP TABLE IF EXISTS `ofRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofRole` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofRole`
--

LOCK TABLES `ofRole` WRITE;
/*!40000 ALTER TABLE `ofRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofRolePermission`
--

DROP TABLE IF EXISTS `ofRolePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofRolePermission` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `roleId` tinyint NOT NULL,
  `permissionId` tinyint NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofRolePermission`
--

LOCK TABLES `ofRolePermission` WRITE;
/*!40000 ALTER TABLE `ofRolePermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofRolePermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofRoster`
--

DROP TABLE IF EXISTS `ofRoster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofRoster` (
  `rosterID` bigint NOT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub` tinyint NOT NULL,
  `ask` tinyint NOT NULL,
  `recv` tinyint NOT NULL,
  `nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rosterID`),
  KEY `ofRoster_unameid_idx` (`username`),
  KEY `ofRoster_jid_idx` (`jid`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofRoster`
--

LOCK TABLES `ofRoster` WRITE;
/*!40000 ALTER TABLE `ofRoster` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofRoster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofRosterGroups`
--

DROP TABLE IF EXISTS `ofRosterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofRosterGroups` (
  `rosterID` bigint NOT NULL,
  `rank` tinyint NOT NULL,
  `groupName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rosterID`,`rank`),
  KEY `ofRosterGroup_rosterid_idx` (`rosterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofRosterGroups`
--

LOCK TABLES `ofRosterGroups` WRITE;
/*!40000 ALTER TABLE `ofRosterGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofRosterGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofSASLAuthorized`
--

DROP TABLE IF EXISTS `ofSASLAuthorized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofSASLAuthorized` (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `principal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`,`principal`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofSASLAuthorized`
--

LOCK TABLES `ofSASLAuthorized` WRITE;
/*!40000 ALTER TABLE `ofSASLAuthorized` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofSASLAuthorized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofSecurityAuditLog`
--

DROP TABLE IF EXISTS `ofSecurityAuditLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofSecurityAuditLog` (
  `msgID` bigint NOT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entryStamp` bigint NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`msgID`),
  KEY `ofSecurityAuditLog_tstamp_idx` (`entryStamp`),
  KEY `ofSecurityAuditLog_uname_idx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofSecurityAuditLog`
--

LOCK TABLES `ofSecurityAuditLog` WRITE;
/*!40000 ALTER TABLE `ofSecurityAuditLog` DISABLE KEYS */;
INSERT INTO `ofSecurityAuditLog` VALUES (1,'admin',1622821827492,'Successful admin console login attempt','entropy.com.vn','The user logged in successfully to the admin console from address 172.22.0.1. '),(2,'admin',1622821893339,'Updated server property route.all-resources','entropy.com.vn','Property created with value \'true\''),(3,'admin',1623598074604,'Successful admin console login attempt','entropy.com.vn','The user logged in successfully to the admin console from address 172.22.0.1. ');
/*!40000 ALTER TABLE `ofSecurityAuditLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofTag`
--

DROP TABLE IF EXISTS `ofTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofTag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryId` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofTag`
--

LOCK TABLES `ofTag` WRITE;
/*!40000 ALTER TABLE `ofTag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofUser`
--

DROP TABLE IF EXISTS `ofUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofUser` (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storedKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serverKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iterations` int DEFAULT NULL,
  `plainPassword` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryptedPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creationDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modificationDate` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `gender` tinyint NOT NULL DEFAULT '0',
  `dateOfBirth` date DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcryptedPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `createdBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `ofUser_cDate_idx` (`creationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofUser`
--

LOCK TABLES `ofUser` WRITE;
/*!40000 ALTER TABLE `ofUser` DISABLE KEYS */;
INSERT INTO `ofUser` VALUES ('admin','lttvB/jfSjQkKu3AGRAA1BWSA2I=','1KkPu/a8FzgwbB1l20ZNwCLfsuA=','lKKg817EjE2lVHkdu5UErhbOGSUW8QbB',4096,NULL,'3bd8e06eeebb4ce356f03108a3cd1ca7327dbe2d6c8b0c9ff4df10ebb7ad5351e07eca4d7608e64f','Administrator','admin@example.com','001622821802876','0',1,0,NULL,NULL,1,'','2021-06-04 16:06:06',NULL,'Anonymous',NULL);
/*!40000 ALTER TABLE `ofUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofUserFlag`
--

DROP TABLE IF EXISTS `ofUserFlag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofUserFlag` (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endTime` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`,`name`),
  KEY `ofUserFlag_sTime_idx` (`startTime`),
  KEY `ofUserFlag_eTime_idx` (`endTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofUserFlag`
--

LOCK TABLES `ofUserFlag` WRITE;
/*!40000 ALTER TABLE `ofUserFlag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofUserFlag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofUserProp`
--

DROP TABLE IF EXISTS `ofUserProp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofUserProp` (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `propValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofUserProp`
--

LOCK TABLES `ofUserProp` WRITE;
/*!40000 ALTER TABLE `ofUserProp` DISABLE KEYS */;
INSERT INTO `ofUserProp` VALUES ('admin','console.rows_per_page','/server-properties.jsp=25,/session-summary.jsp=25,/security-audit-viewer.jsp=25');
/*!40000 ALTER TABLE `ofUserProp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofVCard`
--

DROP TABLE IF EXISTS `ofVCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofVCard` (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vcard` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofVCard`
--

LOCK TABLES `ofVCard` WRITE;
/*!40000 ALTER TABLE `ofVCard` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofVCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofVersion`
--

DROP TABLE IF EXISTS `ofVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofVersion` (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofVersion`
--

LOCK TABLES `ofVersion` WRITE;
/*!40000 ALTER TABLE `ofVersion` DISABLE KEYS */;
INSERT INTO `ofVersion` VALUES ('monitoring',8),('openfire',30);
/*!40000 ALTER TABLE `ofVersion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-13 16:52:56