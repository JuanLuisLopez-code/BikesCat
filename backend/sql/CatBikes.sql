-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: CatBikes
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add bike',6,'add_bike'),(22,'Can change bike',6,'change_bike'),(23,'Can delete bike',6,'delete_bike'),(24,'Can view bike',6,'view_bike'),(25,'Can add station',7,'add_station'),(26,'Can change station',7,'change_station'),(27,'Can delete station',7,'delete_station'),(28,'Can view station',7,'view_station'),(29,'Can add slot',8,'add_slot'),(30,'Can change slot',8,'change_slot'),(31,'Can delete slot',8,'delete_slot'),(32,'Can view slot',8,'view_slot'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add blacklist',10,'add_blacklist'),(38,'Can change blacklist',10,'change_blacklist'),(39,'Can delete blacklist',10,'delete_blacklist'),(40,'Can view blacklist',10,'view_blacklist'),(41,'Can add blacklist2fa',11,'add_blacklist2fa'),(42,'Can change blacklist2fa',11,'change_blacklist2fa'),(43,'Can delete blacklist2fa',11,'delete_blacklist2fa'),(44,'Can view blacklist2fa',11,'view_blacklist2fa'),(45,'Can add rent',12,'add_rent'),(46,'Can change rent',12,'change_rent'),(47,'Can delete rent',12,'delete_rent'),(48,'Can view rent',12,'view_rent'),(49,'Can add incident',13,'add_incident'),(50,'Can change incident',13,'change_incident'),(51,'Can delete incident',13,'delete_incident'),(52,'Can view incident',13,'view_incident'),(53,'Can add notification',14,'add_notification'),(54,'Can change notification',14,'change_notification'),(55,'Can delete notification',14,'delete_notification'),(56,'Can view notification',14,'view_notification');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist2FA_blacklist2fa`
--

DROP TABLE IF EXISTS `blacklist2FA_blacklist2fa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist2FA_blacklist2fa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code2FA` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blacklist2FA_blacklist2fa_user_id_11f1ebe4_fk_user_user_id` (`user_id`),
  CONSTRAINT `blacklist2FA_blacklist2fa_user_id_11f1ebe4_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=821 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist2FA_blacklist2fa`
--

LOCK TABLES `blacklist2FA_blacklist2fa` WRITE;
/*!40000 ALTER TABLE `blacklist2FA_blacklist2fa` DISABLE KEYS */;
INSERT INTO `blacklist2FA_blacklist2fa` VALUES (820,639870978,'pending',1);
/*!40000 ALTER TABLE `blacklist2FA_blacklist2fa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist_blacklist`
--

DROP TABLE IF EXISTS `blacklist_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist_blacklist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_blacklist`
--

LOCK TABLES `blacklist_blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist_blacklist` DISABLE KEYS */;
INSERT INTO `blacklist_blacklist` VALUES (2,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTA3ODV9.Xr7s6_PDnu0AQ4NYjyNJflNVv8YJ9L_BSMpQhwWPF5k'),(1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTAwNjh9.hSPMA-postFOnedEIOsQKrWD6fmXGBoyHfwwIGQBrOk'),(21,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE0MDR9.4tSH-x-MkBp2Vf5k61K5v-4IoruFimBW_m__XSOFLFo'),(22,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE0NTF9.z72sAmMr-KESiJhjWtDzqEuNTw95LiA51G80O8ALPZ4'),(23,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE1NTl9.2IZvFI4MnhqCey9iJ5b6cre8TnQqvIklZOX20NtKNYA'),(24,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE1OTl9.MQBxWzxh0zN5bZLwVntAn_um_judvT_aXyssIKjHa_U'),(25,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE2NTB9.xpJYLBXv_1N3Mxc03Zh0IiOIV_uf7AfqHEzk6OcxG40'),(27,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE3ODJ9.tSTQE7ti3DurWUiOawNVg4FIM82cviM34r4EzLM_NNM'),(28,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE4MDN9.4-6dMRPfWqLCs4c7VkAaaHtUKsCcGotvCwQwV8G4anM'),(30,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE4MjN9.sKsZfR84Eg1BNJ7z8cQwj3IdVYun687pYwLjpie1gbo'),(29,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE4MTR9.wlDHKIYw9govqPly-4s0UJtlevwY72V0j1WVqJw57dM'),(31,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE4MzF9.uDJbTeVGWFXQYdgZhWtwj3byoM4jJycJo1REIq_lxy0'),(32,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE4Mzh9.ku-LAcVhoE6EMDkDLSb_4wCkfUvZsHk94O4NLjE_XWk'),(33,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE4NTB9.eg8mEddf_oqlD9z902qxDFJI-vxUHBmUsLu5NtKMnsg'),(34,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE4NzV9.uv_BWP2RVmLyjmAluMcZSBv3BnUgFQtRtEpCzkrBGtg'),(35,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE4ODN9.VllLtlQ2xQwAjYKegY5cyUOi5W1GQk3es68-8ZScu2U'),(36,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE4OTF9.yDD57K-In6h6W5IgqIvSNodhvqDTEXwbHq3AJZvVtdI'),(37,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTE5MDF9.cqEkBf6DcmYZQ2T9t3W6RM3riqCIq3LczzYu1pZ25uA'),(3,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTEwNjR9.8-Ej8lFTLm1Vu2KqCQY9DwzPQrdgt3pncliu7Yj8RUY'),(4,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTEwNzZ9._4NL71JULYjT5w4Q_XZbKsyA26n8s4fOgdOv471grGE'),(5,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTEwODd9.IZnmXCRwOuPTxRQCVauGvt8vwOuNzWbmoDSwRTq8004'),(6,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTEwOTV9.-SoJzLYeM8-nfIy2vKv8Gdtg0w86Y6EUNAsrVnCWPjo'),(7,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTExMDd9.0PI3_T0YcjCGcJCzpIZApAA2CHzJvXw5LNQPK5iZ7UE'),(9,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTExMjN9.-W2B-Th0kD-43cZ7XQwPK3v-dsKfP-W9BGV8dZu4oWU'),(8,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTExMTV9.ziRa6A7ZOlF9vXdVN6GnQnAfPDxyPDF67PHrSAbxI3c'),(10,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTExMzJ9.Ucx_eg7XmJQ8ZdJQZ9N_4YOVg2yD0ZuiwxaDP4iIpf0'),(11,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTExNDJ9.YcA3FjMR7gwZzC-wDEk16VboS54hwX1Rzsnu6Md49SA'),(13,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTExNjB9.x0SV85uyfLKNZJJvZKI3wJBz17Ep9FQt9Yfz0Os1O5I'),(12,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTExNTF9.h5Gx2EDP4E2Q6okSPV_JUADgXcDtezW8g_EzxCr1Me8'),(14,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTExNzF9.hWBXWQn-zTmMLn_K69CjHzHP7qmSZtsz-j_KpKIy64U'),(15,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTExODB9.v6qSTAndpHg4zYVuKQ_QatDn-sSgBN-CR__c4aLF1RM'),(16,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTEyMDh9.-1lKekC2dd8iexMEjwY14obML6379kw3elDK1jHFxyE'),(17,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTEyMTd9.-H84zcn7EAXWZFEM96FEKhEvNMDJ3lpP_dX9FghDwiA'),(20,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTEzMjF9.ILgTgsQ9NXaLSKerKQ6Q52n-zV9CTLYQds69w94JJx4'),(38,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI1MzB9.ZVUx0GQ3VTFefdRhFVfP_cKLRfjOPjJoEmlC1u_N7t8'),(39,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI1Mzl9.7oIa65IrocuWQa8dF9xlw-KfbKMswwCAXxMGRiIRfaM'),(40,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI1NDZ9.Y1RZKCJJomSgpt59d8lCGO8uJfBLEqoxpjQwBrvHu18'),(42,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI1NjJ9.HLfpvja_N3lVOuLLyDhQDP6ZU9-lhpYBDyEbjd_-pkM'),(41,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI1NTR9.wdvrWAKZw_vCvQChDdAkBx2Yr22mcr-7kuUVXqNYAuc'),(43,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI1NzB9.DZnEjN9oLgw7DN5mUY7y9ZA7dPuFx3M6lo_RSskCO_Q'),(44,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI1Nzl9.KWb5kb6KRHNU2Pc8xjJ5GBOdQDiMGZ0O668dQOYiGl0'),(45,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI1ODd9.FYPaC1eMXlRMO3_ig_Kqrafn6rsDFolBTCkgi6B1T9A'),(46,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI1OTZ9.-NrW6hD4RctOCthQHN6FkhCto7388TcCGAm1mPl2uz0'),(47,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI2MDR9.felNZUTIvCMry9UnxWTmSvCS57CEqmpIljeCJ7EYYpY'),(48,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTI3NjZ9.vZKvxMAYwYiz9GcDgLVKXoGoeSkfldkyHf3QcoNRBpg'),(49,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTQ0ODZ9.22E9Xq_B1kQdQw3iDUSvNBpOE6vdX8XgtJkl1-xKdCo'),(51,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTU2ODZ9.ZmSpCWr3XWf5IBXodQzwQMPK5sIR5ciJSdsfYp9Iw78'),(50,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTUwODZ9.LZ3pm-PWo6HHz0srMX1U1EAVuPJsbW76YnCAnQ0i6Bo'),(52,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTY0NTB9.Ptxf7SDiQ9dkfAnE4tqiemhMPuO5eZve_1n_pAYT5cI'),(53,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTY1OTN9.rbTgeBd7Jg7GHu6Zd4TAPZ7Jb-td7swpnoeIIx-s6hk'),(54,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5MTY4NTd9.lTsOAQ8pMvv_rfEVMd26OJjXNS2wNaOfUGoWPALSPWs'),(64,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTczMDh9._leNqOvTQRfCLiTq3BiObPXIgfYuEnzrloRO8qBDcVw'),(55,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTE0NjR9.WsjLXXz3NDwLczVG8P2eoxuzH0CFFYezse5rS3UcFNQ'),(67,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTg0Mzh9.5BN8PvBhBEReOMkIzoVVVCZOYKwZk1mC6wQsRKtVB2A'),(65,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTgyNjh9.wmpxBNBs7pVxhbQsNzyCYH3UNwEXffcyV7_cKTteZug'),(66,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTgzNjh9.DOpp9HC7XORGcz6EprKW9kIODhwZa4kG6S2z74HKbEk'),(56,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTIzNDR9.Q7ADTQWXCZYlOb1Ba4U40ViK9jr66G9E16XGVoajpLk'),(69,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTk0ODN9.RJen9PEPBKYMfpBC-422iNjlZxjD6lg4wRbib_kuvAA'),(70,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTk1NDR9.SwL-V_fg5LWKtNBo3pQeUN76cgzo8S94Al_h_VRWD2k'),(71,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTk1NjB9.N2ZmZOZUTUZKmAN3dDt-5qXWkA7Bg-G08lOuAsJHVHo'),(72,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTk2MDl9.6FeYS5EB1wj9RiiVZlBMPIZljAf4lv9iRV0-SVms5xY'),(73,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTk2Mjd9.-RzFix0SO6DYLTJ7GuvweB5uSfhvUEJ6ETZf4Op0GH8'),(74,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTk3MjF9.sSzrr9nfPOEbZ5gkT5VQKjcMhDSSbudswus68dHZOSc'),(75,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTk5ODZ9.rjX4bq8rmzMp28LN3TS_ikj9T9Yl_L0TF35eUcxOUvA'),(68,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTkzNDN9.hF2ZYbep6-9fzOjI06rJl4uSQyGMB9Rw_hbSSWuSC1o'),(58,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTM4NDR9.ri1u-nfHkFOKst5HClF03DfCtkQxghQLhFdHMpYXl5M'),(59,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTM4NjN9.yEnnWO4fhJirmVsVysof7cCVE39Hicpn8j2GTB5fgu4'),(57,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTMzNzN9.xfMIJzYgBPDIF_4H7AO1gA4_dlzOjM9XckxOEp-zeCc'),(61,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTQ1NDl9.LhMt02uG2vhIyJ-whxjV6eN0UOa3UO7gnZZFUmw2uM0'),(60,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTQyMjd9.EA4sspKAvnVQaoYGfs7COOdWPLnBqLGp5mhz6_zgJSw'),(62,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTUyMzR9.dYngQoPEyYdkprm2xyiffaj2iYGXoekyykPf51Gooig'),(63,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ikp1YW4gTHVpcyBMb3BleiBkZWwgQmFyY28iLCJleHAiOjE2NzY5OTYxMDV9.vOIieHsXygh1pLGctr46C4X9dS4fivoZvAyL_ArbKyQ'),(26,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Imp1YW4iLCJleHAiOjE2NzY5MTE2NzB9.hJMTYbbTytak2VzceTh-0igL3Yr112c9kHxkj3f4tBs'),(18,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Imp1YW4iLCJleHAiOjE2NzY5MTEyNzF9.Pi2OK_DTriwmo7BvvCPOG_LqB66JyMlVjEBpxrNmIqc'),(19,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Imp1YW4iLCJleHAiOjE2NzY5MTEyODV9.-wg3-hjvkXr3i21dxZm3jchoC5bbTA8Wn8tz2GF1GHA');
/*!40000 ALTER TABLE `blacklist_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(10,'blacklist','blacklist'),(11,'blacklist2FA','blacklist2fa'),(4,'contenttypes','contenttype'),(13,'incidents','incident'),(14,'incidents','notification'),(12,'rent','rent'),(5,'sessions','session'),(6,'stations','bike'),(8,'stations','slot'),(7,'stations','station'),(9,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-02-20 15:48:45.866669'),(2,'contenttypes','0002_remove_content_type_name','2023-02-20 15:48:45.907959'),(3,'auth','0001_initial','2023-02-20 15:48:46.050533'),(4,'auth','0002_alter_permission_name_max_length','2023-02-20 15:48:46.089424'),(5,'auth','0003_alter_user_email_max_length','2023-02-20 15:48:46.098119'),(6,'auth','0004_alter_user_username_opts','2023-02-20 15:48:46.106937'),(7,'auth','0005_alter_user_last_login_null','2023-02-20 15:48:46.114842'),(8,'auth','0006_require_contenttypes_0002','2023-02-20 15:48:46.118624'),(9,'auth','0007_alter_validators_add_error_messages','2023-02-20 15:48:46.126469'),(10,'auth','0008_alter_user_username_max_length','2023-02-20 15:48:46.136112'),(11,'auth','0009_alter_user_last_name_max_length','2023-02-20 15:48:46.144109'),(12,'auth','0010_alter_group_name_max_length','2023-02-20 15:48:46.158866'),(13,'auth','0011_update_proxy_permissions','2023-02-20 15:48:46.166346'),(14,'auth','0012_alter_user_first_name_max_length','2023-02-20 15:48:46.174132'),(15,'user','0001_initial','2023-02-20 15:48:46.359559'),(16,'admin','0001_initial','2023-02-20 15:48:46.437331'),(17,'admin','0002_logentry_remove_auto_add','2023-02-20 15:48:46.449076'),(18,'admin','0003_logentry_add_action_flag_choices','2023-02-20 15:48:46.462032'),(19,'blacklist','0001_initial','2023-02-20 15:48:46.485834'),(20,'blacklist2FA','0001_initial','2023-02-20 15:48:46.503929'),(21,'blacklist2FA','0002_initial','2023-02-20 15:48:46.543363'),(22,'stations','0001_initial','2023-02-20 15:48:46.646217'),(23,'incidents','0001_initial','2023-02-20 15:48:46.703339'),(24,'incidents','0002_initial','2023-02-20 15:48:46.829260'),(25,'rent','0001_initial','2023-02-20 15:48:46.936692'),(26,'rent','0002_initial','2023-02-20 15:48:46.991411'),(27,'sessions','0001_initial','2023-02-20 15:48:47.018227');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents_incident`
--

DROP TABLE IF EXISTS `incidents_incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents_incident` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `body` varchar(300) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `slot_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `incidents_incident_modified_at_dedf2cef` (`modified_at`),
  KEY `incidents_incident_slot_id_2ae57628_fk_stations_slot_id` (`slot_id`),
  KEY `incidents_incident_user_id_d45fd8f9_fk_user_user_id` (`user_id`),
  CONSTRAINT `incidents_incident_slot_id_2ae57628_fk_stations_slot_id` FOREIGN KEY (`slot_id`) REFERENCES `stations_slot` (`id`),
  CONSTRAINT `incidents_incident_user_id_d45fd8f9_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents_incident`
--

LOCK TABLES `incidents_incident` WRITE;
/*!40000 ALTER TABLE `incidents_incident` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidents_incident` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `incidents_incident_AU` AFTER UPDATE ON `incidents_incident` FOR EACH ROW BEGIN
IF NEW.status = 'in_progress' THEN
INSERT INTO incidents_notification (body, user_id, seen, created_at, modified_at) VALUES (CONCAT('The incidence: ', OLD.slug, ' is in progress.'), OLD.user_id, FALSE, NOW(), NOW());
END IF;
IF NEW.status = 'resolved' THEN INSERT INTO incidents_notification (body, user_id, seen, created_at, modified_at) VALUES 
(CONCAT('The incidence: ', OLD.slug, ' is resolved.'), OLD.user_id, FALSE, NOW(), NOW());
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `incidents_notification`
--

DROP TABLE IF EXISTS `incidents_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `seen` tinyint(1) NOT NULL,
  `body` varchar(300) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `incidents_notification_modified_at_fd71004e` (`modified_at`),
  KEY `incidents_notification_user_id_640b50dc_fk_user_user_id` (`user_id`),
  CONSTRAINT `incidents_notification_user_id_640b50dc_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents_notification`
--

LOCK TABLES `incidents_notification` WRITE;
/*!40000 ALTER TABLE `incidents_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidents_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent_rent`
--

DROP TABLE IF EXISTS `rent_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent_rent` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `bike_id` bigint NOT NULL,
  `end_slot_id` bigint DEFAULT NULL,
  `start_slot_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rent_rent_bike_id_4ecb3af0_fk_stations_bike_id` (`bike_id`),
  KEY `rent_rent_end_slot_id_e6928abe_fk_stations_slot_id` (`end_slot_id`),
  KEY `rent_rent_start_slot_id_75e1b348_fk_stations_slot_id` (`start_slot_id`),
  KEY `rent_rent_user_id_07f92b1b_fk_user_user_id` (`user_id`),
  CONSTRAINT `rent_rent_bike_id_4ecb3af0_fk_stations_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `stations_bike` (`id`),
  CONSTRAINT `rent_rent_end_slot_id_e6928abe_fk_stations_slot_id` FOREIGN KEY (`end_slot_id`) REFERENCES `stations_slot` (`id`),
  CONSTRAINT `rent_rent_start_slot_id_75e1b348_fk_stations_slot_id` FOREIGN KEY (`start_slot_id`) REFERENCES `stations_slot` (`id`),
  CONSTRAINT `rent_rent_user_id_07f92b1b_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_rent`
--

LOCK TABLES `rent_rent` WRITE;
/*!40000 ALTER TABLE `rent_rent` DISABLE KEYS */;
/*!40000 ALTER TABLE `rent_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations_bike`
--

DROP TABLE IF EXISTS `stations_bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations_bike` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations_bike`
--

LOCK TABLES `stations_bike` WRITE;
/*!40000 ALTER TABLE `stations_bike` DISABLE KEYS */;
INSERT INTO `stations_bike` VALUES (1,'victoria-jensen-vsj99p','Victoria Jensen','unused'),(2,'dr-troy-tyler-md-qmb4iu','Dr. Troy Tyler MD','unused'),(3,'aaron-jensen-v3agw1','Aaron Jensen','used'),(4,'austin-mendez-ccvrme','Austin Mendez','used'),(5,'douglas-phillips-qeas2a','Douglas Phillips','unused'),(6,'luis-willis-vuqpmj','Luis Willis','used'),(7,'robert-medina-8hb1u3','Robert Medina','unused'),(8,'suzanne-morgan-ygyfvw','Suzanne Morgan','used'),(9,'jared-jones-s36fle','Jared Jones','used'),(10,'destiny-doyle-9cmsle','Destiny Doyle','used'),(11,'william-ramirez-vvnjl7','William Ramirez','used'),(12,'catherine-olson-qvazci','Catherine Olson','unused'),(13,'alyssa-gray-vicvzb','Alyssa Gray','unused'),(14,'charles-waters-ukel29','Charles Waters','used'),(15,'pamela-collins-oi9sdx','Pamela Collins','used'),(16,'diana-hobbs-gdbm8b','Diana Hobbs','used'),(17,'laura-anderson-bdq2au','Laura Anderson','used'),(18,'carlos-rodriguez-95wknq','Carlos Rodriguez','used'),(19,'donna-mclean-vlft3o','Donna Mclean','used'),(20,'jessica-roy-h6lms6','Jessica Roy','used'),(21,'alexander-allen-wd6ge1','Alexander Allen','used'),(22,'brendan-rodriguez-t1i074','Brendan Rodriguez','unused'),(23,'daniel-patton-du54yu','Daniel Patton','used'),(24,'melissa-collins-hkssmz','Melissa Collins','used'),(25,'theresa-bryant-qlqj8t','Theresa Bryant','used'),(26,'julie-howell-md-khrdh2','Julie Howell MD','used'),(27,'antonio-cook-5jr2sl','Antonio Cook','used'),(28,'john-hayes-9prtdq','John Hayes','used'),(29,'heather-mathis-6alhtu','Heather Mathis','unused'),(30,'laura-wilson-p4f8it','Laura Wilson','unused'),(31,'jennifer-dean-t2lrlj','Jennifer Dean','used'),(32,'jennifer-williams-ws91mk','Jennifer Williams','used'),(33,'michelle-smith-hqf280','Michelle Smith','used'),(34,'alan-branch-61rmpf','Alan Branch','used'),(35,'kyle-roy-qlqav7','Kyle Roy','used'),(36,'tracey-keith-kgrx23','Tracey Keith','unused'),(37,'kelly-carr-r3x6kf','Kelly Carr','unused'),(38,'elizabeth-robinson-md-hvuxqa','Elizabeth Robinson MD','unused'),(39,'benjamin-wilson-y7h0yw','Benjamin Wilson','unused'),(40,'jessica-conway-035jw2','Jessica Conway','used'),(41,'daniel-green-obkspe','Daniel Green','unused'),(42,'emma-chen-yrsspn','Emma Chen','used'),(43,'erika-cole-hqkdoc','Erika Cole','unused'),(44,'whitney-barnes-gmywyh','Whitney Barnes','used'),(45,'michael-meadows-jqwnld','Michael Meadows','used'),(46,'crystal-sutton-8ele4d','Crystal Sutton','used'),(47,'theresa-spencer-ujthaa','Theresa Spencer','used'),(48,'amy-jimenez-2wis9s','Amy Jimenez','unused'),(49,'nicole-lee-2l3kz7','Nicole Lee','used'),(50,'maurice-holmes-cs7sgl','Maurice Holmes','unused');
/*!40000 ALTER TABLE `stations_bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations_slot`
--

DROP TABLE IF EXISTS `stations_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations_slot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `bike_id` bigint DEFAULT NULL,
  `station_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bike_id` (`bike_id`),
  KEY `stations_slot_station_id_5681ed9a_fk_stations_station_id` (`station_id`),
  CONSTRAINT `stations_slot_bike_id_ff035efc_fk_stations_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `stations_bike` (`id`),
  CONSTRAINT `stations_slot_station_id_5681ed9a_fk_stations_station_id` FOREIGN KEY (`station_id`) REFERENCES `stations_station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations_slot`
--

LOCK TABLES `stations_slot` WRITE;
/*!40000 ALTER TABLE `stations_slot` DISABLE KEYS */;
INSERT INTO `stations_slot` VALUES (11,'unused',NULL,2),(12,'unused',NULL,2),(13,'used',12,2),(14,'used',41,2),(15,'used',1,2),(16,'used',43,3),(17,'unused',NULL,3),(18,'used',39,3),(19,'used',13,3),(20,'used',38,3),(21,'unused',NULL,4),(22,'used',2,4),(23,'unused',NULL,4),(24,'unused',NULL,4),(25,'used',48,4),(26,'used',50,5),(27,'used',37,5),(28,'used',36,5),(29,'used',7,5),(30,'used',5,5),(31,'used',29,6),(32,'used',30,6),(33,'unused',NULL,6),(34,'unused',NULL,6),(35,'used',22,6);
/*!40000 ALTER TABLE `stations_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations_station`
--

DROP TABLE IF EXISTS `stations_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations_station` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations_station`
--

LOCK TABLES `stations_station` WRITE;
/*!40000 ALTER TABLE `stations_station` DISABLE KEYS */;
INSERT INTO `stations_station` VALUES (2,'Marilyn Huang','marilyn-huang-it22gt','active','https://cdn.pixabay.com/photo/2017/03/05/20/16/baby-cat-2119755__480.jpg',-0.6017619874026919,38.82643873013639),(3,'Gary Peters','gary-peters-hjb6sx','active','https://cdn.pixabay.com/photo/2017/05/13/09/46/cat-2309126__480.jpg',-0.614718016094318,38.816135820873875),(4,'Robert Jennings','robert-jennings-ddmuk3','active','https://cdn.pixabay.com/photo/2017/05/25/07/40/cat-2342562__480.jpg',-0.6079926247636944,38.819714166956004),(5,'Michael Scott','michael-scott-q06ayo','active','https://cdn.pixabay.com/photo/2014/09/18/20/17/cat-451377__480.jpg',-0.5943218982354332,38.821701764826074),(6,'Anthony Schultz','anthony-schultz-f0gn4v','active','https://cdn.pixabay.com/photo/2014/01/17/14/53/cat-246933__480.jpg',-0.612995683932653,38.82558174819851);
/*!40000 ALTER TABLE `stations_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `types` varchar(10) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `countTokens` int NOT NULL,
  `countLogs` int NOT NULL,
  `is_2FA` tinyint(1) NOT NULL,
  `tokenForgotPassword` varchar(254) DEFAULT NULL,
  `type_register` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tokenForgotPassword` (`tokenForgotPassword`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (1,'',NULL,0,'050ec92f-c232-7947-b448-1fcbdb4347f5','Juan Luis Lopez del Barco','juanluislopezdaw@gmail.com',1,'admin',0,0,10,1,NULL,'google'),(2,'pbkdf2_sha256$390000$jh0KGpsrY6SJbe23mMM7AF$WBCdCl5hQCwWvX9hq6Z6aMt334ltUrI0BKhxWcART2g=',NULL,0,'68a6293f-e652-0c41-0e90-e613bf817bf9','juan','juan@juan.com',0,'client',0,0,9,0,NULL,'email');
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `user_user_AU` AFTER UPDATE ON `user_user` FOR EACH ROW BEGIN
IF NEW.tokenForgotPassword IS NOT NULL THEN
INSERT INTO incidents_notification (body, user_id, seen, created_at, modified_at) VALUES (CONCAT('Please put a new password.'), OLD.id, FALSE, NOW(), NOW());
END IF;
IF NEW.tokenForgotPassword IS NULL THEN INSERT INTO incidents_notification (body, user_id, seen, created_at, modified_at) VALUES 
(CONCAT('Your new password is updated correctly.'), OLD.id, FALSE, NOW(), NOW());
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_groups_user_id_group_id_bb60391f_uniq` (`user_id`,`group_id`),
  KEY `user_user_groups_group_id_c57f13c0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_user_groups_group_id_c57f13c0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_user_groups_user_id_13f9a20d_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq` (`user_id`,`permission_id`),
  KEY `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_user_permissions_user_id_31782f58_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_user_permissions`
--

LOCK TABLES `user_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21 18:56:45
