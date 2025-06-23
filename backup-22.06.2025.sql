/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sakura_e_com
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-0ubuntu0.24.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) NOT NULL,
  `parent_address_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `postcode` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `vat_id` varchar(191) DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_parent_address_id_foreign` (`parent_address_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES
(30,'customer',NULL,4,NULL,NULL,'idjfjnv','ndkdjf',NULL,'rkjfdkjf','pdfkoofkj','dlfkmf','dfkmfk','BY','129947','qdfkvf@kcvkdfk.com','375295996042',NULL,0,0,NULL,'2025-03-01 10:29:30','2025-03-01 10:29:30'),
(31,'cart_billing',30,4,18,NULL,'idjfjnv','ndkdjf',NULL,'rkjfdkjf','pdfkoofkj','dlfkmf','dfkmfk','BY','129947','qdfkvf@kcvkdfk.com','375295996042',NULL,0,1,NULL,'2025-03-01 10:29:35','2025-03-01 10:29:35'),
(32,'cart_shipping',30,4,18,NULL,'idjfjnv','ndkdjf',NULL,'rkjfdkjf','pdfkoofkj','dlfkmf','dfkmfk','BY','129947','qdfkvf@kcvkdfk.com','375295996042',NULL,0,0,NULL,'2025-03-01 10:29:35','2025-03-01 10:29:35'),
(33,'order_shipping',NULL,NULL,NULL,8,'idjfjnv','ndkdjf',NULL,'rkjfdkjf','pdfkoofkj','dlfkmf','dfkmfk','BY','129947','qdfkvf@kcvkdfk.com','375295996042',NULL,0,0,NULL,'2025-03-01 10:29:55','2025-03-01 10:29:55'),
(34,'order_billing',NULL,NULL,NULL,8,'idjfjnv','ndkdjf',NULL,'rkjfdkjf','pdfkoofkj','dlfkmf','dfkmfk','BY','129947','qdfkvf@kcvkdfk.com','375295996042',NULL,0,0,NULL,'2025-03-01 10:29:55','2025-03-01 10:29:55'),
(35,'customer',NULL,6,NULL,NULL,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028','',0,0,NULL,'2025-03-04 23:17:31','2025-06-04 13:27:42'),
(36,'cart_billing',35,6,21,NULL,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,1,NULL,'2025-03-04 23:18:26','2025-03-04 23:18:26'),
(37,'cart_shipping',35,6,21,NULL,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-04 23:18:26','2025-03-04 23:18:26'),
(38,'order_shipping',NULL,NULL,NULL,9,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-04 23:28:16','2025-03-04 23:28:16'),
(39,'order_billing',NULL,NULL,NULL,9,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-04 23:28:16','2025-03-04 23:28:16'),
(40,'customer',NULL,6,NULL,NULL,'dfg','dfgf',NULL,'gfdg','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 08:44:51','2025-03-05 08:44:51'),
(41,'cart_billing',40,6,22,NULL,'dfg','dfgf',NULL,'gfdg','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,1,NULL,'2025-03-05 08:45:00','2025-03-05 08:45:00'),
(42,'cart_shipping',40,6,22,NULL,'dfg','dfgf',NULL,'gfdg','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 08:45:00','2025-03-05 08:45:00'),
(43,'order_shipping',NULL,NULL,NULL,10,'dfg','dfgf',NULL,'gfdg','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 08:45:12','2025-03-05 08:45:12'),
(44,'order_billing',NULL,NULL,NULL,10,'dfg','dfgf',NULL,'gfdg','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 08:45:12','2025-03-05 08:45:12'),
(45,'cart_billing',40,6,23,NULL,'dfg','dfgf',NULL,'gfdg','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,1,NULL,'2025-03-05 08:48:03','2025-03-05 08:48:03'),
(46,'cart_shipping',40,6,23,NULL,'dfg','dfgf',NULL,'gfdg','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 08:48:03','2025-03-05 08:48:03'),
(47,'order_shipping',NULL,NULL,NULL,11,'dfg','dfgf',NULL,'gfdg','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 08:48:11','2025-03-05 08:48:11'),
(48,'order_billing',NULL,NULL,NULL,11,'dfg','dfgf',NULL,'gfdg','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 08:48:11','2025-03-05 08:48:11'),
(49,'cart_billing',35,6,24,NULL,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,1,NULL,'2025-03-05 14:41:59','2025-03-05 14:41:59'),
(50,'cart_shipping',35,6,24,NULL,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 14:41:59','2025-03-05 14:41:59'),
(51,'order_shipping',NULL,NULL,NULL,12,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 14:45:33','2025-03-05 14:45:33'),
(52,'order_billing',NULL,NULL,NULL,12,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-03-05 14:45:33','2025-03-05 14:45:33'),
(53,'cart_billing',35,6,35,NULL,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,1,NULL,'2025-06-04 14:51:08','2025-06-04 14:51:08'),
(54,'cart_shipping',35,6,35,NULL,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-06-04 14:51:08','2025-06-04 14:51:08'),
(55,'order_shipping',NULL,NULL,NULL,13,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-06-04 14:51:19','2025-06-04 14:51:19'),
(56,'order_billing',NULL,NULL,NULL,13,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-06-04 14:51:19','2025-06-04 14:51:19'),
(57,'cart_billing',35,6,36,NULL,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,1,NULL,'2025-06-04 17:05:49','2025-06-04 17:05:49'),
(58,'cart_shipping',35,6,36,NULL,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-06-04 17:05:49','2025-06-04 17:05:49'),
(59,'order_shipping',NULL,NULL,NULL,14,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-06-04 17:06:07','2025-06-04 17:06:07'),
(60,'order_billing',NULL,NULL,NULL,14,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-06-04 17:06:07','2025-06-04 17:06:07'),
(65,'cart_billing',NULL,8,43,NULL,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','80292614028',NULL,0,1,NULL,'2025-06-06 14:07:33','2025-06-06 14:07:33'),
(66,'cart_shipping',NULL,8,43,NULL,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','80292614028',NULL,0,0,NULL,'2025-06-06 14:07:33','2025-06-06 14:07:33'),
(67,'order_shipping',NULL,NULL,NULL,15,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','80292614028',NULL,0,0,NULL,'2025-06-06 14:07:58','2025-06-06 14:07:58'),
(68,'order_billing',NULL,NULL,NULL,15,'Тест2','Тест2',NULL,'лвлоывол','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','80292614028',NULL,0,0,NULL,'2025-06-06 14:07:58','2025-06-06 14:07:58'),
(69,'cart_billing',35,6,46,NULL,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,1,NULL,'2025-06-08 00:55:59','2025-06-08 00:55:59'),
(70,'cart_shipping',35,6,46,NULL,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-06-08 00:55:59','2025-06-08 00:55:59'),
(71,'order_shipping',NULL,NULL,NULL,16,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-06-08 01:11:37','2025-06-08 01:11:37'),
(72,'order_billing',NULL,NULL,NULL,16,'Тест2','Тест2',NULL,'','1','Гродно','Гродненская область','BY','122343','test2@gmail.com','375292614028',NULL,0,0,NULL,'2025-06-08 01:11:37','2025-06-08 01:11:37');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) unsigned NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES
(1,'Admin1','admin@example.com','$2y$10$zvOQCU0HpKzj7SJuzPsYE.0WoddGGWICp64IEXHmBoAMXdw5vq7B2','biW3Cht3CylGma6vTPgyT69fAeHvJS5WBHLuDFNNEizhKRZzZiOyn2wjW5LtCe5CCxw6ip3feQLGHyL2',1,1,NULL,NULL,'2025-02-25 19:54:31','2025-06-22 11:03:49'),
(2,'Админ 2','admin2@gmail.com','$2y$10$8kBxLOIIFW2bJPw0y1FNkeE27WLI0ugqqsuIMYI/a8.wo0W4sdXNi','6jGmpx8NWSTCpJks3peOC7QBJZS0k6O0RwAauEpUuIqDwHP27W7mo5H73I2KEEUSkSfE2aB7qJN80c7t',1,1,NULL,NULL,'2025-06-22 11:02:22','2025-06-22 11:02:22');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_families`
--

DROP TABLE IF EXISTS `attribute_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_families` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_families`
--

LOCK TABLES `attribute_families` WRITE;
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` VALUES
(1,'default','По умолчанию',0,1),
(4,'jewelry','Украшения',0,1),
(5,'for_home','Для дома',0,1),
(6,'dishes','Посуда',0,1),
(8,'Antique','Антиквариат',0,1),
(9,'Weapon','Оружие',0,1),
(10,'For_home_','Бансай',0,1),
(11,'Vase_interior','Ваза интерьер',0,1),
(12,'Rock_garden_interior','Сад камней (интерьер)',0,1),
(13,'screen_interior','Ширма (интерьер)',0,1),
(14,'Omamori','Омамори (мини сувениры)',0,1),
(15,'Maneki_neko','Манеки нэко (мини сувениры)',0,1),
(16,'Fan','Веер',0,1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_group_mappings`
--

DROP TABLE IF EXISTS `attribute_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_group_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_mappings`
--

LOCK TABLES `attribute_group_mappings` WRITE;
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` VALUES
(1,1,2),
(1,23,1),
(1,31,1),
(1,39,1),
(1,55,1),
(1,62,1),
(1,69,1),
(1,76,1),
(1,83,1),
(1,90,1),
(1,97,1),
(1,104,1),
(1,111,1),
(2,1,4),
(2,23,3),
(2,31,3),
(2,39,3),
(2,55,3),
(2,62,3),
(2,69,3),
(2,76,3),
(2,83,3),
(2,90,3),
(2,97,3),
(2,104,3),
(2,111,3),
(3,1,5),
(3,23,4),
(3,31,4),
(3,39,4),
(3,55,4),
(3,62,4),
(3,69,4),
(3,76,4),
(3,83,4),
(3,90,4),
(3,97,4),
(3,104,4),
(3,111,4),
(5,6,1),
(5,28,1),
(5,36,1),
(5,44,1),
(5,60,1),
(5,67,1),
(5,74,1),
(5,81,1),
(5,88,1),
(5,95,1),
(5,102,1),
(5,109,1),
(5,116,1),
(6,6,2),
(6,28,2),
(6,36,2),
(6,44,2),
(6,60,2),
(6,67,2),
(6,74,2),
(6,81,2),
(6,88,2),
(6,95,2),
(6,102,2),
(6,109,2),
(6,116,2),
(7,6,3),
(7,28,3),
(7,36,3),
(7,44,3),
(7,60,3),
(7,67,3),
(7,74,3),
(7,81,3),
(7,88,3),
(7,95,3),
(7,102,3),
(7,109,3),
(7,116,3),
(8,6,4),
(8,28,4),
(8,36,4),
(8,44,4),
(8,60,4),
(8,67,4),
(8,74,4),
(8,81,4),
(8,88,4),
(8,95,4),
(8,102,4),
(8,109,4),
(8,116,4),
(9,2,1),
(9,24,1),
(9,32,1),
(9,40,1),
(9,56,1),
(9,63,1),
(9,70,1),
(9,77,1),
(9,84,1),
(9,91,1),
(9,98,1),
(9,105,1),
(9,112,1),
(10,2,2),
(10,24,2),
(10,32,2),
(10,40,2),
(10,56,2),
(10,63,2),
(10,70,2),
(10,77,2),
(10,84,2),
(10,91,2),
(10,98,2),
(10,105,2),
(10,112,2),
(11,4,1),
(11,26,1),
(11,34,1),
(11,42,1),
(11,58,1),
(11,65,1),
(11,72,1),
(11,79,1),
(11,86,1),
(11,93,1),
(11,100,1),
(11,107,1),
(11,114,1),
(12,4,2),
(12,26,2),
(12,34,2),
(13,4,3),
(13,26,3),
(13,34,3),
(13,42,2),
(13,58,2),
(13,65,2),
(13,72,2),
(13,79,2),
(13,86,2),
(13,93,2),
(13,100,2),
(13,107,2),
(13,114,2),
(19,5,1),
(19,27,1),
(19,35,1),
(19,43,1),
(19,59,1),
(19,66,1),
(19,73,1),
(19,80,1),
(19,87,1),
(19,94,1),
(19,108,1),
(19,115,1),
(21,5,2),
(21,27,2),
(21,35,2),
(21,43,2),
(21,59,2),
(21,66,2),
(21,73,2),
(21,80,2),
(21,87,2),
(21,94,2),
(21,108,2),
(21,115,2),
(22,5,3),
(22,27,3),
(22,35,3),
(22,43,3),
(22,59,3),
(22,66,3),
(22,73,3),
(22,80,3),
(22,87,3),
(22,94,3),
(22,101,1),
(22,108,3),
(22,115,3),
(24,1,8),
(24,31,7),
(26,6,5),
(26,28,5),
(26,36,5),
(26,44,5),
(26,60,5),
(26,67,5),
(26,74,5),
(26,81,5),
(26,88,5),
(26,95,5),
(26,102,5),
(26,109,5),
(26,116,5),
(27,1,3),
(27,23,2),
(27,31,2),
(27,39,2),
(27,55,2),
(27,62,2),
(27,69,2),
(27,76,2),
(27,83,2),
(27,90,2),
(27,97,2),
(27,104,2),
(27,111,2),
(28,7,1),
(28,29,1),
(28,37,1),
(28,45,1),
(28,61,1),
(28,68,1),
(28,75,1),
(28,82,1),
(28,89,1),
(28,96,1),
(28,103,1),
(28,110,1),
(28,117,1),
(34,30,3),
(35,30,4),
(36,30,2),
(37,38,2),
(38,38,3),
(39,38,1),
(40,39,5),
(43,39,6),
(44,39,7),
(44,55,6),
(44,76,7),
(44,97,8),
(44,104,7),
(44,111,7),
(45,39,8),
(47,39,10),
(47,55,5),
(47,69,8),
(47,76,8),
(47,83,7),
(47,90,9),
(47,97,9),
(47,104,8),
(48,83,8),
(49,39,9),
(50,39,11),
(50,104,10),
(50,111,9),
(51,62,5),
(52,62,6),
(53,62,11),
(54,62,10),
(55,62,8),
(56,62,9),
(57,62,7),
(58,69,5),
(58,76,5),
(58,83,5),
(58,90,5),
(59,76,6),
(59,83,6),
(59,90,6),
(60,69,6),
(61,69,9),
(62,69,7),
(62,76,9),
(62,90,7),
(63,76,10),
(64,90,8),
(65,97,5),
(65,104,5),
(65,111,5),
(66,97,6),
(66,104,6),
(66,111,6),
(67,97,7),
(67,104,9),
(67,111,8),
(68,111,10);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) DEFAULT NULL,
  `attribute_family_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `column` int(11) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES
(1,'general',1,'Общее',1,1,0),
(2,'description',1,'Описание',1,2,0),
(3,'meta_description',1,'Мета-описание',1,3,0),
(4,'price',1,'Цена',2,1,0),
(5,'shipping',1,'Доставка',2,2,0),
(6,'settings',1,'Настройки',2,3,0),
(7,'inventories',1,'Инвентарь',2,4,0),
(23,'general',4,'Общее',1,1,1),
(24,'description',4,'Описание',1,2,1),
(25,'meta_description',4,'Мета-описание',1,3,1),
(26,'price',4,'Цена',2,1,1),
(27,'shipping',4,'Доставка',2,2,1),
(28,'settings',4,'Настройки',2,3,1),
(29,'inventories',4,'Инвентарь',2,4,1),
(30,'Osnovnoe',4,'Оснвоное',1,4,1),
(31,'general',5,'Общее',1,1,1),
(32,'description',5,'Описание',1,2,1),
(33,'meta_description',5,'Мета-описание',1,3,1),
(34,'price',5,'Цена',2,1,1),
(35,'shipping',5,'Доставка',2,2,1),
(36,'settings',5,'Настройки',2,3,1),
(37,'inventories',5,'Инвентарь',2,4,1),
(38,'for_home_osnovnoe',5,'Основное',1,4,1),
(39,'general',6,'Общее',1,1,1),
(40,'description',6,'Описание',1,2,1),
(41,'meta_description',6,'Мета-описание',1,3,1),
(42,'price',6,'Цена',2,1,1),
(43,'shipping',6,'Доставка',2,2,1),
(44,'settings',6,'Настройки',2,3,1),
(45,'inventories',6,'Инвентарь',2,4,1),
(55,'general',8,'Общее',1,1,1),
(56,'description',8,'Описание',1,2,1),
(57,'meta_description',8,'Мета-описание',1,3,1),
(58,'price',8,'Цена',2,1,1),
(59,'shipping',8,'Доставка',2,2,1),
(60,'settings',8,'Настройки',2,3,1),
(61,'inventories',8,'Инвентарь',2,4,1),
(62,'general',9,'Общее',1,1,1),
(63,'description',9,'Описание',1,2,1),
(64,'meta_description',9,'Мета-описание',1,3,1),
(65,'price',9,'Цена',2,1,1),
(66,'shipping',9,'Доставка',2,2,1),
(67,'settings',9,'Настройки',2,3,1),
(68,'inventories',9,'Инвентарь',2,4,1),
(69,'general',10,'Общее',1,1,1),
(70,'description',10,'Описание',1,2,1),
(71,'meta_description',10,'Мета-описание',1,3,1),
(72,'price',10,'Цена',2,1,1),
(73,'shipping',10,'Доставка',2,2,1),
(74,'settings',10,'Настройки',2,3,1),
(75,'inventories',10,'Инвентарь',2,4,1),
(76,'general',11,'Общее',1,1,1),
(77,'description',11,'Описание',1,2,1),
(78,'meta_description',11,'Мета-описание',1,3,1),
(79,'price',11,'Цена',2,1,1),
(80,'shipping',11,'Доставка',2,2,1),
(81,'settings',11,'Настройки',2,3,1),
(82,'inventories',11,'Инвентарь',2,4,1),
(83,'general',12,'Общее',1,1,1),
(84,'description',12,'Описание',1,2,1),
(85,'meta_description',12,'Мета-описание',1,3,1),
(86,'price',12,'Цена',2,1,1),
(87,'shipping',12,'Доставка',2,2,1),
(88,'settings',12,'Настройки',2,3,1),
(89,'inventories',12,'Инвентарь',2,4,1),
(90,'general',13,'Общее',1,1,1),
(91,'description',13,'Описание',1,2,1),
(92,'meta_description',13,'Мета-описание',1,3,1),
(93,'price',13,'Цена',2,1,1),
(94,'shipping',13,'Доставка',2,2,1),
(95,'settings',13,'Настройки',2,3,1),
(96,'inventories',13,'Инвентарь',2,4,1),
(97,'general',14,'Общее',1,1,1),
(98,'description',14,'Описание',1,2,1),
(99,'meta_description',14,'Мета-описание',1,3,1),
(100,'price',14,'Цена',2,1,1),
(101,'shipping',14,'Доставка',2,2,1),
(102,'settings',14,'Настройки',2,3,1),
(103,'inventories',14,'Инвентарь',2,4,1),
(104,'general',15,'Общее',1,1,1),
(105,'description',15,'Описание',1,2,1),
(106,'meta_description',15,'Мета-описание',1,3,1),
(107,'price',15,'Цена',2,1,1),
(108,'shipping',15,'Доставка',2,2,1),
(109,'settings',15,'Настройки',2,3,1),
(110,'inventories',15,'Инвентарь',2,4,1),
(111,'general',16,'Общее',1,1,1),
(112,'description',16,'Описание',1,2,1),
(113,'meta_description',16,'Мета-описание',1,3,1),
(114,'price',16,'Цена',2,1,1),
(115,'shipping',16,'Доставка',2,2,1),
(116,'settings',16,'Настройки',2,3,1),
(117,'inventories',16,'Инвентарь',2,4,1);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES
(6,6,'ru','S'),
(7,7,'ru','M'),
(8,8,'ru','L'),
(9,9,'ru','XL'),
(15,6,'en','S'),
(16,7,'en','M'),
(17,8,'en','L'),
(18,9,'en','XL'),
(19,10,'ru','XL'),
(20,10,'en','XL'),
(53,27,'ru','Золото'),
(54,27,'en','Gold'),
(55,28,'ru','Серебро'),
(56,28,'en','Silver'),
(57,29,'ru','Дерево'),
(58,29,'en','Wood'),
(59,30,'ru','Кольцо'),
(60,30,'en','Ring'),
(61,31,'ru','Серьги'),
(62,31,'en','Earrings'),
(63,32,'ru','Ожерелья'),
(64,32,'en','Necklaces'),
(65,33,'ru','Браслеты'),
(66,33,'en','Bracelets'),
(67,34,'ru','Бюджетные'),
(68,34,'en','Budget'),
(69,35,'ru','Средний сегмент'),
(70,35,'en','Middle segment'),
(71,36,'ru','Люксовые'),
(72,36,'en','Luxury'),
(73,37,'ru','Мебель'),
(74,37,'en','Furniture'),
(75,38,'ru','Декор'),
(76,38,'en','Decor'),
(77,39,'ru','Текстиль'),
(78,39,'en','Textile'),
(79,40,'ru','Дерево'),
(80,40,'en','Wood'),
(81,41,'ru','Бумага'),
(82,41,'en','Paper'),
(83,42,'ru','Ткани'),
(84,42,'en','Fabrics'),
(85,43,'ru','Бюджетные'),
(86,43,'en','Budget'),
(87,44,'ru','Средний сегмент'),
(88,44,'en','Middle segment'),
(89,45,'ru','Премиум'),
(90,45,'en','Premium'),
(93,47,'ru','Керамика'),
(94,47,'en','Ceramics'),
(95,48,'ru','Стекло'),
(96,48,'en','Glass'),
(103,52,'ru','Кружка'),
(104,52,'en','Mug'),
(105,53,'ru','Тарелка'),
(106,53,'en','Plate'),
(109,55,'ru','Белый'),
(110,55,'en','White'),
(111,56,'ru','Многоцветный'),
(112,56,'en','Multicolor'),
(113,57,'ru','Черный'),
(114,57,'en','Black'),
(115,58,'ru','Желтый'),
(116,58,'en','Yellow'),
(117,59,'ru','Красный'),
(118,59,'en','Red'),
(119,60,'ru','Суши-сет'),
(120,60,'en','Sushi-set'),
(121,61,'ru','Коричневый'),
(122,61,'en','Brown'),
(123,62,'ru','Чайник'),
(124,62,'en','Teapot'),
(125,63,'ru','Для саке'),
(126,63,'en','Sake Set'),
(127,64,'ru','Чугун'),
(128,64,'en','Cast Iron'),
(129,65,'ru','Прозрачный'),
(130,65,'en','Transparent'),
(131,66,'ru','Катана'),
(132,66,'en','Katana'),
(133,67,'ru','Вакидзаси'),
(134,67,'en','Wakizashi'),
(135,68,'ru','Боккен'),
(136,68,'en','Bokken'),
(137,69,'ru','Меч'),
(138,69,'en','Sword'),
(139,70,'ru','Дайсё'),
(140,70,'en','Daisho'),
(141,71,'ru','Нагината'),
(142,71,'en','Naginata'),
(143,72,'ru','Нержавеющая сталь'),
(144,72,'en','Stainless steel'),
(145,73,'ru','Дамасская сталь'),
(146,73,'en','Damascus steel'),
(147,74,'ru','Текстиль'),
(148,74,'en','Textile'),
(149,75,'ru','Конский волос'),
(150,75,'en','Horsehair'),
(151,76,'ru','Дуб'),
(152,76,'en','Oak'),
(153,77,'ru','Граб'),
(154,77,'en','Hornbeam'),
(155,78,'ru','Бук'),
(156,78,'en','Beech'),
(157,79,'ru','Резина'),
(158,79,'en','Rubber'),
(159,80,'ru','Танто'),
(160,80,'en','Tanto'),
(161,81,'ru','Да'),
(162,81,'en','Yes'),
(163,82,'ru','Нет'),
(164,82,'en','No'),
(165,83,'ru','Имитация'),
(166,83,'en','Imitation'),
(167,84,'ru','Да'),
(168,84,'en','Yes'),
(169,85,'ru','Нет'),
(170,85,'en','No'),
(171,86,'ru','Бёбу'),
(172,86,'en','Byobu'),
(173,87,'ru','Мини сад'),
(174,87,'en','Mini garden'),
(175,88,'ru','Бонсай'),
(176,88,'en','Bonsai'),
(177,89,'ru','Андон'),
(178,89,'en','Andon'),
(179,90,'ru','Ваза'),
(180,90,'en','Vase'),
(181,91,'ru','Бамбук'),
(182,91,'en','Byobu'),
(183,92,'ru','Васи(рисовая бумага)'),
(184,92,'en','Washi(rice paper)'),
(185,93,'ru','Пластик'),
(186,93,'en','Plastic'),
(187,94,'ru','Дерево'),
(188,94,'en','Tree'),
(189,95,'ru','Песок'),
(190,95,'en','Sand'),
(191,96,'ru','Камни'),
(192,96,'en','Stones'),
(193,97,'ru','Бумага'),
(194,97,'en','Paper'),
(195,98,'ru','Фарфор'),
(196,98,'en','Porcelain'),
(197,99,'ru','Омамори'),
(198,99,'en','Оmamori'),
(199,100,'ru','Манэки нэко'),
(200,100,'en','Maneki Neko'),
(201,101,'ru','Нэцкэ'),
(202,101,'en','Netsuke'),
(203,102,'ru','Сэнсу'),
(204,102,'en','Sensu'),
(205,103,'ru','Хлопок'),
(206,103,'en','Cotton'),
(207,104,'ru','Керамика'),
(208,104,'en','Ceramics'),
(209,105,'ru','Пластик'),
(210,105,'en','Plastic'),
(211,106,'ru','Камень'),
(212,106,'en','Stone'),
(213,107,'ru','Гипс'),
(214,107,'en','Gypsum'),
(215,108,'ru','Бамбук'),
(216,108,'en','Bamboo'),
(217,109,'ru','Текстиль'),
(218,109,'en','Textile'),
(219,110,'ru','Голубой'),
(220,110,'en','Blue'),
(221,111,'ru','Серый'),
(222,111,'en','Grey');
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `admin_name` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `swatch_value` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES
(6,24,'S',0,NULL),
(7,24,'M',1,NULL),
(8,24,'L',2,NULL),
(9,24,'XL',3,NULL),
(10,24,'XXL',4,NULL),
(27,34,'gold',0,NULL),
(28,34,'silver',1,NULL),
(29,34,'wood',2,NULL),
(30,35,'Кольцо',0,NULL),
(31,35,'Серьги',1,NULL),
(32,35,'Ожерелья',2,NULL),
(33,35,'Браслеты',3,NULL),
(34,36,'Бюджетные',0,NULL),
(35,36,'Средний сегмент',1,NULL),
(36,36,'Люксовые',2,NULL),
(37,37,'Мебель',0,NULL),
(38,37,'Декор',1,NULL),
(39,37,'Текстиль',2,NULL),
(40,38,'Дерево',0,NULL),
(41,38,'Бумага',1,NULL),
(42,38,'Ткани',2,NULL),
(43,39,'Бюджетные',0,NULL),
(44,39,'Средний сегмент',1,NULL),
(45,39,'Премиум',2,NULL),
(47,40,'Керамика',1,NULL),
(48,40,'Стекло',2,NULL),
(52,43,'Кружка',0,NULL),
(53,43,'Тарелка',1,NULL),
(55,44,'Белый',0,NULL),
(56,44,'Многоцветный',1,NULL),
(57,44,'Черный',2,NULL),
(58,44,'Желтый',3,NULL),
(59,44,'Красный',4,NULL),
(60,43,'Суши-сет',3,NULL),
(61,44,'Коричневый',5,NULL),
(62,43,'Чайник',4,NULL),
(63,43,'Для саке',5,NULL),
(64,40,'Чугун',3,NULL),
(65,44,'Прозрачный',6,NULL),
(66,51,'Катана',0,NULL),
(67,51,'Вакидзаси',1,NULL),
(68,51,'Боккен',2,NULL),
(69,51,'Меч',3,NULL),
(70,51,'Дайсё',4,NULL),
(71,51,'Нагината',5,NULL),
(72,52,'Нержавеющая сталь',0,NULL),
(73,52,'Дамасская сталь',1,NULL),
(74,52,'Текстиль',2,NULL),
(75,52,'Конский волос',3,NULL),
(76,52,'Дуб',4,NULL),
(77,52,'Граб',5,NULL),
(78,52,'Бук',6,NULL),
(79,52,'Резина',7,NULL),
(80,51,'Танто',6,NULL),
(81,53,'Да',0,NULL),
(82,53,'Нет',1,NULL),
(83,53,'Имитация',2,NULL),
(84,54,'Да',0,NULL),
(85,54,'Нет',1,NULL),
(86,58,'Бёбу',0,NULL),
(87,58,'Мини сад',1,NULL),
(88,58,'Бонсай',2,NULL),
(89,58,'Андон',3,NULL),
(90,58,'Ваза',4,NULL),
(91,59,'Бамбук',0,NULL),
(92,59,'Васи(рисовая бумага)',1,NULL),
(93,59,'Пластик',2,NULL),
(94,59,'Дерево',3,NULL),
(95,59,'Песок',4,NULL),
(96,59,'Камни',5,NULL),
(97,59,'Бумага',6,NULL),
(98,59,'Фарфор',7,NULL),
(99,65,'Омамори',0,NULL),
(100,65,'Манэки нэко',1,NULL),
(101,65,'Нэцкэ',2,NULL),
(102,65,'Сэнсу',3,NULL),
(103,66,'Хлопок',0,NULL),
(104,66,'Керамика',1,NULL),
(105,66,'Пластик',2,NULL),
(106,66,'Камень',3,NULL),
(107,66,'Гипс',4,NULL),
(108,66,'Бамбук',5,NULL),
(109,66,'Текстиль',6,NULL),
(110,44,'Голубой',7,NULL),
(111,44,'Серый',8,NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES
(1,1,'ru','Артикул товара (SKU)'),
(2,2,'ru','Название'),
(3,3,'ru','Ключ URL'),
(5,5,'ru','Новый'),
(6,6,'ru','Популярный'),
(7,7,'ru','Видимость по отдельности'),
(8,8,'ru','Статус'),
(9,9,'ru','Краткое описание'),
(10,10,'ru','Описание'),
(11,11,'ru','Цена'),
(12,12,'ru','Стоимость'),
(13,13,'ru','Специальная цена'),
(19,19,'ru','Длина'),
(21,21,'ru','Высота'),
(22,22,'ru','Вес'),
(24,24,'ru','Размер'),
(26,26,'ru','Гостевой заказ'),
(27,27,'ru','Артикул'),
(28,28,'ru','Управление запасами'),
(29,1,'en','SKU'),
(30,2,'en','Name'),
(31,3,'en','URL Key'),
(33,5,'en','New'),
(34,6,'en','Featured'),
(35,7,'en','Visible Individually'),
(36,8,'en','Status'),
(37,9,'en','Short Description'),
(38,10,'en','Description'),
(39,11,'en','Price'),
(40,12,'en','Cost'),
(41,13,'en','Special Price'),
(47,19,'en','Length'),
(49,21,'en','Height'),
(50,22,'en','Weight'),
(52,24,'en','Size'),
(54,26,'en','Guest Checkout'),
(55,27,'en','Product Number'),
(56,28,'en','Manage Stock'),
(67,34,'en','Material'),
(68,34,'ru','Материал'),
(69,35,'en','Jewelry type'),
(70,35,'ru','Тип украшения'),
(71,36,'en','Level of price'),
(72,36,'ru','Уровень цен'),
(73,37,'en','Product type'),
(74,37,'ru','Тип продукта(для дома)'),
(75,38,'en','Material'),
(76,38,'ru','Материал(для дома)'),
(77,39,'en','Level of price'),
(78,39,'ru','Уровень цен(для дома)'),
(79,40,'en','Material'),
(80,40,'ru','Материал'),
(85,43,'en','Product type'),
(86,43,'ru','Тип товара'),
(87,44,'en','Color'),
(88,44,'ru','Цвет'),
(89,45,'en','Quantity'),
(90,45,'ru','Количество предметов'),
(93,47,'en','weight, g'),
(94,47,'ru','вес, г'),
(95,48,'en','size, mm'),
(96,48,'ru','размеры, мм'),
(97,49,'en','Volume, ml'),
(98,49,'ru','Объем, мл'),
(99,50,'en','Size, sm'),
(100,50,'ru','Размер, см'),
(101,51,'en','Type of weapon'),
(102,51,'ru','Тип оружия'),
(103,52,'en','Weapon material'),
(104,52,'ru','Материал оружия'),
(105,53,'en','Sharpening'),
(106,53,'ru','Заточка'),
(107,54,'en','Certificate'),
(108,54,'ru','Сертификат'),
(109,55,'en','Blade length (sm)'),
(110,55,'ru','Длинна клинка (см)'),
(111,56,'en','Handle length (sm)'),
(112,56,'ru','Длина рукоятки (см)'),
(113,57,'en','Weight (kg)'),
(114,57,'ru','Вес (кг)'),
(115,58,'en','Type'),
(116,58,'ru','Тип'),
(117,59,'en','Material'),
(118,59,'ru','Материал'),
(119,60,'en','Easy to care for'),
(120,60,'ru','Простота ухода'),
(121,61,'en','Age (years)'),
(122,61,'ru','Возраст (лет)'),
(123,62,'en','Height, cm'),
(124,62,'ru','Высота, см'),
(125,63,'en','Diameter, cm'),
(126,63,'ru','Диаметр, см'),
(127,64,'en','Length, cm'),
(128,64,'ru','Длина, см'),
(129,65,'en','Type'),
(130,65,'ru','Тип'),
(131,66,'en','Material'),
(132,66,'ru','Материал'),
(133,67,'en','Quantity'),
(134,67,'ru','Количество'),
(135,68,'en','Number of ribs'),
(136,68,'ru','Количество ребер');
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `admin_name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `swatch_type` varchar(191) DEFAULT NULL,
  `validation` varchar(191) DEFAULT NULL,
  `regex` varchar(191) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_comparable` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_locale` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_channel` tinyint(1) NOT NULL DEFAULT 0,
  `default_value` int(11) DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES
(1,'sku','Артикул товара (SKU)','text',NULL,NULL,NULL,1,1,1,0,0,0,0,0,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(2,'name','Название','text',NULL,NULL,NULL,3,1,0,0,1,0,0,0,1,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(3,'url_key','Ключ URL','text',NULL,NULL,NULL,4,1,1,0,0,0,0,0,1,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(5,'new','Новый','boolean',NULL,NULL,NULL,6,0,0,0,0,0,0,0,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(6,'featured','Популярный','boolean',NULL,NULL,NULL,7,0,0,0,0,1,0,1,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-28 11:02:45'),
(7,'visible_individually','Видимость по отдельности','boolean',NULL,NULL,NULL,9,1,0,0,0,0,0,0,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(8,'status','Статус','boolean',NULL,NULL,NULL,10,1,0,0,0,0,0,0,0,1,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(9,'short_description','Краткое описание','textarea',NULL,NULL,NULL,11,1,0,0,0,0,0,0,1,0,NULL,1,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(10,'description','Описание','textarea',NULL,NULL,NULL,12,1,0,0,1,0,0,0,1,0,NULL,1,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(11,'price','Цена','price','dropdown','decimal',NULL,13,0,0,1,1,0,0,0,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-27 19:53:01'),
(12,'cost','Стоимость','price',NULL,'decimal',NULL,14,0,0,0,0,0,1,0,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(13,'special_price','Специальная цена','price',NULL,'decimal',NULL,15,0,0,0,0,0,0,0,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(19,'length','Длина','text',NULL,'decimal','0',22,1,0,0,1,1,1,1,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-27 13:12:45'),
(21,'height','Высота','text',NULL,'decimal','0',24,1,0,0,1,1,1,1,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-27 13:12:56'),
(22,'weight','Вес','text',NULL,'decimal','0',25,1,0,0,0,0,0,1,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:12:06'),
(24,'size','Размер','select','dropdown',NULL,NULL,27,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-27 13:36:30'),
(26,'guest_checkout','Гостевой заказ','boolean',NULL,NULL,NULL,8,1,0,0,0,0,0,0,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(27,'product_number','Артикул','text',NULL,NULL,'1',2,0,1,0,0,0,0,1,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:13:10'),
(28,'manage_stock','Управление запасами','boolean',NULL,NULL,NULL,1,0,0,0,0,0,0,1,0,0,1,0,'2025-02-25 19:54:31','2025-02-25 14:35:08'),
(34,'material','Материал','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 19:09:44','2025-06-08 21:02:27'),
(35,'jewelry_type','jewelry_type','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 19:38:29','2025-02-27 20:59:41'),
(36,'level_of_price','level_of_price','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,0,0,0,NULL,0,'2025-02-27 19:41:03','2025-06-08 20:57:51'),
(37,'for_home_product_type','for_home_product_type','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 20:38:19','2025-02-27 21:08:07'),
(38,'for_home_material','for_home_material','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 20:42:15','2025-02-27 21:32:03'),
(39,'for_home_level_of_price','for_home_level_of_price','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 20:44:41','2025-02-27 21:05:10'),
(40,'material_for_dishes','Материал(посуда)','select','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 21:23:48','2025-06-09 20:01:50'),
(43,'Product_type','Тип товара(посуда)','select','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-08 21:09:36','2025-06-09 19:15:18'),
(44,'Color_dishes','Цвет (все)','select','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-08 21:55:46','2025-06-22 11:38:40'),
(45,'Quantity_dishes','Количество предметов(посуда)','text',NULL,NULL,'0',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-08 22:05:33','2025-06-08 22:31:28'),
(47,'weight_all','Вес (все)','text',NULL,NULL,'0',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-08 22:35:24','2025-06-08 22:36:44'),
(48,'Size_dishes','Размеры (посуда)','text',NULL,NULL,'0',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-08 22:39:36','2025-06-08 22:39:55'),
(49,'Volume_dishes2','Объем мл (посуда)','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-09 00:27:43','2025-06-09 00:27:58'),
(50,'size_sm','Размеры, см (посуда)','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-09 00:32:15','2025-06-09 00:36:04'),
(51,'Weapon_type','Тип (оружие)','select','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-17 22:14:39','2025-06-17 22:51:58'),
(52,'Product_material','Материал (оружие)','multiselect','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-17 22:18:13','2025-06-17 22:52:59'),
(53,'Sharpening_weapon','Заточка(оружие)','select','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-17 22:37:42','2025-06-17 22:37:58'),
(54,'Certificate_weapon','Сертификат','select','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-17 22:39:34','2025-06-17 22:57:28'),
(55,'Blade_length_weapon','Длинна клинка(оружие (см))','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-17 22:42:24','2025-06-17 23:23:35'),
(56,'Handle_length_weapon','Длина рукоятки(оружие(см))','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-17 22:43:56','2025-06-17 23:24:18'),
(57,'weight_weapon','Вес (оружие(кг))','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-17 22:45:46','2025-06-17 23:24:50'),
(58,'Type_interior','Тип (интерьер)','select','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-18 21:03:29','2025-06-18 21:09:07'),
(59,'Material_interior','Материал (интерьер)','multiselect','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-18 21:10:57','2025-06-18 23:53:59'),
(60,'Easy_to_care_Bonsai','Простота ухода(Бонсаи)','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-18 22:07:34','2025-06-18 22:07:53'),
(61,'Age_Bonsai','Возраст (Бонсай)','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-18 22:09:56','2025-06-18 22:10:15'),
(62,'Height_Bonsai','Высота (Все)','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-18 22:13:45','2025-06-18 22:28:51'),
(63,'Diameter_all','Диаметр (Все)','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-18 22:29:53','2025-06-18 22:30:11'),
(64,'Length_all','Длина (все) , см','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-18 23:28:00','2025-06-18 23:28:20'),
(65,'type_mini_souvenirs','Тип (мини сувениры)','select','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-22 11:14:56','2025-06-22 11:43:03'),
(66,'Material_mini_souvenir','Материал (мини сувениры)','multiselect','dropdown',NULL,'',NULL,1,0,1,0,1,1,1,0,0,NULL,0,'2025-06-22 11:24:59','2025-06-22 11:43:18'),
(67,'Quantity_mini_souvenir','Количество предметов(мини сувениры)','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-22 11:47:14','2025-06-22 11:47:30'),
(68,'Number_of_ribs','Количество ребер (веера)','textarea',NULL,NULL,'',NULL,1,0,0,0,1,1,1,0,0,NULL,0,'2025-06-22 14:25:28','2025-06-22 14:26:06');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `cart_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `tax_total` decimal(12,4) DEFAULT 0.0000,
  `base_tax_total` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `checkout_method` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES
(18,'qqq@qqq.com','qqqqqqq','qqqqqqq','free_free',NULL,0,1,4.0000,NULL,'USD','USD','RUB','RUB',1200.0000,1200.0000,1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1200.0000,1200.0000,NULL,0,0,NULL,4,1,'2025-03-01 10:26:26','2025-03-01 10:29:57'),
(19,'qqq@qqq.com','qqqqqqq','qqqqqqq',NULL,NULL,0,1,4.0000,NULL,'USD','USD','RUB','USD',44.0000,4000.0000,44.0000,4000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,44.0000,4000.0000,NULL,0,1,NULL,4,1,'2025-03-01 10:32:37','2025-03-01 10:34:41'),
(20,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','USD',4.4000,400.0000,4.4000,400.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.4000,400.0000,NULL,1,1,NULL,NULL,1,'2025-03-01 10:50:39','2025-03-01 10:53:31'),
(21,'test2@gmail.com','Тест2','Тест2','free_free',NULL,0,1,3.0000,NULL,'USD','USD','RUB','RUB',3000.0000,3000.0000,3000.0000,3000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,3000.0000,3000.0000,NULL,0,0,NULL,6,1,'2025-03-04 22:29:31','2025-03-04 23:28:24'),
(22,'test2@gmail.com','Тест2','Тест2','free_free',NULL,0,2,4.0000,NULL,'USD','USD','RUB','RUB',1900.0000,1900.0000,1900.0000,1900.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1900.0000,1900.0000,NULL,0,0,NULL,6,1,'2025-03-05 07:50:34','2025-03-05 08:45:35'),
(23,'test2@gmail.com','Тест2','Тест2','free_free',NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,NULL,0,0,NULL,6,1,'2025-03-05 08:47:37','2025-03-05 08:48:13'),
(24,'test2@gmail.com','Тест2','Тест2','free_free',NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,NULL,0,0,NULL,6,1,'2025-03-05 14:00:38','2025-03-05 14:45:54'),
(25,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,NULL,1,1,NULL,NULL,1,'2025-03-05 15:49:40','2025-03-05 15:49:40'),
(27,'example@mail.com','testtest','testest',NULL,NULL,0,3,4.0000,NULL,'USD','USD','RUB','USD',66.0000,6000.0000,66.0000,6000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,66.0000,6000.0000,NULL,0,1,NULL,7,1,'2025-06-01 15:05:07','2025-06-01 18:10:55'),
(28,'test2@gmail.com','Тест2','Тест2',NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,NULL,0,0,NULL,6,1,'2025-06-01 15:56:49','2025-06-01 15:56:49'),
(29,'test2@gmail.com','Тест2','Тест2',NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,NULL,0,0,NULL,6,1,'2025-06-01 15:57:14','2025-06-01 15:57:14'),
(30,'test2@gmail.com','Тест2','Тест2',NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,NULL,0,0,NULL,6,1,'2025-06-01 15:57:20','2025-06-01 15:57:20'),
(31,'test2@gmail.com','Тест2','Тест2',NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,NULL,0,0,NULL,6,1,'2025-06-01 16:00:18','2025-06-01 16:00:18'),
(32,'test2@gmail.com','Тест2','Тест2',NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,NULL,0,0,NULL,6,1,'2025-06-01 16:00:23','2025-06-01 16:00:23'),
(35,'test2@gmail.com','Тест2','Тест2','free_free',NULL,0,1,2.0000,NULL,'USD','USD','RUB','RUB',220.0000,220.0000,220.0000,220.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,220.0000,220.0000,NULL,0,0,NULL,6,1,'2025-06-04 14:50:08','2025-06-04 14:51:34'),
(36,'test2@gmail.com','Тест2','Тест2','free_free',NULL,0,1,1.0000,NULL,'USD','USD','RUB','BYN',4.0700,110.0000,4.0700,110.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.0700,110.0000,NULL,0,0,NULL,6,1,'2025-06-04 17:05:26','2025-06-04 17:06:17'),
(42,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',1200.0000,1200.0000,1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1200.0000,1200.0000,NULL,1,1,NULL,NULL,1,'2025-06-05 18:42:20','2025-06-05 18:43:34'),
(43,'yariksen.exe@gmail.com','ярослав','ярослав','free_free',NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',10000.0000,10000.0000,10000.0000,10000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,10000.0000,10000.0000,NULL,0,0,NULL,8,1,'2025-06-06 13:53:39','2025-06-06 14:08:23'),
(45,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','RUB',300.0000,300.0000,300.0000,300.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,300.0000,300.0000,NULL,1,1,NULL,NULL,1,'2025-06-07 16:09:59','2025-06-07 17:35:51'),
(46,'test2@gmail.com','Тест2','Тест2','free_free',NULL,0,2,5.0000,NULL,'USD','USD','RUB','BYN',122.1000,3300.0000,122.1000,3300.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,122.1000,3300.0000,NULL,0,0,NULL,6,1,'2025-06-07 23:24:34','2025-06-08 01:11:50'),
(48,NULL,NULL,NULL,NULL,NULL,0,2,2.0000,NULL,'USD','USD','RUB','BYN',170.2000,4600.0000,170.2000,4600.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,170.2000,4600.0000,NULL,1,1,NULL,NULL,1,'2025-06-10 13:37:15','2025-06-10 13:37:18');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item_inventories`
--

DROP TABLE IF EXISTS `cart_item_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_item_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `cart_item_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item_inventories`
--

LOCK TABLES `cart_item_inventories` WRITE;
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(12,4) NOT NULL DEFAULT 1.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(191) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `cart_id` int(10) unsigned NOT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES
(26,1,'sju-125','simple','Японское ожерелье \"Сакура\"',NULL,20.0000,20.0000,20.0000,4.4000,400.0000,NULL,4.4000,400.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.4000,400.0000,4.4000,400.0000,NULL,NULL,38,20,NULL,NULL,'{\"product_id\":\"38\",\"is_buy_now\":\"0\",\"quantity\":1}','2025-03-01 10:50:39','2025-03-01 10:53:31'),
(54,1,'sku-125','simple','Золотое кольцо \"Солнечный свет\"',NULL,10.0000,10.0000,10.0000,10000.0000,10000.0000,NULL,10000.0000,10000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL,37,43,NULL,NULL,'{\"quantity\":1,\"product_id\":37}','2025-06-06 13:53:40','2025-06-06 13:53:40'),
(61,1,'1001','simple','Посуда для суши, роллы на 2 персоны 12 предметов',NULL,2300.0000,2300.0000,2300.0000,62.9000,1700.0000,NULL,62.9000,1700.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,62.9000,1700.0000,62.9000,1700.0000,NULL,NULL,53,48,NULL,NULL,'{\"quantity\":1,\"product_id\":53}','2025-06-10 13:37:15','2025-06-10 13:37:15'),
(62,1,'1007','simple','Японский чайник Тэцубин',NULL,1223.0000,1223.0000,1223.0000,107.3000,2900.0000,NULL,107.3000,2900.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,107.3000,2900.0000,107.3000,2900.0000,NULL,NULL,59,48,NULL,NULL,'{\"quantity\":1,\"product_id\":59}','2025-06-10 13:37:18','2025-06-10 13:37:18');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_payment`
--

DROP TABLE IF EXISTS `cart_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
INSERT INTO `cart_payment` VALUES
(25,'cashondelivery','Cash On Delivery',18,'2025-03-01 10:29:40','2025-03-01 10:29:40'),
(27,'cashondelivery','Cash On Delivery',21,'2025-03-04 23:28:13','2025-03-04 23:28:13'),
(28,'cashondelivery','Cash On Delivery',22,'2025-03-05 08:45:09','2025-03-05 08:45:09'),
(29,'cashondelivery','Cash On Delivery',23,'2025-03-05 08:48:09','2025-03-05 08:48:09'),
(30,'cashondelivery','Cash On Delivery',24,'2025-03-05 14:43:02','2025-03-05 14:43:02'),
(31,'cashondelivery','Cash On Delivery',35,'2025-06-04 14:51:16','2025-06-04 14:51:16'),
(32,'cashondelivery','Cash On Delivery',36,'2025-06-04 17:06:01','2025-06-04 17:06:01'),
(35,'cashondelivery','Cash On Delivery',43,'2025-06-06 14:07:54','2025-06-06 14:07:54'),
(36,'cashondelivery','Cash On Delivery',46,'2025-06-08 00:56:11','2025-06-08 00:56:11');
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping_rates`
--

DROP TABLE IF EXISTS `cart_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_shipping_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) NOT NULL,
  `carrier_title` varchar(191) NOT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) NOT NULL,
  `method_description` varchar(191) DEFAULT NULL,
  `price` double DEFAULT 0,
  `base_price` double DEFAULT 0,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(191) DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT 1,
  `cart_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
INSERT INTO `cart_shipping_rates` VALUES
(64,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,32,'2025-03-01 10:29:37','2025-03-01 10:29:37',18),
(68,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,37,'2025-03-04 23:28:11','2025-03-04 23:28:11',21),
(70,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,42,'2025-03-05 08:45:06','2025-03-05 08:45:06',22),
(72,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,46,'2025-03-05 08:48:07','2025-03-05 08:48:07',23),
(74,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,50,'2025-03-05 14:43:00','2025-03-05 14:43:00',24),
(76,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,54,'2025-06-04 14:51:12','2025-06-04 14:51:12',35),
(78,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,58,'2025-06-04 17:05:57','2025-06-04 17:05:57',36),
(87,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,66,'2025-06-06 14:07:50','2025-06-06 14:07:50',43),
(92,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,70,'2025-06-08 00:56:08','2025-06-08 00:56:08',46);
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT 0,
  `logo_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `display_mode` varchar(191) DEFAULT 'products_and_description',
  `_lft` int(10) unsigned NOT NULL DEFAULT 0,
  `_rgt` int(10) unsigned NOT NULL DEFAULT 0,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `banner_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,1,NULL,0,'products_and_description',1,26,NULL,NULL,NULL,'2025-02-25 19:54:31','2025-06-05 16:57:42'),
(30,2,NULL,1,'products_and_description',12,13,1,NULL,NULL,'2025-02-27 16:35:47','2025-06-18 21:22:50'),
(35,5,NULL,0,'products_and_description',14,15,1,NULL,NULL,'2025-02-27 19:23:54','2025-06-22 16:52:17'),
(37,1,NULL,1,'products_and_description',16,17,1,NULL,NULL,'2025-06-05 16:56:17','2025-06-18 23:57:12'),
(38,3,NULL,1,'products_and_description',18,19,1,NULL,NULL,'2025-06-18 21:29:35','2025-06-18 23:58:18'),
(39,4,NULL,1,'products_and_description',20,21,1,NULL,NULL,'2025-06-22 11:11:02','2025-06-22 16:55:05'),
(40,5,NULL,1,'products_and_description',22,23,1,NULL,NULL,'2025-06-22 16:57:15','2025-06-22 16:59:11'),
(41,6,NULL,1,'products_and_description',24,25,1,NULL,NULL,'2025-06-22 17:03:39','2025-06-22 17:03:39');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_filterable_attributes`
--

DROP TABLE IF EXISTS `category_filterable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_filterable_attributes`
--

LOCK TABLES `category_filterable_attributes` WRITE;
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
INSERT INTO `category_filterable_attributes` VALUES
(30,11),
(35,11),
(35,34),
(35,35),
(35,36),
(30,40),
(1,24),
(30,43),
(30,44),
(37,11),
(37,51),
(37,53),
(37,52),
(37,54),
(38,58),
(38,11),
(38,44),
(38,59),
(39,11),
(39,44),
(39,65),
(39,66),
(40,11),
(41,11);
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `name` text NOT NULL,
  `slug` varchar(191) NOT NULL,
  `url_path` varchar(2048) NOT NULL,
  `description` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES
(1,1,'Корень','root','','Описание корневой категории','','','',NULL,'ru'),
(2,1,'Root','root','','<p>Root Category Description</p>','','','',NULL,'en'),
(59,30,'Посуда','Dish','','<p>Посуда</p>','','','',1,'ru'),
(60,30,'Dish','dish','','<p>Dish</p>','','','',2,'en'),
(69,35,'Украшения','jewelry','','<p>Украшения</p>','','','',1,'ru'),
(70,35,'Jewelry','jewelry','','<p>Jewelry</p>','','','',2,'en'),
(73,37,'Souvenir weapons','souvenir-weapons','','<p><em>This category contains goods that are souvenir weapons, this is confirmed by a certificate.</em></p>','','','',2,'en'),
(74,37,'Сувенирное оружие','сувенирное-оружие','','<p><em>В этой категории находятся товары являющиеся сувенирным оружием, это подтвеждаеться сертификатом.</em></p>','','','',1,'ru'),
(75,38,'Для дома (интерьер)','для-дома-интерьер','','<p><em>Погрузитесь в атмосферу гармонии и уюта с традиционными японскими предметами для дома.</em></p>','','','',1,'ru'),
(76,38,'For home (interior)','for-home-interior','','<p><em>Immerse yourself in an atmosphere of harmony and comfort with traditional Japanese home items.</em></p>','','','',2,'en'),
(77,39,'Мини сувениры','мини-сувениры','','<p><em>Погрузитесь в мир японской культуры с нашей коллекцией миниатюрных сувениров! Эти изящные и милые вещицы &ndash; идеальный способ привезти кусочек Японии с собой или порадовать близких необычным подарком.</em></p>','','','',1,'ru'),
(78,39,'Мини сувениры','мини-сувениры','','<p><em>Dive into the world of Japanese culture with our collection of miniature souvenirs! These elegant and cute items are the perfect way to bring a piece of Japan home with you or to please your loved ones with an unusual gift.</em></p>','','','',2,'en'),
(79,40,'Аниме','аниме','','<p>аниме</p>','','','',1,'ru'),
(80,40,'Аниме','аниме','','<p>аниме</p>','','','',2,'en'),
(81,41,'Одежда','одежда','','<p>Одежда</p>','','','',1,'ru'),
(82,41,'Одежда','одежда','','<p>Одежда</p>','','','',2,'en');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_currencies`
--

DROP TABLE IF EXISTS `channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_currencies` (
  `channel_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_currencies`
--

LOCK TABLES `channel_currencies` WRITE;
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_inventory_sources`
--

DROP TABLE IF EXISTS `channel_inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int(10) unsigned NOT NULL,
  `inventory_source_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_inventory_sources`
--

LOCK TABLES `channel_inventory_sources` WRITE;
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` VALUES
(1,1);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_locales`
--

DROP TABLE IF EXISTS `channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_locales` (
  `channel_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_locales`
--

LOCK TABLES `channel_locales` WRITE;
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` VALUES
(1,1),
(1,2);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_translations`
--

DROP TABLE IF EXISTS `channel_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `maintenance_mode_text` text DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_translations`
--

LOCK TABLES `channel_translations` WRITE;
/*!40000 ALTER TABLE `channel_translations` DISABLE KEYS */;
INSERT INTO `channel_translations` VALUES
(1,1,'ru','По умолчанию',NULL,NULL,'{\"meta_title\":\"\\u0414\\u0435\\u043c\\u043e\\u043d\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d\",\"meta_description\":\"\\u041c\\u0435\\u0442\\u0430-\\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 \\u0434\\u0435\\u043c\\u043e\\u043d\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d\\u0430\",\"meta_keywords\":\"\\u041c\\u0435\\u0442\\u0430-\\u043a\\u043b\\u044e\\u0447\\u0435\\u0432\\u044b\\u0435 \\u0441\\u043b\\u043e\\u0432\\u0430 \\u0434\\u0435\\u043c\\u043e\\u043d\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d\\u0430\"}',NULL,NULL),
(2,1,'en','Default',NULL,NULL,'{\"meta_title\":\"Demo store\",\"meta_description\":\"Demo store meta description\",\"meta_keywords\":\"Demo store meta keyword\"}',NULL,NULL);
/*!40000 ALTER TABLE `channel_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `theme` varchar(191) DEFAULT NULL,
  `hostname` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT 0,
  `allowed_ips` text DEFAULT NULL,
  `root_category_id` int(10) unsigned DEFAULT NULL,
  `default_locale_id` int(10) unsigned NOT NULL,
  `base_currency_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES
(1,'default',NULL,'default','http://localhost',NULL,NULL,NULL,0,NULL,1,1,1,'2025-02-25 19:54:31','2025-02-25 19:54:31');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_channels`
--

DROP TABLE IF EXISTS `cms_page_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_channels`
--

LOCK TABLES `cms_page_channels` WRITE;
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
INSERT INTO `cms_page_channels` VALUES
(1,1),
(2,1),
(7,1),
(11,1);
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translations`
--

DROP TABLE IF EXISTS `cms_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) NOT NULL,
  `url_key` varchar(191) NOT NULL,
  `html_content` longtext DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale` varchar(191) NOT NULL,
  `cms_page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translations`
--

LOCK TABLES `cms_page_translations` WRITE;
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
INSERT INTO `cms_page_translations` VALUES
(1,'О нас','about-us','<p style=\"text-align: center;\" data-start=\"175\" data-end=\"285\">Мы открыли этот магазин, потому что <strong data-start=\"211\" data-end=\"241\">искренне влюблены в Японию</strong> &mdash; её <strong data-start=\"247\" data-end=\"258\">красоту</strong>, <strong data-start=\"260\" data-end=\"272\">традиции</strong> и <strong data-start=\"275\" data-end=\"284\">тепло</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"287\" data-end=\"554\">Каждый товар на сайте мы <strong data-start=\"312\" data-end=\"329\">выбрали лично</strong> &mdash; это именно те вещи, которые мы с радостью подарили бы друзьям или оставили у себя дома. Здесь вы не найдёте случайных предметов &mdash; только <strong data-start=\"469\" data-end=\"501\">подлинные, душевные сувениры</strong>, несущие в себе атмосферу страны восходящего солнца.</p>\r\n<p style=\"text-align: center;\" data-start=\"556\" data-end=\"643\">Мы делимся с вами своей любовью к Японии<br data-start=\"596\" data-end=\"599\">&mdash; <strong data-start=\"601\" data-end=\"642\">через детали, в которых живёт история</strong>.</p>','about us','','aboutus','ru',1),
(2,'О проекте','return-policy','<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<p style=\"text-align: center;\" data-start=\"230\" data-end=\"347\"><strong data-start=\"230\" data-end=\"253\">Акихабара</strong>&nbsp;&mdash; это проект, созданный с одной идеей:<br data-start=\"292\" data-end=\"295\"><strong data-start=\"295\" data-end=\"347\">приблизить настоящую Японию к тем, кто её любит.</strong></p>\r\n<p style=\"text-align: center;\" data-start=\"349\" data-end=\"597\">Нам всегда было мало сувениров &laquo;для туристов&raquo;. Мы хотели делиться тем, что действительно <strong data-start=\"438\" data-end=\"476\">имеет значение в японской культуре</strong>: амулеты, обереги, предметы с символикой, вещи ручной работы &mdash; те самые мелочи, которые японцы дарят друг другу с душой.</p>\r\n<p style=\"text-align: center;\" data-start=\"599\" data-end=\"756\">Этот проект вырос из личной страсти к Японии и стремления показать, что даже маленький сувенир может нести в себе <strong data-start=\"713\" data-end=\"755\">историю, смысл и энергию другой страны</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"758\" data-end=\"935\">Мы сотрудничаем с поставщиками, небольшими мастерскими и ремесленниками, чтобы каждый заказ был не просто покупкой &mdash; а <strong data-start=\"877\" data-end=\"908\">частичкой японской культуры</strong>, которой хочется дорожить.</p>\r\n</div>\r\n</div>','return policy','','return, policy','ru',2),
(3,'Политика возврата','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Политика возврата\"</div></div>','Refund policy','','refund, policy','ru',3),
(4,'Условия и положения','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Условия и положения\"</div></div>','Terms & Conditions','','term, conditions','ru',4),
(5,'Условия использования','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Условия использования\"</div></div>','Terms of use','','term, use','ru',5),
(6,'Служба поддержки клиентов','customer-service','<p style=\"text-align: center;\" data-start=\"129\" data-end=\"290\">Раздел находится <strong data-start=\"146\" data-end=\"162\">в разработке</strong>.<br data-start=\"163\" data-end=\"166\">Скоро здесь появится удобный способ быстро связаться с нами по любым вопросам: заказ, доставка, возврат или помощь в выборе.</p>\r\n<p style=\"text-align: center;\" data-start=\"292\" data-end=\"354\">А пока вы можете написать нам на email:<br data-start=\"331\" data-end=\"334\">sakurajapan@gmail.com</p>\r\n<p style=\"text-align: center;\" data-start=\"356\" data-end=\"388\">Спасибо за понимание и терпение!</p>','Customer Service','','customer, service','ru',7),
(8,'Политика оплаты','payment-policy','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Политика оплаты\"</div></div>','Payment Policy','','payment, policy','ru',9),
(9,'Политика доставки','shipping-policy','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Политика доставки\"</div></div>','Shipping Policy','','shipping, policy','ru',10),
(10,'Политика конфиденциальности','privacy-policy','<div class=\"static-container\">\r\n<div class=\"mb-5\">Содержание страницы \"Политика конфиденциальности\"</div>\r\n</div>','Privacy Policy','','privacy, policy','ru',11),
(11,'About Us','about-us','<div class=\"static-container\">\r\n<div class=\"mb-5\">\r\n<p style=\"text-align: center;\" data-start=\"76\" data-end=\"191\">We started this store because we are genuinely in love with Japan &mdash; its <strong data-start=\"148\" data-end=\"158\">beauty</strong>, <strong data-start=\"160\" data-end=\"174\">traditions</strong>, and <strong data-start=\"180\" data-end=\"190\">warmth</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"193\" data-end=\"468\">Every item on our website has been <strong data-start=\"228\" data-end=\"251\">personally selected</strong> &mdash; these are the kinds of treasures we&rsquo;d gladly give to friends or keep for ourselves. You won&rsquo;t find random trinkets here &mdash; only <strong data-start=\"381\" data-end=\"415\">authentic, heartfelt souvenirs</strong> that carry the spirit of the Land of the Rising Sun.</p>\r\n<p style=\"text-align: center;\" data-start=\"470\" data-end=\"555\">We share our love for Japan with you<br data-start=\"506\" data-end=\"509\">&mdash; <strong data-start=\"511\" data-end=\"554\">through the details where history lives</strong>.</p>\r\n</div>\r\n</div>','about us','','aboutus','en',1),
(12,'Return Policy','return-policy','<div class=\"static-container\"><div class=\"mb-5\">Return Policy Page Content</div></div>','return policy','','return, policy','en',2),
(13,'Refund Policy','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Refund Policy Page Content</div></div>','Refund policy','','refund, policy','en',3),
(14,'Terms & Conditions','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Terms & Conditions Page Content</div></div>','Terms & Conditions','','term, conditions','en',4),
(15,'Terms of Use','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Terms of Use Page Content</div></div>','Terms of use','','term, use','en',5),
(16,'Customer Service','customer-service','<p style=\"text-align: center;\" data-start=\"48\" data-end=\"235\">This section is currently under development.<br data-start=\"92\" data-end=\"95\">Soon, you&rsquo;ll be able to quickly reach out to us here for any questions &mdash; about orders, delivery, returns, or help choosing the perfect item.</p>\r\n<p style=\"text-align: center;\" data-start=\"237\" data-end=\"310\">In the meantime, feel free to email us at:<br data-start=\"279\" data-end=\"282\">📩 <strong data-start=\"285\" data-end=\"310\"><a class=\"cursor-pointer\" rel=\"noopener\" data-start=\"287\" data-end=\"308\">sakurajapan@gmail.com</a></strong></p>\r\n<p style=\"text-align: center;\" data-start=\"312\" data-end=\"358\" data-is-last-node=\"\" data-is-only-node=\"\">Thank you for your understanding and patience!</p>','Customer Service','','customer, service','en',7),
(18,'Payment Policy','payment-policy','<div class=\"static-container\"><div class=\"mb-5\">Payment Policy Page Content</div></div>','Payment Policy','','payment, policy','en',9),
(19,'Shipping Policy','shipping-policy','<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy Page Content</div></div>','Shipping Policy','','shipping, policy','en',10),
(20,'Privacy Policy','privacy-policy','<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy Page Content</div></div>','Privacy Policy','','privacy, policy','en',11);
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` VALUES
(1,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(2,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(3,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(4,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(5,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(6,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(7,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(9,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(10,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(11,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_items`
--

DROP TABLE IF EXISTS `compare_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_items_product_id_foreign` (`product_id`),
  KEY `compare_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_items`
--

LOCK TABLES `compare_items` WRITE;
/*!40000 ALTER TABLE `compare_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `channel_code` varchar(191) DEFAULT NULL,
  `locale_code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES
(1,'sales.checkout.shopping_cart.allow_guest_checkout','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(2,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(3,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(4,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(5,'emails.general.notifications.emails.general.notifications.new_order','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(6,'emails.general.notifications.emails.general.notifications.new_admin','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(7,'emails.general.notifications.emails.general.notifications.new_invoice','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(8,'emails.general.notifications.emails.general.notifications.new_refund','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(9,'emails.general.notifications.emails.general.notifications.new_shipment','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(10,'emails.general.notifications.emails.general.notifications.new_inventory_source','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(11,'emails.general.notifications.emails.general.notifications.cancel_order','1',NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(12,'customer.settings.social_login.enable_facebook','1','default',NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(13,'customer.settings.social_login.enable_twitter','1','default',NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(14,'customer.settings.social_login.enable_google','1','default',NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(15,'customer.settings.social_login.enable_linkedin','1','default',NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(16,'customer.settings.social_login.enable_github','1','default',NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(17,'catalog.products.settings.compare_option','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(18,'catalog.products.settings.image_search','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(19,'catalog.products.search.engine','database',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(20,'catalog.products.search.admin_mode','database',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(21,'catalog.products.search.storefront_mode','database',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(22,'catalog.products.search.min_query_length','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(23,'catalog.products.search.max_query_length','1000',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(24,'catalog.products.product_view_page.no_of_related_products','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(25,'catalog.products.product_view_page.no_of_up_sells_products','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(26,'catalog.products.cart_view_page.no_of_cross_sells_products','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(27,'catalog.products.storefront.products_per_page','','default',NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(28,'catalog.products.storefront.buy_now_button_display','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(29,'catalog.products.cache_small_image.width','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(30,'catalog.products.cache_small_image.height','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(31,'catalog.products.cache_medium_image.width','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(32,'catalog.products.cache_medium_image.height','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(33,'catalog.products.cache_large_image.width','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(34,'catalog.products.cache_large_image.height','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(35,'catalog.products.review.guest_review','1',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(36,'catalog.products.review.customer_review','1',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(37,'catalog.products.review.summary','review_counts',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(38,'catalog.products.attribute.image_attribute_upload_size','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(39,'catalog.products.attribute.file_attribute_upload_size','',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(40,'catalog.products.social_share.enabled','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(41,'catalog.products.social_share.facebook','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(42,'catalog.products.social_share.twitter','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(43,'catalog.products.social_share.pinterest','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(44,'catalog.products.social_share.whatsapp','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(45,'catalog.products.social_share.linkedin','0',NULL,NULL,'2025-02-25 19:22:46','2025-02-25 19:22:46'),
(46,'catalog.products.social_share.email','0',NULL,NULL,'2025-02-25 19:22:47','2025-02-25 19:22:47'),
(47,'catalog.products.social_share.share_message','',NULL,NULL,'2025-02-25 19:22:47','2025-02-25 19:22:47'),
(48,'general.general.locale_options.weight_unit','kgs','default',NULL,'2025-02-26 14:22:48','2025-02-26 14:22:48'),
(49,'general.general.breadcrumbs.shop','1',NULL,NULL,'2025-02-26 14:22:48','2025-02-26 14:23:57'),
(50,'catalog.rich_snippets.products.enable','1',NULL,NULL,'2025-02-26 14:40:57','2025-02-28 11:19:50'),
(51,'catalog.rich_snippets.products.show_sku','1',NULL,NULL,'2025-02-26 14:40:57','2025-02-27 14:20:18'),
(52,'catalog.rich_snippets.products.show_weight','1',NULL,NULL,'2025-02-26 14:40:57','2025-02-27 14:20:18'),
(53,'catalog.rich_snippets.products.show_categories','1',NULL,NULL,'2025-02-26 14:40:57','2025-02-26 14:40:57'),
(54,'catalog.rich_snippets.products.show_images','1',NULL,NULL,'2025-02-26 14:40:57','2025-02-27 14:20:18'),
(55,'catalog.rich_snippets.products.show_reviews','1',NULL,NULL,'2025-02-26 14:40:57','2025-02-27 14:20:18'),
(56,'catalog.rich_snippets.products.show_ratings','1',NULL,NULL,'2025-02-26 14:40:58','2025-02-27 14:20:18'),
(57,'catalog.rich_snippets.products.show_offers','1',NULL,NULL,'2025-02-26 14:40:58','2025-02-27 14:20:18'),
(58,'catalog.rich_snippets.categories.enable','1',NULL,NULL,'2025-02-26 14:40:58','2025-02-28 11:19:51'),
(59,'catalog.rich_snippets.categories.show_search_input_field','1',NULL,NULL,'2025-02-26 14:40:58','2025-02-26 14:43:32'),
(65,'general.design.admin_logo.favicon','configuration/5U88xFPRESEkkyCwvK35KclbFQwgSmZEVYfOy1K7.ico',NULL,NULL,'2025-02-27 12:49:53','2025-02-27 14:18:27'),
(66,'general.design.admin_logo.logo_image','configuration/N6HCMZk1Ta0bjWEA9CrYeyRoChRLc0H55koHLPmz.svg',NULL,NULL,'2025-02-27 13:00:56','2025-02-27 14:18:38'),
(67,'general.content.header_offer.title','',NULL,NULL,'2025-02-27 14:19:39','2025-02-28 15:06:26'),
(68,'general.content.header_offer.redirection_title','',NULL,NULL,'2025-02-27 14:19:39','2025-02-28 15:06:26'),
(69,'general.content.header_offer.redirection_link','',NULL,NULL,'2025-02-27 14:19:39','2025-02-27 14:19:39'),
(70,'general.content.custom_scripts.custom_css','','default',NULL,'2025-02-27 14:19:39','2025-02-27 14:19:39'),
(71,'general.content.custom_scripts.custom_javascript','','default',NULL,'2025-02-27 14:19:39','2025-02-27 14:19:39');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES
(22,'BY','Belarus'),
(118,'KZ','Kazakhstan'),
(186,'RU','Russia');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translations`
--

DROP TABLE IF EXISTS `country_state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_state_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_state_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `default_name` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translations`
--

LOCK TABLES `country_state_translations` WRITE;
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `default_name` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translations`
--

LOCK TABLES `country_translations` WRITE;
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) DEFAULT NULL,
  `decimal` int(10) unsigned NOT NULL DEFAULT 2,
  `group_separator` varchar(191) NOT NULL DEFAULT ',',
  `decimal_separator` varchar(191) NOT NULL DEFAULT '.',
  `currency_position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES
(1,'RUB','Российский рубль','₽',2,',','.',NULL,NULL,NULL),
(2,'USD','Доллар США','$',2,',','.',NULL,NULL,NULL),
(3,'BYN','Белорусский рубль','Br',1,',','.','','2025-02-27 14:34:22','2025-02-27 14:49:17'),
(4,'KZH','Казахский тэнге','₸',2,',','.',NULL,NULL,NULL),
(5,'KZH','Казахский тэнге','₸',2,',','.',NULL,NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
INSERT INTO `currency_exchange_rates` VALUES
(1,0.037000000000,3,'2025-02-27 14:50:21','2025-02-27 14:50:21'),
(2,0.011000000000,2,'2025-02-27 14:50:44','2025-02-27 14:50:44'),
(3,5.600000000000,4,'2025-03-01 00:18:31','2025-03-01 00:18:31'),
(4,5.600000000000,5,'2025-03-01 00:18:50','2025-03-01 00:18:50');
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES
(1,'guest','Гость',0,NULL,NULL),
(2,'general','Общий',0,NULL,NULL),
(3,'wholesale','Оптовый',0,NULL,NULL);
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notes`
--

DROP TABLE IF EXISTS `customer_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `note` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notes_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notes`
--

LOCK TABLES `customer_notes` WRITE;
/*!40000 ALTER TABLE `customer_notes` DISABLE KEYS */;
INSERT INTO `customer_notes` VALUES
(1,6,'Здравствуйте, в вашем следующем заказе будет дополнительный подарок',0,'2025-06-10 22:00:10','2025-06-10 22:00:10'),
(2,6,'Здравствуйте, в вашем следующем заказе будет дополнительный подарок',1,'2025-06-10 22:01:19','2025-06-10 22:01:19');
/*!40000 ALTER TABLE `customer_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_resets`
--

LOCK TABLES `customer_password_resets` WRITE;
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
INSERT INTO `customer_password_resets` VALUES
('test@gmail.com','$2y$10$5MZOxJohl3XI66edugXXhuWQhNSq3WNYiF.8oCF3D/dl90GBxK0EK','2025-03-04 09:11:33'),
('example@mail.com','$2y$10$Y0nzuoiGDTvivtBk/q5jqOo7FYrSJYvPHcwRcmBqeDh.wMKaf.nI2','2025-06-01 18:21:16'),
('test2@gmail.com','$2y$10$Kxk03riJna2q6NLMLXqiruUGo/1GdAQ5NCJly5XEcxmUQE2trBZeG','2025-06-22 10:54:43');
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspended` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `token` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_channel_id_foreign` (`channel_id`),
  CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES
(3,'1111','1111',NULL,NULL,'111@111.com',NULL,NULL,1,'$2y$10$Nanuf7jwQt0Tg8AI2uJNf.Rn5hP3JMfAgLGiJsKWkswXlrj4N0K8S','OqOq7OagSplT76OuKE3iNSeD649mjqQBvVZVJ2qurMhgGxxmujknLTZ66WvfLlw6EzE7Hfm3Lpbq0Xk3',1,1,0,1,0,'aa08384dec3ed1bec98f62578edb0253',NULL,'2025-03-01 10:25:20','2025-03-01 10:25:20'),
(4,'qqqqqqq','qqqqqqq',NULL,NULL,'qqq@qqq.com',NULL,NULL,1,'$2y$10$2fd8xsY9JHSdLsVrjj9Jt.7CzTvpQJFSNOfX6wKgqNjB/tS341Kku','raG7hPHvTAfIKDg6USFTGcVn3DIocUbAZUqPTChr2tKptultJ73ZawekTkNmkHoL8K6yLPaPVxkmh56x',1,1,0,1,0,'bbab823b8387f4f7a629684450b17cd6',NULL,'2025-03-01 10:26:06','2025-03-01 10:26:06'),
(5,'Тест1','Тест2',NULL,NULL,'test@gmail.com',NULL,NULL,1,'$2y$10$uL5uyM.tg/hslztJ4JE8/ucNu8kPEfYflUhMFL1oHc0pOsoJn9Ofy','zPb5z9qOsmORxz8FhhnCcE3Kj57NspoU82UBwohoitQdZNfcm99Is1MB0hf5Nw891iLtYzDREMlFGmSN',1,1,0,1,0,'f370f62cfc60dd19bb570fcb0404eff6',NULL,'2025-03-04 09:11:02','2025-03-04 09:11:02'),
(6,'Тест2','Тест2','Male',NULL,'test2@gmail.com','80292614028',NULL,1,'$2y$10$Ma/GqABfmBHuQLYFLiX.P.LoPAJorgVXlfgV913fLgcJ8WC/geA2u','Xl1DtE1Q2gstwj2Odi3OiZHJiMF44uGsRxdYmC6iDMzDqwGeDVaAQYDB0IZC0KjfmFKqXqUEH3jNeIQQ',1,1,0,1,0,'2ebc20a8c224c42839ca844a95bb59bc',NULL,'2025-03-04 22:16:16','2025-06-04 20:58:37'),
(7,'testtest','testest','Male',NULL,'example@mail.com','+3751234567890',NULL,1,'$2y$10$EVrGJ6xLBJG7Ik76m0OYt.rf/XaPF/p.fxCXRIVbOFD0y2hwhPRd2','HjhXIDDfUsaacq0rmNDOmmN33nyAeinrg5520aTEPtWsix2rFKFbsZrL9xbUP5QaTc1jU4MLg3XVD0mQ',1,1,0,1,0,'7897bd688155ee97b1f84be70d4f1438',NULL,'2025-06-01 18:07:10','2025-06-01 18:08:06'),
(8,'ярослав','ярослав',NULL,NULL,'yariksen.exe@gmail.com',NULL,NULL,1,'$2y$10$2Oh1bUDgY9uw15NpuFScVuk1d3EDBJO.2lib44Mbe6OY3ElakILNK','esc81iatI3W8uk8BKEXi0OJrWdrCUkbLekpPGYWX4xkCrImJtlQfTpZtsBitOaFMi6cjlLaEVITI44nG',1,1,0,1,0,'82254233776623198b1e03603e059ba5',NULL,'2025-06-06 14:02:48','2025-06-06 14:02:48');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_sources`
--

DROP TABLE IF EXISTS `inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `contact_name` varchar(191) NOT NULL,
  `contact_email` varchar(191) NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `contact_fax` varchar(191) DEFAULT NULL,
  `country` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `street` varchar(191) NOT NULL,
  `postcode` varchar(191) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_sources`
--

LOCK TABLES `inventory_sources` WRITE;
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` VALUES
(1,'default','По умолчанию',NULL,'По умолчанию','warehouse@example.com','1234567899',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `order_id` int(10) unsigned DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `reminders` int(11) NOT NULL DEFAULT 0,
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `direction` enum('ltr','rtl') NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES
(1,'ru','Русский','ltr','locales/ru.png',NULL,'2025-02-27 12:54:25'),
(2,'en','Английский','ltr','locales/en.png',NULL,'2025-02-27 14:28:33');
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_admin_password_resets_table',1),
(3,'2014_10_12_100000_create_password_resets_table',1),
(4,'2018_06_12_111907_create_admins_table',1),
(5,'2018_06_13_055341_create_roles_table',1),
(6,'2018_07_05_130148_create_attributes_table',1),
(7,'2018_07_05_132854_create_attribute_translations_table',1),
(8,'2018_07_05_135150_create_attribute_families_table',1),
(9,'2018_07_05_135152_create_attribute_groups_table',1),
(10,'2018_07_05_140832_create_attribute_options_table',1),
(11,'2018_07_05_140856_create_attribute_option_translations_table',1),
(12,'2018_07_05_142820_create_categories_table',1),
(13,'2018_07_10_055143_create_locales_table',1),
(14,'2018_07_20_054426_create_countries_table',1),
(15,'2018_07_20_054502_create_currencies_table',1),
(16,'2018_07_20_054542_create_currency_exchange_rates_table',1),
(17,'2018_07_20_064849_create_channels_table',1),
(18,'2018_07_21_142836_create_category_translations_table',1),
(19,'2018_07_23_110040_create_inventory_sources_table',1),
(20,'2018_07_24_082635_create_customer_groups_table',1),
(21,'2018_07_24_082930_create_customers_table',1),
(22,'2018_07_27_065727_create_products_table',1),
(23,'2018_07_27_070011_create_product_attribute_values_table',1),
(24,'2018_07_27_092623_create_product_reviews_table',1),
(25,'2018_07_27_113941_create_product_images_table',1),
(26,'2018_07_27_113956_create_product_inventories_table',1),
(27,'2018_08_30_064755_create_tax_categories_table',1),
(28,'2018_08_30_065042_create_tax_rates_table',1),
(29,'2018_08_30_065840_create_tax_mappings_table',1),
(30,'2018_09_05_150444_create_cart_table',1),
(31,'2018_09_05_150915_create_cart_items_table',1),
(32,'2018_09_11_064045_customer_password_resets',1),
(33,'2018_09_19_093453_create_cart_payment',1),
(34,'2018_09_19_093508_create_cart_shipping_rates_table',1),
(35,'2018_09_20_060658_create_core_config_table',1),
(36,'2018_09_27_113154_create_orders_table',1),
(37,'2018_09_27_113207_create_order_items_table',1),
(38,'2018_09_27_115022_create_shipments_table',1),
(39,'2018_09_27_115029_create_shipment_items_table',1),
(40,'2018_09_27_115135_create_invoices_table',1),
(41,'2018_09_27_115144_create_invoice_items_table',1),
(42,'2018_10_01_095504_create_order_payment_table',1),
(43,'2018_10_03_025230_create_wishlist_table',1),
(44,'2018_10_12_101803_create_country_translations_table',1),
(45,'2018_10_12_101913_create_country_states_table',1),
(46,'2018_10_12_101923_create_country_state_translations_table',1),
(47,'2018_11_16_173504_create_subscribers_list_table',1),
(48,'2018_11_21_144411_create_cart_item_inventories_table',1),
(49,'2018_12_06_185202_create_product_flat_table',1),
(50,'2018_12_24_123812_create_channel_inventory_sources_table',1),
(51,'2018_12_26_165327_create_product_ordered_inventories_table',1),
(52,'2019_05_13_024321_create_cart_rules_table',1),
(53,'2019_05_13_024322_create_cart_rule_channels_table',1),
(54,'2019_05_13_024323_create_cart_rule_customer_groups_table',1),
(55,'2019_05_13_024324_create_cart_rule_translations_table',1),
(56,'2019_05_13_024325_create_cart_rule_customers_table',1),
(57,'2019_05_13_024326_create_cart_rule_coupons_table',1),
(58,'2019_05_13_024327_create_cart_rule_coupon_usage_table',1),
(59,'2019_06_17_180258_create_product_downloadable_samples_table',1),
(60,'2019_06_17_180314_create_product_downloadable_sample_translations_table',1),
(61,'2019_06_17_180325_create_product_downloadable_links_table',1),
(62,'2019_06_17_180346_create_product_downloadable_link_translations_table',1),
(63,'2019_06_21_202249_create_downloadable_link_purchased_table',1),
(64,'2019_07_30_153530_create_cms_pages_table',1),
(65,'2019_07_31_143339_create_category_filterable_attributes_table',1),
(66,'2019_08_02_105320_create_product_grouped_products_table',1),
(67,'2019_08_20_170510_create_product_bundle_options_table',1),
(68,'2019_08_20_170520_create_product_bundle_option_translations_table',1),
(69,'2019_08_20_170528_create_product_bundle_option_products_table',1),
(70,'2019_09_11_184511_create_refunds_table',1),
(71,'2019_09_11_184519_create_refund_items_table',1),
(72,'2019_12_03_184613_create_catalog_rules_table',1),
(73,'2019_12_03_184651_create_catalog_rule_channels_table',1),
(74,'2019_12_03_184732_create_catalog_rule_customer_groups_table',1),
(75,'2019_12_06_101110_create_catalog_rule_products_table',1),
(76,'2019_12_06_110507_create_catalog_rule_product_prices_table',1),
(77,'2019_12_14_000001_create_personal_access_tokens_table',1),
(78,'2020_01_14_191854_create_cms_page_translations_table',1),
(79,'2020_01_15_130209_create_cms_page_channels_table',1),
(80,'2020_04_16_185147_add_table_addresses',1),
(81,'2020_05_06_171638_create_order_comments_table',1),
(82,'2020_05_21_171500_create_product_customer_group_prices_table',1),
(83,'2020_06_25_162154_create_customer_social_accounts_table',1),
(84,'2020_11_19_112228_create_product_videos_table',1),
(85,'2020_11_26_141455_create_marketing_templates_table',1),
(86,'2020_11_26_150534_create_marketing_events_table',1),
(87,'2020_11_26_150644_create_marketing_campaigns_table',1),
(88,'2020_12_21_000200_create_channel_translations_table',1),
(89,'2020_12_27_121950_create_jobs_table',1),
(90,'2021_03_11_212124_create_order_transactions_table',1),
(91,'2021_04_07_132010_create_product_review_images_table',1),
(92,'2021_12_15_104544_notifications',1),
(93,'2022_03_15_160510_create_failed_jobs_table',1),
(94,'2022_04_01_094622_create_sitemaps_table',1),
(95,'2022_10_03_144232_create_product_price_indices_table',1),
(96,'2022_10_04_144444_create_job_batches_table',1),
(97,'2022_10_08_134150_create_product_inventory_indices_table',1),
(98,'2023_05_26_213105_create_wishlist_items_table',1),
(99,'2023_05_26_213120_create_compare_items_table',1),
(100,'2023_06_27_163529_rename_product_review_images_to_product_review_attachments',1),
(101,'2023_07_06_140013_add_logo_path_column_to_locales',1),
(102,'2023_07_10_184256_create_theme_customizations_table',1),
(103,'2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table',1),
(104,'2023_07_20_185324_add_column_column_in_attribute_groups_table',1),
(105,'2023_07_25_145943_add_regex_column_in_attributes_table',1),
(106,'2023_07_25_165945_drop_notes_column_from_customers_table',1),
(107,'2023_07_25_171058_create_customer_notes_table',1),
(108,'2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table',1),
(109,'2023_09_15_170053_create_theme_customization_translations_table',1),
(110,'2023_09_20_102031_add_default_value_column_in_attributes_table',1),
(111,'2023_09_20_102635_add_inventories_group_in_attribute_groups_table',1),
(112,'2023_09_26_155709_add_columns_to_currencies',1),
(113,'2023_10_05_163612_create_visits_table',1),
(114,'2023_10_12_090446_add_tax_category_id_column_in_order_items_table',1),
(115,'2023_11_08_054614_add_code_column_in_attribute_groups_table',1),
(116,'2023_11_08_140116_create_search_terms_table',1),
(117,'2023_11_09_162805_create_url_rewrites_table',1),
(118,'2023_11_17_150401_create_search_synonyms_table',1),
(119,'2023_12_11_054614_add_channel_id_column_in_product_price_indices_table',1),
(120,'2024_01_11_154640_create_imports_table',1),
(121,'2024_01_11_154741_create_import_batches_table',1),
(122,'2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table',1),
(123,'2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table',1),
(124,'2024_01_22_170814_add_unique_index_in_mapping_tables',1),
(125,'2024_02_26_153000_add_columns_to_addresses_table',1),
(126,'2024_03_07_193421_rename_address1_column_in_addresses_table',1),
(127,'2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table',1),
(128,'2024_04_19_102939_add_incl_tax_columns_in_orders_table',1),
(129,'2024_04_19_135405_add_incl_tax_columns_in_cart_items_table',1),
(130,'2024_04_19_144641_add_incl_tax_columns_in_order_items_table',1),
(131,'2024_04_23_133154_add_incl_tax_columns_in_cart_table',1),
(132,'2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table',1),
(133,'2024_04_24_102939_add_incl_tax_columns_in_invoices_table',1),
(134,'2024_04_24_102939_add_incl_tax_columns_in_refunds_table',1),
(135,'2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table',1),
(136,'2024_04_24_144641_add_incl_tax_columns_in_refund_items_table',1),
(137,'2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table',1),
(138,'2024_05_10_152848_create_saved_filters_table',1),
(139,'2024_06_03_174128_create_product_channels_table',1),
(140,'2024_06_04_130527_add_channel_id_column_in_customers_table',1),
(141,'2024_06_04_134403_add_channel_id_column_in_visits_table',1),
(142,'2024_06_13_184426_add_theme_column_into_theme_customizations_table',1),
(143,'2025_02_28_004155_prune_not_needed_db',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `comment` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
INSERT INTO `order_comments` VALUES
(4,13,'Скоро доставим',0,'2025-06-04 16:45:48','2025-06-04 16:45:48');
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT 0.0000,
  `total_weight` decimal(12,4) DEFAULT 0.0000,
  `qty_ordered` int(11) DEFAULT 0,
  `qty_shipped` int(11) DEFAULT 0,
  `qty_invoiced` int(11) DEFAULT 0,
  `qty_canceled` int(11) DEFAULT 0,
  `qty_refunded` int(11) DEFAULT 0,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES
(12,'sku-2','simple','Икебана \"Искусство цветочной аранжировки\"',NULL,700.0000,2800.0000,4,4,0,4,0,300.0000,300.0000,1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,300.0000,300.0000,1200.0000,1200.0000,41,'Sakura\\Product\\Models\\Product',8,NULL,NULL,'{\"product_id\":\"41\",\"is_buy_now\":\"0\",\"quantity\":1,\"locale\":\"ru\"}','2025-03-01 10:29:55','2025-03-01 10:37:28'),
(13,'sku-1','simple','Татами \"Традиция Японии\"',NULL,400.0000,1200.0000,3,0,0,0,0,1000.0000,1000.0000,3000.0000,3000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,3000.0000,3000.0000,40,'Sakura\\Product\\Models\\Product',9,NULL,NULL,'{\"quantity\":3,\"product_id\":40,\"locale\":\"ru\"}','2025-03-04 23:28:16','2025-03-04 23:28:16'),
(14,'20','simple','Подушка',NULL,100.0000,100.0000,1,0,0,0,0,1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,1000.0000,1000.0000,45,'Sakura\\Product\\Models\\Product',10,NULL,NULL,'{\"product_id\":\"45\",\"is_buy_now\":\"0\",\"quantity\":1,\"locale\":\"ru\"}','2025-03-05 08:45:12','2025-03-05 08:45:12'),
(15,'sku-2','simple','Икебана \"Искусство цветочной аранжировки\"',NULL,700.0000,2100.0000,3,0,0,0,0,300.0000,300.0000,900.0000,900.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,300.0000,300.0000,900.0000,900.0000,41,'Sakura\\Product\\Models\\Product',10,NULL,NULL,'{\"quantity\":3,\"product_id\":41,\"locale\":\"ru\"}','2025-03-05 08:45:13','2025-03-05 08:45:13'),
(16,'sku-4','simple','Японская подушка',NULL,300.0000,300.0000,1,0,0,0,0,1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,1000.0000,1000.0000,42,'Sakura\\Product\\Models\\Product',11,NULL,NULL,'{\"quantity\":1,\"product_id\":42,\"locale\":\"ru\"}','2025-03-05 08:48:11','2025-03-05 08:48:11'),
(17,'sku-1','simple','Татами \"Традиция Японии\"',NULL,400.0000,400.0000,1,0,0,1,0,1000.0000,1000.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,1000.0000,1000.0000,40,'Sakura\\Product\\Models\\Product',12,NULL,NULL,'{\"quantity\":1,\"product_id\":40,\"locale\":\"ru\"}','2025-03-05 14:45:33','2025-06-04 14:52:51'),
(18,'123','simple','Катана сувенирная',NULL,15.0000,30.0000,2,2,0,0,0,110.0000,110.0000,220.0000,220.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,110.0000,110.0000,220.0000,220.0000,47,'Sakura\\Product\\Models\\Product',13,NULL,NULL,'{\"quantity\":1,\"product_id\":47,\"locale\":\"ru\"}','2025-06-04 14:51:19','2025-06-04 15:18:47'),
(19,'123','simple','Катана сувенирная',NULL,15.0000,15.0000,1,0,0,0,0,4.0700,110.0000,4.0700,110.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.0700,110.0000,4.0700,110.0000,47,'Sakura\\Product\\Models\\Product',14,NULL,NULL,'{\"quantity\":1,\"product_id\":47,\"locale\":\"ru\"}','2025-06-04 17:06:07','2025-06-04 17:06:07'),
(20,'sku-125','simple','Золотое кольцо \"Солнечный свет\"',NULL,10.0000,10.0000,1,0,0,0,0,10000.0000,10000.0000,10000.0000,10000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,10000.0000,10000.0000,10000.0000,10000.0000,37,'Sakura\\Product\\Models\\Product',15,NULL,NULL,'{\"quantity\":1,\"product_id\":37,\"locale\":\"ru\"}','2025-06-06 14:07:58','2025-06-06 14:07:58'),
(21,'123','simple','Катана сувенирная',NULL,15.0000,30.0000,2,0,0,0,0,44.4000,1200.0000,88.8000,2400.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,44.4000,1200.0000,88.8000,2400.0000,47,'Sakura\\Product\\Models\\Product',16,NULL,NULL,'{\"quantity\":1,\"product_id\":47,\"locale\":\"ru\"}','2025-06-08 01:11:37','2025-06-08 01:11:37'),
(22,'sku-2','simple','Икебана \"Искусство цветочной аранжировки\"',NULL,700.0000,2100.0000,3,0,0,0,0,11.1000,300.0000,33.3000,900.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,11.1000,300.0000,33.3000,900.0000,41,'Sakura\\Product\\Models\\Product',16,NULL,NULL,'{\"quantity\":1,\"product_id\":41,\"locale\":\"ru\"}','2025-06-08 01:11:37','2025-06-08 01:11:37');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
INSERT INTO `order_payment` VALUES
(8,8,'cashondelivery','Cash On Delivery',NULL,'2025-03-01 10:29:55','2025-03-01 10:29:55'),
(9,9,'cashondelivery','Cash On Delivery',NULL,'2025-03-04 23:28:16','2025-03-04 23:28:16'),
(10,10,'cashondelivery','Cash On Delivery',NULL,'2025-03-05 08:45:12','2025-03-05 08:45:12'),
(11,11,'cashondelivery','Cash On Delivery',NULL,'2025-03-05 08:48:11','2025-03-05 08:48:11'),
(12,12,'cashondelivery','Cash On Delivery',NULL,'2025-03-05 14:45:33','2025-03-05 14:45:33'),
(13,13,'cashondelivery','Cash On Delivery',NULL,'2025-06-04 14:51:19','2025-06-04 14:51:19'),
(14,14,'cashondelivery','Cash On Delivery',NULL,'2025-06-04 17:06:07','2025-06-04 17:06:07'),
(15,15,'cashondelivery','Cash On Delivery',NULL,'2025-06-06 14:07:58','2025-06-06 14:07:58'),
(16,16,'cashondelivery','Cash On Delivery',NULL,'2025-06-08 01:11:37','2025-06-08 01:11:37');
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT 0.0000,
  `payment_method` varchar(191) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `invoice_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `channel_name` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `shipping_title` varchar(191) DEFAULT NULL,
  `shipping_description` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `channel_type` varchar(191) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(8,'1','canceled','По умолчанию',0,'qqq@qqq.com','qqqqqqq','qqqqqqq','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,1,4,'USD','RUB','RUB',1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1200.0000,1200.0000,0.0000,0.0000,4,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',18,NULL,'2025-03-01 10:29:55','2025-03-01 10:37:28'),
(9,'9','pending','По умолчанию',0,'test2@gmail.com','Тест2','Тест2','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,1,3,'USD','RUB','RUB',3000.0000,3000.0000,0.0000,0.0000,0.0000,0.0000,3000.0000,3000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,3000.0000,3000.0000,0.0000,0.0000,6,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',21,NULL,'2025-03-04 23:28:16','2025-03-04 23:28:16'),
(10,'10','pending','По умолчанию',0,'test2@gmail.com','Тест2','Тест2','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,2,4,'USD','RUB','RUB',1900.0000,1900.0000,0.0000,0.0000,0.0000,0.0000,1900.0000,1900.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1900.0000,1900.0000,0.0000,0.0000,6,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',22,NULL,'2025-03-05 08:45:12','2025-03-05 08:45:12'),
(11,'11','pending','По умолчанию',0,'test2@gmail.com','Тест2','Тест2','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,1,1,'USD','RUB','RUB',1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,0.0000,0.0000,6,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',23,NULL,'2025-03-05 08:48:11','2025-03-05 08:48:11'),
(12,'12','canceled','По умолчанию',0,'test2@gmail.com','Тест2','Тест2','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,1,1,'USD','RUB','RUB',1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,0.0000,0.0000,6,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',24,NULL,'2025-03-05 14:45:33','2025-06-04 14:52:51'),
(13,'13','processing','По умолчанию',0,'test2@gmail.com','Тест2','Тест2','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,1,2,'USD','RUB','RUB',220.0000,220.0000,0.0000,0.0000,0.0000,0.0000,220.0000,220.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,220.0000,220.0000,0.0000,0.0000,6,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',35,NULL,'2025-06-04 14:51:19','2025-06-04 15:18:47'),
(14,'14','pending','По умолчанию',0,'test2@gmail.com','Тест2','Тест2','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,1,1,'USD','RUB','BYN',4.0700,110.0000,0.0000,0.0000,0.0000,0.0000,4.0700,110.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.0700,110.0000,0.0000,0.0000,6,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',36,NULL,'2025-06-04 17:06:07','2025-06-04 17:06:07'),
(15,'15','pending','По умолчанию',0,'yariksen.exe@gmail.com','ярослав','ярослав','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,1,1,'USD','RUB','RUB',10000.0000,10000.0000,0.0000,0.0000,0.0000,0.0000,10000.0000,10000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,10000.0000,10000.0000,0.0000,0.0000,8,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',43,NULL,'2025-06-06 14:07:58','2025-06-06 14:07:58'),
(16,'16','pending','По умолчанию',0,'test2@gmail.com','Тест2','Тест2','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,2,5,'USD','RUB','BYN',122.1000,3300.0000,0.0000,0.0000,0.0000,0.0000,122.1000,3300.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,122.1000,3300.0000,0.0000,0.0000,6,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',46,NULL,'2025-06-08 01:11:37','2025-06-08 01:11:37');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `text_value` text DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `unique_id` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1883 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES
(754,NULL,NULL,'30',NULL,NULL,NULL,NULL,NULL,NULL,35,19,'35|19'),
(755,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL,NULL,35,21,'35|21'),
(756,NULL,NULL,'100',NULL,NULL,NULL,NULL,NULL,NULL,35,22,'35|22'),
(757,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,35,28,'35|28'),
(761,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,35,5,'35|5'),
(762,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,35,6,'35|6'),
(763,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,35,7,'35|7'),
(764,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,35,8,'default|35|8'),
(765,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,35,26,'35|26'),
(766,NULL,NULL,'sku-123',NULL,NULL,NULL,NULL,NULL,NULL,35,1,'35|1'),
(767,'ru',NULL,'Браслет из нефрита из дерева 5 мм, 108 бусин Lignum vitae',NULL,NULL,NULL,NULL,NULL,NULL,35,2,'ru|35|2'),
(768,'ru',NULL,'браслет-из-нефрита-из-дерева-5-мм-108-бусин-lignum-vitae',NULL,NULL,NULL,NULL,NULL,NULL,35,3,'ru|35|3'),
(769,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,35,27,'35|27'),
(770,'ru',NULL,'<p><strong>Браслет из жадеита из дерева Lignum vitae</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,35,9,'ru|35|9'),
(771,'ru',NULL,'<p><strong>О лигнум витае&nbsp;</strong></p>\r\n<p>Lignum vitae происходит от латинского и означает &laquo;дерево жизни&raquo; или &laquo;дерево жизни&raquo; из-за его широкого спектра медицинских применений. Эта древесина является одной из самых тяжелых и твердых, а ее прочность делает ее идеальной для множества применений. Она имеет свойство менять цвет на более глубокий зеленый.</p>\r\n<p><strong><span data-preserver-spaces=\"true\">О жадеите</span></strong><span data-preserver-spaces=\"true\">&nbsp;</span></p>\r\n<p><span data-preserver-spaces=\"true\">Жадеит особенно ценился среди китайцев, которые использовали этот драгоценный камень для различных целей. Во-первых, считается, что жадеит дает вам физическую силу, тем самым увеличивая долголетие. Во-вторых, говорят, что он помогает вам бороться с негативной энергией. Согласно фэн-шуй, жадеит также может влиять на процветание.&nbsp;</span></p>\r\n<p><span data-preserver-spaces=\"true\">В Японии у буддистов есть четки (дзюдзю, нэндзю). Киото &mdash; известный центр производства четок.</span></p>\r\n<p><strong><span data-preserver-spaces=\"true\">Обслуживание</span></strong></p>\r\n<p><span data-preserver-spaces=\"true\">Снимайте перед душем и сном. Материал чувствителен к химикатам и чрезмерному потоотделению. Рекомендуем снимать при занятиях спортом и уборке. Протирать мягкой тканью.</span></p>\r\n<p><span data-preserver-spaces=\"true\">※ Цвет может отличаться от реального в зависимости от цветопередачи монитора.</span></p>\r\n<p><span data-preserver-spaces=\"true\">※Импортные пошлины, налоги и сборы не включены в цену товара или стоимость доставки. Эти сборы являются ответственностью покупателя.<br>Пожалуйста, свяжитесь с таможенной службой вашей страны, чтобы определить, какими будут эти дополнительные расходы, до торгов/покупки.</span></p>',NULL,NULL,NULL,NULL,NULL,NULL,35,10,'ru|35|10'),
(773,NULL,NULL,NULL,NULL,29,NULL,NULL,NULL,NULL,35,34,'35|34'),
(774,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,35,35,'35|35'),
(775,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,NULL,35,36,'35|36'),
(776,NULL,NULL,NULL,NULL,NULL,300.0000,NULL,NULL,NULL,35,11,'35|11'),
(777,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,12,'35|12'),
(778,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,13,'35|13'),
(781,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL,36,19,'36|19'),
(782,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,36,21,'36|21'),
(783,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,36,22,'36|22'),
(784,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,36,28,'36|28'),
(788,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,36,5,'36|5'),
(789,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,36,6,'36|6'),
(790,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,36,7,'36|7'),
(791,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,36,8,'default|36|8'),
(792,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,36,26,'36|26'),
(793,NULL,NULL,'sku-124',NULL,NULL,NULL,NULL,NULL,NULL,36,1,'36|1'),
(794,'ru',NULL,'Серебряный браслет \"Звёздный путь\"',NULL,NULL,NULL,NULL,NULL,NULL,36,2,'ru|36|2'),
(795,'ru',NULL,'серебряныи-браслет-звездныи-путь',NULL,NULL,NULL,NULL,NULL,NULL,36,3,'ru|36|3'),
(796,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,36,27,'36|27'),
(797,'ru',NULL,'<p>Стильный серебряный браслет с уникальным дизайном, вдохновлённым космосом.</p>',NULL,NULL,NULL,NULL,NULL,NULL,36,9,'ru|36|9'),
(798,'ru',NULL,'<p>Серебряный браслет \"Звёздный путь\" изготовлен из высококачественного серебра 925 пробы, что обеспечивает его прочность и долговечность. Этот браслет отличается оригинальным плетением, которое напоминает звёздное небо, создавая ощущение глубины и загадки.</p>\r\n<p>Каждая звено браслета аккуратно обработано, что придаёт ему дополнительный блеск и элегантность. Браслет украшен маленькими вставками из циркония, которые сверкают при любом освещении, добавляя нотку роскоши.</p>\r\n<p>Идеален как для повседневного ношения, так и для особых случаев, браслет \"Звёздный путь\" станет отличным дополнением к вашему образу и прекрасным подарком для близкого человека. Доступен в различных размерах для идеальной посадки на запястье.</p>',NULL,NULL,NULL,NULL,NULL,NULL,36,10,'ru|36|10'),
(800,NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,36,34,'36|34'),
(801,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,36,35,'36|35'),
(802,NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,36,36,'36|36'),
(803,NULL,NULL,NULL,NULL,NULL,1500.0000,NULL,NULL,NULL,36,11,'36|11'),
(804,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,12,'36|12'),
(805,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,13,'36|13'),
(808,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,37,19,'37|19'),
(809,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL,NULL,37,21,'37|21'),
(810,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,37,22,'37|22'),
(811,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,37,28,'37|28'),
(815,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,37,5,'37|5'),
(816,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,37,6,'37|6'),
(817,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,37,7,'37|7'),
(818,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,37,8,'default|37|8'),
(819,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,37,26,'37|26'),
(820,NULL,NULL,'sku-125',NULL,NULL,NULL,NULL,NULL,NULL,37,1,'37|1'),
(821,'ru',NULL,'Золотое кольцо \"Солнечный свет\"',NULL,NULL,NULL,NULL,NULL,NULL,37,2,'ru|37|2'),
(822,'ru',NULL,'золотое-кольцо-солнечныи-свет',NULL,NULL,NULL,NULL,NULL,NULL,37,3,'ru|37|3'),
(823,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,37,27,'37|27'),
(824,'ru',NULL,'<p>Изысканное золотое кольцо с элегантным дизайном, вдохновленным лучами солнца.</p>',NULL,NULL,NULL,NULL,NULL,NULL,37,9,'ru|37|9'),
(825,'ru',NULL,'<p>Золотое кольцо Sunshine выполнено из высококачественного золота 585 пробы, что придает ему невероятный блеск и долговечность. Это ювелирное изделие отличается уникальным дизайном с изогнутыми линиями, напоминающими солнечные лучи, символизирующие тепло и радость.</p>\r\n<p>Кольцо украшено центральным камнем - натуральным топазом, который ярко сверкает и придает кольцу индивидуальность. Каждая деталь кольца тщательно проработана, что подчеркивает его изысканность и элегантность.</p>\r\n<p>Подходящее для любого случая - от повседневного ношения до особых случаев, кольцо Sunshine станет прекрасным дополнением к вашему образу и идеальным подарком для близкого человека. Доступно в разных размерах для наилучшей посадки.</p>',NULL,NULL,NULL,NULL,NULL,NULL,37,10,'ru|37|10'),
(827,NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,NULL,37,34,'37|34'),
(828,NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,37,35,'37|35'),
(829,NULL,NULL,NULL,NULL,36,NULL,NULL,NULL,NULL,37,36,'37|36'),
(830,NULL,NULL,NULL,NULL,NULL,10000.0000,NULL,NULL,NULL,37,11,'37|11'),
(831,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,12,'37|12'),
(832,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,13,'37|13'),
(835,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,NULL,38,19,'38|19'),
(836,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL,NULL,38,21,'38|21'),
(837,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL,38,22,'38|22'),
(838,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,38,28,'38|28'),
(842,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,38,5,'38|5'),
(843,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,38,6,'38|6'),
(844,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,38,7,'38|7'),
(845,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,38,8,'default|38|8'),
(846,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,38,26,'38|26'),
(847,NULL,NULL,'sju-125',NULL,NULL,NULL,NULL,NULL,NULL,38,1,'38|1'),
(848,'ru',NULL,'Японское ожерелье \"Сакура\"',NULL,NULL,NULL,NULL,NULL,NULL,38,2,'ru|38|2'),
(849,'ru',NULL,'японское-ожерелье-сакура',NULL,NULL,NULL,NULL,NULL,NULL,38,3,'ru|38|3'),
(850,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,38,27,'38|27'),
(851,'ru',NULL,'<p>Элегантное японское ожерелье, вдохновлённое красотой цветущей сакуры.</p>\r\n<h3>&nbsp;</h3>',NULL,NULL,NULL,NULL,NULL,NULL,38,9,'ru|38|9'),
(852,'ru',NULL,'<p>Японское ожерелье \"Сакура\" выполнено из высококачественных материалов, включая нежное серебро и натуральные жемчужины, которые создают утончённый и романтичный образ. Дизайн ожерелья пронизан традиционными японскими мотивами, отражая гармонию и красоту природы.</p>\r\n<p>Каждая деталь ожерелья тщательно проработана: изящные цветочные элементы напоминают о нежности цветущих сакур, а жемчужины добавляют изысканности. Ожерелье идеально подходит как для повседневного ношения, так и для особых случаев, подчеркивая индивидуальность и стиль.</p>\r\n<p>Это украшение станет великолепным подарком для ценителей японской культуры и эстетики. Доступно в различных длинах для идеальной посадки на шее.</p>',NULL,NULL,NULL,NULL,NULL,NULL,38,10,'ru|38|10'),
(854,NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,38,34,'38|34'),
(855,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,NULL,38,35,'38|35'),
(856,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,NULL,38,36,'38|36'),
(857,NULL,NULL,NULL,NULL,NULL,400.0000,NULL,NULL,NULL,38,11,'38|11'),
(858,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,12,'38|12'),
(859,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,13,'38|13'),
(990,'en',NULL,'Jade bracelet made of wood 5 mm, 108 Lignum vitae beads',NULL,NULL,NULL,NULL,NULL,NULL,35,2,'en|35|2'),
(991,'en',NULL,'jade-bracelet-made-of-wood-5-mm-108-lignum-vitae-beads',NULL,NULL,NULL,NULL,NULL,NULL,35,3,'en|35|3'),
(992,'en',NULL,'<p><strong><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Jadeite bracelet made from Lignum vitae wood</span></span></strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,35,9,'en|35|9'),
(993,'en',NULL,'<p><strong><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">About Lignum Vitae&nbsp;</span></span></strong></p>\r\n<p><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Lignum vitae comes from Latin and means \"tree of life\" or \"tree of life\" due to its wide range of medicinal uses. This wood is one of the heaviest and hardest, and its strength makes it ideal for many uses. It has the ability to change color to a deeper green.</span></span></p>\r\n<p><strong><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">About jadeite</span></span></span></strong><span data-preserver-spaces=\"true\">&nbsp;</span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Jadeite was especially prized by the Chinese, who used this gemstone for a variety of purposes. Firstly, jadeite is believed to give you physical strength, thereby increasing longevity. Secondly, it is said to help you fight negative energy. According to Feng Shui, jadeite can also influence prosperity.&nbsp;</span></span></span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">In Japan, Buddhists have rosaries (juju, nenju). Kyoto is a famous center for the production of rosaries.</span></span></span></p>\r\n<p><strong><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Service</span></span></span></strong></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Remove before showering and sleeping. The material is sensitive to chemicals and excessive sweating. We recommend removing it when exercising or cleaning. Wipe with a soft cloth.</span></span></span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">※ The color may differ from the actual one depending on the color rendering of the monitor.</span></span></span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">※Import duties, taxes and charges are not included in the item price or shipping charges. These charges are the buyer\'s responsibility. </span></span><br><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Please check with your country\'s customs office to determine what these additional costs will be prior to bidding/buying.</span></span></span></p>',NULL,NULL,NULL,NULL,NULL,NULL,35,10,'en|35|10'),
(1020,'en',NULL,'Japanese Sakura Necklace',NULL,NULL,NULL,NULL,NULL,NULL,38,2,'en|38|2'),
(1021,'en',NULL,'japanese-sakura-necklace',NULL,NULL,NULL,NULL,NULL,NULL,38,3,'en|38|3'),
(1022,'en',NULL,'<p>An elegant Japanese necklace inspired by the beauty of cherry blossoms.</p>',NULL,NULL,NULL,NULL,NULL,NULL,38,9,'en|38|9'),
(1023,'en',NULL,'<p>The Japanese Sakura necklace is made of high-quality materials, including delicate silver and natural pearls, which create a sophisticated and romantic image. The design of the necklace is permeated with traditional Japanese motifs, reflecting the harmony and beauty of nature.</p>\r\n<p>Every detail of the necklace is carefully crafted: graceful floral elements remind of the delicacy of blooming sakura, and pearls add sophistication. The necklace is ideal for both everyday wear and special occasions, emphasizing individuality and style.</p>\r\n<p>This jewelry will be a great gift for connoisseurs of Japanese culture and aesthetics. Available in various lengths for a perfect fit on the neck.</p>',NULL,NULL,NULL,NULL,NULL,NULL,38,10,'en|38|10'),
(1026,'en',NULL,'Silver Bracelet \"Star Trek\"',NULL,NULL,NULL,NULL,NULL,NULL,36,2,'en|36|2'),
(1027,'en',NULL,'silver-bracelet-star-trek',NULL,NULL,NULL,NULL,NULL,NULL,36,3,'en|36|3'),
(1028,'en',NULL,'<p>Stylish silver bracelet with a unique design inspired by space.</p>',NULL,NULL,NULL,NULL,NULL,NULL,36,9,'en|36|9'),
(1029,'en',NULL,'<p>The Star Trek Silver Bracelet is made of high-quality 925 sterling silver, which ensures its strength and durability. This bracelet features an original weave that resembles the starry sky, creating a sense of depth and mystery.</p>\r\n<p>Each link of the bracelet is carefully processed, which gives it additional shine and elegance. The bracelet is decorated with small zircon inserts that sparkle in any light, adding a touch of luxury.</p>\r\n<p>Perfect for both everyday wear and special occasions, the Star Trek bracelet will be a great addition to your look and a wonderful gift for a loved one. Available in various sizes for a perfect fit on the wrist.</p>',NULL,NULL,NULL,NULL,NULL,NULL,36,10,'en|36|10'),
(1032,'en',NULL,'Gold Ring \"Sunlight\"',NULL,NULL,NULL,NULL,NULL,NULL,37,2,'en|37|2'),
(1033,'en',NULL,'gold-ring-sunlight',NULL,NULL,NULL,NULL,NULL,NULL,37,3,'en|37|3'),
(1034,'en',NULL,'<p>An exquisite gold ring with an elegant design inspired by the rays of the sun.</p>',NULL,NULL,NULL,NULL,NULL,NULL,37,9,'en|37|9'),
(1035,'en',NULL,'<p>The Sunshine gold ring is made of high-quality 14K gold, which gives it incredible shine and durability. This piece of jewelry features a unique design with curved lines reminiscent of the sun\'s rays, symbolizing warmth and joy.</p>\r\n<p>The ring is decorated with a central stone - a natural topaz, which sparkles brightly and gives the ring its individuality. Each detail of the ring is carefully crafted, which emphasizes its sophistication and elegance.</p>\r\n<p>Suitable for any occasion - from everyday wear to special occasions, the Sunshine ring will be a wonderful addition to your look and an ideal gift for a loved one. Available in different sizes for the best fit.</p>',NULL,NULL,NULL,NULL,NULL,NULL,37,10,'en|37|10'),
(1093,NULL,NULL,'90',NULL,NULL,NULL,NULL,NULL,NULL,52,19,'52|19'),
(1094,NULL,NULL,'85',NULL,NULL,NULL,NULL,NULL,NULL,52,21,'52|21'),
(1095,NULL,NULL,'330',NULL,NULL,NULL,NULL,NULL,NULL,52,22,'52|22'),
(1096,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,52,28,'52|28'),
(1097,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,52,5,'52|5'),
(1098,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,52,6,'52|6'),
(1099,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,52,7,'52|7'),
(1100,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,52,8,'default|52|8'),
(1101,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,52,26,'52|26'),
(1102,NULL,NULL,'1002',NULL,NULL,NULL,NULL,NULL,NULL,52,1,'52|1'),
(1103,'ru',NULL,'Кружка Японская \"Живопись Сакура\"',NULL,NULL,NULL,NULL,NULL,NULL,52,2,'ru|52|2'),
(1104,'ru',NULL,'кружка-японская-живопись-сакура',NULL,NULL,NULL,NULL,NULL,NULL,52,3,'ru|52|3'),
(1105,NULL,NULL,'101',NULL,NULL,NULL,NULL,NULL,NULL,52,27,'52|27'),
(1106,NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,NULL,52,40,'52|40'),
(1107,NULL,NULL,NULL,NULL,52,NULL,NULL,NULL,NULL,52,43,'52|43'),
(1108,NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,52,44,'52|44'),
(1109,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,52,45,'52|45'),
(1111,NULL,NULL,'310',NULL,NULL,NULL,NULL,NULL,NULL,52,47,'52|47'),
(1112,NULL,NULL,'90х85х90',NULL,NULL,NULL,NULL,NULL,NULL,52,48,'52|48'),
(1113,'ru',NULL,'<p>Кружка Японская \"Живопись Сакура\"</p>',NULL,NULL,NULL,NULL,NULL,NULL,52,9,'ru|52|9'),
(1114,'ru',NULL,'<ul>\r\n<li>Керамическая кружка с принтом Японская живопись Сакура в эксклюзивном дизайне, станет прекрасным подарком для вас или близкого человека. Она сохранит цвет и принт при многократном использовании, радуя своего владельца каждый день.</li>\r\n<li>Кружка из керамики будет долго сохранять температуру напитка, не позволяя ему остывать слишком быстро, сохраняя аромат вкус напитка.</li>\r\n<li>Смело можно использовать в микроволновой печи. Рисунок нанесен методом сублимации, что гарантирует яркие цвета и долговечность!</li>\r\n<li>Кружку можно использовать для подарка без повода и для декора интерьера кухни.</li>\r\n</ul>\r\n<ul>\r\n<li>Каждую кружку аккуратно упаковываем в индивидуальную коробку.</li>\r\n</ul>',NULL,NULL,NULL,NULL,NULL,NULL,52,10,'ru|52|10'),
(1115,NULL,NULL,NULL,NULL,NULL,650.0000,NULL,NULL,NULL,52,11,'52|11'),
(1116,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52,12,'52|12'),
(1117,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52,13,'52|13'),
(1118,NULL,NULL,'390',NULL,NULL,NULL,NULL,NULL,NULL,53,19,'53|19'),
(1119,NULL,NULL,'55',NULL,NULL,NULL,NULL,NULL,NULL,53,21,'53|21'),
(1120,NULL,NULL,'2300',NULL,NULL,NULL,NULL,NULL,NULL,53,22,'53|22'),
(1121,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,53,28,'53|28'),
(1122,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,53,5,'53|5'),
(1123,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,53,6,'53|6'),
(1124,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,53,7,'53|7'),
(1125,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,53,8,'default|53|8'),
(1126,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,53,26,'53|26'),
(1127,NULL,NULL,'1001',NULL,NULL,NULL,NULL,NULL,NULL,53,1,'53|1'),
(1128,'ru',NULL,'Посуда для суши, роллы на 2 персоны 12 предметов',NULL,NULL,NULL,NULL,NULL,NULL,53,2,'ru|53|2'),
(1129,'ru',NULL,'посуда-для-суши-роллы-на-2-персоны-12-предметов',NULL,NULL,NULL,NULL,NULL,NULL,53,3,'ru|53|3'),
(1130,NULL,NULL,'110',NULL,NULL,NULL,NULL,NULL,NULL,53,27,'53|27'),
(1131,NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,NULL,53,40,'53|40'),
(1132,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,53,43,'53|43'),
(1133,NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,53,44,'53|44'),
(1134,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,53,45,'53|45'),
(1136,NULL,NULL,'2300',NULL,NULL,NULL,NULL,NULL,NULL,53,47,'53|47'),
(1137,NULL,NULL,'керамические пластины размером 200x130 ,  тарелки для соуса размером 90x65, керамические чашки размером 110x50',NULL,NULL,NULL,NULL,NULL,NULL,53,48,'53|48'),
(1138,'ru',NULL,'<p><strong>Суши сет: суши блюда, роллы на 2 персоны 12 штук, сакуры с иероглифами&nbsp;</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,53,9,'ru|53|9'),
(1139,'ru',NULL,'<p class=\"ds-markdown-paragraph\"><strong>Набор для суши и роллов на 2 персоны | 12 предметов</strong><br><em>Изысканное погружение в восточную культуру</em></p>\r\n<hr>\r\n<h3><strong>Комплектация:</strong></h3>\r\n<p class=\"ds-markdown-paragraph\">✔&nbsp;<strong>2 прямоугольные керамические тарелки</strong>&nbsp;с узором сакуры и иероглифами<br>✔&nbsp;<strong>2 изящные тарелки для соуса</strong>&nbsp;в том же стиле<br>✔&nbsp;<strong>2 керамические чашки</strong>&nbsp;для чая или саке<br>✔&nbsp;<strong>2 пары бамбуковых палочек</strong>&nbsp;&mdash; гладкие и удобные<br>✔&nbsp;<strong>2 керамических держателя</strong>&nbsp;для палочек<br>✔&nbsp;<strong>2 бамбуковых коврика</strong>&nbsp;для эстетичной сервировки</p>\r\n<hr>\r\n<h3><strong>Особенности:</strong></h3>\r\n<p class=\"ds-markdown-paragraph\">&bull;&nbsp;<strong>Роскошный дизайн</strong>&nbsp;&mdash; мотивы сакуры и каллиграфии<br>&bull;&nbsp;<strong>Практичность</strong>&nbsp;&mdash; устойчивые керамические предметы<br>&bull;&nbsp;<strong>Гигиеничность</strong>&nbsp;&mdash; бамбуковые аксессуары с защитой стола<br>&bull;&nbsp;<strong>Компактное хранение</strong>&nbsp;&mdash; коробка с пластиковой крышкой и продуманными отделениями</p>\r\n<hr>\r\n<p class=\"ds-markdown-paragraph\"><strong>Идеальный выбор:</strong><br>&bull; Для романтического ужина<br>&bull; В подарок ценителям восточной кухни<br>&bull; Для создания атмосферы ресторана дома</p>\r\n<p class=\"ds-markdown-paragraph\"><em>Все предметы аккуратно уложены в подарочную упаковку.</em></p>',NULL,NULL,NULL,NULL,NULL,NULL,53,10,'ru|53|10'),
(1140,NULL,NULL,NULL,NULL,NULL,1850.0000,NULL,NULL,NULL,53,11,'53|11'),
(1141,NULL,NULL,NULL,NULL,NULL,1700.0000,NULL,NULL,NULL,53,13,'53|13'),
(1142,NULL,NULL,'Ceramic plates 2600, \r\nSauce dishes 90x65 234, \r\nCeramic cups 220.',NULL,NULL,NULL,NULL,NULL,NULL,53,49,'53|49'),
(1143,NULL,NULL,'Керамические пластины (Ceramic plates) 20x13.\r\nТарелки для соуса (Sauce dishes) 9x6.5.\r\nКерамические чашки (Ceramic cups) 11x5.',NULL,NULL,NULL,NULL,NULL,NULL,53,50,'53|50'),
(1144,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL,55,19,'55|19'),
(1145,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,55,21,'55|21'),
(1146,NULL,NULL,'1800',NULL,NULL,NULL,NULL,NULL,NULL,55,22,'55|22'),
(1147,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,55,28,'55|28'),
(1148,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,55,5,'55|5'),
(1149,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,55,6,'55|6'),
(1150,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,55,7,'55|7'),
(1151,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,55,8,'default|55|8'),
(1152,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,55,26,'55|26'),
(1153,NULL,NULL,'1003',NULL,NULL,NULL,NULL,NULL,NULL,55,1,'55|1'),
(1154,'ru',NULL,'Набор для суши \"Цветущая вишня\" с иероглифом на красном фоне 2 персоны',NULL,NULL,NULL,NULL,NULL,NULL,55,2,'ru|55|2'),
(1155,'ru',NULL,'набор-для-суши-цветущая-вишня-с-иероглифом-на-красном-фоне-2-персоны',NULL,NULL,NULL,NULL,NULL,NULL,55,3,'ru|55|3'),
(1156,NULL,NULL,'28',NULL,NULL,NULL,NULL,NULL,NULL,55,27,'55|27'),
(1157,NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,NULL,55,40,'55|40'),
(1158,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,55,43,'55|43'),
(1159,NULL,NULL,NULL,NULL,59,NULL,NULL,NULL,NULL,55,44,'55|44'),
(1160,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,55,45,'55|45'),
(1161,NULL,NULL,'1800',NULL,NULL,NULL,NULL,NULL,NULL,55,47,'55|47'),
(1162,NULL,NULL,'Тарелка  (Plate) 1820.  \r\nПосуда для соуса (Sauce dish) 1170.',NULL,NULL,NULL,NULL,NULL,NULL,55,49,'55|49'),
(1163,NULL,NULL,'Тарелка (Plate )20x13.\r\nПосуда для соуса (Sauce dish ) 9x6,5.',NULL,NULL,NULL,NULL,NULL,NULL,55,50,'55|50'),
(1164,'ru',NULL,'<p><strong>Набор для суши \"Цветущая вишня\" с иероглифом на красном фоне 2 персоны 28x28, 3x3, 5см</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,55,9,'ru|55|9'),
(1165,'ru',NULL,'<div>Набор рассчитан на двух человек, в комплект входят две прямоугольные керамические пластины. Легкие и гладкие бамбуковые палочки, два комплекта, которые не размокают и не деформируются при правильном хранении. Два керамических держателя для палочек. Два керамических соусника.</div>\r\n<div>Набор упакован в картонную коробку с пластиковой крышкой. Каждый предмет в наборе имеет свою отдельную ячейку для удобного хранения.</div>\r\n<div>Состав набора:</div>\r\n<div>- Тарелка (20*13 см) -2 шт.</div>\r\n<div>- Посуда для соуса (9*6,5 см) - 2 шт.</div>\r\n<div>- Набор бамбуковых палочек для суши. - 2 комплекта.</div>\r\n<div>- Подставка для палок (5,5*1 см) - 2 шт.</div>\r\n<div>- Коробка из подарочного картона (28*29*4см)</div>',NULL,NULL,NULL,NULL,NULL,NULL,55,10,'ru|55|10'),
(1166,NULL,NULL,NULL,NULL,NULL,1500.0000,NULL,NULL,NULL,55,11,'55|11'),
(1167,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,55,13,'55|13'),
(1168,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,56,19,'56|19'),
(1169,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,56,21,'56|21'),
(1170,NULL,NULL,'450',NULL,NULL,NULL,NULL,NULL,NULL,56,22,'56|22'),
(1171,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,56,28,'56|28'),
(1172,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,56,5,'56|5'),
(1173,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,56,6,'56|6'),
(1174,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,56,7,'56|7'),
(1175,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,56,8,'default|56|8'),
(1176,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,56,26,'56|26'),
(1177,NULL,NULL,'1004',NULL,NULL,NULL,NULL,NULL,NULL,56,1,'56|1'),
(1178,'ru',NULL,'Керамический чайник Кюсю',NULL,NULL,NULL,NULL,NULL,NULL,56,2,'ru|56|2'),
(1179,'ru',NULL,'керамическии-чаиник-кюсю',NULL,NULL,NULL,NULL,NULL,NULL,56,3,'ru|56|3'),
(1180,NULL,NULL,'97',NULL,NULL,NULL,NULL,NULL,NULL,56,27,'56|27'),
(1181,NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,NULL,56,40,'56|40'),
(1182,NULL,NULL,NULL,NULL,62,NULL,NULL,NULL,NULL,56,43,'56|43'),
(1183,NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,NULL,56,44,'56|44'),
(1184,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,56,45,'56|45'),
(1185,NULL,NULL,'450',NULL,NULL,NULL,NULL,NULL,NULL,56,47,'56|47'),
(1186,NULL,NULL,'300',NULL,NULL,NULL,NULL,NULL,NULL,56,49,'56|49'),
(1187,NULL,NULL,'12x15x10',NULL,NULL,NULL,NULL,NULL,NULL,56,50,'56|50'),
(1188,'ru',NULL,'<p><strong>Керамический чайник Кюсю 300 мл</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,56,9,'ru|56|9'),
(1189,'ru',NULL,'<p>Традиционный японский чайник Кюсю для заваривания чая. Его уникальная конструкция с боковой ручкой позволяет легко наливать чай одной рукой. Идеально подходит для любителей чая, ценящих аутентичность и функциональность</p>',NULL,NULL,NULL,NULL,NULL,NULL,56,10,'ru|56|10'),
(1190,NULL,NULL,NULL,NULL,NULL,3420.0000,NULL,NULL,NULL,56,11,'56|11'),
(1191,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,56,13,'56|13'),
(1192,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL,57,19,'57|19'),
(1193,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,NULL,57,21,'57|21'),
(1194,NULL,NULL,'400',NULL,NULL,NULL,NULL,NULL,NULL,57,22,'57|22'),
(1195,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,57,28,'57|28'),
(1196,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,57,5,'57|5'),
(1197,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,57,6,'57|6'),
(1198,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,57,7,'57|7'),
(1199,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,57,8,'default|57|8'),
(1200,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,57,26,'57|26'),
(1201,NULL,NULL,'1005',NULL,NULL,NULL,NULL,NULL,NULL,57,1,'57|1'),
(1202,'ru',NULL,'Набор для саке “Гейша”',NULL,NULL,NULL,NULL,NULL,NULL,57,2,'ru|57|2'),
(1203,'ru',NULL,'набор-для-саке-геиша',NULL,NULL,NULL,NULL,NULL,NULL,57,3,'ru|57|3'),
(1204,NULL,NULL,'17',NULL,NULL,NULL,NULL,NULL,NULL,57,27,'57|27'),
(1205,NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,NULL,57,40,'57|40'),
(1206,NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,57,43,'57|43'),
(1207,NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,57,44,'57|44'),
(1208,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,57,45,'57|45'),
(1209,NULL,NULL,'400',NULL,NULL,NULL,NULL,NULL,NULL,57,47,'57|47'),
(1210,NULL,NULL,'Графин (Decanter) 250.\r\nЧашки (Cups) 25.',NULL,NULL,NULL,NULL,NULL,NULL,57,49,'57|49'),
(1211,NULL,NULL,'Графин (Decanter) : 15x6.\r\nЧашки (Cups) : 5x5.',NULL,NULL,NULL,NULL,NULL,NULL,57,50,'57|50'),
(1212,'ru',NULL,'<p><strong>Элегантный набор для саке с изображением гейши. Идеален для сервировки традиционного японского напитка.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,57,9,'ru|57|9'),
(1213,'ru',NULL,'<p>&nbsp;Погрузитесь в японскую культуру с этим изысканным набором для саке. Набор состоит из графина (токкури) и двух чашек (очоко), украшенных нежным изображением гейши в традиционном кимоно. Идеально подходит для наслаждения саке в компании или в одиночестве. Прекрасный подарок для любителей японской культуры и ценителей хорошего саке.</p>',NULL,NULL,NULL,NULL,NULL,NULL,57,10,'ru|57|10'),
(1214,NULL,NULL,NULL,NULL,NULL,920.0000,NULL,NULL,NULL,57,11,'57|11'),
(1215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,57,13,'57|13'),
(1216,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL,58,19,'58|19'),
(1217,NULL,NULL,'18',NULL,NULL,NULL,NULL,NULL,NULL,58,21,'58|21'),
(1218,NULL,NULL,'373',NULL,NULL,NULL,NULL,NULL,NULL,58,22,'58|22'),
(1219,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,58,28,'58|28'),
(1220,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,58,5,'58|5'),
(1221,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,58,6,'58|6'),
(1222,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,58,7,'58|7'),
(1223,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,58,8,'default|58|8'),
(1224,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,58,26,'58|26'),
(1225,NULL,NULL,'1006',NULL,NULL,NULL,NULL,NULL,NULL,58,1,'58|1'),
(1226,'ru',NULL,'Чайник заварочный',NULL,NULL,NULL,NULL,NULL,NULL,58,2,'ru|58|2'),
(1227,'ru',NULL,'чаиник-заварочныи',NULL,NULL,NULL,NULL,NULL,NULL,58,3,'ru|58|3'),
(1228,NULL,NULL,'77',NULL,NULL,NULL,NULL,NULL,NULL,58,27,'58|27'),
(1229,NULL,NULL,NULL,NULL,48,NULL,NULL,NULL,NULL,58,40,'58|40'),
(1230,NULL,NULL,NULL,NULL,62,NULL,NULL,NULL,NULL,58,43,'58|43'),
(1231,NULL,NULL,NULL,NULL,65,NULL,NULL,NULL,NULL,58,44,'58|44'),
(1232,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,58,45,'58|45'),
(1233,NULL,NULL,'373',NULL,NULL,NULL,NULL,NULL,NULL,58,47,'58|47'),
(1234,NULL,NULL,'800',NULL,NULL,NULL,NULL,NULL,NULL,58,49,'58|49'),
(1235,NULL,NULL,'16x20x11.',NULL,NULL,NULL,NULL,NULL,NULL,58,50,'58|50'),
(1236,'ru',NULL,'<p><strong>Стильный заварочный чайник с прозрачным корпусом, деревянными элементами и встроенным фильтром для идеального чаепития.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,58,9,'ru|58|9'),
(1237,'ru',NULL,'<p>Этот элегантный чайник представляет собой современную интерпретацию классического Кюсю. Прозрачный стеклянный корпус позволяет наблюдать за волшебным процессом заваривания чая, а удобная боковая ручка из дерева обеспечивает комфортный захват. Встроенное ситечко облегчает приготовление напитка, удерживая чайные листья, а деревянная крышка сохраняет тепло и аромат. Чайник станет прекрасным дополнением к вашей чайной церемонии, сочетая в себе функциональность, эстетику и высокое качество материалов. Его минималистичный дизайн легко впишется в любой интерьер, а удобный объем позволит наслаждаться любимым чаем в одиночку или в компании друзей.</p>',NULL,NULL,NULL,NULL,NULL,NULL,58,10,'ru|58|10'),
(1238,NULL,NULL,NULL,NULL,NULL,1460.0000,NULL,NULL,NULL,58,11,'58|11'),
(1239,NULL,NULL,NULL,NULL,NULL,1400.0000,NULL,NULL,NULL,58,13,'58|13'),
(1240,NULL,NULL,'320',NULL,NULL,NULL,NULL,NULL,NULL,52,49,'52|49'),
(1241,NULL,NULL,'325',NULL,NULL,NULL,NULL,NULL,NULL,52,50,'52|50'),
(1242,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL,59,19,'59|19'),
(1243,NULL,NULL,'14',NULL,NULL,NULL,NULL,NULL,NULL,59,21,'59|21'),
(1244,NULL,NULL,'1223',NULL,NULL,NULL,NULL,NULL,NULL,59,22,'59|22'),
(1245,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,59,28,'59|28'),
(1246,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,59,5,'59|5'),
(1247,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,59,6,'59|6'),
(1248,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,59,7,'59|7'),
(1249,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,59,8,'default|59|8'),
(1250,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,59,26,'59|26'),
(1251,NULL,NULL,'1007',NULL,NULL,NULL,NULL,NULL,NULL,59,1,'59|1'),
(1252,'ru',NULL,'Японский чайник Тэцубин',NULL,NULL,NULL,NULL,NULL,NULL,59,2,'ru|59|2'),
(1253,'ru',NULL,'японскии-чаиник-тэцубин',NULL,NULL,NULL,NULL,NULL,NULL,59,3,'ru|59|3'),
(1254,NULL,NULL,'78',NULL,NULL,NULL,NULL,NULL,NULL,59,27,'59|27'),
(1255,NULL,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,59,40,'59|40'),
(1256,NULL,NULL,NULL,NULL,62,NULL,NULL,NULL,NULL,59,43,'59|43'),
(1257,NULL,NULL,NULL,NULL,57,NULL,NULL,NULL,NULL,59,44,'59|44'),
(1258,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,59,45,'59|45'),
(1259,NULL,NULL,'1233',NULL,NULL,NULL,NULL,NULL,NULL,59,47,'59|47'),
(1260,NULL,NULL,'520',NULL,NULL,NULL,NULL,NULL,NULL,59,49,'59|49'),
(1261,NULL,NULL,'20x7x14',NULL,NULL,NULL,NULL,NULL,NULL,59,50,'59|50'),
(1262,'ru',NULL,'<p><strong>Тэцубин &mdash; это Японский чугунный чайник с верхней ручкой для кипячения воды (буквально переводится как &laquo;железный горшок&raquo;). В Японии чугунный чайник Тэцубин используется в качестве чайника для нагрева воды над горящим углем</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,59,9,'ru|59|9'),
(1263,'ru',NULL,'<p>Традиционный чугунный чайник Тэцубин.<br>Украшен классическими рельефными узорами снаружи.<br>Относительно небольшой Тэцубин (520 мл), подходящий для традиционного заваривания Сенча или любого другого листового чая для одного или нескольких человек.<br>Чугунная конструкция быстро нагревает воду и сохраняет чайник горячим дольше, чем фарфоровые или глиняные аналоги.</p>',NULL,NULL,NULL,NULL,NULL,NULL,59,10,'ru|59|10'),
(1264,NULL,NULL,NULL,NULL,NULL,2900.0000,NULL,NULL,NULL,59,11,'59|11'),
(1265,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,59,13,'59|13'),
(1266,'en',NULL,'Japanese Mug \"Sakura Painting\"',NULL,NULL,NULL,NULL,NULL,NULL,52,2,'en|52|2'),
(1267,'en',NULL,'japanese-mug-sakura-painting',NULL,NULL,NULL,NULL,NULL,NULL,52,3,'en|52|3'),
(1268,'en',NULL,'<p>Japanese \"Sakura Painting\" Mug</p>',NULL,NULL,NULL,NULL,NULL,NULL,52,9,'en|52|9'),
(1269,'en',NULL,'<ul>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">A ceramic mug featuring an exclusive Japanese Sakura painting design will make a wonderful gift for yourself or a loved one. It retains its color and print even after repeated use, bringing joy to its owner every day.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">The ceramic mug maintains the temperature of your drink for a long time, preventing it from cooling too quickly while preserving the aroma and taste.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Safe for use in the microwave. The design is applied using sublimation printing, ensuring vibrant colors and durability!</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">This mug is perfect as a spontaneous gift or as a decorative piece for your kitchen.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Each mug is carefully packaged in an individual box.</p>\r\n</li>\r\n</ul>',NULL,NULL,NULL,NULL,NULL,NULL,52,10,'en|52|10'),
(1270,'en',NULL,'Sushi Dinnerware Set for Two – 12 Pieces',NULL,NULL,NULL,NULL,NULL,NULL,53,2,'en|53|2'),
(1271,'en',NULL,'sushi-dinnerware-set-for-two-12-pieces',NULL,NULL,NULL,NULL,NULL,NULL,53,3,'en|53|3'),
(1272,'en',NULL,'<p><strong>Sushi Set for Two &ndash; 12-Piece Sakura &amp; Calligraphy Design</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,53,9,'en|53|9'),
(1273,'en',NULL,'<p class=\"ds-markdown-paragraph\">This elegant set, designed for enjoying authentic Eastern cuisine at home, includes&nbsp;<strong>12 pieces</strong>&nbsp;crafted from sakura-patterned and calligraphic ceramic, showcasing the refined beauty of Asian culture.</p>\r\n<h3><strong>Set Includes:</strong></h3>\r\n<p class=\"ds-markdown-paragraph\">✔&nbsp;<strong>2 rectangular ceramic plates</strong>&nbsp;&ndash; for serving sushi and rolls.<br>✔&nbsp;<strong>2 sauce dishes</strong>&nbsp;&ndash; perfect for soy sauce, wasabi, or ginger.<br>✔&nbsp;<strong>2 ceramic cups</strong>&nbsp;&ndash; ideal for tea or sake.<br>✔&nbsp;<strong>2 pairs of smooth bamboo chopsticks</strong>&nbsp;&ndash; lightweight and comfortable for dining.<br>✔&nbsp;<strong>2 ceramic chopstick rests</strong>&nbsp;&ndash; keeps utensils hygienic and secure.<br>✔&nbsp;<strong>2 bamboo placemats</strong>&nbsp;&ndash; protects your table and enhances presentation.</p>\r\n<h3><strong>Features:</strong></h3>\r\n<ul>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>Stylish &amp; practical</strong>&nbsp;&ndash; Combines traditional aesthetics with everyday functionality.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>Secure packaging</strong>&nbsp;&ndash; Housed in a sturdy cardboard box with a plastic lid for easy storage and transport.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>Compact organization</strong>&nbsp;&ndash; Each piece has a designated spot inside the box.</p>\r\n</li>\r\n</ul>\r\n<p class=\"ds-markdown-paragraph\">Perfect for intimate dinners, gifts, or elevating your home dining experience!</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Sushi Set for Two (12-Piece)</strong><br>Ceramic plates, sauce dishes, cups + bamboo chopsticks, rests &amp; mats. Sakura/calligraphy design. Packed in a storage-friendly box. Ideal for home dining or gifting.</p>',NULL,NULL,NULL,NULL,NULL,NULL,53,10,'en|53|10'),
(1274,'en',NULL,'Sushi set \"Blossoming cherry\" with hieroglyph on red background for 2 persons',NULL,NULL,NULL,NULL,NULL,NULL,55,2,'en|55|2'),
(1275,'en',NULL,'sushi-set-blossoming-cherry-with-hieroglyph-on-red-background-for-2-persons',NULL,NULL,NULL,NULL,NULL,NULL,55,3,'en|55|3'),
(1276,'en',NULL,'<p><strong>Sushi Set \"Blossoming Cherry\" with hieroglyph on red background, 2 persons, 28x28, 3x3, 5cm</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,55,9,'en|55|9'),
(1277,'en',NULL,'<p class=\"ds-markdown-paragraph\"><strong>Sushi Set for Two Persons</strong></p>\r\n<p class=\"ds-markdown-paragraph\">The set includes:</p>\r\n<ul>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>2 rectangular ceramic plates</strong>&nbsp;(20x13 cm)</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>2 ceramic sauce dishes</strong>&nbsp;(9x6.5 cm)</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>2 pairs of bamboo chopsticks</strong>&nbsp;(lightweight, smooth, resistant to moisture and deformation when stored properly)</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>2 ceramic chopstick rests</strong>&nbsp;(5.5x1 cm)</p>\r\n</li>\r\n</ul>\r\n<p class=\"ds-markdown-paragraph\"><strong>Packaging:</strong></p>\r\n<ul>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Sturdy cardboard box with plastic lid</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Each item has a dedicated compartment for organized storage</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Gift box dimensions: 28x29x4 cm</p>\r\n</li>\r\n</ul>',NULL,NULL,NULL,NULL,NULL,NULL,55,10,'en|55|10'),
(1278,'en',NULL,'Kyushu ceramic teapot',NULL,NULL,NULL,NULL,NULL,NULL,56,2,'en|56|2'),
(1279,'en',NULL,'kyushu-ceramic-teapot',NULL,NULL,NULL,NULL,NULL,NULL,56,3,'en|56|3'),
(1280,'en',NULL,'<p>Ceramic teapot Kyushu 300 ml</p>',NULL,NULL,NULL,NULL,NULL,NULL,56,9,'en|56|9'),
(1281,'en',NULL,'<p class=\"ds-markdown-paragraph\"><strong>Traditional Japanese Kyushu Teapot for Brewing Tea</strong></p>\r\n<p class=\"ds-markdown-paragraph\">Featuring a unique side-handle design that allows for easy one-handed pouring. Perfect for tea enthusiasts who value authenticity and functionality.</p>',NULL,NULL,NULL,NULL,NULL,NULL,56,10,'en|56|10'),
(1282,'en',NULL,'Sake Set \"Geisha\"',NULL,NULL,NULL,NULL,NULL,NULL,57,2,'en|57|2'),
(1283,'en',NULL,'sake-set-geisha',NULL,NULL,NULL,NULL,NULL,NULL,57,3,'en|57|3'),
(1284,'en',NULL,'<p><strong>Elegant sake set with geisha design. Perfect for serving traditional Japanese drink.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,57,9,'en|57|9'),
(1285,'en',NULL,'<p>Immerse yourself in Japanese culture with this exquisite sake set. The set includes a decanter (tokkuri) and two cups (ochoko), adorned with delicate depictions of a geisha in traditional kimono. Perfect for enjoying sake with company or alone. A wonderful gift for lovers of Japanese culture and connoisseurs of fine sake.</p>',NULL,NULL,NULL,NULL,NULL,NULL,57,10,'en|57|10'),
(1286,'en',NULL,'Teapot',NULL,NULL,NULL,NULL,NULL,NULL,58,2,'en|58|2'),
(1287,'en',NULL,'teapot',NULL,NULL,NULL,NULL,NULL,NULL,58,3,'en|58|3'),
(1288,'en',NULL,'<p><strong>Stylish teapot with transparent body, wooden accents, and built-in filter for perfect tea brewing.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,58,9,'en|58|9'),
(1289,'en',NULL,'<p>This elegant teapot offers a modern interpretation of the classic Kyushu style. Its transparent glass body allows you to witness the magical tea brewing process, while the comfortable wooden side handle provides a secure grip. The built-in filter simplifies preparation by containing tea leaves, and the wooden lid retains heat and aroma. The teapot will beautifully complement your tea ceremony, combining functionality, aesthetics, and high-quality materials. Its minimalist design effortlessly blends with any interior, and the convenient volume lets you enjoy your favorite tea alone or with friends.</p>',NULL,NULL,NULL,NULL,NULL,NULL,58,10,'en|58|10'),
(1290,'en',NULL,'Japanese Tetsubin Teapot',NULL,NULL,NULL,NULL,NULL,NULL,59,2,'en|59|2'),
(1291,'en',NULL,'japanese-tetsubin-teapot',NULL,NULL,NULL,NULL,NULL,NULL,59,3,'en|59|3'),
(1292,'en',NULL,'<p><strong>Tetsubin is a Japanese cast iron teapot with a top handle for boiling water (literally translated as \"iron pot\"). In Japan, the cast iron teapot Tetsubin is used as a kettle for heating water over burning charcoal.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,59,9,'en|59|9'),
(1293,'en',NULL,'<p>Traditional cast iron Tetsubin teapot.<br>Adorned with classic embossed patterns on the exterior.<br>A relatively small Tetsubin (520 ml), suitable for traditional brewing of Sencha or any other loose-leaf tea for one or several people.<br>The cast iron construction heats water quickly and keeps the teapot hot longer than porcelain or clay counterparts.</p>',NULL,NULL,NULL,NULL,NULL,NULL,59,10,'en|59|10'),
(1294,NULL,NULL,'104',NULL,NULL,NULL,NULL,NULL,NULL,60,19,'60|19'),
(1295,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,60,21,'60|21'),
(1296,NULL,NULL,'2.33',NULL,NULL,NULL,NULL,NULL,NULL,60,22,'60|22'),
(1297,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,60,28,'60|28'),
(1298,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,60,5,'60|5'),
(1299,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,60,6,'60|6'),
(1300,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,60,7,'60|7'),
(1301,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,60,8,'default|60|8'),
(1302,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,60,26,'60|26'),
(1303,NULL,NULL,'1200',NULL,NULL,NULL,NULL,NULL,NULL,60,1,'60|1'),
(1304,'ru',NULL,'Набор самурайских сувенирных мечей',NULL,NULL,NULL,NULL,NULL,NULL,60,2,'ru|60|2'),
(1305,'ru',NULL,'набор-самураиских-сувенирных-мечеи',NULL,NULL,NULL,NULL,NULL,NULL,60,3,'ru|60|3'),
(1306,NULL,NULL,'1200',NULL,NULL,NULL,NULL,NULL,NULL,60,27,'60|27'),
(1307,NULL,NULL,NULL,NULL,70,NULL,NULL,NULL,NULL,60,51,'60|51'),
(1308,NULL,NULL,'72,74,77',NULL,NULL,NULL,NULL,NULL,NULL,60,52,'60|52'),
(1309,NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,60,53,'60|53'),
(1310,NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,60,54,'60|54'),
(1311,NULL,NULL,'Катана (Katana) 70\r\nВакидзаси (Wakizashi) 48,5',NULL,NULL,NULL,NULL,NULL,NULL,60,55,'60|55'),
(1312,NULL,NULL,'Катана (Katana) 24\r\nВакидзаси (Wakizashi) 21',NULL,NULL,NULL,NULL,NULL,NULL,60,56,'60|56'),
(1313,NULL,NULL,'2.33',NULL,NULL,NULL,NULL,NULL,NULL,60,57,'60|57'),
(1314,'ru',NULL,'<h3><strong>Набор \"Дайсё\" (катана + вакидзаси)</strong></h3>',NULL,NULL,NULL,NULL,NULL,NULL,60,9,'ru|60|9'),
(1315,'ru',NULL,'<p class=\"ds-markdown-paragraph\">Дайсё &mdash; это общее название для двух основных мечей самурая в феодальной Японии: длинного&nbsp;<strong>катаны</strong>&nbsp;и короткого&nbsp;<strong>вакидзаси</strong>. Вместе они составляли традиционный парный набор, символизирующий статус и боевую подготовку воина.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Катана</strong>&nbsp;использовалась для боя в открытом пространстве, а&nbsp;<strong>вакидзаси</strong> &mdash; для ближнего боя или ритуалов (например, сэппуку). Дайсё (букв. &laquo;большой-малый&raquo;) отражал не только практическое разделение оружия, но и социальный кодекс самурая. Носить эти мечи могли только представители воинского сословия, что подчёркивало их привилегированное положение.</p>\r\n<p class=\"ds-markdown-paragraph\">Воссоздайте дух самурайской эпохи с набором &ldquo;Дайсё&rdquo;, включающим катану и вакидзаси. Оба меча выполнены в едином стиле, что подчеркивает их принадлежность к одной школе и традиции. Клинки изготовлены из прочной стали, обеспечивающей остроту и долговечность. Рукоятки (цука) искусно обмотаны черным текстилем, обеспечивающим надежный хват. Ножны (сая) покрыты черным лаком с глянцевым блеском, а гарды (цуба) украшены изящным орнаментом. Этот набор станет достойным украшением любой коллекции и прекрасным подарком для поклонников японской культуры.</p>',NULL,NULL,NULL,NULL,NULL,NULL,60,10,'ru|60|10'),
(1316,NULL,NULL,NULL,NULL,NULL,33500.0000,NULL,NULL,NULL,60,11,'60|11'),
(1317,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,13,'60|13'),
(1318,NULL,NULL,'104',NULL,NULL,NULL,NULL,NULL,NULL,61,19,'61|19'),
(1319,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,61,21,'61|21'),
(1320,NULL,NULL,'1185',NULL,NULL,NULL,NULL,NULL,NULL,61,22,'61|22'),
(1321,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,61,28,'61|28'),
(1322,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,61,5,'61|5'),
(1323,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,61,6,'61|6'),
(1324,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,61,7,'61|7'),
(1325,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,61,8,'default|61|8'),
(1326,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,61,26,'61|26'),
(1327,NULL,NULL,'1201',NULL,NULL,NULL,NULL,NULL,NULL,61,1,'61|1'),
(1328,'ru',NULL,'Меч самурайский сине-золотой с золотистой гардой',NULL,NULL,NULL,NULL,NULL,NULL,61,2,'ru|61|2'),
(1329,'ru',NULL,'меч-самураискии-сине-золотои-с-золотистои-гардои',NULL,NULL,NULL,NULL,NULL,NULL,61,3,'ru|61|3'),
(1330,NULL,NULL,'1201',NULL,NULL,NULL,NULL,NULL,NULL,61,27,'61|27'),
(1331,NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,NULL,61,51,'61|51'),
(1332,NULL,NULL,'72,74,77',NULL,NULL,NULL,NULL,NULL,NULL,61,52,'61|52'),
(1333,NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,61,53,'61|53'),
(1334,NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,61,54,'61|54'),
(1335,NULL,NULL,'70',NULL,NULL,NULL,NULL,NULL,NULL,61,55,'61|55'),
(1336,NULL,NULL,'75',NULL,NULL,NULL,NULL,NULL,NULL,61,56,'61|56'),
(1337,NULL,NULL,'1,185',NULL,NULL,NULL,NULL,NULL,NULL,61,57,'61|57'),
(1338,'ru',NULL,'<p><strong>Этот сине-золотой клинок &mdash; не просто украшение, а воплощение самурайского духа, где каждая деталь говорит о совершенстве форм и благородстве традиций</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,61,9,'ru|61|9'),
(1339,'ru',NULL,'<p class=\"ds-markdown-paragraph\">Катана &mdash; это больше чем просто меч. Это квинтэссенция японского воинского духа, воплощение вековых традиций и безупречного мастерства кузнецов. С XII века этот изогнутый однолезвийный клинок был неразрывно связан с кодексом самурая, становясь буквально продолжением его руки и воли.</p>\r\n<p class=\"ds-markdown-paragraph\">Искусство создания катаны сравнимо с таинством &mdash; многослойная ковка стали, закалка с особым температурным режимом, кропотливая полировка, превращающая клинок в произведение искусства. Характерный изгиб и тщательно выверенный баланс позволяли наносить молниеносные режущие удары, а особое положение лезвием вверх давало самураю преимущество в скоротечных схватках.</p>\r\n<p class=\"ds-markdown-paragraph\">Но катана никогда не была просто оружием. В мирное время она служила символом статуса, а в ритуальных практиках &mdash; инструментом сохранения чести. Даже сегодня, когда эпоха самураев осталась в прошлом, катана продолжает жить &mdash; в традиционных боевых искусствах, в кинематографе, в коллекциях ценителей. Ваша сине-золотая катана, пусть и декоративная, хранит в себе отголоски этой великой традиции, напоминая о времени, когда меч был не просто сталью, а воплощением духа воина.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Катана \"Самурайский сине-золотой с золотой гардой\"</strong>&nbsp;&ndash; это стилизованное оружие в традиционном японском духе, созданное для коллекционеров и ценителей восточной эстетики. Меч выполнен из нержавеющей стали с декоративной имитацией заточки, что делает его безопасным украшением интерьера.</p>\r\n<p class=\"ds-markdown-paragraph\">Клинок длиной&nbsp;<strong>70 см</strong>&nbsp;дополнен изящной&nbsp;<strong>золотой цубой</strong>&nbsp;с узорами, а&nbsp;<strong>синие акценты</strong>&nbsp;на рукояти и ножнах придают мечу благородный вид. Рукоять длиной&nbsp;<strong>24 см</strong>&nbsp;обтянута текстилем для удобного хвата, а лакированные ножны (<strong>75 см</strong>) завершают образ.</p>',NULL,NULL,NULL,NULL,NULL,NULL,61,10,'ru|61|10'),
(1340,NULL,NULL,NULL,NULL,NULL,29100.0000,NULL,NULL,NULL,61,11,'61|11'),
(1341,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,61,13,'61|13'),
(1342,NULL,NULL,'58',NULL,NULL,NULL,NULL,NULL,NULL,62,19,'62|19'),
(1343,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,62,21,'62|21'),
(1344,NULL,NULL,'1085',NULL,NULL,NULL,NULL,NULL,NULL,62,22,'62|22'),
(1345,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,62,28,'62|28'),
(1346,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,62,5,'62|5'),
(1347,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,62,6,'62|6'),
(1348,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,62,7,'62|7'),
(1349,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,62,8,'default|62|8'),
(1350,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,62,26,'62|26'),
(1351,NULL,NULL,'1202',NULL,NULL,NULL,NULL,NULL,NULL,62,1,'62|1'),
(1352,'ru',NULL,'Вакидзаси самурайский меч',NULL,NULL,NULL,NULL,NULL,NULL,62,2,'ru|62|2'),
(1353,'ru',NULL,'вакидзаси-самураискии-меч',NULL,NULL,NULL,NULL,NULL,NULL,62,3,'ru|62|3'),
(1354,NULL,NULL,'1202',NULL,NULL,NULL,NULL,NULL,NULL,62,27,'62|27'),
(1355,NULL,NULL,NULL,NULL,67,NULL,NULL,NULL,NULL,62,51,'62|51'),
(1356,NULL,NULL,'72,74,77',NULL,NULL,NULL,NULL,NULL,NULL,62,52,'62|52'),
(1357,NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,62,53,'62|53'),
(1358,NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,62,54,'62|54'),
(1359,NULL,NULL,'34',NULL,NULL,NULL,NULL,NULL,NULL,62,55,'62|55'),
(1360,NULL,NULL,'14',NULL,NULL,NULL,NULL,NULL,NULL,62,56,'62|56'),
(1361,NULL,NULL,'1,085',NULL,NULL,NULL,NULL,NULL,NULL,62,57,'62|57'),
(1362,'ru',NULL,'<p>Изысканный вакидзаси с клинком 34 см &mdash; уменьшенное, но не менее значимое воплощение самурайского духа. Деревянные ножны, сталь с благородным блеском и сертификат подлинности делают его достойным элементом любой коллекции.</p>',NULL,NULL,NULL,NULL,NULL,NULL,62,9,'ru|62|9'),
(1363,'ru',NULL,'<p class=\"ds-markdown-paragraph\">Вакидзаси &mdash; это самурайский короткий меч, верный спутник катаны, вместе с которым они составляли священную пару дайсё. В отличие от своего более длинного собрата, вакидзаси был оружием повседневности: его носили даже в помещении, использовали в ближнем бою, а иногда &mdash; для совершения ритуального сэппуку. Его клинок (обычно 30&ndash;60 см) сочетал смертоносную остроту с изяществом: те же изгибы и ковка, что у катаны, но более компактный размер позволял мгновенно атаковать в тесных пространствах. Вакидзаси считался &laquo;мечом чести&raquo; &mdash; последним аргументом самурая, когда катана была недоступна. Сегодня, как и катана, он стал символом эпохи, воплощённым в коллекционных репликах, где каждая деталь &mdash; от текстильной оплётки рукояти до лакированных ножен &mdash; хранит дух бусидо. Ваш экземпляр с имитацией заточки &mdash; прекрасная дань этой традици. Данная модель сочетает в себе элегантность и практичность. Клинок изготовлен из прочной нержавеющей стали 440, что обеспечивает его долговечность и стойкость к коррозии. Рукоятка (Цука) искусно оплетена черным текстилем, обеспечивая надежный хват, а ножны (Сая) покрыты глянцевым лаком глубокого бордового оттенка. Металлические элементы оправы (Цуба, Фучи, Кашира) добавляют изысканности и завершают образ. Этот вакидзаси станет прекрасным дополнением коллекции или запоминающимся подарком.</p>',NULL,NULL,NULL,NULL,NULL,NULL,62,10,'ru|62|10'),
(1364,NULL,NULL,NULL,NULL,NULL,19000.0000,NULL,NULL,NULL,62,11,'62|11'),
(1365,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62,13,'62|13'),
(1366,NULL,NULL,'110',NULL,NULL,NULL,NULL,NULL,NULL,63,19,'63|19'),
(1367,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,63,21,'63|21'),
(1368,NULL,NULL,'629',NULL,NULL,NULL,NULL,NULL,NULL,63,22,'63|22'),
(1369,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,63,28,'63|28'),
(1370,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,63,5,'63|5'),
(1371,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,63,6,'63|6'),
(1372,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,63,7,'63|7'),
(1373,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,63,8,'default|63|8'),
(1374,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,63,26,'63|26'),
(1375,NULL,NULL,'1203',NULL,NULL,NULL,NULL,NULL,NULL,63,1,'63|1'),
(1376,'ru',NULL,'Тренировочный меч, боккен Mr. Fox',NULL,NULL,NULL,NULL,NULL,NULL,63,2,'ru|63|2'),
(1377,'ru',NULL,'тренировочныи-меч-боккен-mr-fox',NULL,NULL,NULL,NULL,NULL,NULL,63,3,'ru|63|3'),
(1378,NULL,NULL,'1203',NULL,NULL,NULL,NULL,NULL,NULL,63,27,'63|27'),
(1379,NULL,NULL,NULL,NULL,68,NULL,NULL,NULL,NULL,63,51,'63|51'),
(1380,NULL,NULL,'74,76',NULL,NULL,NULL,NULL,NULL,NULL,63,52,'63|52'),
(1381,NULL,NULL,NULL,NULL,82,NULL,NULL,NULL,NULL,63,53,'63|53'),
(1382,NULL,NULL,NULL,NULL,85,NULL,NULL,NULL,NULL,63,54,'63|54'),
(1383,NULL,NULL,'75',NULL,NULL,NULL,NULL,NULL,NULL,63,55,'63|55'),
(1384,NULL,NULL,'30',NULL,NULL,NULL,NULL,NULL,NULL,63,56,'63|56'),
(1385,NULL,NULL,'629',NULL,NULL,NULL,NULL,NULL,NULL,63,57,'63|57'),
(1386,'ru',NULL,'<p><strong>Боккен Mr. Fox &mdash; не просто деревянная копия меча, а инструмент, в котором живёт дух самурайских традиций.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,63,9,'ru|63|9'),
(1387,'ru',NULL,'<p><strong>Боккен</strong> &mdash; это деревянный макет японского меча, созданный для тренировок и поединков. В отличие от настоящей катаны, он не имеет острого лезвия, но точно повторяет её форму, вес и баланс, что делает его незаменимым инструментом в таких боевых искусствах, как кэндо, айкидо и иайдо.</p>\r\n<p class=\"ds-markdown-paragraph\">Идеально сбалансированный деревянный меч для отработки техник кендо и иайдо. Изготовлен из плотной древесины (дуб или бук), точно передает вес и баланс настоящей катаны при длине 105 см. Рукоять с традиционной черной ромбовидной оплеткой обеспечивает надежный хват во время тренировок. Профессиональный инструмент для серьезных занятий японскими боевыми искусствами. Подойдет как начинающим, так и опытным практикам.</p>',NULL,NULL,NULL,NULL,NULL,NULL,63,10,'ru|63|10'),
(1388,NULL,NULL,NULL,NULL,NULL,11479.0000,NULL,NULL,NULL,63,11,'63|11'),
(1389,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,63,13,'63|13'),
(1390,NULL,NULL,'110',NULL,NULL,NULL,NULL,NULL,NULL,64,19,'64|19'),
(1391,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,64,21,'64|21'),
(1392,NULL,NULL,'550',NULL,NULL,NULL,NULL,NULL,NULL,64,22,'64|22'),
(1393,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,64,28,'64|28'),
(1394,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,64,5,'64|5'),
(1395,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,64,6,'64|6'),
(1396,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,64,7,'64|7'),
(1397,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,64,8,'default|64|8'),
(1398,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,64,26,'64|26'),
(1399,NULL,NULL,'1204',NULL,NULL,NULL,NULL,NULL,NULL,64,1,'64|1'),
(1400,'ru',NULL,'Боккен 102 см с резиновой ручкой',NULL,NULL,NULL,NULL,NULL,NULL,64,2,'ru|64|2'),
(1401,'ru',NULL,'боккен-102-см-с-резиновои-ручкои',NULL,NULL,NULL,NULL,NULL,NULL,64,3,'ru|64|3'),
(1402,NULL,NULL,'1204',NULL,NULL,NULL,NULL,NULL,NULL,64,27,'64|27'),
(1403,NULL,NULL,NULL,NULL,68,NULL,NULL,NULL,NULL,64,51,'64|51'),
(1404,NULL,NULL,'76,79',NULL,NULL,NULL,NULL,NULL,NULL,64,52,'64|52'),
(1405,NULL,NULL,NULL,NULL,82,NULL,NULL,NULL,NULL,64,53,'64|53'),
(1406,NULL,NULL,NULL,NULL,85,NULL,NULL,NULL,NULL,64,54,'64|54'),
(1407,NULL,NULL,'102',NULL,NULL,NULL,NULL,NULL,NULL,64,55,'64|55'),
(1408,NULL,NULL,'26',NULL,NULL,NULL,NULL,NULL,NULL,64,56,'64|56'),
(1409,NULL,NULL,'550',NULL,NULL,NULL,NULL,NULL,NULL,64,57,'64|57'),
(1410,'ru',NULL,'<p><strong>Боккен 102 с резиновой рукоятью</strong> &mdash; идеальный партнёр для тренировок, сочетающий традиционную форму деревянного меча с современным удобством.</p>',NULL,NULL,NULL,NULL,NULL,NULL,64,9,'ru|64|9'),
(1411,'ru',NULL,'<p class=\"ds-markdown-paragraph\"><strong>Боккен</strong> &mdash; это деревянный макет японского меча, созданный для тренировок и поединков. В отличие от настоящей катаны, он не имеет острого лезвия, но точно повторяет её форму, вес и баланс, что делает его незаменимым инструментом в таких боевых искусствах, как кэндо, айкидо и иайдо.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Боккен 102 с резиновой ручкой</strong> &ndash; практичный тренировочный меч из твердой древесины (дуб/бук) длиной 102 см. Резиновая рукоять (26 см) обеспечивает надежный хват, а оптимальный вес (550 г) делает его удобным для отработки техник кендо и иайдо.</p>\r\n<p class=\"ds-markdown-paragraph\">&nbsp;</p>',NULL,NULL,NULL,NULL,NULL,NULL,64,10,'ru|64|10'),
(1412,NULL,NULL,NULL,NULL,NULL,12000.0000,NULL,NULL,NULL,64,11,'64|11'),
(1413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,64,13,'64|13'),
(1414,NULL,NULL,'35',NULL,NULL,NULL,NULL,NULL,NULL,65,19,'65|19'),
(1415,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,65,21,'65|21'),
(1416,NULL,NULL,'0.5',NULL,NULL,NULL,NULL,NULL,NULL,65,22,'65|22'),
(1417,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,65,28,'65|28'),
(1418,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,65,5,'65|5'),
(1419,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,65,6,'65|6'),
(1420,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,65,7,'65|7'),
(1421,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,65,8,'default|65|8'),
(1422,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,65,26,'65|26'),
(1423,NULL,NULL,'1205',NULL,NULL,NULL,NULL,NULL,NULL,65,1,'65|1'),
(1424,'ru',NULL,'Японский танто самурай катана',NULL,NULL,NULL,NULL,NULL,NULL,65,2,'ru|65|2'),
(1425,'ru',NULL,'японскии-танто-самураи-катана',NULL,NULL,NULL,NULL,NULL,NULL,65,3,'ru|65|3'),
(1426,NULL,NULL,'1205',NULL,NULL,NULL,NULL,NULL,NULL,65,27,'65|27'),
(1427,NULL,NULL,NULL,NULL,80,NULL,NULL,NULL,NULL,65,51,'65|51'),
(1428,NULL,NULL,'73,76',NULL,NULL,NULL,NULL,NULL,NULL,65,52,'65|52'),
(1429,NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,65,53,'65|53'),
(1430,NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,65,54,'65|54'),
(1431,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL,65,55,'65|55'),
(1432,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,65,56,'65|56'),
(1433,NULL,NULL,'0,5',NULL,NULL,NULL,NULL,NULL,NULL,65,57,'65|57'),
(1434,'ru',NULL,'<p><strong>Миниатюрный шедевр самурайского оружейного искусства &ndash; танто с благородным стальным клинком передает многовековые традиции Японии в каждой детали.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,65,9,'ru|65|9'),
(1435,'ru',NULL,'<p><strong>Танто</strong> &mdash; это традиционный японский короткий меч или кинжал, который использовался самураями как вспомогательное оружие. Его название буквально означает &laquo;короткий меч&raquo; (яп. 短刀) и отражает его ключевую особенность &mdash; компактный размер.</p>\r\n<p>Этот танто - это воплощение минимализма и элегантности. Клинок из дамасской стали с хамоном, обладает&nbsp; красивым узором. Рукоять и ножны изготовлены из натурального дерева, подчеркивающего красоту клинка. Прекрасный образец японского оружейного искусства.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>',NULL,NULL,NULL,NULL,NULL,NULL,65,10,'ru|65|10'),
(1436,NULL,NULL,NULL,NULL,NULL,21899.0000,NULL,NULL,NULL,65,11,'65|11'),
(1437,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,65,13,'65|13'),
(1438,NULL,NULL,'105',NULL,NULL,NULL,NULL,NULL,NULL,66,19,'66|19'),
(1439,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,66,21,'66|21'),
(1440,NULL,NULL,'0.8',NULL,NULL,NULL,NULL,NULL,NULL,66,22,'66|22'),
(1441,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,66,28,'66|28'),
(1442,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,66,5,'66|5'),
(1443,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,66,6,'66|6'),
(1444,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,66,7,'66|7'),
(1445,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,66,8,'default|66|8'),
(1446,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,66,26,'66|26'),
(1447,NULL,NULL,'1206',NULL,NULL,NULL,NULL,NULL,NULL,66,1,'66|1'),
(1448,'ru',NULL,'Меч ниндзя японский',NULL,NULL,NULL,NULL,NULL,NULL,66,2,'ru|66|2'),
(1449,'ru',NULL,'меч-ниндзя-японскии',NULL,NULL,NULL,NULL,NULL,NULL,66,3,'ru|66|3'),
(1450,NULL,NULL,'1206',NULL,NULL,NULL,NULL,NULL,NULL,66,27,'66|27'),
(1451,NULL,NULL,NULL,NULL,69,NULL,NULL,NULL,NULL,66,51,'66|51'),
(1452,NULL,NULL,'72,78',NULL,NULL,NULL,NULL,NULL,NULL,66,52,'66|52'),
(1453,NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,66,53,'66|53'),
(1454,NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,66,54,'66|54'),
(1455,NULL,NULL,'62,5',NULL,NULL,NULL,NULL,NULL,NULL,66,55,'66|55'),
(1456,NULL,NULL,'12,5',NULL,NULL,NULL,NULL,NULL,NULL,66,56,'66|56'),
(1457,NULL,NULL,'0,8',NULL,NULL,NULL,NULL,NULL,NULL,66,57,'66|57'),
(1458,'ru',NULL,'<p><strong>Катана с клинком из благородной стали &mdash; воплощение самурайского духа. Изысканные линии меча и традиционные материалы создают атмосферу древней Японии, делая его прекрасным коллекционным экземпляром.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,66,9,'ru|66|9'),
(1459,'ru',NULL,'<p><strong>Ниндзято</strong>&nbsp;&mdash; это традиционный японский меч, ассоциирующийся с ниндзя (синоби), хотя его историческое существование остаётся предметом споров. В отличие от самурайской катаны, ниндзято чаще изображается с&nbsp;<strong>прямым клинком</strong>&nbsp;и&nbsp;<strong>квадратной гардой (цубой)</strong>, что делает его удобным для скрытных операций и боя в тесных пространствах.</p>\r\n<p><strong>Меч ниндзя &nbsp;Катана ниндзя-то </strong>- многофункциональный прямой меч японских шпионов-диверсантов синоби (ниндзя - американизм введенный в обиход в Голливуде). &nbsp;Клинок прямой однолезвийный со скошенным к лезвию острием, длиной 500-600 мм. Навершие (кассира) &nbsp;- головка рукояти съёмная &nbsp;с отравленной иглой. Рукоять (цука) часто полая для хранения сыпучих веществ (пороха, кварцевого песка). Гарда (цуба) квадратная, очень часто имеющая в верхней части паз для кинжала. Ножны (сайя) часто имели также паз для ножа. Очень часто лезвие черного цвета чтобы не блестело ночью. Прямота меча объясняется удобством ношения на спине и тем, что древние японские мечи (кэн) были прямые.В действительности достоверных источников не существует и исторически не подтверждено, в основном это выдумки голливудских режиссеров, реально отличие от самурайских катан - мелкие детали. Самураи японское военное сословие которое бьется в честном бою, а синоби не брезгают предательством и используют ночь для убийств.</p>\r\n<p>&nbsp;</p>',NULL,NULL,NULL,NULL,NULL,NULL,66,10,'ru|66|10'),
(1460,NULL,NULL,NULL,NULL,NULL,28070.0000,NULL,NULL,NULL,66,11,'66|11'),
(1461,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,66,13,'66|13'),
(1462,NULL,NULL,'200',NULL,NULL,NULL,NULL,NULL,NULL,67,19,'67|19'),
(1463,NULL,NULL,'7.5',NULL,NULL,NULL,NULL,NULL,NULL,67,21,'67|21'),
(1464,NULL,NULL,'3800',NULL,NULL,NULL,NULL,NULL,NULL,67,22,'67|22'),
(1465,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,67,28,'67|28'),
(1466,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,67,5,'67|5'),
(1467,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,67,6,'67|6'),
(1468,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,67,7,'67|7'),
(1469,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,67,8,'default|67|8'),
(1470,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,67,26,'67|26'),
(1471,NULL,NULL,'1207',NULL,NULL,NULL,NULL,NULL,NULL,67,1,'67|1'),
(1472,'ru',NULL,'Название Нагината Бусидо. Рэй',NULL,NULL,NULL,NULL,NULL,NULL,67,2,'ru|67|2'),
(1473,'ru',NULL,'название-нагината-бусидо-рэи',NULL,NULL,NULL,NULL,NULL,NULL,67,3,'ru|67|3'),
(1474,NULL,NULL,'1207',NULL,NULL,NULL,NULL,NULL,NULL,67,27,'67|27'),
(1475,NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,67,51,'67|51'),
(1476,NULL,NULL,'73,75,76',NULL,NULL,NULL,NULL,NULL,NULL,67,52,'67|52'),
(1477,NULL,NULL,NULL,NULL,81,NULL,NULL,NULL,NULL,67,53,'67|53'),
(1478,NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,67,54,'67|54'),
(1479,NULL,NULL,'40',NULL,NULL,NULL,NULL,NULL,NULL,67,55,'67|55'),
(1480,NULL,NULL,'140',NULL,NULL,NULL,NULL,NULL,NULL,67,56,'67|56'),
(1481,NULL,NULL,'3800',NULL,NULL,NULL,NULL,NULL,NULL,67,57,'67|57'),
(1482,'ru',NULL,'<p><strong>Нагината Бусидо. Рэй</strong>&nbsp;&mdash; оружие, в котором гармонично сочетаются искусство златоустовской гравюры и японские боевые традиции. Её изогнутый клинок и рукоять из благородных материалов словно рассказывают историю самурайской доблести, а сертификат подлинности подтверждает исключительность этого изделия.</p>',NULL,NULL,NULL,NULL,NULL,NULL,67,9,'ru|67|9'),
(1483,'ru',NULL,'<p><strong>Нагината (дословный перевод &ndash; &laquo;длинный меч&raquo;)</strong> &ndash; японское холодное оружие с и изогнутым односторонним клинком и длинной рукоятью овального сечения. Это аналог европейской глефы, но по сравнению с глефой, нагината обладает более легким весом. Нагината с давних времен была излюбленным оружием воинов-монахов и отшельников (сохэев и ямабуси). В мирное время этот вид оружия зачастую использовался женщинами из сословия самураев для защиты своего жилища. Также нагинату применяли в бою легендарные женщины-самураи (онна-бугэйся). В старой Японии существовало 425 школ, где изучали технику боя нагинатадзюцу. В середине 1920-х годов оно введено в обязательную программу для средних школ, а в 1955 году образована Всеяпонская федерация нагината. В наше время нагината является одним из символов Японии, хотя и не столь известной, как катана. Сегодня нагинатадзюцу, как вид японского боевого искусства, культивируется в Москве, Санкт-Петербурге и других городах России.</p>\r\n<p>Образ нагинаты в эксклюзивном исполнении, объединив в одном изделии японские оружейные традиции и искусство златоустовской гравюры на металле. Украшенная авторская нагината посвящена кодексу самурая &ndash; бусидо&nbsp;</p>\r\n<p>**Нагината &laquo;Бусидо. Рэй&raquo; (礼 &ndash; &laquo;Почтение&raquo;)** &ndash; это уникальное разборное оружие с регулируемой длиной свыше 1800 мм, способное трансформироваться в средний или короткий вариант благодаря резьбовому соединению звеньев рукояти. Её конструкция позволяет полностью разбирать оружие: при извлечении мэкуги (крепежного колышка) можно снять или заменить цубу, превратив нагинату в модульную систему. Основу составляют эбу (древко из черного мореного граба) и хо (изогнутый клинок из атмосферостойкого дамаска Zladinox ZDI-1016), соединенные через художественно выполненную муфту хабаки из мокуме-гане. &nbsp;</p>\r\n<p>Клинок украшен философской гравировкой: на лицевой стороне &ndash; семь иероглифов принципов бусидо (Справедливость, Почтение, Мужество, Честь, Добродетель, Преданность, Искренность), на оборотной &ndash; только иероглиф &laquo;Рэй&raquo;. Центральным художественным элементом стала ажурная цуба из титанового дамаска ZlaTi, где сочетание медного мокуме-гане и сине-золотого титана символизирует стихии огня и воздуха. К цубе крепится съемный темляк с семью бусинами (мокуме-гане, ZlaTi и резными) и кистью из конского волоса с оберегами-масками. &nbsp;</p>\r\n<p>Рукоять &ndash; произведение искусства: четыре стяжных сэмагонэ украшены миниатюрами (бамбук, Фудзи, журавли), а рельефные узоры изображают символы несгибаемости (бамбук) и гармонии стихий (волны, облака). Навершие исудзуки из ZlaTi служит балансиром и ударным элементом. Ножны из бука с гравировкой подчеркивают самурайскую эстетику. &nbsp;</p>\r\n<p>Это оружие-оберег, воплощающее кодекс бусидо. Каждая деталь &ndash; от клинка до темляка &ndash; напоминает о чести, защите и духовной силе. &laquo;Бусидо. Рэй&raquo; создана для коллекционеров, ценящих глубину традиций и мастерство исполнения. &nbsp;</p>\r\n<p>*Примечание: изделие декоративное, не является холодным оружием.*</p>',NULL,NULL,NULL,NULL,NULL,NULL,67,10,'ru|67|10'),
(1484,NULL,NULL,NULL,NULL,NULL,123000.0000,NULL,NULL,NULL,67,11,'67|11'),
(1485,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,67,13,'67|13'),
(1486,'en',NULL,'Samurai Souvenir Sword Set',NULL,NULL,NULL,NULL,NULL,NULL,60,2,'en|60|2'),
(1487,'en',NULL,'samurai-souvenir-sword-set',NULL,NULL,NULL,NULL,NULL,NULL,60,3,'en|60|3'),
(1488,'en',NULL,'<h3><strong>Daishō Set (Katana + Wakizashi)</strong></h3>',NULL,NULL,NULL,NULL,NULL,NULL,60,9,'en|60|9'),
(1489,'en',NULL,'<p class=\"ds-markdown-paragraph\"><strong>\"Daishō\"</strong>&nbsp;is the collective name for the two primary swords of a samurai in feudal Japan: the long&nbsp;<strong>katana</strong>&nbsp;and the short&nbsp;<strong>wakizashi</strong>. Together, they formed a traditional paired set symbolizing the warrior\'s status and combat prowess.</p>\r\n<p class=\"ds-markdown-paragraph\">The&nbsp;<strong>katana</strong>&nbsp;was used for open combat, while the&nbsp;<strong>wakizashi</strong>&nbsp;served for close-quarters fighting or rituals (such as seppuku). Daishō (literally \"big-small\") reflected not just the functional division of weapons, but also the samurai\'s social code. Only members of the warrior class were permitted to wear these swords, emphasizing their privileged status.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Recreate the spirit of the samurai era</strong>&nbsp;with this&nbsp;<strong>Daishō set</strong>, featuring both katana and wakizashi. Crafted in matching style, these blades honor a single school of tradition. The swords are forged from durable steel for sharpness and longevity, with handles (<strong>tsuka</strong>) wrapped in black textile for a secure grip. The scabbards (<strong>saya</strong>) feature glossy black lacquer, while the guards (<strong>tsuba</strong>) display intricate ornamentation. This set makes a&nbsp;<strong>stunning centerpiece for any collection</strong>&nbsp;and an&nbsp;<strong>exceptional gift</strong> for enthusiasts of Japanese culture.</p>',NULL,NULL,NULL,NULL,NULL,NULL,60,10,'en|60|10'),
(1490,'en',NULL,'Samurai Sword - Blue & Gold with Gilded Guard',NULL,NULL,NULL,NULL,NULL,NULL,61,2,'en|61|2'),
(1491,'en',NULL,'samurai-sword-blue-gold-with-gilded-guard',NULL,NULL,NULL,NULL,NULL,NULL,61,3,'en|61|3'),
(1492,'en',NULL,'<p><strong>This blue and gold blade is not merely an ornament, but an embodiment of the samurai spirit, where every detail speaks of the perfection of form and the nobility of tradition.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,61,9,'en|61|9'),
(1493,'en',NULL,'<p class=\"ds-markdown-paragraph\">The katana is far more than just a sword. It is the quintessence of the Japanese warrior spirit, the embodiment of centuries-old traditions and the flawless craftsmanship of blacksmiths. Since the 12th century, this curved, single-edged blade has been inextricably linked to the samurai code, becoming an extension of the warrior&rsquo;s hand and will.</p>\r\n<p class=\"ds-markdown-paragraph\">The art of crafting a katana is akin to a sacred ritual&mdash;multi-layered steel forging, tempering with precise temperature control, and meticulous polishing that transforms the blade into a work of art. Its distinctive curve and meticulously calculated balance allowed for lightning-fast slashing strikes, while the unique edge-up positioning gave the samurai an advantage in swift duels.</p>\r\n<p class=\"ds-markdown-paragraph\">Yet the katana was never merely a weapon. In times of peace, it served as a status symbol, and in ritual practices, as a tool for preserving honor. Even today, long after the age of the samurai has passed, the katana endures&mdash;in traditional martial arts, in cinema, and in the collections of connoisseurs. Your blue-and-gold katana, though decorative, carries echoes of this grand tradition, a reminder of an era when a sword was not just steel, but the embodiment of a warrior&rsquo;s soul.</p>\r\n<p class=\"ds-markdown-paragraph\">The&nbsp;<em>Samurai Blue &amp; Gold Katana with Gold Guard</em>&nbsp;is a stylized weapon in the traditional Japanese spirit, crafted for collectors and admirers of Eastern aesthetics. The sword is made of stainless steel with a decorative faux edge, making it a safe interior ornament.</p>\r\n<p class=\"ds-markdown-paragraph\">The 70 cm (27.5 in) blade is paired with an elegant gold&nbsp;<em>tsuba</em>&nbsp;(guard) adorned with intricate patterns, while blue accents on the handle and scabbard lend the sword a noble appearance. The 24 cm (9.4 in) handle is wrapped in fabric for a secure grip, and the lacquered 75 cm (29.5 in) scabbard completes the ensemble.\"</p>',NULL,NULL,NULL,NULL,NULL,NULL,61,10,'en|61|10'),
(1494,'en',NULL,'Wakizashi – the samurai sword',NULL,NULL,NULL,NULL,NULL,NULL,62,2,'en|62|2'),
(1495,'en',NULL,'wakizashi-the-samurai-sword',NULL,NULL,NULL,NULL,NULL,NULL,62,3,'en|62|3'),
(1496,'en',NULL,'<p><strong>An exquisite wakizashi with a 34 cm blade&mdash;a compact yet equally profound embodiment of the samurai spirit. Featuring wooden scabbards, steel with a noble luster, and a certificate of authenticity, this piece stands as a worthy addition to any collection.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,62,9,'en|62|9'),
(1497,'en',NULL,'<p class=\"ds-markdown-paragraph\">Wakizashi is the samurai short sword, the faithful companion of the katana, together they formed the sacred daisho pair. Unlike its longer counterpart, the wakizashi was an everyday weapon: it was worn even indoors, used in close combat, and sometimes for performing the ritual seppuku.</p>\r\n<p class=\"ds-markdown-paragraph\">Its blade (usually 30-60 cm) combined deadly sharpness with elegance: the same curves and forging as the katana, but the more compact size allowed for instant attacks in tight spaces. The wakizashi was considered the \"sword of honor\" - the samurai\'s last argument when the katana was unavailable.</p>\r\n<p class=\"ds-markdown-paragraph\">Today, like the katana, it has become a symbol of the era, embodied in collectible replicas where every detail - from the textile-wrapped hilt to the lacquered scabbard - preserves the spirit of bushido. Your specimen with imitation sharpening is a beautiful tribute to this tradition.</p>\r\n<p class=\"ds-markdown-paragraph\">This model combines elegance and practicality. The blade is made of durable 440 stainless steel, ensuring its durability and corrosion resistance. The handle (Tsuka) is skillfully wrapped in black textile, providing a secure grip, while the scabbard (Saya) is coated with a glossy deep burgundy lacquer. The metal fittings (Tsuba, Fuchi, Kashira) add sophistication and complete the look. This wakizashi will be a wonderful addition to any collection or a memorable gift.</p>',NULL,NULL,NULL,NULL,NULL,NULL,62,10,'en|62|10'),
(1498,'en',NULL,'Training sword, bokken Mr. Fox',NULL,NULL,NULL,NULL,NULL,NULL,63,2,'en|63|2'),
(1499,'en',NULL,'training-sword-bokken-mr-fox',NULL,NULL,NULL,NULL,NULL,NULL,63,3,'en|63|3'),
(1500,'en',NULL,'<p><strong>Bokken Mr. Fox is not just a wooden copy of a sword, but a tool that embodies the spirit of samurai traditions.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,63,9,'en|63|9'),
(1501,'en',NULL,'<p><strong>Bokken is a wooden replica of a Japanese sword designed for training and sparring. Unlike a real katana, it doesn\'t have a sharp blade, but it precisely replicates its shape, weight, and balance, making it an indispensable tool in martial arts such as kendo, aikido, and iaido.</strong></p>\r\n<p><strong>A perfectly balanced wooden sword for practicing kendo and iaido techniques. Made of dense wood (oak or beech), it accurately replicates the weight and balance of a real katana with a length of 105 cm. The handle features traditional black diamond-pattern wrapping for a secure grip during training. A professional tool for serious practice of Japanese martial arts. Suitable for both beginners and experienced practitioners.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,63,10,'en|63|10'),
(1502,'en',NULL,'Bokken 102 cm with rubber handle',NULL,NULL,NULL,NULL,NULL,NULL,64,2,'en|64|2'),
(1503,'en',NULL,'bokken-102-cm-with-rubber-handle',NULL,NULL,NULL,NULL,NULL,NULL,64,3,'en|64|3'),
(1504,'en',NULL,'<p class=\"ds-markdown-paragraph\"><strong>Bokken 102 with rubber handle - the perfect training partner, combining the traditional shape of a wooden sword with modern convenience.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,64,9,'en|64|9'),
(1505,'en',NULL,'<p class=\"ds-markdown-paragraph\">Bokken - a wooden replica of a Japanese sword designed for training and sparring. Unlike a real katana, it doesn\'t have a sharp blade but precisely replicates its shape, weight and balance, making it an essential tool for martial arts like kendo, aikido and iaido.</p>\r\n<p class=\"ds-markdown-paragraph\">Bokken 102 with rubber handle - a practical training sword made of hardwood (oak/beech) with 102 cm length. The rubber handle (26 cm) provides a secure grip, while the optimal weight (550 g) makes it comfortable for practicing kendo and iaido techniques.</p>',NULL,NULL,NULL,NULL,NULL,NULL,64,10,'en|64|10'),
(1506,'en',NULL,'Japanese tanto samurai katana',NULL,NULL,NULL,NULL,NULL,NULL,65,2,'en|65|2'),
(1507,'en',NULL,'japanese-tanto-samurai-katana',NULL,NULL,NULL,NULL,NULL,NULL,65,3,'en|65|3'),
(1508,'en',NULL,'<p><strong>Miniature masterpiece of samurai weaponry art &ndash; the tanto with a noble steel blade carries centuries-old Japanese traditions in every detail.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,65,9,'en|65|9'),
(1509,'en',NULL,'<p class=\"ds-markdown-paragraph\">Tanto is a traditional Japanese short sword or dagger that was used by samurai as a secondary weapon. Its name literally means \"short sword\" (Japanese: 短刀) and reflects its key feature - compact size.</p>\r\n<p class=\"ds-markdown-paragraph\">This tanto embodies minimalism and elegance. The blade is made of Damascus steel with a hamon, featuring a beautiful pattern. The handle and sheath are crafted from natural wood, highlighting the beauty of the blade. A fine example of Japanese weapon artistry.</p>',NULL,NULL,NULL,NULL,NULL,NULL,65,10,'en|65|10'),
(1510,'en',NULL,'Ninja sword Japanese',NULL,NULL,NULL,NULL,NULL,NULL,66,2,'en|66|2'),
(1511,'en',NULL,'ninja-sword-japanese',NULL,NULL,NULL,NULL,NULL,NULL,66,3,'en|66|3'),
(1512,'en',NULL,'<p><strong>Katana with a blade of noble steel - the embodiment of the samurai spirit. The exquisite lines of the sword and traditional materials create an atmosphere of ancient Japan, making it a beautiful collector\'s item.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,66,9,'en|66|9'),
(1513,'en',NULL,'<p class=\"ds-markdown-paragraph\">Ninjato is a traditional Japanese sword associated with ninja (shinobi), though its historical existence remains debated. Unlike the samurai katana, ninjato is typically depicted with a straight blade and square guard (tsuba), making it suitable for covert operations and combat in confined spaces.</p>\r\n<p class=\"ds-markdown-paragraph\">Ninja sword Ninja-to - a multifunctional straight sword used by Japanese spy-saboteurs shinobi (the term \"ninja\" being an Americanism popularized by Hollywood). Features a straight single-edged blade with a slanted tip, 500-600 mm in length. The pommel (kashira) has a removable head with a poisoned needle. The handle (tsuka) is often hollow for storing loose substances (gunpowder, quartz sand). The guard (tsuba) is square-shaped, frequently featuring a dagger slot in its upper part. The scabbard (saya) often included a knife slot as well. The blade was commonly blackened to prevent reflection at night. The straightness of the sword facilitated back-carrying and mirrored ancient Japanese straight swords (ken). In reality, no reliable historical sources exist to confirm these details - most are Hollywood fabrications. The actual differences from samurai katanas are minor. Samurai were Japan\'s military class who fought honorably in open combat, while shinobi employed treachery and night-time assassinations.</p>',NULL,NULL,NULL,NULL,NULL,NULL,66,10,'en|66|10'),
(1514,'en',NULL,'Name: Naginata Bushido. Rei',NULL,NULL,NULL,NULL,NULL,NULL,67,2,'en|67|2'),
(1515,'en',NULL,'name-naginata-bushido-rei',NULL,NULL,NULL,NULL,NULL,NULL,67,3,'en|67|3'),
(1516,'en',NULL,'<p><strong>Naginata Bushido. Rei &mdash; a weapon that harmoniously combines the art of Zlatoust engraving and Japanese martial traditions. Its curved blade and handle made of noble materials seem to tell a story of samurai valor, while the certificate of authenticity confirms the exclusivity of this piece.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,67,9,'en|67|9'),
(1517,'en',NULL,'<p>**Naginata (literal translation - \"long sword\")** - a Japanese edged weapon with a curved single-edged blade and a long oval-sectioned handle. This is an analogue of the European glaive, but compared to the glaive, the naginata has a lighter weight. Since ancient times, the naginata was the favorite weapon of warrior-monks and hermits (sohei and yamabushi). In peacetime, this type of weapon was often used by women from the samurai class to protect their homes. The naginata was also used in battle by legendary female samurai (onna-bugeisha). In old Japan, there were 425 schools that studied naginatajutsu combat techniques. In the mid-1920s, it was introduced into the compulsory curriculum for secondary schools, and in 1955, the All Japan Naginata Federation was established. Today, the naginata is one of the symbols of Japan, although not as famous as the katana. Currently, naginatajutsu as a form of Japanese martial art is practiced in Moscow, St. Petersburg and other cities of Russia.</p>\r\n<p>The image of the naginata in an exclusive design, combining Japanese weapon traditions and the art of Zlatoust metal engraving in one product. The decorated author\'s naginata is dedicated to the samurai code - bushido.</p>\r\n<p>**Naginata \"Bushido. Rei\" (礼 - \"Respect\")** is a unique collapsible weapon with an adjustable length of over 1800 mm, capable of transforming into a medium or short version thanks to the threaded connection of the handle links. Its design allows for complete disassembly of the weapon: when the mekugi (retaining pin) is removed, the tsuba can be removed or replaced, turning the naginata into a modular system. The basis consists of ebu (a shaft made of black stained hornbeam) and ho (a curved blade made of weather-resistant Damascus steel Zladinox ZDI-1016), connected through an artistically crafted habaki coupling made of mokume-gane.</p>\r\n<p>The blade is decorated with philosophical engraving: on the front side - seven kanji characters of bushido principles (Justice, Respect, Courage, Honor, Virtue, Loyalty, Sincerity), on the reverse side - only the kanji \"Rei\". The central artistic element is an openwork tsuba made of titanium Damascus steel ZlaTi, where the combination of copper mokume-gane and blue-gold titanium symbolizes the elements of fire and air. A removable lanyard with seven beads (mokume-gane, ZlaTi and carved) and a horsehair tassel with amulet masks is attached to the tsuba.</p>\r\n<p>The handle is a work of art: four tightening semagone are decorated with miniatures (bamboo, Fuji, cranes), and relief patterns depict symbols of inflexibility (bamboo) and harmony of the elements (waves, clouds). The isuzuki pommel made of ZlaTi serves as a balancer and striking element. The beech scabbard with engraving emphasizes samurai aesthetics.</p>\r\n<p>This is a talisman weapon that embodies the bushido code. Every detail - from the blade to the lanyard - reminds of honor, protection and spiritual strength. \"Bushido. Rei\" was created for collectors who appreciate the depth of traditions and the skill of execution.</p>\r\n<p>*Note: the product is decorative and is not a melee weapon.*</p>',NULL,NULL,NULL,NULL,NULL,NULL,67,10,'en|67|10'),
(1518,NULL,NULL,'40',NULL,NULL,NULL,NULL,NULL,NULL,69,19,'69|19'),
(1519,NULL,NULL,'50',NULL,NULL,NULL,NULL,NULL,NULL,69,21,'69|21'),
(1520,NULL,NULL,'1.9',NULL,NULL,NULL,NULL,NULL,NULL,69,22,'69|22'),
(1521,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,69,28,'69|28'),
(1522,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,69,5,'69|5'),
(1523,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,69,6,'69|6'),
(1524,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,69,7,'69|7'),
(1525,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,69,8,'default|69|8'),
(1526,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,69,26,'69|26'),
(1527,NULL,NULL,'1400',NULL,NULL,NULL,NULL,NULL,NULL,69,1,'69|1'),
(1528,'ru',NULL,'Японская черная сосна',NULL,NULL,NULL,NULL,NULL,NULL,69,2,'ru|69|2'),
(1529,'ru',NULL,'японская-черная-сосна',NULL,NULL,NULL,NULL,NULL,NULL,69,3,'ru|69|3'),
(1530,NULL,NULL,'1400',NULL,NULL,NULL,NULL,NULL,NULL,69,27,'69|27'),
(1531,NULL,NULL,'1,9',NULL,NULL,NULL,NULL,NULL,NULL,69,47,'69|47'),
(1532,NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,NULL,69,58,'69|58'),
(1533,NULL,NULL,'Средняя (Middle)',NULL,NULL,NULL,NULL,NULL,NULL,69,60,'69|60'),
(1534,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,69,61,'69|61'),
(1535,NULL,NULL,'40',NULL,NULL,NULL,NULL,NULL,NULL,69,62,'69|62'),
(1536,'ru',NULL,'<p><strong>Вырастите свой дзен с этим прекрасным бонсай: миниатюрная сосна в голубом керамическом горшке станет живым украшением интерьера и символом долголетия.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,69,9,'ru|69|9'),
(1537,'ru',NULL,'<p>Бонсай (盆栽) &mdash; это древнее японское искусство выращивания миниатюрных деревьев в небольших контейнерах, имитирующих природные ландшафты.<br>Классический бонсай из сосны<br>Потряcающая вечнозелeная сосна 7 лет в керамичеcкoм кaшпо-бонсaйницe.<br>Бoнcай растёт в японcком пpемиaльном грунте, удеpживающим влагу и полезныe вeщества. Не нуждаeтcя в пepecaдке, полностью здоров, дocтaточно тoлькo поливать два разв в неделю.<br>Высота с кашпо 40 см, без кашпо 35 см.<br>Такой бонсай - хороший подарок для того, кто ценит эстетику, красоту и удивительный мир растений. Это комнатное растение, его можно содержать как в квартире, офисе, так и на улице в летнее и зимне время.&nbsp; &nbsp;</p>',NULL,NULL,NULL,NULL,NULL,NULL,69,10,'ru|69|10'),
(1538,NULL,NULL,NULL,NULL,NULL,14700.0000,NULL,NULL,NULL,69,11,'69|11'),
(1539,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,13,'69|13'),
(1540,NULL,NULL,'60',NULL,NULL,NULL,NULL,NULL,NULL,70,19,'70|19'),
(1541,NULL,NULL,'45',NULL,NULL,NULL,NULL,NULL,NULL,70,21,'70|21'),
(1542,NULL,NULL,'2.2',NULL,NULL,NULL,NULL,NULL,NULL,70,22,'70|22'),
(1543,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,70,28,'70|28'),
(1544,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,70,5,'70|5'),
(1545,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,70,6,'70|6'),
(1546,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,70,7,'70|7'),
(1547,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,70,8,'default|70|8'),
(1548,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,70,26,'70|26'),
(1549,NULL,NULL,'1401',NULL,NULL,NULL,NULL,NULL,NULL,70,1,'70|1'),
(1550,'ru',NULL,'Бонсай Можевельник',NULL,NULL,NULL,NULL,NULL,NULL,70,2,'ru|70|2'),
(1551,'ru',NULL,'бонсаи-можевельник',NULL,NULL,NULL,NULL,NULL,NULL,70,3,'ru|70|3'),
(1552,NULL,NULL,'1401',NULL,NULL,NULL,NULL,NULL,NULL,70,27,'70|27'),
(1553,NULL,NULL,'2,2',NULL,NULL,NULL,NULL,NULL,NULL,70,47,'70|47'),
(1554,NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,NULL,70,58,'70|58'),
(1555,NULL,NULL,'Средняя (Middle)',NULL,NULL,NULL,NULL,NULL,NULL,70,60,'70|60'),
(1556,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,70,61,'70|61'),
(1557,NULL,NULL,'35',NULL,NULL,NULL,NULL,NULL,NULL,70,62,'70|62'),
(1558,'ru',NULL,'<p><strong>Живой бонсай - изящный можевельник в стильном керамическом горшке - привнесет в ваш дом гармонию природы и станет прекрасным акцентом в интерьере.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,70,9,'ru|70|9'),
(1559,'ru',NULL,'<p>Бонсай (盆栽) &mdash; это древнее японское искусство выращивания миниатюрных деревьев в небольших контейнерах, имитирующих природные ландшафты.<br>Классический Бонсай из Можжевельника, возраст 8 лет. Такой Бонсай станет стильным украшением любого помещения. Можжевельник - вечнозеленое растение, оно будет радовать вас своей красотой и летом и зимой. А также это медленнорастущее растение, поэтому Бонсай из Можжевельника так популярны.<br>Бонсай достаточно поливать 2-3 раза в неделю и опрыскивать летом, весной и осенью. А зимой Можжевельнику требуется прохладная зимовка. Пересадка потребуется только через 2 года.<br>Заготовка для Бонсай адаптирована к содержанию в помещении, полностью здоров и готова к переезду в новый дом. Доставляется в подарочном пакете. Отличный вариант небанального подарка, который будет радовать получателя долгие годы!</p>',NULL,NULL,NULL,NULL,NULL,NULL,70,10,'ru|70|10'),
(1560,NULL,NULL,NULL,NULL,NULL,16400.0000,NULL,NULL,NULL,70,11,'70|11'),
(1561,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,70,13,'70|13'),
(1562,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL,71,19,'71|19'),
(1563,NULL,NULL,'30',NULL,NULL,NULL,NULL,NULL,NULL,71,21,'71|21'),
(1564,NULL,NULL,'0.8',NULL,NULL,NULL,NULL,NULL,NULL,71,22,'71|22'),
(1565,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,71,28,'71|28'),
(1566,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,71,5,'71|5'),
(1567,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,71,6,'71|6'),
(1568,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,71,7,'71|7'),
(1569,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,71,8,'default|71|8'),
(1570,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,71,26,'71|26'),
(1571,NULL,NULL,'1402',NULL,NULL,NULL,NULL,NULL,NULL,71,1,'71|1'),
(1572,'ru',NULL,'Ваза \"Фудзияма\"',NULL,NULL,NULL,NULL,NULL,NULL,71,2,'ru|71|2'),
(1573,'ru',NULL,'ваза-фудзияма',NULL,NULL,NULL,NULL,NULL,NULL,71,3,'ru|71|3'),
(1574,NULL,NULL,'1402',NULL,NULL,NULL,NULL,NULL,NULL,71,27,'71|27'),
(1575,NULL,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,71,44,'71|44'),
(1576,NULL,NULL,'0,8',NULL,NULL,NULL,NULL,NULL,NULL,71,47,'71|47'),
(1577,NULL,NULL,NULL,NULL,90,NULL,NULL,NULL,NULL,71,58,'71|58'),
(1578,NULL,NULL,'98',NULL,NULL,NULL,NULL,NULL,NULL,71,59,'71|59'),
(1579,NULL,NULL,'25',NULL,NULL,NULL,NULL,NULL,NULL,71,62,'71|62'),
(1580,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,NULL,71,63,'71|63'),
(1581,'ru',NULL,'<p><strong>Изящная ваза с изображением горы Фудзи и сосен, станет элегантным акцентом в вашем интерьере и привнесет нотку восточной гармонии.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,71,9,'ru|71|9'),
(1582,'ru',NULL,'<p><strong>Ваза &ldquo;Фудзияма&rdquo;: Ода Японской Эстетике</strong></p>\r\n<p>Эта изящная керамическая ваза &ndash; не просто предмет интерьера, а настоящее произведение искусства, вдохновленное красотой японской природы. На ее нежной кремовой поверхности запечатлен завораживающий пейзаж: величественная гора Фудзи, окутанная легкой дымкой облаков, и стройные сосны, устремленные ввысь.<br>Каждый элемент росписи выполнен с любовью к деталям, передавая умиротворяющую атмосферу японского ландшафта. Ваза &ldquo;Фудзияма&rdquo; идеально подойдет для создания атмосферы покоя и гармонии в вашем доме, напоминая о величии природы и традиционной японской эстетике.<br>Благодаря своей элегантной форме и утонченному дизайну, ваза станет прекрасным украшением для гостиной, спальни или кабинета. Наполните ее свежими цветами, сухоцветами или просто оставьте как самостоятельный элемент декора &ndash; в любом случае она будет привлекать восхищенные взгляды.</p>',NULL,NULL,NULL,NULL,NULL,NULL,71,10,'ru|71|10'),
(1583,NULL,NULL,NULL,NULL,NULL,19450.0000,NULL,NULL,NULL,71,11,'71|11'),
(1584,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,71,13,'71|13'),
(1585,NULL,NULL,'28',NULL,NULL,NULL,NULL,NULL,NULL,72,19,'72|19'),
(1586,NULL,NULL,'53',NULL,NULL,NULL,NULL,NULL,NULL,72,21,'72|21'),
(1587,NULL,NULL,'0.15',NULL,NULL,NULL,NULL,NULL,NULL,72,22,'72|22'),
(1588,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,72,28,'72|28'),
(1589,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,72,5,'72|5'),
(1590,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,72,6,'72|6'),
(1591,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,72,7,'72|7'),
(1592,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,72,8,'default|72|8'),
(1593,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,72,26,'72|26'),
(1594,NULL,NULL,'1403',NULL,NULL,NULL,NULL,NULL,NULL,72,1,'72|1'),
(1595,'ru',NULL,'Фонарик Андон японский',NULL,NULL,NULL,NULL,NULL,NULL,72,2,'ru|72|2'),
(1596,'ru',NULL,'фонарик-андон-японскии',NULL,NULL,NULL,NULL,NULL,NULL,72,3,'ru|72|3'),
(1597,NULL,NULL,'1403',NULL,NULL,NULL,NULL,NULL,NULL,72,27,'72|27'),
(1598,NULL,NULL,NULL,NULL,59,NULL,NULL,NULL,NULL,72,44,'72|44'),
(1599,NULL,NULL,'0,15',NULL,NULL,NULL,NULL,NULL,NULL,72,47,'72|47'),
(1600,NULL,NULL,NULL,NULL,89,NULL,NULL,NULL,NULL,72,58,'72|58'),
(1601,NULL,NULL,'92,97',NULL,NULL,NULL,NULL,NULL,NULL,72,59,'72|59'),
(1602,NULL,NULL,'45',NULL,NULL,NULL,NULL,NULL,NULL,72,62,'72|62'),
(1603,NULL,NULL,'25',NULL,NULL,NULL,NULL,NULL,NULL,72,63,'72|63'),
(1604,'ru',NULL,'<p><strong>Привнесите восточный колорит с этими яркими красными бумажными фонариками, создающими уютную и праздничную атмосферу.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,72,9,'ru|72|9'),
(1605,'ru',NULL,'<p>Андон (яп. 行灯, &laquo;идущий свет&raquo;) &mdash; это традиционный японский фонарь с бумажным абажуром, который использовался для освещения домов, улиц и религиозных церемоний.</p>\r\n<p>Изготовлен из материалов хорошего качества, которые подлежат вторичной переработке и повторному использованию.Эти фонарики можно легко повесить на стену или потолок с помощью крючков.Изысканное качество изготовления, четкая печать, красивые и красочные цвета.Хорошо сделанный и простой по стилю, хороший декоративный эффект.</p>',NULL,NULL,NULL,NULL,NULL,NULL,72,10,'ru|72|10'),
(1606,NULL,NULL,NULL,NULL,NULL,750.0000,NULL,NULL,NULL,72,11,'72|11'),
(1607,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,72,13,'72|13'),
(1608,NULL,NULL,'30',NULL,NULL,NULL,NULL,NULL,NULL,73,19,'73|19'),
(1609,NULL,NULL,'11',NULL,NULL,NULL,NULL,NULL,NULL,73,21,'73|21'),
(1610,NULL,NULL,'1.1',NULL,NULL,NULL,NULL,NULL,NULL,73,22,'73|22'),
(1611,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,73,28,'73|28'),
(1612,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,73,5,'73|5'),
(1613,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,73,6,'73|6'),
(1614,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,73,7,'73|7'),
(1615,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,73,8,'default|73|8'),
(1616,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,73,26,'73|26'),
(1617,NULL,NULL,'1404',NULL,NULL,NULL,NULL,NULL,NULL,73,1,'73|1'),
(1618,'ru',NULL,'Сад Дзен \"Будда с деревом\"',NULL,NULL,NULL,NULL,NULL,NULL,73,2,'ru|73|2'),
(1619,'ru',NULL,'сад-дзен-будда-с-деревом',NULL,NULL,NULL,NULL,NULL,NULL,73,3,'ru|73|3'),
(1620,NULL,NULL,'1404',NULL,NULL,NULL,NULL,NULL,NULL,73,27,'73|27'),
(1621,NULL,NULL,'25x30x8',NULL,NULL,NULL,NULL,NULL,NULL,73,48,'73|48'),
(1622,NULL,NULL,NULL,NULL,87,NULL,NULL,NULL,NULL,73,58,'73|58'),
(1623,NULL,NULL,'93,94,95',NULL,NULL,NULL,NULL,NULL,NULL,73,59,'73|59'),
(1624,'ru',NULL,'<p><strong>Создайте уголок гармонии с этим миниатюрным садом камней: расслабляйтесь, медитируйте и освобождайте разум, рисуя узоры на песке.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,73,9,'ru|73|9'),
(1625,'ru',NULL,'<p>Мини-сад дзен (или настольный сад камней) &mdash; это компактная версия традиционного японского сада камней (карэсансуй), созданная для медитации, релаксации и украшения интерьера.</p>\r\n<p>Главная цель сада дзен - создать пространство для медитации и расслабления, где человек может наслаждаться красотой природы и находить гармонию с самим собой. Для тех, кто не имеет возможности создать сад дзен из натуральных материалов, есть замечательная альтернатива - искусственный сад. Создание такого сада дзен принесёт ровно столько же спокойствия, гармонии, и удовольствия. А использование искусственных материалов облегчит уход за этим замечательным антистресс-сувениром.</p>',NULL,NULL,NULL,NULL,NULL,NULL,73,10,'ru|73|10'),
(1626,NULL,NULL,NULL,NULL,NULL,13700.0000,NULL,NULL,NULL,73,11,'73|11'),
(1627,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,73,13,'73|13'),
(1628,NULL,NULL,'1.1',NULL,NULL,NULL,NULL,NULL,NULL,73,47,'73|47'),
(1629,NULL,NULL,'25',NULL,NULL,NULL,NULL,NULL,NULL,74,19,'74|19'),
(1630,NULL,NULL,'18',NULL,NULL,NULL,NULL,NULL,NULL,74,21,'74|21'),
(1631,NULL,NULL,'1.9',NULL,NULL,NULL,NULL,NULL,NULL,74,22,'74|22'),
(1632,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,74,28,'74|28'),
(1633,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,74,5,'74|5'),
(1634,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,74,6,'74|6'),
(1635,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,74,7,'74|7'),
(1636,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,74,8,'default|74|8'),
(1637,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,74,26,'74|26'),
(1638,NULL,NULL,'1405',NULL,NULL,NULL,NULL,NULL,NULL,74,1,'74|1'),
(1639,'ru',NULL,'Сад дзен японский настольный',NULL,NULL,NULL,NULL,NULL,NULL,74,2,'ru|74|2'),
(1640,'ru',NULL,'сад-дзен-японскии-настольныи',NULL,NULL,NULL,NULL,NULL,NULL,74,3,'ru|74|3'),
(1641,NULL,NULL,'1405',NULL,NULL,NULL,NULL,NULL,NULL,74,27,'74|27'),
(1642,NULL,NULL,'1,9',NULL,NULL,NULL,NULL,NULL,NULL,74,47,'74|47'),
(1643,NULL,NULL,'19x19x13',NULL,NULL,NULL,NULL,NULL,NULL,74,48,'74|48'),
(1644,NULL,NULL,NULL,NULL,87,NULL,NULL,NULL,NULL,74,58,'74|58'),
(1645,NULL,NULL,'93,95,96',NULL,NULL,NULL,NULL,NULL,NULL,74,59,'74|59'),
(1646,'ru',NULL,'<p><strong>Создайте атмосферу покоя и гармонии с этим мини-садом камней: насладитесь медитацией, рисуя узоры на песке, и созерцайте пламя свечи, освобождаясь от стресса.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,74,9,'ru|74|9'),
(1647,'ru',NULL,'<p>Мини-сад дзен (или настольный сад камней) &mdash; это компактная версия традиционного японского сада камней (карэсансуй), созданная для медитации, релаксации и украшения интерьера.<br>Комплект в подарочной упаковке включает статуэтку Будды, подставку, мини грабли, чистейший кварцевый песок, камни и подсвечник для чайной свечи. Настольный японский сад камней &ndash; это оригинальный подарок в офис мужчине или женщине, для друзей, коллег, руководителей и всех, кто ценит красоту и стремится к внутренней гармонии. Мини-сад отлично впишется в любой интерьер, став стильным акцентом в вашем пространстве. Особенно песок с граблями антистресс будет полезен в офисе: каждый раз, когда вам нужно отвлечься от рабочей рутины, садик станет отличным антистресс-инструментом, помогая снять напряжение и восстановить концентрацию.</p>',NULL,NULL,NULL,NULL,NULL,NULL,74,10,'ru|74|10'),
(1648,NULL,NULL,NULL,NULL,NULL,13560.0000,NULL,NULL,NULL,74,11,'74|11'),
(1649,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,74,13,'74|13'),
(1650,NULL,NULL,'155',NULL,NULL,NULL,NULL,NULL,NULL,75,19,'75|19'),
(1651,NULL,NULL,'110',NULL,NULL,NULL,NULL,NULL,NULL,75,21,'75|21'),
(1652,NULL,NULL,'5.7',NULL,NULL,NULL,NULL,NULL,NULL,75,22,'75|22'),
(1653,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,75,28,'75|28'),
(1654,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,75,5,'75|5'),
(1655,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,75,6,'75|6'),
(1656,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,75,7,'75|7'),
(1657,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,75,8,'default|75|8'),
(1658,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,75,26,'75|26'),
(1659,NULL,NULL,'1406',NULL,NULL,NULL,NULL,NULL,NULL,75,1,'75|1'),
(1660,'ru',NULL,'Шестистворчатая ширма «Хиконэ Бёбу»',NULL,NULL,NULL,NULL,NULL,NULL,75,2,'ru|75|2'),
(1661,'ru',NULL,'шестистворчатая-ширма-хиконэ-бебу',NULL,NULL,NULL,NULL,NULL,NULL,75,3,'ru|75|3'),
(1662,NULL,NULL,'1406',NULL,NULL,NULL,NULL,NULL,NULL,75,27,'75|27'),
(1663,NULL,NULL,'5.7',NULL,NULL,NULL,NULL,NULL,NULL,75,47,'75|47'),
(1664,NULL,NULL,NULL,NULL,86,NULL,NULL,NULL,NULL,75,58,'75|58'),
(1665,NULL,NULL,'91,92',NULL,NULL,NULL,NULL,NULL,NULL,75,59,'75|59'),
(1666,NULL,NULL,'96',NULL,NULL,NULL,NULL,NULL,NULL,75,62,'75|62'),
(1667,NULL,NULL,'145,5',NULL,NULL,NULL,NULL,NULL,NULL,75,64,'75|64'),
(1668,'ru',NULL,'<p><strong>Шестистворчатая ширма &ldquo;Хиконэ Бёбу&rdquo; - это роскошная репродукция японского шедевра XVII века, выполненная в традиционной технике с золотой фольгой, идеально подходящая для ценителей искусства и восточного стиля.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,75,9,'ru|75|9'),
(1669,'ru',NULL,'<p>Бёбу (屏風, byōbu) &mdash; это традиционная японская складная ширма, используемая для зонирования пространства, украшения интерьера и защиты от сквозняков.<br>Представленная ширма &laquo;Хиконэ бёбу&raquo; &mdash; это одна из лучших репродукций оригинальной ширмы XVII века.<br>Произведение является образцом японской декоративной живописи на ширмах. Это шестистворчатая ширма, состоящая из расписных панелей, обрамленных по периметру деревянными рамами. С оборотной стороны они оклеены специальной декоративной бумагой, играющей роль подкладки-задника.<br>Техника исполнения росписи аутентична манере оригинала: она выполнена на японской бумаге васи водяными красками на полотне, обитом тончайшей золотой фольгой методом кимпаку.<br>В историю японского искусства произведение вошло под названием ширма &laquo;Хиконэ бёбу&raquo; по месту ее нахождения в замке Хиконэ (префектура Сига), принадлежавшем самурайскому клану Ии. В 1997 году потомки семьи</p>',NULL,NULL,NULL,NULL,NULL,NULL,75,10,'ru|75|10'),
(1670,NULL,NULL,NULL,NULL,NULL,29350.0000,NULL,NULL,NULL,75,11,'75|11'),
(1671,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,75,13,'75|13'),
(1672,'en',NULL,'Bonsai Juniper',NULL,NULL,NULL,NULL,NULL,NULL,70,2,'en|70|2'),
(1673,'en',NULL,'bonsai-juniper',NULL,NULL,NULL,NULL,NULL,NULL,70,3,'en|70|3'),
(1674,'en',NULL,'<p><strong>Living bonsai &ndash; an elegant juniper in a stylish ceramic pot &ndash; will bring harmony of nature into your home and become a beautiful accent in the interior.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,70,9,'en|70|9'),
(1675,'en',NULL,'<p class=\"ds-markdown-paragraph\"><strong>Bonsai (盆栽)</strong>&nbsp;&mdash; this is the ancient Japanese art of growing miniature trees in small containers, imitating natural landscapes.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Classic Juniper Bonsai, age 8 years.</strong><br>Such a&nbsp;<strong>Bonsai</strong>&nbsp;will become a stylish decoration for any room.<br><strong>Juniper</strong>&nbsp;is an evergreen plant; it will delight you with its beauty both in summer and winter.<br>Also, it is a&nbsp;<strong>slow-growing plant</strong>, which is why&nbsp;<strong>Juniper Bonsai</strong>&nbsp;are so popular.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Bonsai</strong>&nbsp;needs to be watered&nbsp;<strong>2&ndash;3 times a week</strong>&nbsp;and sprayed in summer, spring, and autumn.<br>But in winter,&nbsp;<strong>Juniper</strong>&nbsp;requires a&nbsp;<strong>cool wintering</strong>.<br><strong>Repotting</strong>&nbsp;will be needed only after&nbsp;<strong>2 years</strong>.</p>\r\n<p class=\"ds-markdown-paragraph\">This&nbsp;<strong>Bonsai starter</strong>&nbsp;is adapted for indoor keeping, completely healthy, and ready to move to a new home.<br>Delivered in a&nbsp;<strong>gift bag</strong>.<br>An excellent choice for a&nbsp;<strong>non-trivial gift</strong> that will please the recipient for many years!</p>',NULL,NULL,NULL,NULL,NULL,NULL,70,10,'en|70|10'),
(1676,'en',NULL,'Japanese Black Pine',NULL,NULL,NULL,NULL,NULL,NULL,69,2,'en|69|2'),
(1677,'en',NULL,'japanese-black-pine',NULL,NULL,NULL,NULL,NULL,NULL,69,3,'en|69|3'),
(1678,'en',NULL,'<p><strong>Cultivate Your Zen with This Beautiful Bonsai: A miniature pine in an elegant blue ceramic pot will become a living interior decoration and a symbol of longevity.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,69,9,'en|69|9'),
(1679,'en',NULL,'<p class=\"ds-markdown-paragraph\">Bonsai (盆栽) - the ancient Japanese art of growing miniature trees in small containers that mimic natural landscapes.</p>\r\n<p class=\"ds-markdown-paragraph\">Classic pine bonsai<br>An amazing 7-year-old evergreen pine in a ceramic bonsai pot.</p>\r\n<p class=\"ds-markdown-paragraph\">The bonsai grows in premium Japanese soil that retains moisture and nutrients. Doesn\'t require repotting, completely healthy, just needs watering twice a week.</p>\r\n<p class=\"ds-markdown-paragraph\">Height with pot: 40 cm, without pot: 35 cm.</p>\r\n<p class=\"ds-markdown-paragraph\">Such a bonsai makes a great gift for those who appreciate aesthetics, beauty and the wonderful world of plants. This is a houseplant that can be kept in an apartment, office, as well as outdoors in summer and winter.</p>\r\n<p>&nbsp;</p>',NULL,NULL,NULL,NULL,NULL,NULL,69,10,'en|69|10'),
(1680,'en',NULL,'Vase \"Fujiyama\"',NULL,NULL,NULL,NULL,NULL,NULL,71,2,'en|71|2'),
(1681,'en',NULL,'vase-fujiyama',NULL,NULL,NULL,NULL,NULL,NULL,71,3,'en|71|3'),
(1682,'en',NULL,'<p><strong>An elegant vase featuring Mount Fuji and pine trees will become a sophisticated accent in your interior and add a touch of Eastern harmony.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,71,9,'en|71|9'),
(1683,'en',NULL,'<p class=\"ds-markdown-paragraph\"><strong>Vase \"Fujiyama\": An Ode to Japanese Aesthetics</strong></p>\r\n<p class=\"ds-markdown-paragraph\">This elegant ceramic vase is not just a home accessory, but a true work of art inspired by the beauty of Japanese nature. Its delicate cream-colored surface captures a mesmerizing landscape: the majestic Mount Fuji shrouded in a light mist of clouds, and slender pine trees reaching skyward.</p>\r\n<p class=\"ds-markdown-paragraph\">Every element of the painting is crafted with meticulous attention to detail, conveying the serene atmosphere of the Japanese countryside. The \"Fujiyama\" vase is perfect for creating an ambiance of peace and harmony in your home, reminding you of nature\'s grandeur and traditional Japanese aesthetics.</p>\r\n<p class=\"ds-markdown-paragraph\">Thanks to its graceful shape and refined design, the vase will make a beautiful addition to your living room, bedroom, or study. Fill it with fresh flowers, dried arrangements, or simply display it as a standalone decorative piece&mdash;either way, it will draw admiring glances.</p>',NULL,NULL,NULL,NULL,NULL,NULL,71,10,'en|71|10'),
(1684,'en',NULL,'Flashlight Andon Japanese',NULL,NULL,NULL,NULL,NULL,NULL,72,2,'en|72|2'),
(1685,'en',NULL,'flashlight-andon-japanese',NULL,NULL,NULL,NULL,NULL,NULL,72,3,'en|72|3'),
(1686,'en',NULL,'<p><strong>Bring in some oriental flair with these vibrant red paper lanterns that create a cozy and festive atmosphere.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,72,9,'en|72|9'),
(1687,'en',NULL,'<p>Andon (行灯, \"walking light\") is a traditional Japanese lantern with a paper lampshade that was used to illuminate homes, streets and religious ceremonies.</p>\r\n<p>Made of good quality materials that can be recycled and reused. These lanterns can be easily hung on the wall or ceiling with hooks. Exquisite workmanship, clear printing, beautiful and colorful colors. Well made and simple in style, good decorative effect.</p>',NULL,NULL,NULL,NULL,NULL,NULL,72,10,'en|72|10'),
(1688,'en',NULL,'Zen Garden \"Buddha with Tree\"',NULL,NULL,NULL,NULL,NULL,NULL,73,2,'en|73|2'),
(1689,'en',NULL,'zen-garden-buddha-with-tree',NULL,NULL,NULL,NULL,NULL,NULL,73,3,'en|73|3'),
(1690,'en',NULL,'<p><strong>Create a corner of harmony with this miniature rock garden: relax, meditate and clear your mind by drawing patterns in the sand.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,73,9,'en|73|9'),
(1691,'en',NULL,'<p>A mini Zen garden (or tabletop rock garden) is a compact version of a traditional Japanese rock garden (karesansui), created for meditation, relaxation and interior decoration.</p>\r\n<p>The main goal of a Zen garden is to create a space for meditation and relaxation, where a person can enjoy the beauty of nature and find harmony with himself. For those who do not have the opportunity to create a Zen garden from natural materials, there is a wonderful alternative - an artificial garden. Creating such a Zen garden will bring exactly the same amount of peace, harmony, and pleasure. And the use of artificial materials will make it easier to care for this wonderful anti-stress souvenir.</p>',NULL,NULL,NULL,NULL,NULL,NULL,73,10,'en|73|10'),
(1692,'en',NULL,'Japanese Zen Garden Tabletop',NULL,NULL,NULL,NULL,NULL,NULL,74,2,'en|74|2'),
(1693,'en',NULL,'japanese-zen-garden-tabletop',NULL,NULL,NULL,NULL,NULL,NULL,74,3,'en|74|3'),
(1694,'en',NULL,'<p><strong>Create an atmosphere of peace and harmony with this mini rock garden: enjoy meditation by drawing patterns in the sand and contemplate the candle flame to release stress.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,74,9,'en|74|9'),
(1695,'en',NULL,'<p>Mini Zen garden (or tabletop rock garden) is a compact version of a traditional Japanese rock garden (karesansui), created for meditation, relaxation and interior decoration.<br>The set in a gift box includes a Buddha statue, a stand, a mini rake, the purest quartz sand, stones and a tea light candle holder. A tabletop Japanese rock garden is an original gift for an office for a man or a woman, for friends, colleagues, managers and anyone who appreciates beauty and strives for inner harmony. The mini garden will fit perfectly into any interior, becoming a stylish accent in your space. Sand with an anti-stress rake will be especially useful in the office: every time you need to escape from the work routine, the garden will become an excellent anti-stress tool, helping to relieve tension and restore concentration.</p>',NULL,NULL,NULL,NULL,NULL,NULL,74,10,'en|74|10'),
(1696,'en',NULL,'Three-Leaf Screen \"Hikone Byobu\"',NULL,NULL,NULL,NULL,NULL,NULL,75,2,'en|75|2'),
(1697,'en',NULL,'three-leaf-screen-hikone-byobu',NULL,NULL,NULL,NULL,NULL,NULL,75,3,'en|75|3'),
(1698,'en',NULL,'<p><strong>The Hikone Byobu Six-Panel Screen is a luxurious reproduction of a 17th century Japanese masterpiece, made in the traditional gold leaf technique, ideal for lovers of art and oriental style.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,75,9,'en|75|9'),
(1699,'en',NULL,'<p>Byōbu (屏風, byōbu) is a traditional Japanese folding screen used to divide a space, decorate an interior, and protect against drafts.<br>The presented screen \"Hikone byōbu\" is one of the best reproductions of the original screen of the 17th century.<br>The work is an example of Japanese decorative painting on screens. This is a six-fold screen consisting of painted panels framed along the perimeter with wooden frames. On the reverse side, they are pasted over with special decorative paper, which plays the role of a lining-back.<br>The painting technique is authentic to the manner of the original: it is done on Japanese washi paper with watercolor paints on a canvas covered with the finest gold foil using the kimpaku method.<br>The work entered the history of Japanese art under the name of the Hikone Byobu screen, after its location in Hikone Castle (Shiga Prefecture), which belonged to the Ii samurai clan. In 1997, the descendants of the family</p>',NULL,NULL,NULL,NULL,NULL,NULL,75,10,'en|75|10'),
(1700,NULL,NULL,'0.016',NULL,NULL,NULL,NULL,NULL,NULL,76,22,'76|22'),
(1701,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,76,28,'76|28'),
(1702,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,76,5,'76|5'),
(1703,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,76,6,'76|6'),
(1704,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,76,7,'76|7'),
(1705,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,76,8,'default|76|8'),
(1706,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,76,26,'76|26'),
(1707,NULL,NULL,'1500',NULL,NULL,NULL,NULL,NULL,NULL,76,1,'76|1'),
(1708,'ru',NULL,'Омамори - исполнение желаний / мечт',NULL,NULL,NULL,NULL,NULL,NULL,76,2,'ru|76|2'),
(1709,'ru',NULL,'омамори-исполнение-желании-мечт',NULL,NULL,NULL,NULL,NULL,NULL,76,3,'ru|76|3'),
(1710,NULL,NULL,'1500',NULL,NULL,NULL,NULL,NULL,NULL,76,27,'76|27'),
(1711,NULL,NULL,NULL,NULL,110,NULL,NULL,NULL,NULL,76,44,'76|44'),
(1712,NULL,NULL,'0.016',NULL,NULL,NULL,NULL,NULL,NULL,76,47,'76|47'),
(1713,NULL,NULL,NULL,NULL,99,NULL,NULL,NULL,NULL,76,65,'76|65'),
(1714,NULL,NULL,'103',NULL,NULL,NULL,NULL,NULL,NULL,76,66,'76|66'),
(1715,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,76,67,'76|67'),
(1716,'ru',NULL,'<p><strong>Японский амулет омамори из ткани с традиционным дизайном. Приносит удачу и защиту.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,76,9,'ru|76|9'),
(1717,'ru',NULL,'<p>Омамори (お守り) &mdash; это традиционные японские амулеты из синтоистских и буддийских храмов, которые приносят удачу, защиту и благополучие.</p>\r\n<p>Маленький амулет-подвеска в виде тканевого мешочка.<br>У каждого амулета омамори своё назначение:<br>- Богатство и изобилие финансы,деньги и достаток - амулет призван привлечь богатство и изобилие в Вашу жизнь.<br>- Любовь и крепкие отношения/брак - амулет призван привлечь счастье и благополучие в ваши отношения, привлечь и сохранить любовь. Является символом стабильного брака и крепких отношений.<br>- Удача/фортуна/везение/фарт - амулет призван привлечь удачу во все ваши дела и начинания. Не забудь взять его на экзамен или важную встречу.<br>- Защита тела/здоровье- амулет призван защитить тело от разных недугов и болезней, поддерживать источник силы внутри тела.<br>Выберите ваш амулет.<br>Упакован в прозрачный плотный кармашек, в котором амулет можно оставить, чтобы он не пылился.<br>Шнурок длиной 15+ см.<br>Размер мешочка 4*6см.<br>Размер кармашка 5*7см.<br>Амулет можно вложить в кошелёк, использовать в качестве брелока для сумки/рюкзака или положить дома.<br>Амулет омамори - отличный подарок для подруги, друга, однокласснику, сестре, любимому.</p>',NULL,NULL,NULL,NULL,NULL,NULL,76,10,'ru|76|10'),
(1718,NULL,NULL,NULL,NULL,NULL,310.0000,NULL,NULL,NULL,76,11,'76|11'),
(1719,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,76,13,'76|13'),
(1720,NULL,NULL,'0.017',NULL,NULL,NULL,NULL,NULL,NULL,77,22,'77|22'),
(1721,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,77,28,'77|28'),
(1722,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,77,5,'77|5'),
(1723,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,77,6,'77|6'),
(1724,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,77,7,'77|7'),
(1725,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,77,8,'default|77|8'),
(1726,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,77,26,'77|26'),
(1727,NULL,NULL,'1501',NULL,NULL,NULL,NULL,NULL,NULL,77,1,'77|1'),
(1728,'ru',NULL,'Омамори “Кот Удачи”',NULL,NULL,NULL,NULL,NULL,NULL,77,2,'ru|77|2'),
(1729,'ru',NULL,'омамори-кот-удачи',NULL,NULL,NULL,NULL,NULL,NULL,77,3,'ru|77|3'),
(1730,NULL,NULL,'1501',NULL,NULL,NULL,NULL,NULL,NULL,77,27,'77|27'),
(1731,NULL,NULL,NULL,NULL,59,NULL,NULL,NULL,NULL,77,44,'77|44'),
(1732,NULL,NULL,'0.017',NULL,NULL,NULL,NULL,NULL,NULL,77,47,'77|47'),
(1733,NULL,NULL,NULL,NULL,99,NULL,NULL,NULL,NULL,77,65,'77|65'),
(1734,NULL,NULL,'103',NULL,NULL,NULL,NULL,NULL,NULL,77,66,'77|66'),
(1735,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,77,67,'77|67'),
(1736,'ru',NULL,'<p><strong>Омамори с изображением Манэки-нэко - японский амулет для привлечения удачи и богатства.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,77,9,'ru|77|9'),
(1737,'ru',NULL,'<p>Омамори (お守り) &mdash; это традиционные японские амулеты из синтоистских и буддийских храмов, которые приносят удачу, защиту и благополучие.</p>\r\n<p>Маленький амулет-подвеска в виде тканевого мешочка.<br>У каждого амулета омамори своё назначение:<br>- Богатство и изобилие - амулет призван привлечь богатство и изобилие в Вашу жизнь.<br>- Любовь и крепкие отношения/брак - амулет призван привлечь счастье и благополучие в ваши отношения, привлечь и сохранить любовь. Является символом стабильного брака и крепких отношений.<br>- Удача/фортуна - амулет призван привлечь удачу во все ваши дела и начинания. Не забудь взять его на экзамен или важную встречу.<br>- Защита тела/здоровье- амулет призван защитить тело от разных недугов и болезней, поддерживать источник силы внутри тела.<br>Упакован в прозрачный плотный кармашек, в котором амулет можно оставить, чтобы он не пылился.<br>Шнурок длиной 15+ см.<br>Размер мешочка 4*6см.<br>Размер кармашка 5*7см.<br>Амулет можно вложить в кошелёк, использовать в качестве брелока для сумки/рюкзака или положить дома.<br>Амулет омамори - отличный подарок для подруги, друга, однокласснику, сестре, любимому.</p>',NULL,NULL,NULL,NULL,NULL,NULL,77,10,'ru|77|10'),
(1738,NULL,NULL,NULL,NULL,NULL,400.0000,NULL,NULL,NULL,77,11,'77|11'),
(1739,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,77,13,'77|13'),
(1740,NULL,NULL,'18',NULL,NULL,NULL,NULL,NULL,NULL,78,19,'78|19'),
(1741,NULL,NULL,'18',NULL,NULL,NULL,NULL,NULL,NULL,78,21,'78|21'),
(1742,NULL,NULL,'0.333',NULL,NULL,NULL,NULL,NULL,NULL,78,22,'78|22'),
(1743,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,78,28,'78|28'),
(1744,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,78,5,'78|5'),
(1745,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,78,6,'78|6'),
(1746,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,78,7,'78|7'),
(1747,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,78,8,'default|78|8'),
(1748,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,78,26,'78|26'),
(1749,NULL,NULL,'1502',NULL,NULL,NULL,NULL,NULL,NULL,78,1,'78|1'),
(1750,'ru',NULL,'Фигурка на батарейках \"Манеки-Неко\" Кот машущий правой лапкой',NULL,NULL,NULL,NULL,NULL,NULL,78,2,'ru|78|2'),
(1751,'ru',NULL,'фигурка-на-батареиках-манеки-неко-кот-машущии-правои-лапкои',NULL,NULL,NULL,NULL,NULL,NULL,78,3,'ru|78|3'),
(1752,NULL,NULL,'1502',NULL,NULL,NULL,NULL,NULL,NULL,78,27,'78|27'),
(1753,NULL,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,78,44,'78|44'),
(1754,NULL,NULL,'0.333',NULL,NULL,NULL,NULL,NULL,NULL,78,47,'78|47'),
(1755,NULL,NULL,NULL,NULL,100,NULL,NULL,NULL,NULL,78,65,'78|65'),
(1756,NULL,NULL,'104',NULL,NULL,NULL,NULL,NULL,NULL,78,66,'78|66'),
(1757,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,78,67,'78|67'),
(1758,'ru',NULL,'<p><strong>Фигурка Манэки-нэко с поднятой лапой, держащая золотую монету и мешочек с сокровищами. Приносит удачу в бизнесе и финансовое благополучие.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,78,9,'ru|78|9'),
(1759,'ru',NULL,'<p>Манэки-нэко (招き猫) &mdash; &laquo;Манящий кот&raquo;<br>Это японский талисман в виде кошки с поднятой лапкой, который привлекает удачу, богатство и благополучие. Его часто можно увидеть в магазинах, ресторанах и домах по всей Японии.</p>\r\n<p>Привлеките удачу и процветание в свою жизнь с очаровательной статуэткой на солнечной батарейке &ndash; черным котом Манэки-нэко!<br>Манэки-нэко, также известный как &laquo;Кот Удачи&raquo; или &laquo;Денежный Кот&raquo;, &ndash; это традиционный японский талисман, приносящий удачу в делах, финансовое благополучие и общее процветание. Эта милая фигурка кота с поднятой лапкой стала популярным символом во всем мире, и теперь у вас есть возможность обзавестись собственным источником позитивной энергии!<br>Особенности этой статуэтки Манэки-нэко:<br>Традиционный символ: Эта статуэтка &ndash; классический представитель Манэки-нэко, с поднятой левой лапкой, которая привлекает клиентов и удачу в бизнесе. Его улыбающееся лицо излучает доброжелательность и позитив.<br>Экологичный источник энергии: Забудьте о батарейках! Этот Манэки-нэко работает на солнечной энергии. Просто поместите его в хорошо освещенное место, и он начнет автоматически махать лапкой, привлекая положительную энергию и удачу в вашу жизнь.<br>Черный цвет: В японской культуре черный цвет Манэки-нэко символизирует защиту от зла и болезней. Он отгоняет негатив и приносит стабильность.<br>Компактный размер: Небольшие размеры статуэтки (Высота: 7.5 см, Ширина: 6.5 см, Длина: 7.5 см) позволяют разместить ее где угодно: на рабочем столе, полке, прилавке магазина или даже в автомобиле.<br>Прочный материал: Изготовленная из качественного пластика, эта статуэтка Манэки-нэко прослужит вам долго, не теряя своего привлекательного внешнего вида.</p>',NULL,NULL,NULL,NULL,NULL,NULL,78,10,'ru|78|10'),
(1760,NULL,NULL,NULL,NULL,NULL,3700.0000,NULL,NULL,NULL,78,11,'78|11'),
(1761,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,78,13,'78|13'),
(1762,NULL,NULL,'15x12x15',NULL,NULL,NULL,NULL,NULL,NULL,78,50,'78|50'),
(1763,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,79,19,'79|19'),
(1764,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,79,21,'79|21'),
(1765,NULL,NULL,'0.170',NULL,NULL,NULL,NULL,NULL,NULL,79,22,'79|22'),
(1766,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,79,28,'79|28'),
(1767,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,79,5,'79|5'),
(1768,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,79,6,'79|6'),
(1769,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,79,7,'79|7'),
(1770,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,79,8,'default|79|8'),
(1771,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,79,26,'79|26'),
(1772,NULL,NULL,'1503',NULL,NULL,NULL,NULL,NULL,NULL,79,1,'79|1'),
(1773,'ru',NULL,'Статуэтка на солнечной батарейке кот манэки нэко',NULL,NULL,NULL,NULL,NULL,NULL,79,2,'ru|79|2'),
(1774,'ru',NULL,'статуэтка-на-солнечнои-батареике-кот-манэки-нэко',NULL,NULL,NULL,NULL,NULL,NULL,79,3,'ru|79|3'),
(1775,NULL,NULL,'1503',NULL,NULL,NULL,NULL,NULL,NULL,79,27,'79|27'),
(1776,NULL,NULL,NULL,NULL,57,NULL,NULL,NULL,NULL,79,44,'79|44'),
(1777,NULL,NULL,'0.170',NULL,NULL,NULL,NULL,NULL,NULL,79,47,'79|47'),
(1778,NULL,NULL,'7.5x6.5x7.510',NULL,NULL,NULL,NULL,NULL,NULL,79,50,'79|50'),
(1779,NULL,NULL,NULL,NULL,100,NULL,NULL,NULL,NULL,79,65,'79|65'),
(1780,NULL,NULL,'105',NULL,NULL,NULL,NULL,NULL,NULL,79,66,'79|66'),
(1781,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,79,67,'79|67'),
(1782,'ru',NULL,'<p><strong>Черный Манэки-нэко на солнечной батарее, привлекающий удачу в бизнесе. Машет лапой, приманивая богатство.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,79,9,'ru|79|9'),
(1783,'ru',NULL,'<p>Манэки-нэко (招き猫) &mdash; &laquo;Манящий кот&raquo;<br>Это японский талисман в виде кошки с поднятой лапкой, который привлекает удачу, богатство и благополучие. Его часто можно увидеть в магазинах, ресторанах и домах по всей Японии.</p>\r\n<p>Привлеките удачу и процветание в свою жизнь с очаровательной статуэткой на солнечной батарейке &ndash; черным котом Манэки-нэко!<br>Манэки-нэко, также известный как &laquo;Кот Удачи&raquo; или &laquo;Денежный Кот&raquo;, &ndash; это традиционный японский талисман, приносящий удачу в делах, финансовое благополучие и общее процветание. Эта милая фигурка кота с поднятой лапкой стала популярным символом во всем мире, и теперь у вас есть возможность обзавестись собственным источником позитивной энергии!<br>Особенности этой статуэтки Манэки-нэко:<br>Традиционный символ: Эта статуэтка &ndash; классический представитель Манэки-нэко, с поднятой левой лапкой, которая привлекает клиентов и удачу в бизнесе. Его улыбающееся лицо излучает доброжелательность и позитив.<br>Экологичный источник энергии: Забудьте о батарейках! Этот Манэки-нэко работает на солнечной энергии. Просто поместите его в хорошо освещенное место, и он начнет автоматически махать лапкой, привлекая положительную энергию и удачу в вашу жизнь.<br>Черный цвет: В японской культуре черный цвет Манэки-нэко символизирует защиту от зла и болезней. Он отгоняет негатив и приносит стабильность.<br>Компактный размер: Небольшие размеры статуэтки (Высота: 7.5 см, Ширина: 6.5 см, Длина: 7.5 см) позволяют разместить ее где угодно: на рабочем столе, полке, прилавке магазина или даже в автомобиле.<br>Прочный материал: Изготовленная из качественного пластика, эта статуэтка Манэки-нэко прослужит вам долго, не теряя своего привлекательного внешнего вида.</p>',NULL,NULL,NULL,NULL,NULL,NULL,79,10,'ru|79|10'),
(1784,NULL,NULL,NULL,NULL,NULL,5400.0000,NULL,NULL,NULL,79,11,'79|11'),
(1785,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,79,13,'79|13'),
(1786,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL,NULL,80,19,'80|19'),
(1787,NULL,NULL,'4',NULL,NULL,NULL,NULL,NULL,NULL,80,21,'80|21'),
(1788,NULL,NULL,'0.027',NULL,NULL,NULL,NULL,NULL,NULL,80,22,'80|22'),
(1789,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,80,28,'80|28'),
(1790,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,80,5,'80|5'),
(1791,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,80,6,'80|6'),
(1792,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,80,7,'80|7'),
(1793,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,80,8,'default|80|8'),
(1794,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,80,26,'80|26'),
(1795,NULL,NULL,'1504',NULL,NULL,NULL,NULL,NULL,NULL,80,1,'80|1'),
(1796,'ru',NULL,'Фигурка Карасиси Фо',NULL,NULL,NULL,NULL,NULL,NULL,80,2,'ru|80|2'),
(1797,'ru',NULL,'фигурка-карасиси-фо',NULL,NULL,NULL,NULL,NULL,NULL,80,3,'ru|80|3'),
(1798,NULL,NULL,'1504',NULL,NULL,NULL,NULL,NULL,NULL,80,27,'80|27'),
(1799,NULL,NULL,NULL,NULL,111,NULL,NULL,NULL,NULL,80,44,'80|44'),
(1800,NULL,NULL,'0.027',NULL,NULL,NULL,NULL,NULL,NULL,80,47,'80|47'),
(1801,NULL,NULL,'4.5x3x3.5',NULL,NULL,NULL,NULL,NULL,NULL,80,50,'80|50'),
(1802,NULL,NULL,NULL,NULL,101,NULL,NULL,NULL,NULL,80,65,'80|65'),
(1803,NULL,NULL,'106',NULL,NULL,NULL,NULL,NULL,NULL,80,66,'80|66'),
(1804,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,80,67,'80|67'),
(1805,'ru',NULL,'<p><strong>Миниатюрная статуэтка, изображающая японского льва-охраника. Традиционная резьба, детальная проработка.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,80,9,'ru|80|9'),
(1806,'ru',NULL,'<p>Нэцкэ (根付) &mdash; миниатюрная японская скульптура с практическим назначением<br>Это небольшие резные фигурки из дерева, кости или камня, которые появились в Японии в период Эдо (1603&ndash;1868). Изначально они служили практическим целям, но со временем стали ценными艺术品 (произведениями искусства) и коллекционными предметами.</p>\r\n<p>Нэцкэ фигурка Карасиси Фо &mdash; Ши Дза - небесный китайский лев Будды. Является охранителем от злых духов, символ счастья и благополучия. Считается также покровителем детей. Помогает людям в их добрых начинаниях и духовных стремлениях. Это уникальный дизайн, ручная работа, положительная энергетика и хорошее качество. Статуэтка божества выполнена из высокопрочного литьевого камня и раскрашена вручную водоотталкивающим воском. Изделие ручной работы станет прекрасным подарком маме, подруге, коллеге, сестре , дочке, другу, мужу, брату . ВЫСОТА ИЗДЕЛИЯ 3.5 СМ.</p>',NULL,NULL,NULL,NULL,NULL,NULL,80,10,'ru|80|10'),
(1807,NULL,NULL,NULL,NULL,NULL,1470.0000,NULL,NULL,NULL,80,11,'80|11'),
(1808,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80,13,'80|13'),
(1809,NULL,NULL,'4',NULL,NULL,NULL,NULL,NULL,NULL,81,19,'81|19'),
(1810,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,81,21,'81|21'),
(1811,NULL,NULL,'0.023',NULL,NULL,NULL,NULL,NULL,NULL,81,22,'81|22'),
(1812,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,81,28,'81|28'),
(1813,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,81,5,'81|5'),
(1814,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,81,6,'81|6'),
(1815,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,81,7,'81|7'),
(1816,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,81,8,'default|81|8'),
(1817,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,81,26,'81|26'),
(1818,NULL,NULL,'1505',NULL,NULL,NULL,NULL,NULL,NULL,81,1,'81|1'),
(1819,'ru',NULL,'Нэцкэ фигурка Дайкоку',NULL,NULL,NULL,NULL,NULL,NULL,81,2,'ru|81|2'),
(1820,'ru',NULL,'нэцкэ-фигурка-даикоку',NULL,NULL,NULL,NULL,NULL,NULL,81,3,'ru|81|3'),
(1821,NULL,NULL,'1505',NULL,NULL,NULL,NULL,NULL,NULL,81,27,'81|27'),
(1822,NULL,NULL,NULL,NULL,111,NULL,NULL,NULL,NULL,81,44,'81|44'),
(1823,NULL,NULL,'0.023',NULL,NULL,NULL,NULL,NULL,NULL,81,47,'81|47'),
(1824,NULL,NULL,'3x5x5',NULL,NULL,NULL,NULL,NULL,NULL,81,50,'81|50'),
(1825,NULL,NULL,NULL,NULL,101,NULL,NULL,NULL,NULL,81,65,'81|65'),
(1826,NULL,NULL,'107',NULL,NULL,NULL,NULL,NULL,NULL,81,66,'81|66'),
(1827,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,81,67,'81|67'),
(1828,'ru',NULL,'<p><strong>Миниатюрная скульптура Нэцкэ, изображающая Дайкоку, одного из Семи богов счастья в японской мифологии.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,81,9,'ru|81|9'),
(1829,'ru',NULL,'<p>Нэцкэ (根付) &mdash; миниатюрная японская скульптура с практическим назначением<br>Это небольшие резные фигурки из дерева, кости или камня, которые появились в Японии в период Эдо (1603&ndash;1868). Изначально они служили практическим целям, но со временем стали ценными艺术品 (произведениями искусства) и коллекционными предметами.</p>\r\n<p>Нэцкэ Дайкоку &mdash; один из семи богов счастья бог богатства и достатка. Иногда ему поклоняются как покровителю домашнего очага. В нэцкэ он изображается в костюме каригину, в шапке тори-эбоси, с колотушкой, крысой и мешком волшебного риса &mdash; символом богатства и достатка. Крысы &mdash; помощники Дайкоку и наши друзья. Они прогрызают в его мешке дырочки, и волшебный рис сыплется с неба на землю прямо нам в руки.</p>',NULL,NULL,NULL,NULL,NULL,NULL,81,10,'ru|81|10'),
(1830,NULL,NULL,NULL,NULL,NULL,3299.0000,NULL,NULL,NULL,81,11,'81|11'),
(1831,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,81,13,'81|13'),
(1832,NULL,NULL,'21',NULL,NULL,NULL,NULL,NULL,NULL,82,19,'82|19'),
(1833,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,82,21,'82|21'),
(1834,NULL,NULL,'0.048',NULL,NULL,NULL,NULL,NULL,NULL,82,22,'82|22'),
(1835,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,82,28,'82|28'),
(1836,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,82,5,'82|5'),
(1837,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,82,6,'82|6'),
(1838,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,82,7,'82|7'),
(1839,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,82,8,'default|82|8'),
(1840,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,82,26,'82|26'),
(1841,NULL,NULL,'1506',NULL,NULL,NULL,NULL,NULL,NULL,82,1,'82|1'),
(1842,'ru',NULL,'Сэнсу - складной бамбуковый',NULL,NULL,NULL,NULL,NULL,NULL,82,2,'ru|82|2'),
(1843,'ru',NULL,'сэнсу-складнои-бамбуковыи',NULL,NULL,NULL,NULL,NULL,NULL,82,3,'ru|82|3'),
(1844,NULL,NULL,'1506',NULL,NULL,NULL,NULL,NULL,NULL,82,27,'82|27'),
(1845,NULL,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,82,44,'82|44'),
(1846,NULL,NULL,'21x3x5',NULL,NULL,NULL,NULL,NULL,NULL,82,50,'82|50'),
(1847,NULL,NULL,NULL,NULL,102,NULL,NULL,NULL,NULL,82,65,'82|65'),
(1848,NULL,NULL,'108,109',NULL,NULL,NULL,NULL,NULL,NULL,82,66,'82|66'),
(1849,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,82,67,'82|67'),
(1850,NULL,NULL,'18',NULL,NULL,NULL,NULL,NULL,NULL,82,68,'82|68'),
(1851,'ru',NULL,'<p><strong>Изящный складной веер с цветочным рисунком в приглушенных тонах. Идеальный аксессуар для создания неповторимого образа.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,82,9,'ru|82|9'),
(1852,'ru',NULL,'<p>Сэнсу (扇子) &mdash; традиционный японский складной веер<br>Сэнсу &mdash; это не просто аксессуар для создания ветерка, а важный элемент японской культуры, искусства и даже этикета. Ощутите прохладу и элегантность с нашим складным веером Сэнсу - воплощением японского мастерства!</p>\r\n<p>Веер Сэнсу &ndash; это не просто функциональный предмет, это произведение искусства, сочетающее в себе красоту, легкость и удобство. Издревле веер был неотъемлемым атрибутом японской культуры, символизирующим статус, вкус и утонченность. Наш складной бамбуковый веер Сэнсу сочетает в себе традиционную форму и современные материалы, создавая уникальный аксессуар, который подчеркнет ваш индивидуальный стиль.<br>Особенности нашего складного бамбукового веера Сэнсу:<br>Традиционный дизайн: Веер Сэнсу - это складной веер, состоящий из тонких лопастей, соединенных у основания. Этот дизайн позволяет легко складывать и раскладывать веер, делая его компактным и удобным для ношения с собой.<br>Натуральные материалы: Лопасти веера изготовлены из прочного и легкого бамбука. Этот природный материал не только экологичен, но и придает вееру неповторимую текстуру и теплоту. Текстильное полотно, натянутое на лопасти, изготовлено из приятного на ощупь материала.<br>Уникальный дизайн: Веер украшен разноцветным цветочным рисунком. Красивые цветы подчеркивают женственность и элегантность.<br>Компактный размер: Благодаря своим компактным размерам (Длина: 21 см, Ширина: 3 см в сложенном виде), веер легко помещается в сумке или кармане, всегда готовый подарить вам прохладу в жаркий день.<br>Ручная работа: Наши веера создаются с любовью и вниманием к деталям. Каждое изделие проходит строгий контроль качества, чтобы вы могли наслаждаться безупречным исполнением и долговечностью.<br>18 ребер: Количество бамбуковых ребер обеспечивает прочность конструкции и плавное раскрытие веера.</p>',NULL,NULL,NULL,NULL,NULL,NULL,82,10,'ru|82|10'),
(1853,NULL,NULL,NULL,NULL,NULL,1100.0000,NULL,NULL,NULL,82,11,'82|11'),
(1854,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,82,13,'82|13'),
(1855,'en',NULL,'Omamori - wish/dream fulfillment',NULL,NULL,NULL,NULL,NULL,NULL,76,2,'en|76|2'),
(1856,'en',NULL,'omamori-wishdream-fulfillment',NULL,NULL,NULL,NULL,NULL,NULL,76,3,'en|76|3'),
(1857,'en',NULL,'<p><strong>Japanese omamori amulet made of fabric with traditional design. Brings good luck and protection.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,76,9,'en|76|9'),
(1858,'en',NULL,'<p>Omamori (お守り) are traditional Japanese amulets from Shinto and Buddhist temples that bring good luck, protection and prosperity.</p>\r\n<p>A small amulet pendant in the form of a fabric bag.<br>Each omamori amulet has its own purpose:<br>- Wealth and abundance finances, money and prosperity - the amulet is designed to attract wealth and abundance into your life.<br>- Love and strong relationships/marriage - the amulet is designed to attract happiness and prosperity into your relationship, to attract and preserve love. It is a symbol of a stable marriage and strong relationships.<br>- Luck/fortune/luck/fortune - the amulet is designed to attract good luck in all your affairs and undertakings. Don\'t forget to take it to an exam or an important meeting.<br>- Body protection/health - the amulet is designed to protect the body from various ailments and diseases, to maintain the source of strength inside the body.<br>Choose your amulet.<br>Packed in a transparent dense pocket, in which the amulet can be left so that it does not gather dust.<br>The cord is 15+ cm long.<br>The size of the bag is 4 * 6 cm.<br>The size of the pocket is 5 * 7 cm.<br>The amulet can be put in a wallet, used as a keychain for a bag / backpack or put at home.<br>The omamori amulet is a great gift for a girlfriend, friend, classmate, sister, loved one.</p>',NULL,NULL,NULL,NULL,NULL,NULL,76,10,'en|76|10'),
(1859,'en',NULL,'Omamori \"Lucky Cat\"',NULL,NULL,NULL,NULL,NULL,NULL,77,2,'en|77|2'),
(1860,'en',NULL,'omamori-lucky-cat',NULL,NULL,NULL,NULL,NULL,NULL,77,3,'en|77|3'),
(1861,'en',NULL,'<p><strong>Omamori with the image of Maneki-neko is a Japanese amulet for attracting good luck and wealth.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,77,9,'en|77|9'),
(1862,'en',NULL,'<p>Omamori (お守り) are traditional Japanese amulets from Shinto and Buddhist temples that bring good luck, protection and prosperity.</p>\r\n<p>A small amulet pendant in the form of a fabric bag.<br>Each omamori amulet has its own purpose:<br>- Wealth and abundance - the amulet is designed to attract wealth and abundance into your life.<br>- Love and strong relationships/marriage - the amulet is designed to attract happiness and prosperity into your relationship, to attract and preserve love. It is a symbol of a stable marriage and strong relationships.<br>- Luck/fortune - the amulet is designed to attract good luck in all your affairs and undertakings. Don\'t forget to take it to an exam or an important meeting.<br>- Body protection/health - the amulet is designed to protect the body from various ailments and diseases, to maintain the source of strength inside the body.<br>Packed in a transparent dense pocket in which the amulet can be left so that it does not gather dust.<br>The cord is 15+ cm long.<br>The size of the bag is 4*6 cm.<br>The size of the pocket is 5*7 cm.<br>The amulet can be put in a wallet, used as a keychain for a bag/backpack or kept at home.<br>The omamori amulet is a great gift for a girlfriend, boyfriend, classmate, sister, or loved one.</p>',NULL,NULL,NULL,NULL,NULL,NULL,77,10,'en|77|10'),
(1863,'en',NULL,'Battery Operated Figure \"Maneki Neko\" Cat Waving Right Paw',NULL,NULL,NULL,NULL,NULL,NULL,78,2,'en|78|2'),
(1864,'en',NULL,'battery-operated-figure-maneki-neko-cat-waving-right-paw',NULL,NULL,NULL,NULL,NULL,NULL,78,3,'en|78|3'),
(1865,'en',NULL,'<p><strong>A Maneki Neko figurine with a raised paw, holding a gold coin and a bag of treasures. Brings good luck in business and financial well-being.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,78,9,'en|78|9'),
(1866,'en',NULL,'<p>Maneki Neko (招き猫) - \"Beckoning Cat\"<br>This is a Japanese lucky charm shaped like a cat with its paw raised that attracts good luck, wealth, and prosperity. It is often seen in shops, restaurants, and homes all over Japan.</p>\r\n<p>Attract good luck and prosperity into your life with this adorable solar-powered black Maneki Neko!<br>The Maneki Neko, also known as the \"Lucky Cat\" or \"Money Cat\", is a traditional Japanese lucky charm that brings good luck in business, financial well-being, and overall prosperity. This cute cat with its paw raised has become a popular symbol around the world, and now you can have your own source of positive energy!<br>Features of this Maneki Neko:<br>Traditional Symbol: This figurine is a classic Maneki Neko, with its left paw raised to attract customers and good luck in business. Its smiling face radiates goodwill and positivity.<br>Environmentally friendly energy source: Forget about batteries! This Maneki Neko is solar powered. Just place it in a well-lit area and it will automatically wave its paw, attracting positive energy and good luck into your life.<br>Black Color: In Japanese culture, the black color of the Maneki Neko symbolizes protection from evil and disease. It drives away negativity and brings stability.<br>Compact Size: The small size of the figurine (Height: 7.5 cm, Width: 6.5 cm, Length: 7.5 cm) allows you to place it anywhere: on your desktop, shelf, store counter or even in your car.<br>Durable Material: Made of high-quality plastic, this Maneki Neko figurine will serve you for a long time without losing its attractive appearance.</p>',NULL,NULL,NULL,NULL,NULL,NULL,78,10,'en|78|10'),
(1867,'en',NULL,'Solar Powered Maneki Neko Cat Figurine',NULL,NULL,NULL,NULL,NULL,NULL,79,2,'en|79|2'),
(1868,'en',NULL,'solar-powered-maneki-neko-cat-figurine',NULL,NULL,NULL,NULL,NULL,NULL,79,3,'en|79|3'),
(1869,'en',NULL,'<p><strong>A black solar-powered Maneki Neko that attracts good luck in business. It waves its paw, beckoning wealth.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,79,9,'en|79|9'),
(1870,'en',NULL,'<p>Maneki Neko (招き猫) - \"Beckoning Cat\"<br>This is a Japanese lucky charm shaped like a cat with its paw raised that attracts good luck, wealth, and prosperity. It is often seen in shops, restaurants, and homes all over Japan.</p>\r\n<p>Attract good luck and prosperity into your life with this adorable solar-powered black Maneki Neko!<br>The Maneki Neko, also known as the \"Lucky Cat\" or \"Money Cat\", is a traditional Japanese lucky charm that brings good luck in business, financial well-being, and overall prosperity. This cute cat with its paw raised has become a popular symbol around the world, and now you can have your own source of positive energy!<br>Features of this Maneki Neko:<br>Traditional Symbol: This figurine is a classic Maneki Neko, with its left paw raised to attract customers and good luck in business. Its smiling face radiates goodwill and positivity.<br>Environmentally friendly energy source: Forget about batteries! This Maneki Neko is solar powered. Just place it in a well-lit area and it will automatically wave its paw, attracting positive energy and good luck into your life.<br>Black Color: In Japanese culture, the black color of the Maneki Neko symbolizes protection from evil and disease. It drives away negativity and brings stability.<br>Compact Size: The small size of the figurine (Height: 7.5 cm, Width: 6.5 cm, Length: 7.5 cm) allows you to place it anywhere: on your desktop, shelf, store counter or even in your car.<br>Durable Material: Made of high-quality plastic, this Maneki Neko figurine will serve you for a long time without losing its attractive appearance.</p>',NULL,NULL,NULL,NULL,NULL,NULL,79,10,'en|79|10'),
(1871,'en',NULL,'Karasisi Fo figurine',NULL,NULL,NULL,NULL,NULL,NULL,80,2,'en|80|2'),
(1872,'en',NULL,'karasisi-fo-figurine',NULL,NULL,NULL,NULL,NULL,NULL,80,3,'en|80|3'),
(1873,'en',NULL,'<p><strong>Miniature figurine depicting a Japanese guardian lion. Traditional carving, detailed elaboration.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,80,9,'en|80|9'),
(1874,'en',NULL,'<p>Netsuke (根付) is a miniature Japanese sculpture with a practical purpose<br>These are small carved figures made of wood, bone or stone that appeared in Japan during the Edo period (1603&ndash;1868). Initially, they served practical purposes, but over time they became valuable 艺术品 (works of art) and collectibles.</p>\r\n<p>Netsuke figurine Karashishi Fo - Shi Za - the Chinese heavenly lion of Buddha. He is a guardian from evil spirits, a symbol of happiness and well-being. He is also considered the patron saint of children. He helps people in their good endeavors and spiritual aspirations. This is a unique design, handmade, positive energy and good quality. The deity figurine is made of highly durable cast stone and hand-painted with water-repellent wax. Handmade product will be a wonderful gift for your mother, girlfriend, colleague, sister, daughter, boyfriend, husband, brother. PRODUCT HEIGHT 3.5 CM.</p>',NULL,NULL,NULL,NULL,NULL,NULL,80,10,'en|80|10'),
(1875,'en',NULL,'Netsuke figurine Daikoku',NULL,NULL,NULL,NULL,NULL,NULL,81,2,'en|81|2'),
(1876,'en',NULL,'netsuke-figurine-daikoku',NULL,NULL,NULL,NULL,NULL,NULL,81,3,'en|81|3'),
(1877,'en',NULL,'<p><strong>A miniature Netsuke sculpture depicting Daikoku, one of the Seven Lucky Gods in Japanese mythology.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,81,9,'en|81|9'),
(1878,'en',NULL,'<p><strong>Netsuke (根付) are miniature Japanese sculptures with a practical purpose</strong><br><strong>These are small carved figures made of wood, bone, or stone that appeared in Japan during the Edo period (1603&ndash;1868). They originally served a practical purpose, but over time they became valuable 艺术品 (works of art) and collectibles.</strong></p>\r\n<p><strong>Netsuke Daikoku is one of the seven gods of happiness, the god of wealth and prosperity. He is sometimes worshiped as the patron of the hearth. In netsuke, he is depicted wearing a kariginu suit, a tori-eboshi hat, with a mallet, a rat, and a bag of magic rice, a symbol of wealth and prosperity. Rats are Daikoku\'s assistants and our friends. They gnaw holes in his bag, and the magic rice falls from the sky to the ground right into our hands.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,81,10,'en|81|10'),
(1879,'en',NULL,'Sensu - folding bamboo',NULL,NULL,NULL,NULL,NULL,NULL,82,2,'en|82|2'),
(1880,'en',NULL,'sensu-folding-bamboo',NULL,NULL,NULL,NULL,NULL,NULL,82,3,'en|82|3'),
(1881,'en',NULL,'<p><strong>A delicate folding fan with a floral design in muted tones. The perfect accessory for creating a unique look.</strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,82,9,'en|82|9'),
(1882,'en',NULL,'<p>Sensu (扇子) - Traditional Japanese Folding Fan<br>Sensu is not just an accessory for creating a breeze, but an important element of Japanese culture, art and even etiquette. Feel cool and elegant with our Sensu folding fan - the embodiment of Japanese craftsmanship!</p>\r\n<p>The Sensu fan is not just a functional object, it is a work of art that combines beauty, lightness and convenience. Since ancient times, the fan has been an integral attribute of Japanese culture, symbolizing status, taste and sophistication. Our Sensu folding bamboo fan combines traditional form and modern materials, creating a unique accessory that will highlight your individual style.<br>Features of our Sensu folding bamboo fan:<br>Traditional design: The Sensu fan is a folding fan consisting of thin blades connected at the base. This design allows the fan to be easily folded and unfolded, making it compact and convenient to carry.<br>Natural Materials: The fan blades are made of durable and lightweight bamboo. This natural material is not only environmentally friendly, but also gives the fan a unique texture and warmth. The textile fabric stretched over the blades is made of a material that is pleasant to the touch.<br>Unique Design: The fan is decorated with a multi-colored floral pattern. Beautiful flowers emphasize femininity and elegance.<br>Compact Size: Thanks to its compact size (Length: 21 cm, Width: 3 cm when folded), the fan easily fits in a bag or pocket, always ready to give you coolness on a hot day.<br>Handmade: Our fans are created with love and attention to detail. Each product undergoes strict quality control so that you can enjoy impeccable workmanship and durability.<br>18 ribs: The number of bamboo ribs ensures the strength of the structure and smooth opening of the fan.</p>',NULL,NULL,NULL,NULL,NULL,NULL,82,10,'en|82|10');
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES
(35,35),
(36,35),
(37,35),
(38,35),
(52,30),
(53,30),
(55,30),
(56,30),
(57,30),
(58,30),
(59,30),
(60,37),
(61,37),
(62,37),
(63,37),
(64,37),
(65,37),
(66,37),
(67,37),
(69,38),
(70,38),
(71,38),
(72,38),
(73,38),
(74,38),
(75,38),
(76,39),
(77,39),
(78,39),
(79,39),
(80,39),
(81,39),
(82,39);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_channels`
--

DROP TABLE IF EXISTS `product_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_channels` (
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_channels`
--

LOCK TABLES `product_channels` WRITE;
/*!40000 ALTER TABLE `product_channels` DISABLE KEYS */;
INSERT INTO `product_channels` VALUES
(35,1),
(36,1),
(37,1),
(38,1),
(52,1),
(53,1),
(55,1),
(56,1),
(57,1),
(58,1),
(59,1),
(60,1),
(61,1),
(62,1),
(63,1),
(64,1),
(65,1),
(66,1),
(67,1),
(69,1),
(70,1),
(71,1),
(72,1),
(73,1),
(74,1),
(75,1),
(76,1),
(77,1),
(78,1),
(79,1),
(80,1),
(81,1),
(82,1);
/*!40000 ALTER TABLE `product_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customer_group_prices`
--

DROP TABLE IF EXISTS `product_customer_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT 0,
  `value_type` varchar(191) NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customer_group_prices`
--

LOCK TABLES `product_customer_group_prices` WRITE;
/*!40000 ALTER TABLE `product_customer_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customer_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_flat`
--

DROP TABLE IF EXISTS `product_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_flat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `product_number` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url_key` varchar(191) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `attribute_family_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_flat`
--

LOCK TABLES `product_flat` WRITE;
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
INSERT INTO `product_flat` VALUES
(69,'sku-123','simple','','Браслет из нефрита из дерева 5 мм, 108 бусин Lignum vitae','<p><strong>Браслет из жадеита из дерева Lignum vitae</strong></p>','<p><strong>О лигнум витае&nbsp;</strong></p>\r\n<p>Lignum vitae происходит от латинского и означает &laquo;дерево жизни&raquo; или &laquo;дерево жизни&raquo; из-за его широкого спектра медицинских применений. Эта древесина является одной из самых тяжелых и твердых, а ее прочность делает ее идеальной для множества применений. Она имеет свойство менять цвет на более глубокий зеленый.</p>\r\n<p><strong><span data-preserver-spaces=\"true\">О жадеите</span></strong><span data-preserver-spaces=\"true\">&nbsp;</span></p>\r\n<p><span data-preserver-spaces=\"true\">Жадеит особенно ценился среди китайцев, которые использовали этот драгоценный камень для различных целей. Во-первых, считается, что жадеит дает вам физическую силу, тем самым увеличивая долголетие. Во-вторых, говорят, что он помогает вам бороться с негативной энергией. Согласно фэн-шуй, жадеит также может влиять на процветание.&nbsp;</span></p>\r\n<p><span data-preserver-spaces=\"true\">В Японии у буддистов есть четки (дзюдзю, нэндзю). Киото &mdash; известный центр производства четок.</span></p>\r\n<p><strong><span data-preserver-spaces=\"true\">Обслуживание</span></strong></p>\r\n<p><span data-preserver-spaces=\"true\">Снимайте перед душем и сном. Материал чувствителен к химикатам и чрезмерному потоотделению. Рекомендуем снимать при занятиях спортом и уборке. Протирать мягкой тканью.</span></p>\r\n<p><span data-preserver-spaces=\"true\">※ Цвет может отличаться от реального в зависимости от цветопередачи монитора.</span></p>\r\n<p><span data-preserver-spaces=\"true\">※Импортные пошлины, налоги и сборы не включены в цену товара или стоимость доставки. Эти сборы являются ответственностью покупателя.<br>Пожалуйста, свяжитесь с таможенной службой вашей страны, чтобы определить, какими будут эти дополнительные расходы, до торгов/покупки.</span></p>','браслет-из-нефрита-из-дерева-5-мм-108-бусин-lignum-vitae',1,1,1,'','','',300.0000,NULL,NULL,NULL,100.0000,'2025-02-27 22:41:48','ru','default',4,35,'2025-02-28 13:00:02',NULL,1),
(70,'sku-123','simple','','Jade bracelet made of wood 5 mm, 108 Lignum vitae beads','<p><strong><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Jadeite bracelet made from Lignum vitae wood</span></span></strong></p>','<p><strong><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">About Lignum Vitae&nbsp;</span></span></strong></p>\r\n<p><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Lignum vitae comes from Latin and means \"tree of life\" or \"tree of life\" due to its wide range of medicinal uses. This wood is one of the heaviest and hardest, and its strength makes it ideal for many uses. It has the ability to change color to a deeper green.</span></span></p>\r\n<p><strong><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">About jadeite</span></span></span></strong><span data-preserver-spaces=\"true\">&nbsp;</span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Jadeite was especially prized by the Chinese, who used this gemstone for a variety of purposes. Firstly, jadeite is believed to give you physical strength, thereby increasing longevity. Secondly, it is said to help you fight negative energy. According to Feng Shui, jadeite can also influence prosperity.&nbsp;</span></span></span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">In Japan, Buddhists have rosaries (juju, nenju). Kyoto is a famous center for the production of rosaries.</span></span></span></p>\r\n<p><strong><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Service</span></span></span></strong></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Remove before showering and sleeping. The material is sensitive to chemicals and excessive sweating. We recommend removing it when exercising or cleaning. Wipe with a soft cloth.</span></span></span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">※ The color may differ from the actual one depending on the color rendering of the monitor.</span></span></span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">※Import duties, taxes and charges are not included in the item price or shipping charges. These charges are the buyer\'s responsibility. </span></span><br><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Please check with your country\'s customs office to determine what these additional costs will be prior to bidding/buying.</span></span></span></p>','jade-bracelet-made-of-wood-5-mm-108-lignum-vitae-beads',1,1,1,'','',NULL,300.0000,NULL,NULL,NULL,100.0000,'2025-02-27 22:41:48','en','default',4,35,'2025-02-28 13:00:02',NULL,1),
(71,'sku-124','simple','','Серебряный браслет \"Звёздный путь\"','<p>Стильный серебряный браслет с уникальным дизайном, вдохновлённым космосом.</p>','<p>Серебряный браслет \"Звёздный путь\" изготовлен из высококачественного серебра 925 пробы, что обеспечивает его прочность и долговечность. Этот браслет отличается оригинальным плетением, которое напоминает звёздное небо, создавая ощущение глубины и загадки.</p>\r\n<p>Каждая звено браслета аккуратно обработано, что придаёт ему дополнительный блеск и элегантность. Браслет украшен маленькими вставками из циркония, которые сверкают при любом освещении, добавляя нотку роскоши.</p>\r\n<p>Идеален как для повседневного ношения, так и для особых случаев, браслет \"Звёздный путь\" станет отличным дополнением к вашему образу и прекрасным подарком для близкого человека. Доступен в различных размерах для идеальной посадки на запястье.</p>','серебряныи-браслет-звездныи-путь',1,1,1,'','','',1500.0000,NULL,NULL,NULL,10.0000,'2025-02-27 22:50:22','ru','default',4,36,'2025-02-28 17:03:47',NULL,1),
(72,'sku-124','simple','','Silver Bracelet \"Star Trek\"','<p>Stylish silver bracelet with a unique design inspired by space.</p>','<p>The Star Trek Silver Bracelet is made of high-quality 925 sterling silver, which ensures its strength and durability. This bracelet features an original weave that resembles the starry sky, creating a sense of depth and mystery.</p>\r\n<p>Each link of the bracelet is carefully processed, which gives it additional shine and elegance. The bracelet is decorated with small zircon inserts that sparkle in any light, adding a touch of luxury.</p>\r\n<p>Perfect for both everyday wear and special occasions, the Star Trek bracelet will be a great addition to your look and a wonderful gift for a loved one. Available in various sizes for a perfect fit on the wrist.</p>','silver-bracelet-star-trek',1,1,1,'','',NULL,1500.0000,NULL,NULL,NULL,10.0000,'2025-02-27 22:50:22','en','default',4,36,'2025-02-28 17:03:47',NULL,1),
(73,'sku-125','simple','','Золотое кольцо \"Солнечный свет\"','<p>Изысканное золотое кольцо с элегантным дизайном, вдохновленным лучами солнца.</p>','<p>Золотое кольцо Sunshine выполнено из высококачественного золота 585 пробы, что придает ему невероятный блеск и долговечность. Это ювелирное изделие отличается уникальным дизайном с изогнутыми линиями, напоминающими солнечные лучи, символизирующие тепло и радость.</p>\r\n<p>Кольцо украшено центральным камнем - натуральным топазом, который ярко сверкает и придает кольцу индивидуальность. Каждая деталь кольца тщательно проработана, что подчеркивает его изысканность и элегантность.</p>\r\n<p>Подходящее для любого случая - от повседневного ношения до особых случаев, кольцо Sunshine станет прекрасным дополнением к вашему образу и идеальным подарком для близкого человека. Доступно в разных размерах для наилучшей посадки.</p>','золотое-кольцо-солнечныи-свет',1,1,1,'','','',10000.0000,NULL,NULL,NULL,10.0000,'2025-02-27 22:57:17','ru','default',4,37,'2025-02-28 13:54:15',NULL,1),
(74,'sku-125','simple','','Gold Ring \"Sunlight\"','<p>An exquisite gold ring with an elegant design inspired by the rays of the sun.</p>','<p>The Sunshine gold ring is made of high-quality 14K gold, which gives it incredible shine and durability. This piece of jewelry features a unique design with curved lines reminiscent of the sun\'s rays, symbolizing warmth and joy.</p>\r\n<p>The ring is decorated with a central stone - a natural topaz, which sparkles brightly and gives the ring its individuality. Each detail of the ring is carefully crafted, which emphasizes its sophistication and elegance.</p>\r\n<p>Suitable for any occasion - from everyday wear to special occasions, the Sunshine ring will be a wonderful addition to your look and an ideal gift for a loved one. Available in different sizes for the best fit.</p>','gold-ring-sunlight',1,1,1,'','',NULL,10000.0000,NULL,NULL,NULL,10.0000,'2025-02-27 22:57:17','en','default',4,37,'2025-02-28 13:54:15',NULL,1),
(75,'sju-125','simple','','Японское ожерелье \"Сакура\"','<p>Элегантное японское ожерелье, вдохновлённое красотой цветущей сакуры.</p>\r\n<h3>&nbsp;</h3>','<p>Японское ожерелье \"Сакура\" выполнено из высококачественных материалов, включая нежное серебро и натуральные жемчужины, которые создают утончённый и романтичный образ. Дизайн ожерелья пронизан традиционными японскими мотивами, отражая гармонию и красоту природы.</p>\r\n<p>Каждая деталь ожерелья тщательно проработана: изящные цветочные элементы напоминают о нежности цветущих сакур, а жемчужины добавляют изысканности. Ожерелье идеально подходит как для повседневного ношения, так и для особых случаев, подчеркивая индивидуальность и стиль.</p>\r\n<p>Это украшение станет великолепным подарком для ценителей японской культуры и эстетики. Доступно в различных длинах для идеальной посадки на шее.</p>','японское-ожерелье-сакура',1,0,1,'','','',400.0000,NULL,NULL,NULL,20.0000,'2025-02-27 23:05:18','ru','default',4,38,'2025-02-28 17:03:47',NULL,1),
(76,'sju-125','simple','','Japanese Sakura Necklace','<p>An elegant Japanese necklace inspired by the beauty of cherry blossoms.</p>','<p>The Japanese Sakura necklace is made of high-quality materials, including delicate silver and natural pearls, which create a sophisticated and romantic image. The design of the necklace is permeated with traditional Japanese motifs, reflecting the harmony and beauty of nature.</p>\r\n<p>Every detail of the necklace is carefully crafted: graceful floral elements remind of the delicacy of blooming sakura, and pearls add sophistication. The necklace is ideal for both everyday wear and special occasions, emphasizing individuality and style.</p>\r\n<p>This jewelry will be a great gift for connoisseurs of Japanese culture and aesthetics. Available in various lengths for a perfect fit on the neck.</p>','japanese-sakura-necklace',1,0,1,'','',NULL,400.0000,NULL,NULL,NULL,20.0000,'2025-02-27 23:05:18','en','default',4,38,'2025-02-28 17:03:47',NULL,1),
(103,'1002','simple','101','Кружка Японская \"Живопись Сакура\"','<p>Кружка Японская \"Живопись Сакура\"</p>','<ul>\r\n<li>Керамическая кружка с принтом Японская живопись Сакура в эксклюзивном дизайне, станет прекрасным подарком для вас или близкого человека. Она сохранит цвет и принт при многократном использовании, радуя своего владельца каждый день.</li>\r\n<li>Кружка из керамики будет долго сохранять температуру напитка, не позволяя ему остывать слишком быстро, сохраняя аромат вкус напитка.</li>\r\n<li>Смело можно использовать в микроволновой печи. Рисунок нанесен методом сублимации, что гарантирует яркие цвета и долговечность!</li>\r\n<li>Кружку можно использовать для подарка без повода и для декора интерьера кухни.</li>\r\n</ul>\r\n<ul>\r\n<li>Каждую кружку аккуратно упаковываем в индивидуальную коробку.</li>\r\n</ul>','кружка-японская-живопись-сакура',0,0,1,NULL,NULL,NULL,650.0000,NULL,NULL,NULL,330.0000,'2025-06-09 01:51:07','ru','default',6,52,'2025-06-09 23:30:35',NULL,1),
(104,'1002','simple','101','Japanese Mug \"Sakura Painting\"','<p>Japanese \"Sakura Painting\" Mug</p>','<ul>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">A ceramic mug featuring an exclusive Japanese Sakura painting design will make a wonderful gift for yourself or a loved one. It retains its color and print even after repeated use, bringing joy to its owner every day.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">The ceramic mug maintains the temperature of your drink for a long time, preventing it from cooling too quickly while preserving the aroma and taste.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Safe for use in the microwave. The design is applied using sublimation printing, ensuring vibrant colors and durability!</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">This mug is perfect as a spontaneous gift or as a decorative piece for your kitchen.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Each mug is carefully packaged in an individual box.</p>\r\n</li>\r\n</ul>','japanese-mug-sakura-painting',0,0,1,NULL,NULL,NULL,650.0000,NULL,NULL,NULL,330.0000,'2025-06-09 01:51:07','en','default',6,52,'2025-06-09 23:30:35',NULL,1),
(105,'1001','simple','110','Посуда для суши, роллы на 2 персоны 12 предметов','<p><strong>Суши сет: суши блюда, роллы на 2 персоны 12 штук, сакуры с иероглифами&nbsp;</strong></p>','<p class=\"ds-markdown-paragraph\"><strong>Набор для суши и роллов на 2 персоны | 12 предметов</strong><br><em>Изысканное погружение в восточную культуру</em></p>\r\n<hr>\r\n<h3><strong>Комплектация:</strong></h3>\r\n<p class=\"ds-markdown-paragraph\">✔&nbsp;<strong>2 прямоугольные керамические тарелки</strong>&nbsp;с узором сакуры и иероглифами<br>✔&nbsp;<strong>2 изящные тарелки для соуса</strong>&nbsp;в том же стиле<br>✔&nbsp;<strong>2 керамические чашки</strong>&nbsp;для чая или саке<br>✔&nbsp;<strong>2 пары бамбуковых палочек</strong>&nbsp;&mdash; гладкие и удобные<br>✔&nbsp;<strong>2 керамических держателя</strong>&nbsp;для палочек<br>✔&nbsp;<strong>2 бамбуковых коврика</strong>&nbsp;для эстетичной сервировки</p>\r\n<hr>\r\n<h3><strong>Особенности:</strong></h3>\r\n<p class=\"ds-markdown-paragraph\">&bull;&nbsp;<strong>Роскошный дизайн</strong>&nbsp;&mdash; мотивы сакуры и каллиграфии<br>&bull;&nbsp;<strong>Практичность</strong>&nbsp;&mdash; устойчивые керамические предметы<br>&bull;&nbsp;<strong>Гигиеничность</strong>&nbsp;&mdash; бамбуковые аксессуары с защитой стола<br>&bull;&nbsp;<strong>Компактное хранение</strong>&nbsp;&mdash; коробка с пластиковой крышкой и продуманными отделениями</p>\r\n<hr>\r\n<p class=\"ds-markdown-paragraph\"><strong>Идеальный выбор:</strong><br>&bull; Для романтического ужина<br>&bull; В подарок ценителям восточной кухни<br>&bull; Для создания атмосферы ресторана дома</p>\r\n<p class=\"ds-markdown-paragraph\"><em>Все предметы аккуратно уложены в подарочную упаковку.</em></p>','посуда-для-суши-роллы-на-2-персоны-12-предметов',0,0,1,NULL,NULL,NULL,1850.0000,1700.0000,NULL,NULL,2300.0000,'2025-06-09 02:29:00','ru','default',6,53,'2025-06-09 23:48:53',NULL,1),
(106,'1001','simple','110','Sushi Dinnerware Set for Two – 12 Pieces','<p><strong>Sushi Set for Two &ndash; 12-Piece Sakura &amp; Calligraphy Design</strong></p>','<p class=\"ds-markdown-paragraph\">This elegant set, designed for enjoying authentic Eastern cuisine at home, includes&nbsp;<strong>12 pieces</strong>&nbsp;crafted from sakura-patterned and calligraphic ceramic, showcasing the refined beauty of Asian culture.</p>\r\n<h3><strong>Set Includes:</strong></h3>\r\n<p class=\"ds-markdown-paragraph\">✔&nbsp;<strong>2 rectangular ceramic plates</strong>&nbsp;&ndash; for serving sushi and rolls.<br>✔&nbsp;<strong>2 sauce dishes</strong>&nbsp;&ndash; perfect for soy sauce, wasabi, or ginger.<br>✔&nbsp;<strong>2 ceramic cups</strong>&nbsp;&ndash; ideal for tea or sake.<br>✔&nbsp;<strong>2 pairs of smooth bamboo chopsticks</strong>&nbsp;&ndash; lightweight and comfortable for dining.<br>✔&nbsp;<strong>2 ceramic chopstick rests</strong>&nbsp;&ndash; keeps utensils hygienic and secure.<br>✔&nbsp;<strong>2 bamboo placemats</strong>&nbsp;&ndash; protects your table and enhances presentation.</p>\r\n<h3><strong>Features:</strong></h3>\r\n<ul>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>Stylish &amp; practical</strong>&nbsp;&ndash; Combines traditional aesthetics with everyday functionality.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>Secure packaging</strong>&nbsp;&ndash; Housed in a sturdy cardboard box with a plastic lid for easy storage and transport.</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>Compact organization</strong>&nbsp;&ndash; Each piece has a designated spot inside the box.</p>\r\n</li>\r\n</ul>\r\n<p class=\"ds-markdown-paragraph\">Perfect for intimate dinners, gifts, or elevating your home dining experience!</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Sushi Set for Two (12-Piece)</strong><br>Ceramic plates, sauce dishes, cups + bamboo chopsticks, rests &amp; mats. Sakura/calligraphy design. Packed in a storage-friendly box. Ideal for home dining or gifting.</p>','sushi-dinnerware-set-for-two-12-pieces',0,0,1,NULL,NULL,NULL,1850.0000,1700.0000,NULL,NULL,2300.0000,'2025-06-09 02:29:00','en','default',6,53,'2025-06-09 23:48:53',NULL,1),
(109,'1003','simple','28','Набор для суши \"Цветущая вишня\" с иероглифом на красном фоне 2 персоны','<p><strong>Набор для суши \"Цветущая вишня\" с иероглифом на красном фоне 2 персоны 28x28, 3x3, 5см</strong></p>','<div>Набор рассчитан на двух человек, в комплект входят две прямоугольные керамические пластины. Легкие и гладкие бамбуковые палочки, два комплекта, которые не размокают и не деформируются при правильном хранении. Два керамических держателя для палочек. Два керамических соусника.</div>\r\n<div>Набор упакован в картонную коробку с пластиковой крышкой. Каждый предмет в наборе имеет свою отдельную ячейку для удобного хранения.</div>\r\n<div>Состав набора:</div>\r\n<div>- Тарелка (20*13 см) -2 шт.</div>\r\n<div>- Посуда для соуса (9*6,5 см) - 2 шт.</div>\r\n<div>- Набор бамбуковых палочек для суши. - 2 комплекта.</div>\r\n<div>- Подставка для палок (5,5*1 см) - 2 шт.</div>\r\n<div>- Коробка из подарочного картона (28*29*4см)</div>','набор-для-суши-цветущая-вишня-с-иероглифом-на-красном-фоне-2-персоны',1,0,1,NULL,NULL,NULL,1500.0000,NULL,NULL,NULL,1800.0000,'2025-06-09 03:38:36','ru','default',6,55,'2025-06-10 00:35:02',NULL,1),
(110,'1003','simple','28','Sushi set \"Blossoming cherry\" with hieroglyph on red background for 2 persons','<p><strong>Sushi Set \"Blossoming Cherry\" with hieroglyph on red background, 2 persons, 28x28, 3x3, 5cm</strong></p>','<p class=\"ds-markdown-paragraph\"><strong>Sushi Set for Two Persons</strong></p>\r\n<p class=\"ds-markdown-paragraph\">The set includes:</p>\r\n<ul>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>2 rectangular ceramic plates</strong>&nbsp;(20x13 cm)</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>2 ceramic sauce dishes</strong>&nbsp;(9x6.5 cm)</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>2 pairs of bamboo chopsticks</strong>&nbsp;(lightweight, smooth, resistant to moisture and deformation when stored properly)</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\"><strong>2 ceramic chopstick rests</strong>&nbsp;(5.5x1 cm)</p>\r\n</li>\r\n</ul>\r\n<p class=\"ds-markdown-paragraph\"><strong>Packaging:</strong></p>\r\n<ul>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Sturdy cardboard box with plastic lid</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Each item has a dedicated compartment for organized storage</p>\r\n</li>\r\n<li>\r\n<p class=\"ds-markdown-paragraph\">Gift box dimensions: 28x29x4 cm</p>\r\n</li>\r\n</ul>','sushi-set-blossoming-cherry-with-hieroglyph-on-red-background-for-2-persons',1,0,1,NULL,NULL,NULL,1500.0000,NULL,NULL,NULL,1800.0000,'2025-06-09 03:38:36','en','default',6,55,'2025-06-10 00:35:02',NULL,1),
(111,'1004','simple','97','Керамический чайник Кюсю','<p><strong>Керамический чайник Кюсю 300 мл</strong></p>','<p>Традиционный японский чайник Кюсю для заваривания чая. Его уникальная конструкция с боковой ручкой позволяет легко наливать чай одной рукой. Идеально подходит для любителей чая, ценящих аутентичность и функциональность</p>','керамическии-чаиник-кюсю',1,0,1,NULL,NULL,NULL,3420.0000,NULL,NULL,NULL,450.0000,'2025-06-09 16:30:45','ru','default',6,56,'2025-06-10 01:22:43',NULL,1),
(112,'1004','simple','97','Kyushu ceramic teapot','<p>Ceramic teapot Kyushu 300 ml</p>','<p class=\"ds-markdown-paragraph\"><strong>Traditional Japanese Kyushu Teapot for Brewing Tea</strong></p>\r\n<p class=\"ds-markdown-paragraph\">Featuring a unique side-handle design that allows for easy one-handed pouring. Perfect for tea enthusiasts who value authenticity and functionality.</p>','kyushu-ceramic-teapot',1,0,1,NULL,NULL,NULL,3420.0000,NULL,NULL,NULL,450.0000,'2025-06-09 16:30:45','en','default',6,56,'2025-06-10 01:22:43',NULL,1),
(113,'1005','simple','17','Набор для саке “Гейша”','<p><strong>Элегантный набор для саке с изображением гейши. Идеален для сервировки традиционного японского напитка.</strong></p>','<p>&nbsp;Погрузитесь в японскую культуру с этим изысканным набором для саке. Набор состоит из графина (токкури) и двух чашек (очоко), украшенных нежным изображением гейши в традиционном кимоно. Идеально подходит для наслаждения саке в компании или в одиночестве. Прекрасный подарок для любителей японской культуры и ценителей хорошего саке.</p>','набор-для-саке-геиша',1,0,1,NULL,NULL,NULL,920.0000,NULL,NULL,NULL,400.0000,'2025-06-09 21:59:04','ru','default',6,57,'2025-06-10 01:22:07',NULL,1),
(114,'1005','simple','17','Sake Set \"Geisha\"','<p><strong>Elegant sake set with geisha design. Perfect for serving traditional Japanese drink.</strong></p>','<p>Immerse yourself in Japanese culture with this exquisite sake set. The set includes a decanter (tokkuri) and two cups (ochoko), adorned with delicate depictions of a geisha in traditional kimono. Perfect for enjoying sake with company or alone. A wonderful gift for lovers of Japanese culture and connoisseurs of fine sake.</p>','sake-set-geisha',1,0,1,NULL,NULL,NULL,920.0000,NULL,NULL,NULL,400.0000,'2025-06-09 21:59:04','en','default',6,57,'2025-06-10 01:22:07',NULL,1),
(115,'1006','simple','77','Чайник заварочный','<p><strong>Стильный заварочный чайник с прозрачным корпусом, деревянными элементами и встроенным фильтром для идеального чаепития.</strong></p>','<p>Этот элегантный чайник представляет собой современную интерпретацию классического Кюсю. Прозрачный стеклянный корпус позволяет наблюдать за волшебным процессом заваривания чая, а удобная боковая ручка из дерева обеспечивает комфортный захват. Встроенное ситечко облегчает приготовление напитка, удерживая чайные листья, а деревянная крышка сохраняет тепло и аромат. Чайник станет прекрасным дополнением к вашей чайной церемонии, сочетая в себе функциональность, эстетику и высокое качество материалов. Его минималистичный дизайн легко впишется в любой интерьер, а удобный объем позволит наслаждаться любимым чаем в одиночку или в компании друзей.</p>','чаиник-заварочныи',1,0,1,NULL,NULL,NULL,1460.0000,1400.0000,NULL,NULL,373.0000,'2025-06-09 22:24:17','ru','default',6,58,'2025-06-10 01:21:32',NULL,1),
(116,'1006','simple','77','Teapot','<p><strong>Stylish teapot with transparent body, wooden accents, and built-in filter for perfect tea brewing.</strong></p>','<p>This elegant teapot offers a modern interpretation of the classic Kyushu style. Its transparent glass body allows you to witness the magical tea brewing process, while the comfortable wooden side handle provides a secure grip. The built-in filter simplifies preparation by containing tea leaves, and the wooden lid retains heat and aroma. The teapot will beautifully complement your tea ceremony, combining functionality, aesthetics, and high-quality materials. Its minimalist design effortlessly blends with any interior, and the convenient volume lets you enjoy your favorite tea alone or with friends.</p>','teapot',1,0,1,NULL,NULL,NULL,1460.0000,1400.0000,NULL,NULL,373.0000,'2025-06-09 22:24:17','en','default',6,58,'2025-06-10 01:21:32',NULL,1),
(117,'1007','simple','78','Японский чайник Тэцубин','<p><strong>Тэцубин &mdash; это Японский чугунный чайник с верхней ручкой для кипячения воды (буквально переводится как &laquo;железный горшок&raquo;). В Японии чугунный чайник Тэцубин используется в качестве чайника для нагрева воды над горящим углем</strong></p>','<p>Традиционный чугунный чайник Тэцубин.<br>Украшен классическими рельефными узорами снаружи.<br>Относительно небольшой Тэцубин (520 мл), подходящий для традиционного заваривания Сенча или любого другого листового чая для одного или нескольких человек.<br>Чугунная конструкция быстро нагревает воду и сохраняет чайник горячим дольше, чем фарфоровые или глиняные аналоги.</p>','японскии-чаиник-тэцубин',1,0,1,NULL,NULL,NULL,2900.0000,NULL,NULL,NULL,1223.0000,'2025-06-09 22:52:11','ru','default',6,59,'2025-06-10 01:26:57',NULL,1),
(118,'1007','simple','78','Japanese Tetsubin Teapot','<p><strong>Tetsubin is a Japanese cast iron teapot with a top handle for boiling water (literally translated as \"iron pot\"). In Japan, the cast iron teapot Tetsubin is used as a kettle for heating water over burning charcoal.</strong></p>','<p>Traditional cast iron Tetsubin teapot.<br>Adorned with classic embossed patterns on the exterior.<br>A relatively small Tetsubin (520 ml), suitable for traditional brewing of Sencha or any other loose-leaf tea for one or several people.<br>The cast iron construction heats water quickly and keeps the teapot hot longer than porcelain or clay counterparts.</p>','japanese-tetsubin-teapot',1,0,1,NULL,NULL,NULL,2900.0000,NULL,NULL,NULL,1223.0000,'2025-06-09 22:52:12','en','default',6,59,'2025-06-10 01:26:57',NULL,1),
(119,'1200','simple','1200','Набор самурайских сувенирных мечей','<h3><strong>Набор \"Дайсё\" (катана + вакидзаси)</strong></h3>','<p class=\"ds-markdown-paragraph\">Дайсё &mdash; это общее название для двух основных мечей самурая в феодальной Японии: длинного&nbsp;<strong>катаны</strong>&nbsp;и короткого&nbsp;<strong>вакидзаси</strong>. Вместе они составляли традиционный парный набор, символизирующий статус и боевую подготовку воина.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Катана</strong>&nbsp;использовалась для боя в открытом пространстве, а&nbsp;<strong>вакидзаси</strong> &mdash; для ближнего боя или ритуалов (например, сэппуку). Дайсё (букв. &laquo;большой-малый&raquo;) отражал не только практическое разделение оружия, но и социальный кодекс самурая. Носить эти мечи могли только представители воинского сословия, что подчёркивало их привилегированное положение.</p>\r\n<p class=\"ds-markdown-paragraph\">Воссоздайте дух самурайской эпохи с набором &ldquo;Дайсё&rdquo;, включающим катану и вакидзаси. Оба меча выполнены в едином стиле, что подчеркивает их принадлежность к одной школе и традиции. Клинки изготовлены из прочной стали, обеспечивающей остроту и долговечность. Рукоятки (цука) искусно обмотаны черным текстилем, обеспечивающим надежный хват. Ножны (сая) покрыты черным лаком с глянцевым блеском, а гарды (цуба) украшены изящным орнаментом. Этот набор станет достойным украшением любой коллекции и прекрасным подарком для поклонников японской культуры.</p>','набор-самураиских-сувенирных-мечеи',0,0,1,NULL,NULL,NULL,33500.0000,NULL,NULL,NULL,2.3300,'2025-06-18 02:00:52','ru','default',9,60,'2025-06-18 04:08:06',NULL,1),
(120,'1200','simple','1200','Samurai Souvenir Sword Set','<h3><strong>Daishō Set (Katana + Wakizashi)</strong></h3>','<p class=\"ds-markdown-paragraph\"><strong>\"Daishō\"</strong>&nbsp;is the collective name for the two primary swords of a samurai in feudal Japan: the long&nbsp;<strong>katana</strong>&nbsp;and the short&nbsp;<strong>wakizashi</strong>. Together, they formed a traditional paired set symbolizing the warrior\'s status and combat prowess.</p>\r\n<p class=\"ds-markdown-paragraph\">The&nbsp;<strong>katana</strong>&nbsp;was used for open combat, while the&nbsp;<strong>wakizashi</strong>&nbsp;served for close-quarters fighting or rituals (such as seppuku). Daishō (literally \"big-small\") reflected not just the functional division of weapons, but also the samurai\'s social code. Only members of the warrior class were permitted to wear these swords, emphasizing their privileged status.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Recreate the spirit of the samurai era</strong>&nbsp;with this&nbsp;<strong>Daishō set</strong>, featuring both katana and wakizashi. Crafted in matching style, these blades honor a single school of tradition. The swords are forged from durable steel for sharpness and longevity, with handles (<strong>tsuka</strong>) wrapped in black textile for a secure grip. The scabbards (<strong>saya</strong>) feature glossy black lacquer, while the guards (<strong>tsuba</strong>) display intricate ornamentation. This set makes a&nbsp;<strong>stunning centerpiece for any collection</strong>&nbsp;and an&nbsp;<strong>exceptional gift</strong> for enthusiasts of Japanese culture.</p>','samurai-souvenir-sword-set',0,0,1,NULL,NULL,NULL,33500.0000,NULL,NULL,NULL,2.3300,'2025-06-18 02:00:52','en','default',9,60,'2025-06-18 04:08:06',NULL,1),
(121,'1201','simple','1201','Меч самурайский сине-золотой с золотистой гардой','<p><strong>Этот сине-золотой клинок &mdash; не просто украшение, а воплощение самурайского духа, где каждая деталь говорит о совершенстве форм и благородстве традиций</strong></p>','<p class=\"ds-markdown-paragraph\">Катана &mdash; это больше чем просто меч. Это квинтэссенция японского воинского духа, воплощение вековых традиций и безупречного мастерства кузнецов. С XII века этот изогнутый однолезвийный клинок был неразрывно связан с кодексом самурая, становясь буквально продолжением его руки и воли.</p>\r\n<p class=\"ds-markdown-paragraph\">Искусство создания катаны сравнимо с таинством &mdash; многослойная ковка стали, закалка с особым температурным режимом, кропотливая полировка, превращающая клинок в произведение искусства. Характерный изгиб и тщательно выверенный баланс позволяли наносить молниеносные режущие удары, а особое положение лезвием вверх давало самураю преимущество в скоротечных схватках.</p>\r\n<p class=\"ds-markdown-paragraph\">Но катана никогда не была просто оружием. В мирное время она служила символом статуса, а в ритуальных практиках &mdash; инструментом сохранения чести. Даже сегодня, когда эпоха самураев осталась в прошлом, катана продолжает жить &mdash; в традиционных боевых искусствах, в кинематографе, в коллекциях ценителей. Ваша сине-золотая катана, пусть и декоративная, хранит в себе отголоски этой великой традиции, напоминая о времени, когда меч был не просто сталью, а воплощением духа воина.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Катана \"Самурайский сине-золотой с золотой гардой\"</strong>&nbsp;&ndash; это стилизованное оружие в традиционном японском духе, созданное для коллекционеров и ценителей восточной эстетики. Меч выполнен из нержавеющей стали с декоративной имитацией заточки, что делает его безопасным украшением интерьера.</p>\r\n<p class=\"ds-markdown-paragraph\">Клинок длиной&nbsp;<strong>70 см</strong>&nbsp;дополнен изящной&nbsp;<strong>золотой цубой</strong>&nbsp;с узорами, а&nbsp;<strong>синие акценты</strong>&nbsp;на рукояти и ножнах придают мечу благородный вид. Рукоять длиной&nbsp;<strong>24 см</strong>&nbsp;обтянута текстилем для удобного хвата, а лакированные ножны (<strong>75 см</strong>) завершают образ.</p>','меч-самураискии-сине-золотои-с-золотистои-гардои',0,0,1,NULL,NULL,NULL,29100.0000,NULL,NULL,NULL,1185.0000,'2025-06-18 02:51:54','ru','default',9,61,'2025-06-18 04:12:25',NULL,1),
(122,'1201','simple','1201','Samurai Sword - Blue & Gold with Gilded Guard','<p><strong>This blue and gold blade is not merely an ornament, but an embodiment of the samurai spirit, where every detail speaks of the perfection of form and the nobility of tradition.</strong></p>','<p class=\"ds-markdown-paragraph\">The katana is far more than just a sword. It is the quintessence of the Japanese warrior spirit, the embodiment of centuries-old traditions and the flawless craftsmanship of blacksmiths. Since the 12th century, this curved, single-edged blade has been inextricably linked to the samurai code, becoming an extension of the warrior&rsquo;s hand and will.</p>\r\n<p class=\"ds-markdown-paragraph\">The art of crafting a katana is akin to a sacred ritual&mdash;multi-layered steel forging, tempering with precise temperature control, and meticulous polishing that transforms the blade into a work of art. Its distinctive curve and meticulously calculated balance allowed for lightning-fast slashing strikes, while the unique edge-up positioning gave the samurai an advantage in swift duels.</p>\r\n<p class=\"ds-markdown-paragraph\">Yet the katana was never merely a weapon. In times of peace, it served as a status symbol, and in ritual practices, as a tool for preserving honor. Even today, long after the age of the samurai has passed, the katana endures&mdash;in traditional martial arts, in cinema, and in the collections of connoisseurs. Your blue-and-gold katana, though decorative, carries echoes of this grand tradition, a reminder of an era when a sword was not just steel, but the embodiment of a warrior&rsquo;s soul.</p>\r\n<p class=\"ds-markdown-paragraph\">The&nbsp;<em>Samurai Blue &amp; Gold Katana with Gold Guard</em>&nbsp;is a stylized weapon in the traditional Japanese spirit, crafted for collectors and admirers of Eastern aesthetics. The sword is made of stainless steel with a decorative faux edge, making it a safe interior ornament.</p>\r\n<p class=\"ds-markdown-paragraph\">The 70 cm (27.5 in) blade is paired with an elegant gold&nbsp;<em>tsuba</em>&nbsp;(guard) adorned with intricate patterns, while blue accents on the handle and scabbard lend the sword a noble appearance. The 24 cm (9.4 in) handle is wrapped in fabric for a secure grip, and the lacquered 75 cm (29.5 in) scabbard completes the ensemble.\"</p>','samurai-sword-blue-gold-with-gilded-guard',0,0,1,NULL,NULL,NULL,29100.0000,NULL,NULL,NULL,1185.0000,'2025-06-18 02:51:54','en','default',9,61,'2025-06-18 04:12:25',NULL,1),
(123,'1202','simple','1202','Вакидзаси самурайский меч','<p>Изысканный вакидзаси с клинком 34 см &mdash; уменьшенное, но не менее значимое воплощение самурайского духа. Деревянные ножны, сталь с благородным блеском и сертификат подлинности делают его достойным элементом любой коллекции.</p>','<p class=\"ds-markdown-paragraph\">Вакидзаси &mdash; это самурайский короткий меч, верный спутник катаны, вместе с которым они составляли священную пару дайсё. В отличие от своего более длинного собрата, вакидзаси был оружием повседневности: его носили даже в помещении, использовали в ближнем бою, а иногда &mdash; для совершения ритуального сэппуку. Его клинок (обычно 30&ndash;60 см) сочетал смертоносную остроту с изяществом: те же изгибы и ковка, что у катаны, но более компактный размер позволял мгновенно атаковать в тесных пространствах. Вакидзаси считался &laquo;мечом чести&raquo; &mdash; последним аргументом самурая, когда катана была недоступна. Сегодня, как и катана, он стал символом эпохи, воплощённым в коллекционных репликах, где каждая деталь &mdash; от текстильной оплётки рукояти до лакированных ножен &mdash; хранит дух бусидо. Ваш экземпляр с имитацией заточки &mdash; прекрасная дань этой традици. Данная модель сочетает в себе элегантность и практичность. Клинок изготовлен из прочной нержавеющей стали 440, что обеспечивает его долговечность и стойкость к коррозии. Рукоятка (Цука) искусно оплетена черным текстилем, обеспечивая надежный хват, а ножны (Сая) покрыты глянцевым лаком глубокого бордового оттенка. Металлические элементы оправы (Цуба, Фучи, Кашира) добавляют изысканности и завершают образ. Этот вакидзаси станет прекрасным дополнением коллекции или запоминающимся подарком.</p>','вакидзаси-самураискии-меч',0,0,1,NULL,NULL,NULL,19000.0000,NULL,NULL,NULL,1085.0000,'2025-06-18 03:06:57','ru','default',9,62,'2025-06-18 04:21:35',NULL,1),
(124,'1202','simple','1202','Wakizashi – the samurai sword','<p><strong>An exquisite wakizashi with a 34 cm blade&mdash;a compact yet equally profound embodiment of the samurai spirit. Featuring wooden scabbards, steel with a noble luster, and a certificate of authenticity, this piece stands as a worthy addition to any collection.</strong></p>','<p class=\"ds-markdown-paragraph\">Wakizashi is the samurai short sword, the faithful companion of the katana, together they formed the sacred daisho pair. Unlike its longer counterpart, the wakizashi was an everyday weapon: it was worn even indoors, used in close combat, and sometimes for performing the ritual seppuku.</p>\r\n<p class=\"ds-markdown-paragraph\">Its blade (usually 30-60 cm) combined deadly sharpness with elegance: the same curves and forging as the katana, but the more compact size allowed for instant attacks in tight spaces. The wakizashi was considered the \"sword of honor\" - the samurai\'s last argument when the katana was unavailable.</p>\r\n<p class=\"ds-markdown-paragraph\">Today, like the katana, it has become a symbol of the era, embodied in collectible replicas where every detail - from the textile-wrapped hilt to the lacquered scabbard - preserves the spirit of bushido. Your specimen with imitation sharpening is a beautiful tribute to this tradition.</p>\r\n<p class=\"ds-markdown-paragraph\">This model combines elegance and practicality. The blade is made of durable 440 stainless steel, ensuring its durability and corrosion resistance. The handle (Tsuka) is skillfully wrapped in black textile, providing a secure grip, while the scabbard (Saya) is coated with a glossy deep burgundy lacquer. The metal fittings (Tsuba, Fuchi, Kashira) add sophistication and complete the look. This wakizashi will be a wonderful addition to any collection or a memorable gift.</p>','wakizashi-the-samurai-sword',0,0,1,NULL,NULL,NULL,19000.0000,NULL,NULL,NULL,1085.0000,'2025-06-18 03:06:57','en','default',9,62,'2025-06-18 04:21:35',NULL,1),
(125,'1203','simple','1203','Тренировочный меч, боккен Mr. Fox','<p><strong>Боккен Mr. Fox &mdash; не просто деревянная копия меча, а инструмент, в котором живёт дух самурайских традиций.</strong></p>','<p><strong>Боккен</strong> &mdash; это деревянный макет японского меча, созданный для тренировок и поединков. В отличие от настоящей катаны, он не имеет острого лезвия, но точно повторяет её форму, вес и баланс, что делает его незаменимым инструментом в таких боевых искусствах, как кэндо, айкидо и иайдо.</p>\r\n<p class=\"ds-markdown-paragraph\">Идеально сбалансированный деревянный меч для отработки техник кендо и иайдо. Изготовлен из плотной древесины (дуб или бук), точно передает вес и баланс настоящей катаны при длине 105 см. Рукоять с традиционной черной ромбовидной оплеткой обеспечивает надежный хват во время тренировок. Профессиональный инструмент для серьезных занятий японскими боевыми искусствами. Подойдет как начинающим, так и опытным практикам.</p>','тренировочныи-меч-боккен-mr-fox',0,0,1,NULL,NULL,NULL,11479.0000,NULL,NULL,NULL,629.0000,'2025-06-18 03:14:21','ru','default',9,63,'2025-06-18 04:25:31',NULL,1),
(126,'1203','simple','1203','Training sword, bokken Mr. Fox','<p><strong>Bokken Mr. Fox is not just a wooden copy of a sword, but a tool that embodies the spirit of samurai traditions.</strong></p>','<p><strong>Bokken is a wooden replica of a Japanese sword designed for training and sparring. Unlike a real katana, it doesn\'t have a sharp blade, but it precisely replicates its shape, weight, and balance, making it an indispensable tool in martial arts such as kendo, aikido, and iaido.</strong></p>\r\n<p><strong>A perfectly balanced wooden sword for practicing kendo and iaido techniques. Made of dense wood (oak or beech), it accurately replicates the weight and balance of a real katana with a length of 105 cm. The handle features traditional black diamond-pattern wrapping for a secure grip during training. A professional tool for serious practice of Japanese martial arts. Suitable for both beginners and experienced practitioners.</strong></p>','training-sword-bokken-mr-fox',0,0,1,NULL,NULL,NULL,11479.0000,NULL,NULL,NULL,629.0000,'2025-06-18 03:14:21','en','default',9,63,'2025-06-18 04:25:31',NULL,1),
(127,'1204','simple','1204','Боккен 102 см с резиновой ручкой','<p><strong>Боккен 102 с резиновой рукоятью</strong> &mdash; идеальный партнёр для тренировок, сочетающий традиционную форму деревянного меча с современным удобством.</p>','<p class=\"ds-markdown-paragraph\"><strong>Боккен</strong> &mdash; это деревянный макет японского меча, созданный для тренировок и поединков. В отличие от настоящей катаны, он не имеет острого лезвия, но точно повторяет её форму, вес и баланс, что делает его незаменимым инструментом в таких боевых искусствах, как кэндо, айкидо и иайдо.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Боккен 102 с резиновой ручкой</strong> &ndash; практичный тренировочный меч из твердой древесины (дуб/бук) длиной 102 см. Резиновая рукоять (26 см) обеспечивает надежный хват, а оптимальный вес (550 г) делает его удобным для отработки техник кендо и иайдо.</p>\r\n<p class=\"ds-markdown-paragraph\">&nbsp;</p>','боккен-102-см-с-резиновои-ручкои',0,0,1,NULL,NULL,NULL,12000.0000,NULL,NULL,NULL,550.0000,'2025-06-18 03:24:02','ru','default',9,64,'2025-06-18 04:27:39',NULL,1),
(128,'1204','simple','1204','Bokken 102 cm with rubber handle','<p class=\"ds-markdown-paragraph\"><strong>Bokken 102 with rubber handle - the perfect training partner, combining the traditional shape of a wooden sword with modern convenience.</strong></p>','<p class=\"ds-markdown-paragraph\">Bokken - a wooden replica of a Japanese sword designed for training and sparring. Unlike a real katana, it doesn\'t have a sharp blade but precisely replicates its shape, weight and balance, making it an essential tool for martial arts like kendo, aikido and iaido.</p>\r\n<p class=\"ds-markdown-paragraph\">Bokken 102 with rubber handle - a practical training sword made of hardwood (oak/beech) with 102 cm length. The rubber handle (26 cm) provides a secure grip, while the optimal weight (550 g) makes it comfortable for practicing kendo and iaido techniques.</p>','bokken-102-cm-with-rubber-handle',0,0,1,NULL,NULL,NULL,12000.0000,NULL,NULL,NULL,550.0000,'2025-06-18 03:24:02','en','default',9,64,'2025-06-18 04:27:39',NULL,1),
(129,'1205','simple','1205','Японский танто самурай катана','<p><strong>Миниатюрный шедевр самурайского оружейного искусства &ndash; танто с благородным стальным клинком передает многовековые традиции Японии в каждой детали.</strong></p>','<p><strong>Танто</strong> &mdash; это традиционный японский короткий меч или кинжал, который использовался самураями как вспомогательное оружие. Его название буквально означает &laquo;короткий меч&raquo; (яп. 短刀) и отражает его ключевую особенность &mdash; компактный размер.</p>\r\n<p>Этот танто - это воплощение минимализма и элегантности. Клинок из дамасской стали с хамоном, обладает&nbsp; красивым узором. Рукоять и ножны изготовлены из натурального дерева, подчеркивающего красоту клинка. Прекрасный образец японского оружейного искусства.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>','японскии-танто-самураи-катана',0,0,1,NULL,NULL,NULL,21899.0000,NULL,NULL,NULL,0.5000,'2025-06-18 03:33:25','ru','default',9,65,'2025-06-18 04:32:17',NULL,1),
(130,'1205','simple','1205','Japanese tanto samurai katana','<p><strong>Miniature masterpiece of samurai weaponry art &ndash; the tanto with a noble steel blade carries centuries-old Japanese traditions in every detail.</strong></p>','<p class=\"ds-markdown-paragraph\">Tanto is a traditional Japanese short sword or dagger that was used by samurai as a secondary weapon. Its name literally means \"short sword\" (Japanese: 短刀) and reflects its key feature - compact size.</p>\r\n<p class=\"ds-markdown-paragraph\">This tanto embodies minimalism and elegance. The blade is made of Damascus steel with a hamon, featuring a beautiful pattern. The handle and sheath are crafted from natural wood, highlighting the beauty of the blade. A fine example of Japanese weapon artistry.</p>','japanese-tanto-samurai-katana',0,0,1,NULL,NULL,NULL,21899.0000,NULL,NULL,NULL,0.5000,'2025-06-18 03:33:25','en','default',9,65,'2025-06-18 04:32:17',NULL,1),
(131,'1206','simple','1206','Меч ниндзя японский','<p><strong>Катана с клинком из благородной стали &mdash; воплощение самурайского духа. Изысканные линии меча и традиционные материалы создают атмосферу древней Японии, делая его прекрасным коллекционным экземпляром.</strong></p>','<p><strong>Ниндзято</strong>&nbsp;&mdash; это традиционный японский меч, ассоциирующийся с ниндзя (синоби), хотя его историческое существование остаётся предметом споров. В отличие от самурайской катаны, ниндзято чаще изображается с&nbsp;<strong>прямым клинком</strong>&nbsp;и&nbsp;<strong>квадратной гардой (цубой)</strong>, что делает его удобным для скрытных операций и боя в тесных пространствах.</p>\r\n<p><strong>Меч ниндзя &nbsp;Катана ниндзя-то </strong>- многофункциональный прямой меч японских шпионов-диверсантов синоби (ниндзя - американизм введенный в обиход в Голливуде). &nbsp;Клинок прямой однолезвийный со скошенным к лезвию острием, длиной 500-600 мм. Навершие (кассира) &nbsp;- головка рукояти съёмная &nbsp;с отравленной иглой. Рукоять (цука) часто полая для хранения сыпучих веществ (пороха, кварцевого песка). Гарда (цуба) квадратная, очень часто имеющая в верхней части паз для кинжала. Ножны (сайя) часто имели также паз для ножа. Очень часто лезвие черного цвета чтобы не блестело ночью. Прямота меча объясняется удобством ношения на спине и тем, что древние японские мечи (кэн) были прямые.В действительности достоверных источников не существует и исторически не подтверждено, в основном это выдумки голливудских режиссеров, реально отличие от самурайских катан - мелкие детали. Самураи японское военное сословие которое бьется в честном бою, а синоби не брезгают предательством и используют ночь для убийств.</p>\r\n<p>&nbsp;</p>','меч-ниндзя-японскии',0,0,1,NULL,NULL,NULL,28070.0000,NULL,NULL,NULL,0.8000,'2025-06-18 03:43:27','ru','default',9,66,'2025-06-18 04:35:52',NULL,1),
(132,'1206','simple','1206','Ninja sword Japanese','<p><strong>Katana with a blade of noble steel - the embodiment of the samurai spirit. The exquisite lines of the sword and traditional materials create an atmosphere of ancient Japan, making it a beautiful collector\'s item.</strong></p>','<p class=\"ds-markdown-paragraph\">Ninjato is a traditional Japanese sword associated with ninja (shinobi), though its historical existence remains debated. Unlike the samurai katana, ninjato is typically depicted with a straight blade and square guard (tsuba), making it suitable for covert operations and combat in confined spaces.</p>\r\n<p class=\"ds-markdown-paragraph\">Ninja sword Ninja-to - a multifunctional straight sword used by Japanese spy-saboteurs shinobi (the term \"ninja\" being an Americanism popularized by Hollywood). Features a straight single-edged blade with a slanted tip, 500-600 mm in length. The pommel (kashira) has a removable head with a poisoned needle. The handle (tsuka) is often hollow for storing loose substances (gunpowder, quartz sand). The guard (tsuba) is square-shaped, frequently featuring a dagger slot in its upper part. The scabbard (saya) often included a knife slot as well. The blade was commonly blackened to prevent reflection at night. The straightness of the sword facilitated back-carrying and mirrored ancient Japanese straight swords (ken). In reality, no reliable historical sources exist to confirm these details - most are Hollywood fabrications. The actual differences from samurai katanas are minor. Samurai were Japan\'s military class who fought honorably in open combat, while shinobi employed treachery and night-time assassinations.</p>','ninja-sword-japanese',0,0,1,NULL,NULL,NULL,28070.0000,NULL,NULL,NULL,0.8000,'2025-06-18 03:43:27','en','default',9,66,'2025-06-18 04:35:52',NULL,1),
(133,'1207','simple','1207','Название Нагината Бусидо. Рэй','<p><strong>Нагината Бусидо. Рэй</strong>&nbsp;&mdash; оружие, в котором гармонично сочетаются искусство златоустовской гравюры и японские боевые традиции. Её изогнутый клинок и рукоять из благородных материалов словно рассказывают историю самурайской доблести, а сертификат подлинности подтверждает исключительность этого изделия.</p>','<p><strong>Нагината (дословный перевод &ndash; &laquo;длинный меч&raquo;)</strong> &ndash; японское холодное оружие с и изогнутым односторонним клинком и длинной рукоятью овального сечения. Это аналог европейской глефы, но по сравнению с глефой, нагината обладает более легким весом. Нагината с давних времен была излюбленным оружием воинов-монахов и отшельников (сохэев и ямабуси). В мирное время этот вид оружия зачастую использовался женщинами из сословия самураев для защиты своего жилища. Также нагинату применяли в бою легендарные женщины-самураи (онна-бугэйся). В старой Японии существовало 425 школ, где изучали технику боя нагинатадзюцу. В середине 1920-х годов оно введено в обязательную программу для средних школ, а в 1955 году образована Всеяпонская федерация нагината. В наше время нагината является одним из символов Японии, хотя и не столь известной, как катана. Сегодня нагинатадзюцу, как вид японского боевого искусства, культивируется в Москве, Санкт-Петербурге и других городах России.</p>\r\n<p>Образ нагинаты в эксклюзивном исполнении, объединив в одном изделии японские оружейные традиции и искусство златоустовской гравюры на металле. Украшенная авторская нагината посвящена кодексу самурая &ndash; бусидо&nbsp;</p>\r\n<p>**Нагината &laquo;Бусидо. Рэй&raquo; (礼 &ndash; &laquo;Почтение&raquo;)** &ndash; это уникальное разборное оружие с регулируемой длиной свыше 1800 мм, способное трансформироваться в средний или короткий вариант благодаря резьбовому соединению звеньев рукояти. Её конструкция позволяет полностью разбирать оружие: при извлечении мэкуги (крепежного колышка) можно снять или заменить цубу, превратив нагинату в модульную систему. Основу составляют эбу (древко из черного мореного граба) и хо (изогнутый клинок из атмосферостойкого дамаска Zladinox ZDI-1016), соединенные через художественно выполненную муфту хабаки из мокуме-гане. &nbsp;</p>\r\n<p>Клинок украшен философской гравировкой: на лицевой стороне &ndash; семь иероглифов принципов бусидо (Справедливость, Почтение, Мужество, Честь, Добродетель, Преданность, Искренность), на оборотной &ndash; только иероглиф &laquo;Рэй&raquo;. Центральным художественным элементом стала ажурная цуба из титанового дамаска ZlaTi, где сочетание медного мокуме-гане и сине-золотого титана символизирует стихии огня и воздуха. К цубе крепится съемный темляк с семью бусинами (мокуме-гане, ZlaTi и резными) и кистью из конского волоса с оберегами-масками. &nbsp;</p>\r\n<p>Рукоять &ndash; произведение искусства: четыре стяжных сэмагонэ украшены миниатюрами (бамбук, Фудзи, журавли), а рельефные узоры изображают символы несгибаемости (бамбук) и гармонии стихий (волны, облака). Навершие исудзуки из ZlaTi служит балансиром и ударным элементом. Ножны из бука с гравировкой подчеркивают самурайскую эстетику. &nbsp;</p>\r\n<p>Это оружие-оберег, воплощающее кодекс бусидо. Каждая деталь &ndash; от клинка до темляка &ndash; напоминает о чести, защите и духовной силе. &laquo;Бусидо. Рэй&raquo; создана для коллекционеров, ценящих глубину традиций и мастерство исполнения. &nbsp;</p>\r\n<p>*Примечание: изделие декоративное, не является холодным оружием.*</p>','название-нагината-бусидо-рэи',0,0,1,NULL,NULL,NULL,123000.0000,NULL,NULL,NULL,3800.0000,'2025-06-18 03:51:29','ru','default',9,67,'2025-06-18 04:39:35',NULL,1),
(134,'1207','simple','1207','Name: Naginata Bushido. Rei','<p><strong>Naginata Bushido. Rei &mdash; a weapon that harmoniously combines the art of Zlatoust engraving and Japanese martial traditions. Its curved blade and handle made of noble materials seem to tell a story of samurai valor, while the certificate of authenticity confirms the exclusivity of this piece.</strong></p>','<p>**Naginata (literal translation - \"long sword\")** - a Japanese edged weapon with a curved single-edged blade and a long oval-sectioned handle. This is an analogue of the European glaive, but compared to the glaive, the naginata has a lighter weight. Since ancient times, the naginata was the favorite weapon of warrior-monks and hermits (sohei and yamabushi). In peacetime, this type of weapon was often used by women from the samurai class to protect their homes. The naginata was also used in battle by legendary female samurai (onna-bugeisha). In old Japan, there were 425 schools that studied naginatajutsu combat techniques. In the mid-1920s, it was introduced into the compulsory curriculum for secondary schools, and in 1955, the All Japan Naginata Federation was established. Today, the naginata is one of the symbols of Japan, although not as famous as the katana. Currently, naginatajutsu as a form of Japanese martial art is practiced in Moscow, St. Petersburg and other cities of Russia.</p>\r\n<p>The image of the naginata in an exclusive design, combining Japanese weapon traditions and the art of Zlatoust metal engraving in one product. The decorated author\'s naginata is dedicated to the samurai code - bushido.</p>\r\n<p>**Naginata \"Bushido. Rei\" (礼 - \"Respect\")** is a unique collapsible weapon with an adjustable length of over 1800 mm, capable of transforming into a medium or short version thanks to the threaded connection of the handle links. Its design allows for complete disassembly of the weapon: when the mekugi (retaining pin) is removed, the tsuba can be removed or replaced, turning the naginata into a modular system. The basis consists of ebu (a shaft made of black stained hornbeam) and ho (a curved blade made of weather-resistant Damascus steel Zladinox ZDI-1016), connected through an artistically crafted habaki coupling made of mokume-gane.</p>\r\n<p>The blade is decorated with philosophical engraving: on the front side - seven kanji characters of bushido principles (Justice, Respect, Courage, Honor, Virtue, Loyalty, Sincerity), on the reverse side - only the kanji \"Rei\". The central artistic element is an openwork tsuba made of titanium Damascus steel ZlaTi, where the combination of copper mokume-gane and blue-gold titanium symbolizes the elements of fire and air. A removable lanyard with seven beads (mokume-gane, ZlaTi and carved) and a horsehair tassel with amulet masks is attached to the tsuba.</p>\r\n<p>The handle is a work of art: four tightening semagone are decorated with miniatures (bamboo, Fuji, cranes), and relief patterns depict symbols of inflexibility (bamboo) and harmony of the elements (waves, clouds). The isuzuki pommel made of ZlaTi serves as a balancer and striking element. The beech scabbard with engraving emphasizes samurai aesthetics.</p>\r\n<p>This is a talisman weapon that embodies the bushido code. Every detail - from the blade to the lanyard - reminds of honor, protection and spiritual strength. \"Bushido. Rei\" was created for collectors who appreciate the depth of traditions and the skill of execution.</p>\r\n<p>*Note: the product is decorative and is not a melee weapon.*</p>','name-naginata-bushido-rei',0,0,1,NULL,NULL,NULL,123000.0000,NULL,NULL,NULL,3800.0000,'2025-06-18 03:51:29','en','default',9,67,'2025-06-18 04:39:35',NULL,1),
(137,'1400','simple','1400','Японская черная сосна','<p><strong>Вырастите свой дзен с этим прекрасным бонсай: миниатюрная сосна в голубом керамическом горшке станет живым украшением интерьера и символом долголетия.</strong></p>','<p>Бонсай (盆栽) &mdash; это древнее японское искусство выращивания миниатюрных деревьев в небольших контейнерах, имитирующих природные ландшафты.<br>Классический бонсай из сосны<br>Потряcающая вечнозелeная сосна 7 лет в керамичеcкoм кaшпо-бонсaйницe.<br>Бoнcай растёт в японcком пpемиaльном грунте, удеpживающим влагу и полезныe вeщества. Не нуждаeтcя в пepecaдке, полностью здоров, дocтaточно тoлькo поливать два разв в неделю.<br>Высота с кашпо 40 см, без кашпо 35 см.<br>Такой бонсай - хороший подарок для того, кто ценит эстетику, красоту и удивительный мир растений. Это комнатное растение, его можно содержать как в квартире, офисе, так и на улице в летнее и зимне время.&nbsp; &nbsp;</p>','японская-черная-сосна',0,0,1,NULL,NULL,NULL,14700.0000,NULL,NULL,NULL,1.9000,'2025-06-19 01:16:56','ru','default',10,69,'2025-06-19 03:14:29',NULL,1),
(138,'1400','simple','1400','Japanese Black Pine','<p><strong>Cultivate Your Zen with This Beautiful Bonsai: A miniature pine in an elegant blue ceramic pot will become a living interior decoration and a symbol of longevity.</strong></p>','<p class=\"ds-markdown-paragraph\">Bonsai (盆栽) - the ancient Japanese art of growing miniature trees in small containers that mimic natural landscapes.</p>\r\n<p class=\"ds-markdown-paragraph\">Classic pine bonsai<br>An amazing 7-year-old evergreen pine in a ceramic bonsai pot.</p>\r\n<p class=\"ds-markdown-paragraph\">The bonsai grows in premium Japanese soil that retains moisture and nutrients. Doesn\'t require repotting, completely healthy, just needs watering twice a week.</p>\r\n<p class=\"ds-markdown-paragraph\">Height with pot: 40 cm, without pot: 35 cm.</p>\r\n<p class=\"ds-markdown-paragraph\">Such a bonsai makes a great gift for those who appreciate aesthetics, beauty and the wonderful world of plants. This is a houseplant that can be kept in an apartment, office, as well as outdoors in summer and winter.</p>\r\n<p>&nbsp;</p>','japanese-black-pine',0,0,1,NULL,NULL,NULL,14700.0000,NULL,NULL,NULL,1.9000,'2025-06-19 01:16:56','en','default',10,69,'2025-06-19 03:14:29',NULL,1),
(139,'1401','simple','1401','Бонсай Можевельник','<p><strong>Живой бонсай - изящный можевельник в стильном керамическом горшке - привнесет в ваш дом гармонию природы и станет прекрасным акцентом в интерьере.</strong></p>','<p>Бонсай (盆栽) &mdash; это древнее японское искусство выращивания миниатюрных деревьев в небольших контейнерах, имитирующих природные ландшафты.<br>Классический Бонсай из Можжевельника, возраст 8 лет. Такой Бонсай станет стильным украшением любого помещения. Можжевельник - вечнозеленое растение, оно будет радовать вас своей красотой и летом и зимой. А также это медленнорастущее растение, поэтому Бонсай из Можжевельника так популярны.<br>Бонсай достаточно поливать 2-3 раза в неделю и опрыскивать летом, весной и осенью. А зимой Можжевельнику требуется прохладная зимовка. Пересадка потребуется только через 2 года.<br>Заготовка для Бонсай адаптирована к содержанию в помещении, полностью здоров и готова к переезду в новый дом. Доставляется в подарочном пакете. Отличный вариант небанального подарка, который будет радовать получателя долгие годы!</p>','бонсаи-можевельник',0,0,1,NULL,NULL,NULL,16400.0000,NULL,NULL,NULL,2.2000,'2025-06-19 01:24:11','ru','default',10,70,'2025-06-19 03:09:44',NULL,1),
(140,'1401','simple','1401','Bonsai Juniper','<p><strong>Living bonsai &ndash; an elegant juniper in a stylish ceramic pot &ndash; will bring harmony of nature into your home and become a beautiful accent in the interior.</strong></p>','<p class=\"ds-markdown-paragraph\"><strong>Bonsai (盆栽)</strong>&nbsp;&mdash; this is the ancient Japanese art of growing miniature trees in small containers, imitating natural landscapes.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Classic Juniper Bonsai, age 8 years.</strong><br>Such a&nbsp;<strong>Bonsai</strong>&nbsp;will become a stylish decoration for any room.<br><strong>Juniper</strong>&nbsp;is an evergreen plant; it will delight you with its beauty both in summer and winter.<br>Also, it is a&nbsp;<strong>slow-growing plant</strong>, which is why&nbsp;<strong>Juniper Bonsai</strong>&nbsp;are so popular.</p>\r\n<p class=\"ds-markdown-paragraph\"><strong>Bonsai</strong>&nbsp;needs to be watered&nbsp;<strong>2&ndash;3 times a week</strong>&nbsp;and sprayed in summer, spring, and autumn.<br>But in winter,&nbsp;<strong>Juniper</strong>&nbsp;requires a&nbsp;<strong>cool wintering</strong>.<br><strong>Repotting</strong>&nbsp;will be needed only after&nbsp;<strong>2 years</strong>.</p>\r\n<p class=\"ds-markdown-paragraph\">This&nbsp;<strong>Bonsai starter</strong>&nbsp;is adapted for indoor keeping, completely healthy, and ready to move to a new home.<br>Delivered in a&nbsp;<strong>gift bag</strong>.<br>An excellent choice for a&nbsp;<strong>non-trivial gift</strong> that will please the recipient for many years!</p>','bonsai-juniper',0,0,1,NULL,NULL,NULL,16400.0000,NULL,NULL,NULL,2.2000,'2025-06-19 01:24:11','en','default',10,70,'2025-06-19 03:09:44',NULL,1),
(141,'1402','simple','1402','Ваза \"Фудзияма\"','<p><strong>Изящная ваза с изображением горы Фудзи и сосен, станет элегантным акцентом в вашем интерьере и привнесет нотку восточной гармонии.</strong></p>','<p><strong>Ваза &ldquo;Фудзияма&rdquo;: Ода Японской Эстетике</strong></p>\r\n<p>Эта изящная керамическая ваза &ndash; не просто предмет интерьера, а настоящее произведение искусства, вдохновленное красотой японской природы. На ее нежной кремовой поверхности запечатлен завораживающий пейзаж: величественная гора Фудзи, окутанная легкой дымкой облаков, и стройные сосны, устремленные ввысь.<br>Каждый элемент росписи выполнен с любовью к деталям, передавая умиротворяющую атмосферу японского ландшафта. Ваза &ldquo;Фудзияма&rdquo; идеально подойдет для создания атмосферы покоя и гармонии в вашем доме, напоминая о величии природы и традиционной японской эстетике.<br>Благодаря своей элегантной форме и утонченному дизайну, ваза станет прекрасным украшением для гостиной, спальни или кабинета. Наполните ее свежими цветами, сухоцветами или просто оставьте как самостоятельный элемент декора &ndash; в любом случае она будет привлекать восхищенные взгляды.</p>','ваза-фудзияма',0,0,1,NULL,NULL,NULL,19450.0000,NULL,NULL,NULL,0.8000,'2025-06-19 01:35:27','ru','default',11,71,'2025-06-19 03:17:08',NULL,1),
(142,'1402','simple','1402','Vase \"Fujiyama\"','<p><strong>An elegant vase featuring Mount Fuji and pine trees will become a sophisticated accent in your interior and add a touch of Eastern harmony.</strong></p>','<p class=\"ds-markdown-paragraph\"><strong>Vase \"Fujiyama\": An Ode to Japanese Aesthetics</strong></p>\r\n<p class=\"ds-markdown-paragraph\">This elegant ceramic vase is not just a home accessory, but a true work of art inspired by the beauty of Japanese nature. Its delicate cream-colored surface captures a mesmerizing landscape: the majestic Mount Fuji shrouded in a light mist of clouds, and slender pine trees reaching skyward.</p>\r\n<p class=\"ds-markdown-paragraph\">Every element of the painting is crafted with meticulous attention to detail, conveying the serene atmosphere of the Japanese countryside. The \"Fujiyama\" vase is perfect for creating an ambiance of peace and harmony in your home, reminding you of nature\'s grandeur and traditional Japanese aesthetics.</p>\r\n<p class=\"ds-markdown-paragraph\">Thanks to its graceful shape and refined design, the vase will make a beautiful addition to your living room, bedroom, or study. Fill it with fresh flowers, dried arrangements, or simply display it as a standalone decorative piece&mdash;either way, it will draw admiring glances.</p>','vase-fujiyama',0,0,1,NULL,NULL,NULL,19450.0000,NULL,NULL,NULL,0.8000,'2025-06-19 01:35:27','en','default',11,71,'2025-06-19 03:17:08',NULL,1),
(143,'1403','simple','1403','Фонарик Андон японский','<p><strong>Привнесите восточный колорит с этими яркими красными бумажными фонариками, создающими уютную и праздничную атмосферу.</strong></p>','<p>Андон (яп. 行灯, &laquo;идущий свет&raquo;) &mdash; это традиционный японский фонарь с бумажным абажуром, который использовался для освещения домов, улиц и религиозных церемоний.</p>\r\n<p>Изготовлен из материалов хорошего качества, которые подлежат вторичной переработке и повторному использованию.Эти фонарики можно легко повесить на стену или потолок с помощью крючков.Изысканное качество изготовления, четкая печать, красивые и красочные цвета.Хорошо сделанный и простой по стилю, хороший декоративный эффект.</p>','фонарик-андон-японскии',0,0,1,NULL,NULL,NULL,750.0000,NULL,NULL,NULL,0.1500,'2025-06-19 01:46:22','ru','default',11,72,'2025-06-19 03:24:26',NULL,1),
(144,'1403','simple','1403','Flashlight Andon Japanese','<p><strong>Bring in some oriental flair with these vibrant red paper lanterns that create a cozy and festive atmosphere.</strong></p>','<p>Andon (行灯, \"walking light\") is a traditional Japanese lantern with a paper lampshade that was used to illuminate homes, streets and religious ceremonies.</p>\r\n<p>Made of good quality materials that can be recycled and reused. These lanterns can be easily hung on the wall or ceiling with hooks. Exquisite workmanship, clear printing, beautiful and colorful colors. Well made and simple in style, good decorative effect.</p>','flashlight-andon-japanese',0,0,1,NULL,NULL,NULL,750.0000,NULL,NULL,NULL,0.1500,'2025-06-19 01:46:22','en','default',11,72,'2025-06-19 03:24:26',NULL,1),
(145,'1404','simple','1404','Сад Дзен \"Будда с деревом\"','<p><strong>Создайте уголок гармонии с этим миниатюрным садом камней: расслабляйтесь, медитируйте и освобождайте разум, рисуя узоры на песке.</strong></p>','<p>Мини-сад дзен (или настольный сад камней) &mdash; это компактная версия традиционного японского сада камней (карэсансуй), созданная для медитации, релаксации и украшения интерьера.</p>\r\n<p>Главная цель сада дзен - создать пространство для медитации и расслабления, где человек может наслаждаться красотой природы и находить гармонию с самим собой. Для тех, кто не имеет возможности создать сад дзен из натуральных материалов, есть замечательная альтернатива - искусственный сад. Создание такого сада дзен принесёт ровно столько же спокойствия, гармонии, и удовольствия. А использование искусственных материалов облегчит уход за этим замечательным антистресс-сувениром.</p>','сад-дзен-будда-с-деревом',0,0,1,NULL,NULL,NULL,13700.0000,NULL,NULL,NULL,1.1000,'2025-06-19 02:05:02','ru','default',12,73,'2025-06-19 03:26:43',NULL,1),
(146,'1404','simple','1404','Zen Garden \"Buddha with Tree\"','<p><strong>Create a corner of harmony with this miniature rock garden: relax, meditate and clear your mind by drawing patterns in the sand.</strong></p>','<p>A mini Zen garden (or tabletop rock garden) is a compact version of a traditional Japanese rock garden (karesansui), created for meditation, relaxation and interior decoration.</p>\r\n<p>The main goal of a Zen garden is to create a space for meditation and relaxation, where a person can enjoy the beauty of nature and find harmony with himself. For those who do not have the opportunity to create a Zen garden from natural materials, there is a wonderful alternative - an artificial garden. Creating such a Zen garden will bring exactly the same amount of peace, harmony, and pleasure. And the use of artificial materials will make it easier to care for this wonderful anti-stress souvenir.</p>','zen-garden-buddha-with-tree',0,0,1,NULL,NULL,NULL,13700.0000,NULL,NULL,NULL,1.1000,'2025-06-19 02:05:02','en','default',12,73,'2025-06-19 03:26:43',NULL,1),
(147,'1405','simple','1405','Сад дзен японский настольный','<p><strong>Создайте атмосферу покоя и гармонии с этим мини-садом камней: насладитесь медитацией, рисуя узоры на песке, и созерцайте пламя свечи, освобождаясь от стресса.</strong></p>','<p>Мини-сад дзен (или настольный сад камней) &mdash; это компактная версия традиционного японского сада камней (карэсансуй), созданная для медитации, релаксации и украшения интерьера.<br>Комплект в подарочной упаковке включает статуэтку Будды, подставку, мини грабли, чистейший кварцевый песок, камни и подсвечник для чайной свечи. Настольный японский сад камней &ndash; это оригинальный подарок в офис мужчине или женщине, для друзей, коллег, руководителей и всех, кто ценит красоту и стремится к внутренней гармонии. Мини-сад отлично впишется в любой интерьер, став стильным акцентом в вашем пространстве. Особенно песок с граблями антистресс будет полезен в офисе: каждый раз, когда вам нужно отвлечься от рабочей рутины, садик станет отличным антистресс-инструментом, помогая снять напряжение и восстановить концентрацию.</p>','сад-дзен-японскии-настольныи',0,0,1,NULL,NULL,NULL,13560.0000,NULL,NULL,NULL,1.9000,'2025-06-19 02:13:48','ru','default',12,74,'2025-06-19 03:28:41',NULL,1),
(148,'1405','simple','1405','Japanese Zen Garden Tabletop','<p><strong>Create an atmosphere of peace and harmony with this mini rock garden: enjoy meditation by drawing patterns in the sand and contemplate the candle flame to release stress.</strong></p>','<p>Mini Zen garden (or tabletop rock garden) is a compact version of a traditional Japanese rock garden (karesansui), created for meditation, relaxation and interior decoration.<br>The set in a gift box includes a Buddha statue, a stand, a mini rake, the purest quartz sand, stones and a tea light candle holder. A tabletop Japanese rock garden is an original gift for an office for a man or a woman, for friends, colleagues, managers and anyone who appreciates beauty and strives for inner harmony. The mini garden will fit perfectly into any interior, becoming a stylish accent in your space. Sand with an anti-stress rake will be especially useful in the office: every time you need to escape from the work routine, the garden will become an excellent anti-stress tool, helping to relieve tension and restore concentration.</p>','japanese-zen-garden-tabletop',0,0,1,NULL,NULL,NULL,13560.0000,NULL,NULL,NULL,1.9000,'2025-06-19 02:13:48','en','default',12,74,'2025-06-19 03:28:41',NULL,1),
(149,'1406','simple','1406','Шестистворчатая ширма «Хиконэ Бёбу»','<p><strong>Шестистворчатая ширма &ldquo;Хиконэ Бёбу&rdquo; - это роскошная репродукция японского шедевра XVII века, выполненная в традиционной технике с золотой фольгой, идеально подходящая для ценителей искусства и восточного стиля.</strong></p>','<p>Бёбу (屏風, byōbu) &mdash; это традиционная японская складная ширма, используемая для зонирования пространства, украшения интерьера и защиты от сквозняков.<br>Представленная ширма &laquo;Хиконэ бёбу&raquo; &mdash; это одна из лучших репродукций оригинальной ширмы XVII века.<br>Произведение является образцом японской декоративной живописи на ширмах. Это шестистворчатая ширма, состоящая из расписных панелей, обрамленных по периметру деревянными рамами. С оборотной стороны они оклеены специальной декоративной бумагой, играющей роль подкладки-задника.<br>Техника исполнения росписи аутентична манере оригинала: она выполнена на японской бумаге васи водяными красками на полотне, обитом тончайшей золотой фольгой методом кимпаку.<br>В историю японского искусства произведение вошло под названием ширма &laquo;Хиконэ бёбу&raquo; по месту ее нахождения в замке Хиконэ (префектура Сига), принадлежавшем самурайскому клану Ии. В 1997 году потомки семьи</p>','шестистворчатая-ширма-хиконэ-бебу',0,0,1,NULL,NULL,NULL,29350.0000,NULL,NULL,NULL,5.7000,'2025-06-19 02:46:24','ru','default',13,75,'2025-06-19 03:30:41',NULL,1),
(150,'1406','simple','1406','Three-Leaf Screen \"Hikone Byobu\"','<p><strong>The Hikone Byobu Six-Panel Screen is a luxurious reproduction of a 17th century Japanese masterpiece, made in the traditional gold leaf technique, ideal for lovers of art and oriental style.</strong></p>','<p>Byōbu (屏風, byōbu) is a traditional Japanese folding screen used to divide a space, decorate an interior, and protect against drafts.<br>The presented screen \"Hikone byōbu\" is one of the best reproductions of the original screen of the 17th century.<br>The work is an example of Japanese decorative painting on screens. This is a six-fold screen consisting of painted panels framed along the perimeter with wooden frames. On the reverse side, they are pasted over with special decorative paper, which plays the role of a lining-back.<br>The painting technique is authentic to the manner of the original: it is done on Japanese washi paper with watercolor paints on a canvas covered with the finest gold foil using the kimpaku method.<br>The work entered the history of Japanese art under the name of the Hikone Byobu screen, after its location in Hikone Castle (Shiga Prefecture), which belonged to the Ii samurai clan. In 1997, the descendants of the family</p>','three-leaf-screen-hikone-byobu',0,0,1,NULL,NULL,NULL,29350.0000,NULL,NULL,NULL,5.7000,'2025-06-19 02:46:24','en','default',13,75,'2025-06-19 03:30:41',NULL,1),
(151,'1500','simple','1500','Омамори - исполнение желаний / мечт','<p><strong>Японский амулет омамори из ткани с традиционным дизайном. Приносит удачу и защиту.</strong></p>','<p>Омамори (お守り) &mdash; это традиционные японские амулеты из синтоистских и буддийских храмов, которые приносят удачу, защиту и благополучие.</p>\r\n<p>Маленький амулет-подвеска в виде тканевого мешочка.<br>У каждого амулета омамори своё назначение:<br>- Богатство и изобилие финансы,деньги и достаток - амулет призван привлечь богатство и изобилие в Вашу жизнь.<br>- Любовь и крепкие отношения/брак - амулет призван привлечь счастье и благополучие в ваши отношения, привлечь и сохранить любовь. Является символом стабильного брака и крепких отношений.<br>- Удача/фортуна/везение/фарт - амулет призван привлечь удачу во все ваши дела и начинания. Не забудь взять его на экзамен или важную встречу.<br>- Защита тела/здоровье- амулет призван защитить тело от разных недугов и болезней, поддерживать источник силы внутри тела.<br>Выберите ваш амулет.<br>Упакован в прозрачный плотный кармашек, в котором амулет можно оставить, чтобы он не пылился.<br>Шнурок длиной 15+ см.<br>Размер мешочка 4*6см.<br>Размер кармашка 5*7см.<br>Амулет можно вложить в кошелёк, использовать в качестве брелока для сумки/рюкзака или положить дома.<br>Амулет омамори - отличный подарок для подруги, друга, однокласснику, сестре, любимому.</p>','омамори-исполнение-желании-мечт',0,0,1,NULL,NULL,NULL,310.0000,NULL,NULL,NULL,0.0160,'2025-06-22 14:55:56','ru','default',14,76,'2025-06-22 17:47:11',NULL,1),
(152,'1500','simple','1500','Omamori - wish/dream fulfillment','<p><strong>Japanese omamori amulet made of fabric with traditional design. Brings good luck and protection.</strong></p>','<p>Omamori (お守り) are traditional Japanese amulets from Shinto and Buddhist temples that bring good luck, protection and prosperity.</p>\r\n<p>A small amulet pendant in the form of a fabric bag.<br>Each omamori amulet has its own purpose:<br>- Wealth and abundance finances, money and prosperity - the amulet is designed to attract wealth and abundance into your life.<br>- Love and strong relationships/marriage - the amulet is designed to attract happiness and prosperity into your relationship, to attract and preserve love. It is a symbol of a stable marriage and strong relationships.<br>- Luck/fortune/luck/fortune - the amulet is designed to attract good luck in all your affairs and undertakings. Don\'t forget to take it to an exam or an important meeting.<br>- Body protection/health - the amulet is designed to protect the body from various ailments and diseases, to maintain the source of strength inside the body.<br>Choose your amulet.<br>Packed in a transparent dense pocket, in which the amulet can be left so that it does not gather dust.<br>The cord is 15+ cm long.<br>The size of the bag is 4 * 6 cm.<br>The size of the pocket is 5 * 7 cm.<br>The amulet can be put in a wallet, used as a keychain for a bag / backpack or put at home.<br>The omamori amulet is a great gift for a girlfriend, friend, classmate, sister, loved one.</p>','omamori-wishdream-fulfillment',0,0,1,NULL,NULL,NULL,310.0000,NULL,NULL,NULL,0.0160,'2025-06-22 14:55:56','en','default',14,76,'2025-06-22 17:47:11',NULL,1),
(153,'1501','simple','1501','Омамори “Кот Удачи”','<p><strong>Омамори с изображением Манэки-нэко - японский амулет для привлечения удачи и богатства.</strong></p>','<p>Омамори (お守り) &mdash; это традиционные японские амулеты из синтоистских и буддийских храмов, которые приносят удачу, защиту и благополучие.</p>\r\n<p>Маленький амулет-подвеска в виде тканевого мешочка.<br>У каждого амулета омамори своё назначение:<br>- Богатство и изобилие - амулет призван привлечь богатство и изобилие в Вашу жизнь.<br>- Любовь и крепкие отношения/брак - амулет призван привлечь счастье и благополучие в ваши отношения, привлечь и сохранить любовь. Является символом стабильного брака и крепких отношений.<br>- Удача/фортуна - амулет призван привлечь удачу во все ваши дела и начинания. Не забудь взять его на экзамен или важную встречу.<br>- Защита тела/здоровье- амулет призван защитить тело от разных недугов и болезней, поддерживать источник силы внутри тела.<br>Упакован в прозрачный плотный кармашек, в котором амулет можно оставить, чтобы он не пылился.<br>Шнурок длиной 15+ см.<br>Размер мешочка 4*6см.<br>Размер кармашка 5*7см.<br>Амулет можно вложить в кошелёк, использовать в качестве брелока для сумки/рюкзака или положить дома.<br>Амулет омамори - отличный подарок для подруги, друга, однокласснику, сестре, любимому.</p>','омамори-кот-удачи',0,0,1,NULL,NULL,NULL,400.0000,NULL,NULL,NULL,0.0170,'2025-06-22 14:59:50','ru','default',14,77,'2025-06-22 17:51:25',NULL,1),
(154,'1501','simple','1501','Omamori \"Lucky Cat\"','<p><strong>Omamori with the image of Maneki-neko is a Japanese amulet for attracting good luck and wealth.</strong></p>','<p>Omamori (お守り) are traditional Japanese amulets from Shinto and Buddhist temples that bring good luck, protection and prosperity.</p>\r\n<p>A small amulet pendant in the form of a fabric bag.<br>Each omamori amulet has its own purpose:<br>- Wealth and abundance - the amulet is designed to attract wealth and abundance into your life.<br>- Love and strong relationships/marriage - the amulet is designed to attract happiness and prosperity into your relationship, to attract and preserve love. It is a symbol of a stable marriage and strong relationships.<br>- Luck/fortune - the amulet is designed to attract good luck in all your affairs and undertakings. Don\'t forget to take it to an exam or an important meeting.<br>- Body protection/health - the amulet is designed to protect the body from various ailments and diseases, to maintain the source of strength inside the body.<br>Packed in a transparent dense pocket in which the amulet can be left so that it does not gather dust.<br>The cord is 15+ cm long.<br>The size of the bag is 4*6 cm.<br>The size of the pocket is 5*7 cm.<br>The amulet can be put in a wallet, used as a keychain for a bag/backpack or kept at home.<br>The omamori amulet is a great gift for a girlfriend, boyfriend, classmate, sister, or loved one.</p>','omamori-lucky-cat',0,0,1,NULL,NULL,NULL,400.0000,NULL,NULL,NULL,0.0170,'2025-06-22 14:59:50','en','default',14,77,'2025-06-22 17:51:25',NULL,1),
(155,'1502','simple','1502','Фигурка на батарейках \"Манеки-Неко\" Кот машущий правой лапкой','<p><strong>Фигурка Манэки-нэко с поднятой лапой, держащая золотую монету и мешочек с сокровищами. Приносит удачу в бизнесе и финансовое благополучие.</strong></p>','<p>Манэки-нэко (招き猫) &mdash; &laquo;Манящий кот&raquo;<br>Это японский талисман в виде кошки с поднятой лапкой, который привлекает удачу, богатство и благополучие. Его часто можно увидеть в магазинах, ресторанах и домах по всей Японии.</p>\r\n<p>Привлеките удачу и процветание в свою жизнь с очаровательной статуэткой на солнечной батарейке &ndash; черным котом Манэки-нэко!<br>Манэки-нэко, также известный как &laquo;Кот Удачи&raquo; или &laquo;Денежный Кот&raquo;, &ndash; это традиционный японский талисман, приносящий удачу в делах, финансовое благополучие и общее процветание. Эта милая фигурка кота с поднятой лапкой стала популярным символом во всем мире, и теперь у вас есть возможность обзавестись собственным источником позитивной энергии!<br>Особенности этой статуэтки Манэки-нэко:<br>Традиционный символ: Эта статуэтка &ndash; классический представитель Манэки-нэко, с поднятой левой лапкой, которая привлекает клиентов и удачу в бизнесе. Его улыбающееся лицо излучает доброжелательность и позитив.<br>Экологичный источник энергии: Забудьте о батарейках! Этот Манэки-нэко работает на солнечной энергии. Просто поместите его в хорошо освещенное место, и он начнет автоматически махать лапкой, привлекая положительную энергию и удачу в вашу жизнь.<br>Черный цвет: В японской культуре черный цвет Манэки-нэко символизирует защиту от зла и болезней. Он отгоняет негатив и приносит стабильность.<br>Компактный размер: Небольшие размеры статуэтки (Высота: 7.5 см, Ширина: 6.5 см, Длина: 7.5 см) позволяют разместить ее где угодно: на рабочем столе, полке, прилавке магазина или даже в автомобиле.<br>Прочный материал: Изготовленная из качественного пластика, эта статуэтка Манэки-нэко прослужит вам долго, не теряя своего привлекательного внешнего вида.</p>','фигурка-на-батареиках-манеки-неко-кот-машущии-правои-лапкои',0,0,1,NULL,NULL,NULL,3700.0000,NULL,NULL,NULL,0.3330,'2025-06-22 15:11:53','ru','default',15,78,'2025-06-22 17:56:21',NULL,1),
(156,'1502','simple','1502','Battery Operated Figure \"Maneki Neko\" Cat Waving Right Paw','<p><strong>A Maneki Neko figurine with a raised paw, holding a gold coin and a bag of treasures. Brings good luck in business and financial well-being.</strong></p>','<p>Maneki Neko (招き猫) - \"Beckoning Cat\"<br>This is a Japanese lucky charm shaped like a cat with its paw raised that attracts good luck, wealth, and prosperity. It is often seen in shops, restaurants, and homes all over Japan.</p>\r\n<p>Attract good luck and prosperity into your life with this adorable solar-powered black Maneki Neko!<br>The Maneki Neko, also known as the \"Lucky Cat\" or \"Money Cat\", is a traditional Japanese lucky charm that brings good luck in business, financial well-being, and overall prosperity. This cute cat with its paw raised has become a popular symbol around the world, and now you can have your own source of positive energy!<br>Features of this Maneki Neko:<br>Traditional Symbol: This figurine is a classic Maneki Neko, with its left paw raised to attract customers and good luck in business. Its smiling face radiates goodwill and positivity.<br>Environmentally friendly energy source: Forget about batteries! This Maneki Neko is solar powered. Just place it in a well-lit area and it will automatically wave its paw, attracting positive energy and good luck into your life.<br>Black Color: In Japanese culture, the black color of the Maneki Neko symbolizes protection from evil and disease. It drives away negativity and brings stability.<br>Compact Size: The small size of the figurine (Height: 7.5 cm, Width: 6.5 cm, Length: 7.5 cm) allows you to place it anywhere: on your desktop, shelf, store counter or even in your car.<br>Durable Material: Made of high-quality plastic, this Maneki Neko figurine will serve you for a long time without losing its attractive appearance.</p>','battery-operated-figure-maneki-neko-cat-waving-right-paw',0,0,1,NULL,NULL,NULL,3700.0000,NULL,NULL,NULL,0.3330,'2025-06-22 15:11:53','en','default',15,78,'2025-06-22 17:56:21',NULL,1),
(157,'1503','simple','1503','Статуэтка на солнечной батарейке кот манэки нэко','<p><strong>Черный Манэки-нэко на солнечной батарее, привлекающий удачу в бизнесе. Машет лапой, приманивая богатство.</strong></p>','<p>Манэки-нэко (招き猫) &mdash; &laquo;Манящий кот&raquo;<br>Это японский талисман в виде кошки с поднятой лапкой, который привлекает удачу, богатство и благополучие. Его часто можно увидеть в магазинах, ресторанах и домах по всей Японии.</p>\r\n<p>Привлеките удачу и процветание в свою жизнь с очаровательной статуэткой на солнечной батарейке &ndash; черным котом Манэки-нэко!<br>Манэки-нэко, также известный как &laquo;Кот Удачи&raquo; или &laquo;Денежный Кот&raquo;, &ndash; это традиционный японский талисман, приносящий удачу в делах, финансовое благополучие и общее процветание. Эта милая фигурка кота с поднятой лапкой стала популярным символом во всем мире, и теперь у вас есть возможность обзавестись собственным источником позитивной энергии!<br>Особенности этой статуэтки Манэки-нэко:<br>Традиционный символ: Эта статуэтка &ndash; классический представитель Манэки-нэко, с поднятой левой лапкой, которая привлекает клиентов и удачу в бизнесе. Его улыбающееся лицо излучает доброжелательность и позитив.<br>Экологичный источник энергии: Забудьте о батарейках! Этот Манэки-нэко работает на солнечной энергии. Просто поместите его в хорошо освещенное место, и он начнет автоматически махать лапкой, привлекая положительную энергию и удачу в вашу жизнь.<br>Черный цвет: В японской культуре черный цвет Манэки-нэко символизирует защиту от зла и болезней. Он отгоняет негатив и приносит стабильность.<br>Компактный размер: Небольшие размеры статуэтки (Высота: 7.5 см, Ширина: 6.5 см, Длина: 7.5 см) позволяют разместить ее где угодно: на рабочем столе, полке, прилавке магазина или даже в автомобиле.<br>Прочный материал: Изготовленная из качественного пластика, эта статуэтка Манэки-нэко прослужит вам долго, не теряя своего привлекательного внешнего вида.</p>','статуэтка-на-солнечнои-батареике-кот-манэки-нэко',0,0,1,NULL,NULL,NULL,5400.0000,NULL,NULL,NULL,0.1700,'2025-06-22 17:05:45','ru','default',15,79,'2025-06-22 17:58:22',NULL,1),
(158,'1503','simple','1503','Solar Powered Maneki Neko Cat Figurine','<p><strong>A black solar-powered Maneki Neko that attracts good luck in business. It waves its paw, beckoning wealth.</strong></p>','<p>Maneki Neko (招き猫) - \"Beckoning Cat\"<br>This is a Japanese lucky charm shaped like a cat with its paw raised that attracts good luck, wealth, and prosperity. It is often seen in shops, restaurants, and homes all over Japan.</p>\r\n<p>Attract good luck and prosperity into your life with this adorable solar-powered black Maneki Neko!<br>The Maneki Neko, also known as the \"Lucky Cat\" or \"Money Cat\", is a traditional Japanese lucky charm that brings good luck in business, financial well-being, and overall prosperity. This cute cat with its paw raised has become a popular symbol around the world, and now you can have your own source of positive energy!<br>Features of this Maneki Neko:<br>Traditional Symbol: This figurine is a classic Maneki Neko, with its left paw raised to attract customers and good luck in business. Its smiling face radiates goodwill and positivity.<br>Environmentally friendly energy source: Forget about batteries! This Maneki Neko is solar powered. Just place it in a well-lit area and it will automatically wave its paw, attracting positive energy and good luck into your life.<br>Black Color: In Japanese culture, the black color of the Maneki Neko symbolizes protection from evil and disease. It drives away negativity and brings stability.<br>Compact Size: The small size of the figurine (Height: 7.5 cm, Width: 6.5 cm, Length: 7.5 cm) allows you to place it anywhere: on your desktop, shelf, store counter or even in your car.<br>Durable Material: Made of high-quality plastic, this Maneki Neko figurine will serve you for a long time without losing its attractive appearance.</p>','solar-powered-maneki-neko-cat-figurine',0,0,1,NULL,NULL,NULL,5400.0000,NULL,NULL,NULL,0.1700,'2025-06-22 17:05:45','en','default',15,79,'2025-06-22 17:58:22',NULL,1),
(159,'1504','simple','1504','Фигурка Карасиси Фо','<p><strong>Миниатюрная статуэтка, изображающая японского льва-охраника. Традиционная резьба, детальная проработка.</strong></p>','<p>Нэцкэ (根付) &mdash; миниатюрная японская скульптура с практическим назначением<br>Это небольшие резные фигурки из дерева, кости или камня, которые появились в Японии в период Эдо (1603&ndash;1868). Изначально они служили практическим целям, но со временем стали ценными艺术品 (произведениями искусства) и коллекционными предметами.</p>\r\n<p>Нэцкэ фигурка Карасиси Фо &mdash; Ши Дза - небесный китайский лев Будды. Является охранителем от злых духов, символ счастья и благополучия. Считается также покровителем детей. Помогает людям в их добрых начинаниях и духовных стремлениях. Это уникальный дизайн, ручная работа, положительная энергетика и хорошее качество. Статуэтка божества выполнена из высокопрочного литьевого камня и раскрашена вручную водоотталкивающим воском. Изделие ручной работы станет прекрасным подарком маме, подруге, коллеге, сестре , дочке, другу, мужу, брату . ВЫСОТА ИЗДЕЛИЯ 3.5 СМ.</p>','фигурка-карасиси-фо',0,0,1,NULL,NULL,NULL,1470.0000,NULL,NULL,NULL,0.0270,'2025-06-22 17:10:08','ru','default',15,80,'2025-06-22 18:02:53',NULL,1),
(160,'1504','simple','1504','Karasisi Fo figurine','<p><strong>Miniature figurine depicting a Japanese guardian lion. Traditional carving, detailed elaboration.</strong></p>','<p>Netsuke (根付) is a miniature Japanese sculpture with a practical purpose<br>These are small carved figures made of wood, bone or stone that appeared in Japan during the Edo period (1603&ndash;1868). Initially, they served practical purposes, but over time they became valuable 艺术品 (works of art) and collectibles.</p>\r\n<p>Netsuke figurine Karashishi Fo - Shi Za - the Chinese heavenly lion of Buddha. He is a guardian from evil spirits, a symbol of happiness and well-being. He is also considered the patron saint of children. He helps people in their good endeavors and spiritual aspirations. This is a unique design, handmade, positive energy and good quality. The deity figurine is made of highly durable cast stone and hand-painted with water-repellent wax. Handmade product will be a wonderful gift for your mother, girlfriend, colleague, sister, daughter, boyfriend, husband, brother. PRODUCT HEIGHT 3.5 CM.</p>','karasisi-fo-figurine',0,0,1,NULL,NULL,NULL,1470.0000,NULL,NULL,NULL,0.0270,'2025-06-22 17:10:08','en','default',15,80,'2025-06-22 18:02:53',NULL,1),
(161,'1505','simple','1505','Нэцкэ фигурка Дайкоку','<p><strong>Миниатюрная скульптура Нэцкэ, изображающая Дайкоку, одного из Семи богов счастья в японской мифологии.</strong></p>','<p>Нэцкэ (根付) &mdash; миниатюрная японская скульптура с практическим назначением<br>Это небольшие резные фигурки из дерева, кости или камня, которые появились в Японии в период Эдо (1603&ndash;1868). Изначально они служили практическим целям, но со временем стали ценными艺术品 (произведениями искусства) и коллекционными предметами.</p>\r\n<p>Нэцкэ Дайкоку &mdash; один из семи богов счастья бог богатства и достатка. Иногда ему поклоняются как покровителю домашнего очага. В нэцкэ он изображается в костюме каригину, в шапке тори-эбоси, с колотушкой, крысой и мешком волшебного риса &mdash; символом богатства и достатка. Крысы &mdash; помощники Дайкоку и наши друзья. Они прогрызают в его мешке дырочки, и волшебный рис сыплется с неба на землю прямо нам в руки.</p>','нэцкэ-фигурка-даикоку',0,0,1,NULL,NULL,NULL,3299.0000,NULL,NULL,NULL,0.0230,'2025-06-22 17:18:19','ru','default',15,81,'2025-06-22 18:04:42',NULL,1),
(162,'1505','simple','1505','Netsuke figurine Daikoku','<p><strong>A miniature Netsuke sculpture depicting Daikoku, one of the Seven Lucky Gods in Japanese mythology.</strong></p>','<p><strong>Netsuke (根付) are miniature Japanese sculptures with a practical purpose</strong><br><strong>These are small carved figures made of wood, bone, or stone that appeared in Japan during the Edo period (1603&ndash;1868). They originally served a practical purpose, but over time they became valuable 艺术品 (works of art) and collectibles.</strong></p>\r\n<p><strong>Netsuke Daikoku is one of the seven gods of happiness, the god of wealth and prosperity. He is sometimes worshiped as the patron of the hearth. In netsuke, he is depicted wearing a kariginu suit, a tori-eboshi hat, with a mallet, a rat, and a bag of magic rice, a symbol of wealth and prosperity. Rats are Daikoku\'s assistants and our friends. They gnaw holes in his bag, and the magic rice falls from the sky to the ground right into our hands.</strong></p>','netsuke-figurine-daikoku',0,0,1,NULL,NULL,NULL,3299.0000,NULL,NULL,NULL,0.0230,'2025-06-22 17:18:19','en','default',15,81,'2025-06-22 18:04:42',NULL,1),
(163,'1506','simple','1506','Сэнсу - складной бамбуковый','<p><strong>Изящный складной веер с цветочным рисунком в приглушенных тонах. Идеальный аксессуар для создания неповторимого образа.</strong></p>','<p>Сэнсу (扇子) &mdash; традиционный японский складной веер<br>Сэнсу &mdash; это не просто аксессуар для создания ветерка, а важный элемент японской культуры, искусства и даже этикета. Ощутите прохладу и элегантность с нашим складным веером Сэнсу - воплощением японского мастерства!</p>\r\n<p>Веер Сэнсу &ndash; это не просто функциональный предмет, это произведение искусства, сочетающее в себе красоту, легкость и удобство. Издревле веер был неотъемлемым атрибутом японской культуры, символизирующим статус, вкус и утонченность. Наш складной бамбуковый веер Сэнсу сочетает в себе традиционную форму и современные материалы, создавая уникальный аксессуар, который подчеркнет ваш индивидуальный стиль.<br>Особенности нашего складного бамбукового веера Сэнсу:<br>Традиционный дизайн: Веер Сэнсу - это складной веер, состоящий из тонких лопастей, соединенных у основания. Этот дизайн позволяет легко складывать и раскладывать веер, делая его компактным и удобным для ношения с собой.<br>Натуральные материалы: Лопасти веера изготовлены из прочного и легкого бамбука. Этот природный материал не только экологичен, но и придает вееру неповторимую текстуру и теплоту. Текстильное полотно, натянутое на лопасти, изготовлено из приятного на ощупь материала.<br>Уникальный дизайн: Веер украшен разноцветным цветочным рисунком. Красивые цветы подчеркивают женственность и элегантность.<br>Компактный размер: Благодаря своим компактным размерам (Длина: 21 см, Ширина: 3 см в сложенном виде), веер легко помещается в сумке или кармане, всегда готовый подарить вам прохладу в жаркий день.<br>Ручная работа: Наши веера создаются с любовью и вниманием к деталям. Каждое изделие проходит строгий контроль качества, чтобы вы могли наслаждаться безупречным исполнением и долговечностью.<br>18 ребер: Количество бамбуковых ребер обеспечивает прочность конструкции и плавное раскрытие веера.</p>','сэнсу-складнои-бамбуковыи',0,0,1,NULL,NULL,NULL,1100.0000,NULL,NULL,NULL,0.0480,'2025-06-22 17:31:37','ru','default',16,82,'2025-06-22 18:06:23',NULL,1),
(164,'1506','simple','1506','Sensu - folding bamboo','<p><strong>A delicate folding fan with a floral design in muted tones. The perfect accessory for creating a unique look.</strong></p>','<p>Sensu (扇子) - Traditional Japanese Folding Fan<br>Sensu is not just an accessory for creating a breeze, but an important element of Japanese culture, art and even etiquette. Feel cool and elegant with our Sensu folding fan - the embodiment of Japanese craftsmanship!</p>\r\n<p>The Sensu fan is not just a functional object, it is a work of art that combines beauty, lightness and convenience. Since ancient times, the fan has been an integral attribute of Japanese culture, symbolizing status, taste and sophistication. Our Sensu folding bamboo fan combines traditional form and modern materials, creating a unique accessory that will highlight your individual style.<br>Features of our Sensu folding bamboo fan:<br>Traditional design: The Sensu fan is a folding fan consisting of thin blades connected at the base. This design allows the fan to be easily folded and unfolded, making it compact and convenient to carry.<br>Natural Materials: The fan blades are made of durable and lightweight bamboo. This natural material is not only environmentally friendly, but also gives the fan a unique texture and warmth. The textile fabric stretched over the blades is made of a material that is pleasant to the touch.<br>Unique Design: The fan is decorated with a multi-colored floral pattern. Beautiful flowers emphasize femininity and elegance.<br>Compact Size: Thanks to its compact size (Length: 21 cm, Width: 3 cm when folded), the fan easily fits in a bag or pocket, always ready to give you coolness on a hot day.<br>Handmade: Our fans are created with love and attention to detail. Each product undergoes strict quality control so that you can enjoy impeccable workmanship and durability.<br>18 ribs: The number of bamboo ribs ensures the strength of the structure and smooth opening of the fan.</p>','sensu-folding-bamboo',0,0,1,NULL,NULL,NULL,1100.0000,NULL,NULL,NULL,0.0480,'2025-06-22 17:31:37','en','default',16,82,'2025-06-22 18:06:23',NULL,1);
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES
(37,'images','product/35/oWbQBNI0jtdkLGuoTP9R81ryAGja7jFOI23cS767.webp',35,1),
(38,'images','product/35/ZE6KUkB9f2S093yPaO6rJLFMknitFMzDNWZPV4eR.webp',35,2),
(39,'images','product/35/CvgCyIDqR5MMh5S0AHij90z7o0oOlw2fJpyglLwR.webp',35,3),
(40,'images','product/35/XxPGaz7kgsIdn9nq523GOjpQO83O9TGtfnElnsDw.webp',35,4),
(41,'images','product/36/7SSFjCRzqJbdk36nKmi44uu7ND2kAZJN7NBDVuVf.webp',36,1),
(42,'images','product/36/cOo0TfU4HE4IoX5zbq1oxnOoEavzQ2Gem2CRMSsO.webp',36,2),
(43,'images','product/36/rjz3qbp2LzGP84YcfryVfmnEJbkr2wq2hzEx0jWx.webp',36,3),
(44,'images','product/36/e2j91sLaXGTuDwwrd7oRlAKanQopnUNwK3x4VBjr.webp',36,4),
(45,'images','product/36/BkklsSltmNbjGIUCGlYoGn4VBvfnlKp1ZMMqlj8I.webp',36,5),
(46,'images','product/37/Q4HXGI1ThU0L4AuiXIlwCy3w6cSDZL3CU47kf2Ns.webp',37,1),
(47,'images','product/37/soHnaipb0SpxxVOUGKUgoV5UqquGwRqQS97j5iLN.webp',37,2),
(48,'images','product/37/8EoBkfXlHFFLmk3v5SLtiuAscR0gmhUcMNHDvU73.webp',37,3),
(49,'images','product/38/yPW55v2HCayiMXCWlfhJ4Dvm9d2vNhPNSF5UQwwE.webp',38,1),
(50,'images','product/38/oynbRIahPfiCUaXDA6jhoY94TSddr2eiyupzCC8o.webp',38,2),
(69,'images','product/52/eJXnYWZVYC53PLQvPFR4ueHK7dglsvfhkQFHUs1L.webp',52,1),
(70,'images','product/53/UBVKQvtvzQzQ2Wo7LbSlF7SfrzYIKKaE5YJPWUU6.webp',53,1),
(71,'images','product/55/p0o339KLxNWsJxksZZ5XPCuS1LtqGpl3IgOASaoW.webp',55,1),
(72,'images','product/56/tsDDkZzarzl8BbT3RJz6hD7UPLyy5pvfoRisjyoa.webp',56,1),
(73,'images','product/57/atGXSw1v5v1D7YnBqm9cq5YTb1RgoXtzgtn68Tug.webp',57,1),
(74,'images','product/58/mcVqIWUoYYVioVW6fyhMoyPoM8tSI4AuTC1UYBrW.webp',58,1),
(75,'images','product/59/M2BKdYV7frgJf78DQsoEvprcjBLWj3yyyXIYzS81.webp',59,1),
(76,'images','product/60/5DYete6ITXV4sFxdxuirrG1lD8y8nKDZjJXHcVWi.webp',60,1),
(77,'images','product/61/vXjxwM27vl3bQKbzxuhCHC64KMWiOffDGPGc9shm.webp',61,1),
(78,'images','product/62/O8IR6tb5rc5ycSjmwmLsB1E905ZNj6ZtnCnzeikY.webp',62,1),
(79,'images','product/63/HDT8NJmeJwTra8J9uFfs47cJpThrAGfz9teTv2E7.webp',63,1),
(80,'images','product/64/h0eGtTAuv7z22ckQeehTiznDbrQcwNsEZC9WW1pa.webp',64,1),
(81,'images','product/65/18HUNXRlsxz3yu9fbAQpr1MV6ksaUdqnWfIj61IW.webp',65,1),
(82,'images','product/66/E9ccOak1xwDaaSOHE4P7m7ZKTajNebbMbAIMW7TG.webp',66,1),
(83,'images','product/67/J7ihZtcITvn7UYw48TucOLRVruWQwaSa7BjXKqQc.webp',67,1),
(84,'images','product/69/LFKRjJIb4Y2X18AoNuix9f0JTKVjL4uxrr2NH0SN.webp',69,1),
(85,'images','product/70/v4FYiHrHO9JhAvFuUT6znyMWoSfpjE4E3WasAwP7.webp',70,1),
(86,'images','product/71/s1L6AMsMWjXbpViRHK1eib7Rf6hyrl2C3w2TirAR.webp',71,1),
(87,'images','product/72/weTmGPXekkJBZLZNBjKthWY24LP1DrDR17qO3mtQ.webp',72,1),
(88,'images','product/73/v9fGh4WerOS4UYmPdut1Ypa5mLDErMKLIRpzWRYn.webp',73,1),
(89,'images','product/74/ZwpdHc6vkcf1y57bTXx6PHNN7eU8XchOi8s2vYFE.webp',74,1),
(90,'images','product/75/TeriT9m9oy9lHM92r2S7VnUo6mS04sSTUWpTdzXi.webp',75,1),
(91,'images','product/76/HZYNfRjXvqchwkbOYIVNlDdq70JyLfH3enCFsK8N.webp',76,1),
(92,'images','product/77/3JeEI1XN9P6zWyxHXSB3wKMTrzXZnFQ7S71PZMZV.webp',77,1),
(93,'images','product/78/KhswjJMKx06bWmpiwTe15eouoCTzc1da0RSUsANY.webp',78,1),
(94,'images','product/79/mlWed7FED5dq5wPKEi3FpKpQmFyf09FbWaVIU5nk.webp',79,1),
(95,'images','product/80/U5x9UekONoBHnvbLRAIGv5izmJ7ei8OasYu8NLr5.webp',80,1),
(96,'images','product/81/giKoIQRUtXNTbjrl2x4HAlMlr7WZHcBRrkOJyorl.webp',81,1),
(97,'images','product/82/PbqL2uw02fFYFlGjeQjBPxk97peNNi7kprCiXHCD.webp',82,1);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) unsigned NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES
(27,100,35,0,1),
(28,100,36,0,1),
(29,100,37,0,1),
(30,100,38,0,1),
(38,87,52,0,1),
(39,34,53,0,1),
(40,65,55,0,1),
(41,21,56,0,1),
(42,36,57,0,1),
(43,44,58,0,1),
(44,22,59,0,1),
(45,8,60,0,1),
(46,19,61,0,1),
(47,33,62,0,1),
(48,21,63,0,1),
(49,24,64,0,1),
(50,19,65,0,1),
(51,23,66,0,1),
(52,1,67,0,1),
(53,30,69,0,1),
(54,22,70,0,1),
(55,1,71,0,1),
(56,73,72,0,1),
(57,41,73,0,1),
(58,32,74,0,1),
(59,3,75,0,1),
(60,110,76,0,1),
(61,190,77,0,1),
(62,57,78,0,1),
(63,43,79,0,1),
(64,86,80,0,1),
(65,41,81,0,1),
(66,58,82,0,1);
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventory_indices`
--

DROP TABLE IF EXISTS `product_inventory_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_inventory_indices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_inventory_indices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory_indices`
--

LOCK TABLES `product_inventory_indices` WRITE;
/*!40000 ALTER TABLE `product_inventory_indices` DISABLE KEYS */;
INSERT INTO `product_inventory_indices` VALUES
(30,100,35,1,NULL,NULL),
(31,100,36,1,NULL,'2025-02-28 14:04:05'),
(32,99,37,1,NULL,'2025-06-06 14:08:11'),
(33,99,38,1,NULL,'2025-02-28 14:31:44'),
(41,87,52,1,NULL,'2025-06-08 23:05:28'),
(42,34,53,1,NULL,NULL),
(43,65,55,1,NULL,NULL),
(44,21,56,1,NULL,'2025-06-09 13:47:06'),
(45,36,57,1,NULL,NULL),
(46,44,58,1,NULL,NULL),
(47,22,59,1,NULL,NULL),
(48,8,60,1,NULL,NULL),
(49,19,61,1,NULL,NULL),
(50,33,62,1,NULL,NULL),
(51,21,63,1,NULL,NULL),
(52,24,64,1,NULL,NULL),
(53,19,65,1,NULL,'2025-06-18 00:43:02'),
(54,23,66,1,NULL,NULL),
(55,1,67,1,NULL,NULL),
(56,30,69,1,NULL,NULL),
(57,22,70,1,NULL,NULL),
(58,1,71,1,NULL,'2025-06-18 22:42:05'),
(59,73,72,1,NULL,NULL),
(60,41,73,1,NULL,NULL),
(61,32,74,1,NULL,NULL),
(62,3,75,1,NULL,NULL),
(63,110,76,1,NULL,NULL),
(64,190,77,1,NULL,NULL),
(65,57,78,1,NULL,NULL),
(66,43,79,1,NULL,NULL),
(67,86,80,1,NULL,NULL),
(68,41,81,1,NULL,NULL),
(69,58,82,1,NULL,NULL);
/*!40000 ALTER TABLE `product_inventory_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordered_inventories`
--

DROP TABLE IF EXISTS `product_ordered_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_ordered_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
INSERT INTO `product_ordered_inventories` VALUES
(5,1,38,1),
(6,0,36,1),
(13,1,37,1);
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_indices`
--

DROP TABLE IF EXISTS `product_price_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price_indices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL DEFAULT 1,
  `min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_indices`
--

LOCK TABLES `product_price_indices` WRITE;
/*!40000 ALTER TABLE `product_price_indices` DISABLE KEYS */;
INSERT INTO `product_price_indices` VALUES
(88,35,1,1,300.0000,300.0000,300.0000,300.0000,NULL,NULL),
(89,35,2,1,300.0000,300.0000,300.0000,300.0000,NULL,NULL),
(90,35,3,1,300.0000,300.0000,300.0000,300.0000,NULL,NULL),
(91,36,1,1,1500.0000,1500.0000,1500.0000,1500.0000,NULL,NULL),
(92,36,2,1,1500.0000,1500.0000,1500.0000,1500.0000,NULL,NULL),
(93,36,3,1,1500.0000,1500.0000,1500.0000,1500.0000,NULL,NULL),
(94,37,1,1,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL),
(95,37,2,1,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL),
(96,37,3,1,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL),
(97,38,1,1,400.0000,400.0000,400.0000,400.0000,NULL,NULL),
(98,38,2,1,400.0000,400.0000,400.0000,400.0000,NULL,NULL),
(99,38,3,1,400.0000,400.0000,400.0000,400.0000,NULL,NULL),
(121,52,1,1,650.0000,650.0000,650.0000,650.0000,NULL,'2025-06-08 23:05:29'),
(122,52,2,1,650.0000,650.0000,650.0000,650.0000,NULL,'2025-06-08 23:05:29'),
(123,52,3,1,650.0000,650.0000,650.0000,650.0000,NULL,'2025-06-08 23:05:29'),
(124,53,1,1,1700.0000,1850.0000,1700.0000,1850.0000,NULL,NULL),
(125,53,2,1,1700.0000,1850.0000,1700.0000,1850.0000,NULL,NULL),
(126,53,3,1,1700.0000,1850.0000,1700.0000,1850.0000,NULL,NULL),
(127,55,1,1,1500.0000,1500.0000,1500.0000,1500.0000,NULL,NULL),
(128,55,2,1,1500.0000,1500.0000,1500.0000,1500.0000,NULL,NULL),
(129,55,3,1,1500.0000,1500.0000,1500.0000,1500.0000,NULL,NULL),
(130,56,1,1,3420.0000,3420.0000,3420.0000,3420.0000,NULL,NULL),
(131,56,2,1,3420.0000,3420.0000,3420.0000,3420.0000,NULL,NULL),
(132,56,3,1,3420.0000,3420.0000,3420.0000,3420.0000,NULL,NULL),
(133,57,1,1,920.0000,920.0000,920.0000,920.0000,NULL,NULL),
(134,57,2,1,920.0000,920.0000,920.0000,920.0000,NULL,NULL),
(135,57,3,1,920.0000,920.0000,920.0000,920.0000,NULL,NULL),
(136,58,1,1,1400.0000,1460.0000,1400.0000,1460.0000,NULL,NULL),
(137,58,2,1,1400.0000,1460.0000,1400.0000,1460.0000,NULL,NULL),
(138,58,3,1,1400.0000,1460.0000,1400.0000,1460.0000,NULL,NULL),
(139,59,1,1,2900.0000,2900.0000,2900.0000,2900.0000,NULL,NULL),
(140,59,2,1,2900.0000,2900.0000,2900.0000,2900.0000,NULL,NULL),
(141,59,3,1,2900.0000,2900.0000,2900.0000,2900.0000,NULL,NULL),
(142,60,1,1,33500.0000,33500.0000,33500.0000,33500.0000,NULL,NULL),
(143,60,2,1,33500.0000,33500.0000,33500.0000,33500.0000,NULL,NULL),
(144,60,3,1,33500.0000,33500.0000,33500.0000,33500.0000,NULL,NULL),
(145,61,1,1,29100.0000,29100.0000,29100.0000,29100.0000,NULL,NULL),
(146,61,2,1,29100.0000,29100.0000,29100.0000,29100.0000,NULL,NULL),
(147,61,3,1,29100.0000,29100.0000,29100.0000,29100.0000,NULL,NULL),
(148,62,1,1,19000.0000,19000.0000,19000.0000,19000.0000,NULL,NULL),
(149,62,2,1,19000.0000,19000.0000,19000.0000,19000.0000,NULL,NULL),
(150,62,3,1,19000.0000,19000.0000,19000.0000,19000.0000,NULL,NULL),
(151,63,1,1,11479.0000,11479.0000,11479.0000,11479.0000,NULL,NULL),
(152,63,2,1,11479.0000,11479.0000,11479.0000,11479.0000,NULL,NULL),
(153,63,3,1,11479.0000,11479.0000,11479.0000,11479.0000,NULL,NULL),
(154,64,1,1,12000.0000,12000.0000,12000.0000,12000.0000,NULL,NULL),
(155,64,2,1,12000.0000,12000.0000,12000.0000,12000.0000,NULL,NULL),
(156,64,3,1,12000.0000,12000.0000,12000.0000,12000.0000,NULL,NULL),
(157,65,1,1,21899.0000,21899.0000,21899.0000,21899.0000,NULL,NULL),
(158,65,2,1,21899.0000,21899.0000,21899.0000,21899.0000,NULL,NULL),
(159,65,3,1,21899.0000,21899.0000,21899.0000,21899.0000,NULL,NULL),
(160,66,1,1,28070.0000,28070.0000,28070.0000,28070.0000,NULL,NULL),
(161,66,2,1,28070.0000,28070.0000,28070.0000,28070.0000,NULL,NULL),
(162,66,3,1,28070.0000,28070.0000,28070.0000,28070.0000,NULL,NULL),
(163,67,1,1,123000.0000,123000.0000,123000.0000,123000.0000,NULL,NULL),
(164,67,2,1,123000.0000,123000.0000,123000.0000,123000.0000,NULL,NULL),
(165,67,3,1,123000.0000,123000.0000,123000.0000,123000.0000,NULL,NULL),
(166,69,1,1,14700.0000,14700.0000,14700.0000,14700.0000,NULL,NULL),
(167,69,2,1,14700.0000,14700.0000,14700.0000,14700.0000,NULL,NULL),
(168,69,3,1,14700.0000,14700.0000,14700.0000,14700.0000,NULL,NULL),
(169,70,1,1,16400.0000,16400.0000,16400.0000,16400.0000,NULL,NULL),
(170,70,2,1,16400.0000,16400.0000,16400.0000,16400.0000,NULL,NULL),
(171,70,3,1,16400.0000,16400.0000,16400.0000,16400.0000,NULL,NULL),
(172,71,1,1,19450.0000,19450.0000,19450.0000,19450.0000,NULL,NULL),
(173,71,2,1,19450.0000,19450.0000,19450.0000,19450.0000,NULL,NULL),
(174,71,3,1,19450.0000,19450.0000,19450.0000,19450.0000,NULL,NULL),
(175,72,1,1,750.0000,750.0000,750.0000,750.0000,NULL,NULL),
(176,72,2,1,750.0000,750.0000,750.0000,750.0000,NULL,NULL),
(177,72,3,1,750.0000,750.0000,750.0000,750.0000,NULL,NULL),
(178,73,1,1,13700.0000,13700.0000,13700.0000,13700.0000,NULL,NULL),
(179,73,2,1,13700.0000,13700.0000,13700.0000,13700.0000,NULL,NULL),
(180,73,3,1,13700.0000,13700.0000,13700.0000,13700.0000,NULL,NULL),
(181,74,1,1,13560.0000,13560.0000,13560.0000,13560.0000,NULL,NULL),
(182,74,2,1,13560.0000,13560.0000,13560.0000,13560.0000,NULL,NULL),
(183,74,3,1,13560.0000,13560.0000,13560.0000,13560.0000,NULL,NULL),
(184,75,1,1,29350.0000,29350.0000,29350.0000,29350.0000,NULL,NULL),
(185,75,2,1,29350.0000,29350.0000,29350.0000,29350.0000,NULL,NULL),
(186,75,3,1,29350.0000,29350.0000,29350.0000,29350.0000,NULL,NULL),
(187,76,1,1,310.0000,310.0000,310.0000,310.0000,NULL,NULL),
(188,76,2,1,310.0000,310.0000,310.0000,310.0000,NULL,NULL),
(189,76,3,1,310.0000,310.0000,310.0000,310.0000,NULL,NULL),
(190,77,1,1,400.0000,400.0000,400.0000,400.0000,NULL,NULL),
(191,77,2,1,400.0000,400.0000,400.0000,400.0000,NULL,NULL),
(192,77,3,1,400.0000,400.0000,400.0000,400.0000,NULL,NULL),
(193,78,1,1,3700.0000,3700.0000,3700.0000,3700.0000,NULL,NULL),
(194,78,2,1,3700.0000,3700.0000,3700.0000,3700.0000,NULL,NULL),
(195,78,3,1,3700.0000,3700.0000,3700.0000,3700.0000,NULL,NULL),
(196,79,1,1,5400.0000,5400.0000,5400.0000,5400.0000,NULL,NULL),
(197,79,2,1,5400.0000,5400.0000,5400.0000,5400.0000,NULL,NULL),
(198,79,3,1,5400.0000,5400.0000,5400.0000,5400.0000,NULL,NULL),
(199,80,1,1,1470.0000,1470.0000,1470.0000,1470.0000,NULL,NULL),
(200,80,2,1,1470.0000,1470.0000,1470.0000,1470.0000,NULL,NULL),
(201,80,3,1,1470.0000,1470.0000,1470.0000,1470.0000,NULL,NULL),
(202,81,1,1,3299.0000,3299.0000,3299.0000,3299.0000,NULL,NULL),
(203,81,2,1,3299.0000,3299.0000,3299.0000,3299.0000,NULL,NULL),
(204,81,3,1,3299.0000,3299.0000,3299.0000,3299.0000,NULL,NULL),
(205,82,1,1,1100.0000,1100.0000,1100.0000,1100.0000,NULL,NULL),
(206,82,2,1,1100.0000,1100.0000,1100.0000,1100.0000,NULL,NULL),
(207,82,3,1,1100.0000,1100.0000,1100.0000,1100.0000,NULL,NULL);
/*!40000 ALTER TABLE `product_price_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_relations` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
INSERT INTO `product_relations` VALUES
(53,55),
(55,53),
(56,58),
(56,59),
(58,56),
(58,59),
(59,56),
(59,58);
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review_attachments`
--

DROP TABLE IF EXISTS `product_review_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_review_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `type` varchar(191) DEFAULT 'image',
  `mime_type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review_attachments`
--

LOCK TABLES `product_review_attachments` WRITE;
/*!40000 ALTER TABLE `product_review_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL DEFAULT '',
  `title` varchar(191) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
INSERT INTO `product_reviews` VALUES
(8,'djfkjdj','fkjfjkef',5,'dknldkff','approved',38,NULL,'2025-03-01 10:43:57','2025-03-01 10:44:51');
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_super_attributes`
--

DROP TABLE IF EXISTS `product_super_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_super_attributes` (
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_super_attributes`
--

LOCK TABLES `product_super_attributes` WRITE;
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `attribute_family_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(35,'sku-123','simple',NULL,4,NULL,'2025-02-27 19:41:48','2025-02-27 19:41:48'),
(36,'sku-124','simple',NULL,4,NULL,'2025-02-27 19:50:22','2025-02-27 19:50:22'),
(37,'sku-125','simple',NULL,4,NULL,'2025-02-27 19:57:17','2025-02-27 19:57:17'),
(38,'sju-125','simple',NULL,4,NULL,'2025-02-27 20:05:18','2025-02-27 20:05:18'),
(52,'1002','simple',NULL,6,NULL,'2025-06-08 22:51:07','2025-06-08 22:51:07'),
(53,'1001','simple',NULL,6,NULL,'2025-06-08 23:29:00','2025-06-08 23:29:00'),
(55,'1003','simple',NULL,6,NULL,'2025-06-09 00:38:36','2025-06-09 00:38:36'),
(56,'1004','simple',NULL,6,NULL,'2025-06-09 13:30:44','2025-06-09 13:30:44'),
(57,'1005','simple',NULL,6,NULL,'2025-06-09 18:59:04','2025-06-09 18:59:04'),
(58,'1006','simple',NULL,6,NULL,'2025-06-09 19:24:17','2025-06-09 19:24:17'),
(59,'1007','simple',NULL,6,NULL,'2025-06-09 19:52:11','2025-06-09 19:52:11'),
(60,'1200','simple',NULL,9,NULL,'2025-06-17 23:00:52','2025-06-17 23:00:52'),
(61,'1201','simple',NULL,9,NULL,'2025-06-17 23:51:54','2025-06-17 23:51:54'),
(62,'1202','simple',NULL,9,NULL,'2025-06-18 00:06:57','2025-06-18 00:06:57'),
(63,'1203','simple',NULL,9,NULL,'2025-06-18 00:14:21','2025-06-18 00:14:21'),
(64,'1204','simple',NULL,9,NULL,'2025-06-18 00:24:02','2025-06-18 00:24:02'),
(65,'1205','simple',NULL,9,NULL,'2025-06-18 00:33:25','2025-06-18 00:33:25'),
(66,'1206','simple',NULL,9,NULL,'2025-06-18 00:43:27','2025-06-18 00:43:27'),
(67,'1207','simple',NULL,9,NULL,'2025-06-18 00:51:28','2025-06-18 00:51:28'),
(69,'1400','simple',NULL,10,NULL,'2025-06-18 22:16:56','2025-06-18 22:16:56'),
(70,'1401','simple',NULL,10,NULL,'2025-06-18 22:24:11','2025-06-18 22:24:11'),
(71,'1402','simple',NULL,11,NULL,'2025-06-18 22:35:27','2025-06-18 22:35:27'),
(72,'1403','simple',NULL,11,NULL,'2025-06-18 22:46:22','2025-06-18 22:46:22'),
(73,'1404','simple',NULL,12,NULL,'2025-06-18 23:05:02','2025-06-18 23:05:02'),
(74,'1405','simple',NULL,12,NULL,'2025-06-18 23:13:48','2025-06-18 23:13:48'),
(75,'1406','simple',NULL,13,NULL,'2025-06-18 23:46:24','2025-06-18 23:46:24'),
(76,'1500','simple',NULL,14,NULL,'2025-06-22 11:55:56','2025-06-22 11:55:56'),
(77,'1501','simple',NULL,14,NULL,'2025-06-22 11:59:50','2025-06-22 11:59:50'),
(78,'1502','simple',NULL,15,NULL,'2025-06-22 12:11:53','2025-06-22 12:11:53'),
(79,'1503','simple',NULL,15,NULL,'2025-06-22 14:05:44','2025-06-22 14:05:44'),
(80,'1504','simple',NULL,15,NULL,'2025-06-22 14:10:08','2025-06-22 14:10:08'),
(81,'1505','simple',NULL,15,NULL,'2025-06-22 14:18:19','2025-06-22 14:18:19'),
(82,'1506','simple',NULL,16,NULL,'2025-06-22 14:31:37','2025-06-22 14:31:37');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_items`
--

DROP TABLE IF EXISTS `refund_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `refund_id` int(10) unsigned DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_items`
--

LOCK TABLES `refund_items` WRITE;
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `permission_type` varchar(191) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'Администратор','Эта роль предоставляет пользователям полный доступ','all',NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_synonyms`
--

DROP TABLE IF EXISTS `search_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_synonyms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `terms` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_synonyms`
--

LOCK TABLES `search_synonyms` WRITE;
/*!40000 ALTER TABLE `search_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_terms`
--

DROP TABLE IF EXISTS `search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(191) NOT NULL,
  `results` int(11) NOT NULL DEFAULT 0,
  `uses` int(11) NOT NULL DEFAULT 0,
  `redirect_url` varchar(191) DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_channel_id_foreign` (`channel_id`),
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
INSERT INTO `search_terms` VALUES
(4,'Чайник \"Сейгайха\" с синими волнами Чайник \"Сейгайха\" с синими волнами',0,1,NULL,0,'ru',1,'2025-03-01 10:33:32','2025-03-01 10:33:32'),
(5,'Чайник \"Сейгайха\" с синими волнами',1,1,NULL,0,'ru',1,'2025-03-01 10:34:11','2025-03-01 10:34:11'),
(6,'Татами \"Традиция Японии\"',1,1,NULL,0,'ru',1,'2025-03-04 22:23:45','2025-03-04 22:23:45'),
(7,'Икебана \"Искусство цветочной аранжировки\"',1,2,NULL,0,'ru',1,'2025-03-05 08:42:54','2025-03-06 14:21:48');
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT 0.0000,
  `base_price` decimal(12,4) DEFAULT 0.0000,
  `total` decimal(12,4) DEFAULT 0.0000,
  `base_total` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `shipment_id` int(10) unsigned NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
INSERT INTO `shipment_items` VALUES
(6,'Икебана \"Искусство цветочной аранжировки\"',NULL,'sku-2',4,2800,300.0000,300.0000,1200.0000,1200.0000,300.0000,300.0000,41,'Sakura\\Product\\Models\\Product',12,4,'{\"product_id\":\"41\",\"is_buy_now\":\"0\",\"quantity\":1,\"locale\":\"ru\"}','2025-03-01 10:36:39','2025-03-01 10:36:39'),
(7,'Катана сувенирная',NULL,'123',2,30,110.0000,110.0000,220.0000,220.0000,110.0000,110.0000,47,'Sakura\\Product\\Models\\Product',18,5,'{\"quantity\":1,\"product_id\":47,\"locale\":\"ru\"}','2025-06-04 15:18:46','2025-06-04 15:18:46');
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `carrier_code` varchar(191) DEFAULT NULL,
  `carrier_title` varchar(191) DEFAULT NULL,
  `track_number` text DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_address_id` int(10) unsigned DEFAULT NULL,
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES
(4,NULL,4,2800,NULL,'kkkm','999',1,4,'Sakura\\Customer\\Models\\Customer',8,33,1,'По умолчанию','2025-03-01 10:36:39','2025-06-04 15:19:00'),
(5,NULL,2,30,NULL,'Сувенирные катаны','100',1,6,'Sakura\\Customer\\Models\\Customer',13,55,1,'По умолчанию','2025-06-04 15:18:46','2025-06-04 15:19:00');
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories_tax_rates`
--

DROP TABLE IF EXISTS `tax_categories_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int(10) unsigned NOT NULL,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories_tax_rates`
--

LOCK TABLES `tax_categories_tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT 0,
  `zip_code` varchar(191) DEFAULT NULL,
  `zip_from` varchar(191) DEFAULT NULL,
  `zip_to` varchar(191) DEFAULT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customization_translations`
--

DROP TABLE IF EXISTS `theme_customization_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_customization_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_customization_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options`)),
  PRIMARY KEY (`id`),
  KEY `theme_customization_translations_theme_customization_id_foreign` (`theme_customization_id`),
  CONSTRAINT `theme_customization_translations_theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customization_translations`
--

LOCK TABLES `theme_customization_translations` WRITE;
/*!40000 ALTER TABLE `theme_customization_translations` DISABLE KEYS */;
INSERT INTO `theme_customization_translations` VALUES
(1,1,'ru','{\"images\":[{\"title\":\"\\u0411\\u0435\\u0433\\u043e\\u043c \\u043a\\u0430\\u043a \\u043d\\u0430\\u0440\\u0443\\u0442\\u043e \\u0437\\u0430 \\u043f\\u043e\\u043a\\u0443\\u043f\\u043a\\u0430\\u043c\\u0438!\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/Sm4LuqGE4gdxB0sjpkSGAuk9cV1lYMKO8XqOX06j.webp\"},{\"title\":\"\\u041f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0448\\u0438 \\u043d\\u043e\\u0432\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b!\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/o57oVb2T05Gh0Ww6IoS8Ry09GDJ3HN3CEYVqR4x9.webp\"},{\"title\":\"\\u041c\\u044b \\u043b\\u044e\\u0431\\u0438\\u043c \\u043d\\u0430\\u0448\\u0438\\u0445 \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439!\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/a6H2hBrvQDHW6x0MRFx0BUhVY5L6sV7lkfYhkUTB.webp\"}]}'),
(3,3,'ru','{\"filters\":{\"parent_id\":1,\"sort\":\"asc\",\"limit\":10}}'),
(6,6,'ru','{\"html\":\"<div class=\\\"features-grid\\\">\\r\\n    <div class=\\\"feature-item\\\">\\r\\n        <img src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/6\\/0aQGO5c3tajnFk3kiiyQafivdUqRZo38YWV44Fo7.webp\\\" alt=\\\"\\u041a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438\\\">\\r\\n         <h3 class=\\\"feature-title\\\">\\u041e\\u0442\\u043a\\u0440\\u043e\\u0439 \\u0434\\u043b\\u044f \\u0441\\u0435\\u0431\\u044f \\u043d\\u0430\\u0448\\u0438 \\u043d\\u043e\\u0432\\u044b\\u0435 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/h3>\\r\\n\\r\\n    <\\/div>\\r\\n    <div class=\\\"feature-item\\\">\\r\\n        <img src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/10\\/HYShlwOY7C5dNeeSf3FFWuA8X0Sx5fZgPTkzqywM.webp\\\" alt=\\\"\\u0411\\u0435\\u0437 \\u043e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0435\\u043d\\u0438\\u0439\\\">\\r\\n         <h3 class=\\\"feature-title\\\">\\u0417\\u0430\\u043a\\u0430\\u0437\\u044b\\u0432\\u0430\\u0439 \\u0431\\u0435\\u0437 \\u043e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0435\\u043d\\u0438\\u0439<\\/h3>\\r\\n\\r\\n    <\\/div>\\r\\n    <div class=\\\"feature-item\\\">\\r\\n        <img src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/6\\/0aQGO5c3tajnFk3kiiyQafivdUqRZo38YWV44Fo7.webp\\\" alt=\\\"\\u0421\\u043f\\u0435\\u0446\\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f\\\">\\r\\n         <h3 class=\\\"feature-title\\\">\\u041d\\u0435 \\u043f\\u0440\\u043e\\u043f\\u0443\\u0441\\u0442\\u0438 \\u0441\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f<\\/h3>\\r\\n\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".features-grid {\\r\\n    display: grid;\\r\\n    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));\\r\\n    gap: 12px;\\r\\n    justify-items: center;\\r\\n    padding: 12px;\\r\\n    max-width: 1000px;\\r\\n    margin: 0 auto;\\r\\n}\\r\\n.feature-item {\\r\\n    text-align: center;\\r\\n    max-width: 260px;\\r\\n}\\r\\n.feature-item img {\\r\\n    width: 100%;\\r\\n    height: auto;\\r\\n    border-radius: 8px;\\r\\n    margin-bottom: 8px;\\r\\n    object-fit: cover;\\r\\n}\\r\\n.feature-title {\\r\\n    font-size: 15px;\\r\\n    font-weight: 500;\\r\\n    line-height: 1.2;\\r\\n    color: #060c3b;\\r\\n    font-family: \'DM Serif Display\', serif;\\r\\n    margin: 0;\\r\\n}\\r\\n.new-products {\\r\\n    font-size: 18px;\\r\\n    font-weight: 500;\\r\\n    color: #060c3b;\\r\\n    font-family: \'DM Serif Display\', serif;\\r\\n    text-align: center;\\r\\n    margin: 8px 0 0;\\r\\n    padding: 0;\\r\\n}\"}'),
(7,7,'ru','{\"title\":\"\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"12\",\"featured\":\"1\"}}'),
(9,9,'ru','{\"title\":\"\\u0412\\u0441\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"48\"}}'),
(10,10,'ru','{\"html\":\"<div class=\\\"features-grid\\\">\\r\\n  <div class=\\\"feature-item\\\">\\r\\n    <img src=\\\"your-image.jpg\\\" alt=\\\"\\u041a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438\\\">\\r\\n    <p>\\u041e\\u0442\\u043a\\u0440\\u043e\\u0439 \\u0434\\u043b\\u044f \\u0441\\u0435\\u0431\\u044f \\u043d\\u0430\\u0448\\u0438 \\u043d\\u043e\\u0432\\u044b\\u0435 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/p>\\r\\n  <\\/div>\\r\\n  <div class=\\\"feature-item\\\">\\r\\n    <img src=\\\"your-image.jpg\\\" alt=\\\"\\u0411\\u0435\\u0437 \\u043e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0435\\u043d\\u0438\\u0439\\\">\\r\\n    <p>\\u0417\\u0430\\u043a\\u0430\\u0437\\u044b\\u0432\\u0430\\u0439 \\u0431\\u0435\\u0437 \\u043e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0435\\u043d\\u0438\\u0439<\\/p>\\r\\n  <\\/div>\\r\\n  <div class=\\\"feature-item\\\">\\r\\n    <img src=\\\"your-image.jpg\\\" alt=\\\"\\u0421\\u043f\\u0435\\u0446\\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f\\\">\\r\\n    <p>\\u041d\\u0435 \\u043f\\u0440\\u043e\\u043f\\u0443\\u0441\\u0442\\u0438 \\u0441\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f<\\/p>\\r\\n  <\\/div>\\r\\n<\\/div>\",\"css\":\".features-grid {\\r\\n  display: grid;\\r\\n  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));\\r\\n  gap: 24px;\\r\\n  justify-items: center;\\r\\n  align-items: start;\\r\\n  margin: 40px auto;\\r\\n  max-width: 1000px;\\r\\n  padding: 0 16px;\\r\\n}\\r\\n\\r\\n.feature-item {\\r\\n  text-align: center;\\r\\n  max-width: 240px;\\r\\n}\\r\\n\\r\\n.feature-item img {\\r\\n  width: 100%;\\r\\n  height: auto;\\r\\n  border-radius: 12px;\\r\\n  display: block;\\r\\n  margin-bottom: 12px;\\r\\n  object-fit: cover;\\r\\n}\\r\\n\\r\\n.feature-item p {\\r\\n  font-size: 14px;\\r\\n  font-family: \'Poppins\', sans-serif;\\r\\n  color: #333;\\r\\n  margin: 0;\\r\\n}\"}'),
(11,11,'ru','{\n  \"column_1\": [\n    {\"url\": \"http://127.0.0.1:8000/page/about-us\", \"title\": \"О нас\", \"sort_order\": \"1\"},\n    {\"url\": \"http://127.0.0.1:8000/contact-us\", \"title\": \"Свяжитесь с нами\", \"sort_order\": \"2\"},\n    {\"url\": \"http://127.0.0.1:8000/page/customer-service\", \"title\": \"Служба поддержки\", \"sort_order\": \"3\"}\n  ],\n  \"column_2\": [\n    {\"url\": \"http://127.0.0.1:8000/page/whats-new\", \"title\": \"Что нового\", \"sort_order\": \"4\"},\n    {\"url\": \"http://127.0.0.1:8000/page/terms-of-use\", \"title\": \"Условия использования\", \"sort_order\": \"5\"},\n    {\"url\": \"http://127.0.0.1:8000/page/terms-conditions\", \"title\": \"Условия и положения\", \"sort_order\": \"6\"}\n  ],\n  \"column_3\": [\n    {\"url\": \"http://127.0.0.1:8000/page/privacy-policy\", \"title\": \"Политика конфиденциальности\", \"sort_order\": \"1\"},\n    {\"url\": \"http://127.0.0.1:8000/page/payment-policy\", \"title\": \"Политика оплаты\", \"sort_order\": \"2\"},\n    {\"url\": \"http://127.0.0.1:8000/page/shipping-policy\", \"title\": \"Политика доставки\", \"sort_order\": \"3\"}\n  ],\n  \"column_4\": [\n    {\"url\": \"http://127.0.0.1:8000/page/refund-policy\", \"title\": \"Политика возврата средств\", \"sort_order\": \"4\"},\n    {\"url\": \"http://127.0.0.1:8000/page/return-policy\", \"title\": \"Политика возврата\", \"sort_order\": \"5\"}\n  ]\n}\n'),
(12,12,'ru','{\"services\":[{\"service_icon\":\"icon-truck\",\"description\":\"\\u041d\\u0430\\u0441\\u043b\\u0430\\u0436\\u0434\\u0430\\u0439\\u0442\\u0435\\u0441\\u044c \\u0431\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e\\u0439 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u043e\\u0439 \\u043d\\u0430 \\u0432\\u0441\\u0435 \\u0437\\u0430\\u043a\\u0430\\u0437\\u044b\",\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\"},{\"service_icon\":\"icon-product\",\"description\":\"\\u0414\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u0430 \\u043b\\u0435\\u0433\\u043a\\u0430\\u044f \\u0437\\u0430\\u043c\\u0435\\u043d\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430!\",\"title\":\"\\u0417\\u0430\\u043c\\u0435\\u043d\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430\"},{\"service_icon\":\"icon-dollar-sign\",\"description\":\"\\u041c\\u044b \\u043e\\u0431\\u0435\\u0449\\u0430\\u0435\\u043c \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u0438\\u0442\\u044c \\u043d\\u0430\\u0448\\u0438\\u043c \\u043a\\u043b\\u0438\\u0435\\u043d\\u0442\\u0430\\u043c \\u043b\\u0443\\u0447\\u0448\\u0438\\u0435 \\u0446\\u0435\\u043d\\u044b \\u043d\\u0430 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b. \\u041d\\u0435 \\u0443\\u043f\\u0443\\u0441\\u0442\\u0438\\u0442\\u0435 \\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c!\",\"title\":\"\\u0412\\u044b\\u0433\\u043e\\u0434\\u043d\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430\"}]}'),
(13,1,'en','{\"images\":[{\"title\":\"Go for shopping!\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/YcH6wUYK3W16Fyj1RX4QPtw0R6SbZ1y27DKrmTj6.webp\"},{\"title\":\"Go Go Go\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/hq6Mo3sxPYM69YGIAvkeIeLMHN152XhUcqSw4R5l.webp\"},{\"image\":\"storage\\/theme\\/1\\/iLguA3sHGwNNuDZvP3J74uGPSgy3Tu77U4MOEHIo.webp\",\"link\":\"\",\"title\":\"We love our clients!\"}]}'),
(15,3,'en','{\"filters\":{\"sort\":\"asc\",\"limit\":\"10\",\"parent_id\":\"1\"}}'),
(18,6,'en','{\"html\":\"<div class=\\\"features-grid\\\"> \\r\\n    <div class=\\\"feature-item\\\">\\r\\n        <img src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/6\\/0aQGO5c3tajnFk3kiiyQafivdUqRZo38YWV44Fo7.webp\\\" alt=\\\"Collections\\\">\\r\\n         <h3 class=\\\"feature-title\\\">Discover our new collections<\\/h3>\\r\\n\\r\\n    <\\/div>\\r\\n    <div class=\\\"feature-item\\\">\\r\\n        <img src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/10\\/HYShlwOY7C5dNeeSf3FFWuA8X0Sx5fZgPTkzqywM.webp\\\" alt=\\\"No limits\\\">\\r\\n         <h3 class=\\\"feature-title\\\">Order without limits<\\/h3>\\r\\n\\r\\n    <\\/div>\\r\\n    <div class=\\\"feature-item\\\">\\r\\n        <img src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/6\\/0aQGO5c3tajnFk3kiiyQafivdUqRZo38YWV44Fo7.webp\\\" alt=\\\"Special offers\\\">\\r\\n         <h3 class=\\\"feature-title\\\">Don\'t miss special offers<\\/h3>\\r\\n\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".features-grid {\\r\\n    display: grid;\\r\\n    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));\\r\\n    gap: 12px;\\r\\n    justify-items: center;\\r\\n    padding: 12px;\\r\\n    max-width: 1000px;\\r\\n    margin: 0 auto;\\r\\n}\\r\\n.feature-item {\\r\\n    text-align: center;\\r\\n    max-width: 260px;\\r\\n}\\r\\n.feature-item img {\\r\\n    width: 100%;\\r\\n    height: auto;\\r\\n    border-radius: 8px;\\r\\n    margin-bottom: 8px;\\r\\n    object-fit: cover;\\r\\n}\\r\\n.feature-title {\\r\\n    font-size: 15px;\\r\\n    font-weight: 500;\\r\\n    line-height: 1.2;\\r\\n    color: #060c3b;\\r\\n    font-family:\'DM Serif Display\', serif;\\r\\n    margin: 0;\\r\\n}\\r\\n.new-products {\\r\\n    font-size: 18px;\\r\\n    font-weight: 500;\\r\\n    color: #060c3b;\\r\\n    font-family:\'DM Serif Display\', serif;\\r\\n    text-align: center;\\r\\n    margin: 8px 0 0;\\r\\n    padding: 0;\\r\\n}\"}'),
(19,7,'en','{\"title\":\"Featured Products\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"12\",\"featured\":\"1\"}}'),
(21,9,'en','{\"title\":\"All Products\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"48\",\"new\":\"1\"}}'),
(22,10,'en','{\"html\":\"<div class=\\\"section-gap special-offers container\\\">\\r\\n    <div class=\\\"inline-col-wrapper\\\">\\r\\n        <div class=\\\"inline-col-image-wrapper\\\">\\r\\n            <img class=\\\"lazy\\\" data-src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/10\\/HYShlwOY7C5dNeeSf3FFWuA8X0Sx5fZgPTkzqywM.webp\\\">\\r\\n        <\\/div>\\r\\n        <div class=\\\"inline-col-content-wrapper\\\">\\r\\n             <h2 class=\\\"inline-col-title\\\">Don\'t miss our special offers!\\r\\n<\\/h2>\\r\\n\\r\\n            <p class=\\\"inline-col-description\\\">Unique discounts and promotions just for you! Hurry up to take advantage of limited offers and update your wardrobe at competitive prices.<\\/p>\\r\\n            <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View offers\\r\\n<\\/button>\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".section-gap {\\r\\n    margin-top:40px\\r\\n}\\r\\n.direction-ltr {\\r\\n    direction:ltr\\r\\n}\\r\\n.direction-rtl {\\r\\n    direction:rtl\\r\\n}\\r\\n.inline-col-wrapper {\\r\\n    display:grid;\\r\\n    grid-template-columns:auto 1fr;\\r\\n    grid-gap:60px;\\r\\n    align-items:center\\r\\n}\\r\\n.inline-col-wrapper .inline-col-image-wrapper {\\r\\n    overflow:hidden\\r\\n}\\r\\n.inline-col-wrapper .inline-col-image-wrapper img {\\r\\n    max-width:100%;\\r\\n    height:auto;\\r\\n    border-radius:16px;\\r\\n    text-indent:-9999px\\r\\n}\\r\\n.inline-col-wrapper .inline-col-content-wrapper {\\r\\n    display:flex;\\r\\n    flex-wrap:wrap;\\r\\n    gap:20px;\\r\\n    max-width:464px\\r\\n}\\r\\n.inline-col-wrapper .inline-col-content-wrapper .inline-col-title {\\r\\n    max-width:442px;\\r\\n    font-size:60px;\\r\\n    font-weight:400;\\r\\n    color:#060c3b;\\r\\n    line-height:70px;\\r\\n    font-family:DM Serif Display;\\r\\n    margin:0\\r\\n}\\r\\n.inline-col-wrapper .inline-col-content-wrapper .inline-col-description {\\r\\n    margin:0;\\r\\n    font-size:18px;\\r\\n    color:#6e6e6e;\\r\\n    font-family:Poppins\\r\\n}\\r\\n@media (max-width:991px) {\\r\\n    .inline-col-wrapper {\\r\\n        grid-template-columns:1fr;\\r\\n        grid-gap:16px\\r\\n    }\\r\\n    .inline-col-wrapper .inline-col-content-wrapper {\\r\\n        gap:10px\\r\\n    }\\r\\n}\\r\\n@media (max-width:768px) {\\r\\n    .inline-col-wrapper .inline-col-image-wrapper img {\\r\\n        max-width:100%;\\r\\n    }\\r\\n    .inline-col-wrapper .inline-col-content-wrapper {\\r\\n        max-width:100%;\\r\\n        justify-content:center;\\r\\n        text-align:center\\r\\n    }\\r\\n    .section-gap {\\r\\n        padding:0 30px;\\r\\n        gap:20px;\\r\\n        margin-top:24px\\r\\n    }\\r\\n    .bold-collections {\\r\\n        margin-top:32px;\\r\\n    }\\r\\n}\\r\\n@media (max-width:525px) {\\r\\n    .inline-col-wrapper .inline-col-content-wrapper {\\r\\n        gap:10px\\r\\n    }\\r\\n    .inline-col-wrapper .inline-col-content-wrapper .inline-col-title {\\r\\n        font-size:20px;\\r\\n        line-height:normal\\r\\n    }\\r\\n    .section-gap {\\r\\n        padding:0 15px;\\r\\n        gap:15px;\\r\\n        margin-top:10px\\r\\n    }\\r\\n    .bold-collections {\\r\\n        margin-top:28px;\\r\\n    }\\r\\n    .inline-col-description {\\r\\n        font-size:16px !important\\r\\n    }\\r\\n    .inline-col-wrapper {\\r\\n        grid-gap:15px\\r\\n    }\"}'),
(23,11,'en','{\n  \"column_1\": [\n    {\"url\":\"http://127.0.0.1:8000/page/about-us\",\"title\":\"About Us\",\"sort_order\":\"1\"},\n    {\"url\":\"http://127.0.0.1:8000/contact-us\",\"title\":\"Contact Us\",\"sort_order\":\"2\"},\n    {\"url\":\"http://127.0.0.1:8000/page/customer-service\",\"title\":\"Customer Service\",\"sort_order\":\"3\"}\n  ],\n  \"column_2\": [\n    {\"url\":\"http://127.0.0.1:8000/page/whats-new\",\"title\":\"What\'s New\",\"sort_order\":\"4\"},\n    {\"url\":\"http://127.0.0.1:8000/page/terms-of-use\",\"title\":\"Terms of Use\",\"sort_order\":\"5\"},\n    {\"url\":\"http://127.0.0.1:8000/page/terms-conditions\",\"title\":\"Terms & Conditions\",\"sort_order\":\"6\"}\n  ],\n  \"column_3\": [\n    {\"url\":\"http://127.0.0.1:8000/page/privacy-policy\",\"title\":\"Privacy Policy\",\"sort_order\":\"1\"},\n    {\"url\":\"http://127.0.0.1:8000/page/payment-policy\",\"title\":\"Payment Policy\",\"sort_order\":\"2\"},\n    {\"url\":\"http://127.0.0.1:8000/page/shipping-policy\",\"title\":\"Shipping Policy\",\"sort_order\":\"3\"}\n  ],\n  \"column_4\": [\n    {\"url\":\"http://127.0.0.1:8000/page/refund-policy\",\"title\":\"Refund Policy\",\"sort_order\":\"4\"},\n    {\"url\":\"http://127.0.0.1:8000/page/return-policy\",\"title\":\"Return Policy\",\"sort_order\":\"5\"}\n  ]\n}\n'),
(24,12,'en','{\"services\":[{\"service_icon\":\"icon-truck\",\"description\":\"Enjoy free shipping on all orders\",\"title\":\"Free Shipping\"},{\"service_icon\":\"icon-product\",\"description\":\"Easy Product Replacement Available!\",\"title\":\"Product Replace\"},{\"service_icon\":\"icon-dollar-sign\",\"description\":\"We promise to offer our customers the best prices on products. Don\'t miss out!\",\"title\":\"Great Price\"}]}'),
(25,13,'ru','{\"title\":\"\\u041d\\u043e\\u0432\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"48\",\"new\":\"1\"}}'),
(26,13,'en','{\"title\":\"New products\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"12\",\"new\":\"1\"}}'),
(33,18,'en','{\"html\":\"<div class=\\\"do-not-delete\\\"><\\/div>\",\"css\":\".do-not-delete {\\r\\n\\tpadding: 20px;\\r\\n}\"}'),
(34,18,'ru','{\"html\":\"<div><\\/div>\",\"css\":\"\"}');
/*!40000 ALTER TABLE `theme_customization_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customizations`
--

DROP TABLE IF EXISTS `theme_customizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_customizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(191) DEFAULT 'default',
  `type` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customizations_channel_id_foreign` (`channel_id`),
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customizations`
--

LOCK TABLES `theme_customizations` WRITE;
/*!40000 ALTER TABLE `theme_customizations` DISABLE KEYS */;
INSERT INTO `theme_customizations` VALUES
(1,'default','image_carousel','Карусель изображений',1,0,1,'2025-02-25 19:54:31','2025-06-07 16:22:18'),
(3,'default','category_carousel','Категории и коллекции',4,1,1,'2025-02-25 19:54:31','2025-06-07 16:27:49'),
(6,'default','static_content','Смелые коллекции',4,1,1,'2025-02-25 19:54:31','2025-06-10 11:43:07'),
(7,'default','product_carousel','Популярные товары',7,1,1,'2025-02-25 19:54:31','2025-02-28 12:53:24'),
(9,'default','product_carousel','Все товары',9,1,1,'2025-02-25 19:54:31','2025-02-28 13:38:58'),
(10,'default','static_content','Смелые коллекции',8,0,1,'2025-02-25 19:54:31','2025-06-07 16:55:11'),
(11,'default','footer_links','Ссылки внизу страницы',11,1,1,'2025-02-25 19:54:31','2025-06-01 16:55:41'),
(12,'default','services_content','Содержание услуг',12,1,1,'2025-02-25 19:54:31','2025-02-28 15:21:06'),
(13,'default','product_carousel','Новые товары',5,1,1,'2025-02-28 07:30:59','2025-06-07 17:38:46'),
(18,'default','static_content','search-DO NOT DELETE',2,1,1,'2025-06-01 16:38:28','2025-06-01 16:42:03'),
(20,'default','static_content','о Японии',4,0,1,'2025-06-04 16:14:43','2025-06-04 16:14:43');
/*!40000 ALTER TABLE `theme_customizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) DEFAULT NULL,
  `request` mediumtext DEFAULT NULL,
  `url` mediumtext DEFAULT NULL,
  `referer` mediumtext DEFAULT NULL,
  `languages` text DEFAULT NULL,
  `useragent` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `platform` text DEFAULT NULL,
  `browser` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `visitable_type` varchar(191) DEFAULT NULL,
  `visitable_id` bigint(20) unsigned DEFAULT NULL,
  `visitor_type` varchar(191) DEFAULT NULL,
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`),
  KEY `visits_channel_id_foreign` (`channel_id`),
  CONSTRAINT `visits_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `item_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_options`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_items`
--

DROP TABLE IF EXISTS `wishlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  KEY `wishlist_items_product_id_foreign` (`product_id`),
  KEY `wishlist_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_items`
--

LOCK TABLES `wishlist_items` WRITE;
/*!40000 ALTER TABLE `wishlist_items` DISABLE KEYS */;
INSERT INTO `wishlist_items` VALUES
(35,1,59,6,NULL,NULL,NULL,'2025-06-10 18:23:45','2025-06-10 18:23:45');
/*!40000 ALTER TABLE `wishlist_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-22 18:15:55
