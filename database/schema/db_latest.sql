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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(34,'order_billing',NULL,NULL,NULL,8,'idjfjnv','ndkdjf',NULL,'rkjfdkjf','pdfkoofkj','dlfkmf','dfkmfk','BY','129947','qdfkvf@kcvkdfk.com','375295996042',NULL,0,0,NULL,'2025-03-01 10:29:55','2025-03-01 10:29:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES
(1,'Example','admin@example.com','$2y$10$YxegFsNmvhIqD/XrOWKn9./AFl2RUOgUNuIPDradYIECcc5JMR33S','biW3Cht3CylGma6vTPgyT69fAeHvJS5WBHLuDFNNEizhKRZzZiOyn2wjW5LtCe5CCxw6ip3feQLGHyL2',1,1,NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(6,'dishes','Посуда',0,1);
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
(2,1,4),
(2,23,3),
(2,31,3),
(2,39,3),
(3,1,5),
(3,23,4),
(3,31,4),
(3,39,4),
(5,6,1),
(5,28,1),
(5,36,1),
(5,44,1),
(6,6,2),
(6,28,2),
(6,36,2),
(6,44,2),
(7,6,3),
(7,28,3),
(7,36,3),
(7,44,3),
(8,6,4),
(8,28,4),
(8,36,4),
(8,44,4),
(9,2,1),
(9,24,1),
(9,32,1),
(9,40,1),
(10,2,2),
(10,24,2),
(10,32,2),
(10,40,2),
(11,4,1),
(11,26,1),
(11,34,1),
(11,42,1),
(12,4,2),
(12,26,2),
(12,34,2),
(12,42,2),
(13,4,3),
(13,26,3),
(13,34,3),
(13,42,3),
(19,5,1),
(19,27,1),
(19,35,1),
(19,43,1),
(21,5,2),
(21,27,2),
(21,35,2),
(21,43,2),
(22,5,3),
(22,27,3),
(22,35,3),
(22,43,3),
(23,1,7),
(23,30,1),
(23,31,6),
(23,46,3),
(24,1,8),
(24,31,7),
(24,39,6),
(26,6,5),
(26,28,5),
(26,36,5),
(26,44,5),
(27,1,3),
(27,23,2),
(27,31,2),
(27,39,2),
(28,7,1),
(28,29,1),
(28,37,1),
(28,45,1),
(34,30,3),
(35,30,4),
(36,30,2),
(36,46,1),
(37,38,2),
(38,38,3),
(39,38,1),
(40,46,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(46,'osnovnoe',6,'Основное',1,4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES
(1,1,'ru','Красный'),
(2,2,'ru','Зеленый'),
(3,3,'ru','Желтый'),
(4,4,'ru','Черный'),
(5,5,'ru','Белый'),
(6,6,'ru','S'),
(7,7,'ru','M'),
(8,8,'ru','L'),
(9,9,'ru','XL'),
(10,1,'en','Red'),
(11,2,'en','Green'),
(12,3,'en','Yellow'),
(13,4,'en','Black'),
(14,5,'en','White'),
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
(91,46,'ru','Фарфор'),
(92,46,'en','Porcelain'),
(93,47,'ru','Керамика'),
(94,47,'en','Ceramics'),
(95,48,'ru','Стекло'),
(96,48,'en','Glass'),
(97,49,'ru','Дерево'),
(98,49,'en','Wood');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES
(1,23,'Красный',0,NULL),
(2,23,'Зеленый',1,NULL),
(3,23,'Желтый',2,NULL),
(4,23,'Черный',3,NULL),
(5,23,'Белый',4,NULL),
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
(46,40,'Фарфор',NULL,NULL),
(47,40,'Керамика',NULL,NULL),
(48,40,'Стекло',NULL,NULL),
(49,40,'Дерево',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(23,23,'ru','Цвет'),
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
(51,23,'en','Color'),
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
(79,40,'en','Material(dishes)'),
(80,40,'ru','Материал(посуда)');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(23,'color','Цвет','select','dropdown',NULL,NULL,26,1,0,1,0,1,1,0,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-27 08:57:26'),
(24,'size','Размер','select','dropdown',NULL,NULL,27,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-27 13:36:30'),
(26,'guest_checkout','Гостевой заказ','boolean',NULL,NULL,NULL,8,1,0,0,0,0,0,0,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(27,'product_number','Артикул','text',NULL,NULL,'1',2,0,1,0,0,0,0,1,0,0,NULL,0,'2025-02-25 19:54:31','2025-02-25 19:13:10'),
(28,'manage_stock','Управление запасами','boolean',NULL,NULL,NULL,1,0,0,0,0,0,0,1,0,0,1,0,'2025-02-25 19:54:31','2025-02-25 14:35:08'),
(34,'material','material','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 19:09:44','2025-02-27 20:59:45'),
(35,'jewelry_type','jewelry_type','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 19:38:29','2025-02-27 20:59:41'),
(36,'level_of_price','level_of_price','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 19:41:03','2025-02-27 20:59:31'),
(37,'for_home_product_type','for_home_product_type','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 20:38:19','2025-02-27 21:08:07'),
(38,'for_home_material','for_home_material','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 20:42:15','2025-02-27 21:32:03'),
(39,'for_home_level_of_price','for_home_level_of_price','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,NULL,0,'2025-02-27 20:44:41','2025-02-27 21:05:10'),
(40,'material_for_dishes','Материал(посуда)','select','dropdown',NULL,'',NULL,0,0,1,0,1,1,1,0,0,0,0,'2025-02-27 21:23:48','2025-02-27 21:23:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES
(18,'qqq@qqq.com','qqqqqqq','qqqqqqq','free_free',NULL,0,1,4.0000,NULL,'USD','USD','RUB','RUB',1200.0000,1200.0000,1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1200.0000,1200.0000,NULL,0,0,NULL,4,1,'2025-03-01 10:26:26','2025-03-01 10:29:57'),
(19,'qqq@qqq.com','qqqqqqq','qqqqqqq',NULL,NULL,0,1,4.0000,NULL,'USD','USD','RUB','USD',44.0000,4000.0000,44.0000,4000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,44.0000,4000.0000,NULL,0,1,NULL,4,1,'2025-03-01 10:32:37','2025-03-01 10:34:41'),
(20,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','RUB','USD',4.4000,400.0000,4.4000,400.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.4000,400.0000,NULL,1,1,NULL,NULL,1,'2025-03-01 10:50:39','2025-03-01 10:53:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES
(24,4,'sku-2','simple','Икебана \"Искусство цветочной аранжировки\"',NULL,700.0000,2800.0000,2800.0000,300.0000,300.0000,NULL,1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,300.0000,300.0000,1200.0000,1200.0000,NULL,NULL,41,18,NULL,NULL,'{\"product_id\":\"41\",\"is_buy_now\":\"0\",\"quantity\":1}','2025-03-01 10:26:26','2025-03-01 10:26:56'),
(25,4,'sku-4','simple','Японская подушка',NULL,300.0000,1200.0000,1200.0000,11.0000,1000.0000,NULL,44.0000,4000.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,11.0000,1000.0000,44.0000,4000.0000,NULL,NULL,42,19,NULL,NULL,'{\"quantity\":4,\"product_id\":42}','2025-03-01 10:32:37','2025-03-01 10:34:40'),
(26,1,'sju-125','simple','Японское ожерелье \"Сакура\"',NULL,20.0000,20.0000,20.0000,4.4000,400.0000,NULL,4.4000,400.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,4.4000,400.0000,4.4000,400.0000,NULL,NULL,38,20,NULL,NULL,'{\"product_id\":\"38\",\"is_buy_now\":\"0\",\"quantity\":1}','2025-03-01 10:50:39','2025-03-01 10:53:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
INSERT INTO `cart_payment` VALUES
(25,'cashondelivery','Cash On Delivery',18,'2025-03-01 10:29:40','2025-03-01 10:29:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
INSERT INTO `cart_shipping_rates` VALUES
(64,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,32,'2025-03-01 10:29:37','2025-03-01 10:29:37',18);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,1,NULL,1,'products_and_description',1,24,NULL,NULL,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(29,1,'category/29/cs8quWcW5IhYMyuwhm6ihIyF0vxN8mTwlxo2nW0K.webp',1,'products_and_description',12,13,1,NULL,NULL,'2025-02-27 16:35:22','2025-02-27 16:35:22'),
(30,1,'category/30/Ojg6n3GSqHTciaYhC0tb56Si8jCojUTv2JPq14dV.webp',1,'products_and_description',14,15,1,NULL,NULL,'2025-02-27 16:35:47','2025-02-27 16:35:47'),
(31,1,'category/31/Ly0QSaBygmvhcP7xatSXBVOlagYO2j3gYqGWxWOR.webp',1,'products_and_description',16,17,1,NULL,NULL,'2025-02-27 16:36:32','2025-02-27 16:36:32'),
(32,1,'category/32/vwzft0X7ScqNYX3AF8rG5FctlpUdLwfHoI8MLWUo.webp',1,'products_and_description',18,19,1,NULL,NULL,'2025-02-27 16:36:58','2025-02-27 16:37:19'),
(33,1,'category/33/120U0kSE4A94TJXwCfmysEW4fc0eWlTyFOtBp3ie.webp',1,'products_and_description',20,21,1,NULL,NULL,'2025-02-27 16:41:01','2025-02-27 16:41:01'),
(35,1,'category/35/anBfVL4aGFne3pi0s6D0xkCNAk2UDAs1jBsNYnfV.webp',1,'products_and_description',22,23,1,NULL,NULL,'2025-02-27 19:23:54','2025-02-27 19:23:54');
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
(29,11),
(30,11),
(31,11),
(32,11),
(32,23),
(33,11),
(35,11),
(35,23),
(35,34),
(35,35),
(35,36),
(29,23),
(29,37),
(29,38),
(29,39),
(30,23),
(30,36),
(30,40);
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES
(1,1,'Корень','root','','Описание корневой категории','','','',NULL,'ru'),
(2,1,'Root','root','','Root Category Description','','','',NULL,'en'),
(57,29,'Для дома','for-house','','<p>Для дома</p>','','','',1,'ru'),
(58,29,'For home','for-home','','<p>For home</p>','','','',2,'en'),
(59,30,'Посуда','dish','','<p>Посуда</p>','','','',1,'ru'),
(60,30,'Dish','dish','','<p>Dish</p>','','','',2,'en'),
(61,31,'Аксессуары','accesories','','<p>Акссесуары</p>','','','',1,'ru'),
(62,31,'Accessories','accessories','','<p>Accessories</p>','','','',2,'en'),
(63,32,'Игрушки','toys','','<p>Игрушки</p>','','','',1,'ru'),
(64,32,'Toys','toys','','<p>Toys</p>','','','',2,'en'),
(65,33,'Аниме','anime','','<p>Аниме</p>','','','',1,'ru'),
(66,33,'Anime','anime','','<p>Anime</p>','','','',2,'en'),
(69,35,'Украшения','jewelry','','<p>Украшения</p>','','','',1,'ru'),
(70,35,'Jewelry','jewelry','','<p>Jewelry</p>','','','',2,'en');
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
(1,'О нас','about-us','<div>adsadjasjdas\r\n<div>&nbsp;</div>\r\n</div>','about us','','aboutus','ru',1),
(2,'Политика возврата','return-policy','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Политика возврата\"</div></div>','return policy','','return, policy','ru',2),
(3,'Политика возврата','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Политика возврата\"</div></div>','Refund policy','','refund, policy','ru',3),
(4,'Условия и положения','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Условия и положения\"</div></div>','Terms & Conditions','','term, conditions','ru',4),
(5,'Условия использования','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Условия использования\"</div></div>','Terms of use','','term, use','ru',5),
(6,'Служба поддержки клиентов','customer-service','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Служба поддержки клиентов\"</div></div>','Customer Service','','customer, service','ru',7),
(7,'Что нового','whats-new','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Что нового\"</div></div>','What\'s New','','new','ru',8),
(8,'Политика оплаты','payment-policy','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Политика оплаты\"</div></div>','Payment Policy','','payment, policy','ru',9),
(9,'Политика доставки','shipping-policy','<div class=\"static-container\"><div class=\"mb-5\">Содержание страницы \"Политика доставки\"</div></div>','Shipping Policy','','shipping, policy','ru',10),
(10,'Политика конфиденциальности','privacy-policy','<div class=\"static-container\">\r\n<div class=\"mb-5\">Содержание страницы \"Политика конфиденциальности\"</div>\r\n</div>','Privacy Policy','','privacy, policy','ru',11),
(11,'About Us','about-us','<div class=\"static-container\"><div class=\"mb-5\">About Us Page Content</div></div>','about us','','aboutus','en',1),
(12,'Return Policy','return-policy','<div class=\"static-container\"><div class=\"mb-5\">Return Policy Page Content</div></div>','return policy','','return, policy','en',2),
(13,'Refund Policy','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Refund Policy Page Content</div></div>','Refund policy','','refund, policy','en',3),
(14,'Terms & Conditions','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Terms & Conditions Page Content</div></div>','Terms & Conditions','','term, conditions','en',4),
(15,'Terms of Use','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Terms of Use Page Content</div></div>','Terms of use','','term, use','en',5),
(16,'Customer Service','customer-service','<div class=\"static-container\"><div class=\"mb-5\">Customer Service Page Content</div></div>','Customer Service','','customer, service','en',7),
(17,'What\'s New','whats-new','<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>','What\'s New','','new','en',8),
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
(8,NULL,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notes`
--

LOCK TABLES `customer_notes` WRITE;
/*!40000 ALTER TABLE `customer_notes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES
(3,'1111','1111',NULL,NULL,'111@111.com',NULL,NULL,1,'$2y$10$Nanuf7jwQt0Tg8AI2uJNf.Rn5hP3JMfAgLGiJsKWkswXlrj4N0K8S','OqOq7OagSplT76OuKE3iNSeD649mjqQBvVZVJ2qurMhgGxxmujknLTZ66WvfLlw6EzE7Hfm3Lpbq0Xk3',1,1,0,1,0,'aa08384dec3ed1bec98f62578edb0253',NULL,'2025-03-01 10:25:20','2025-03-01 10:25:20'),
(4,'qqqqqqq','qqqqqqq',NULL,NULL,'qqq@qqq.com',NULL,NULL,1,'$2y$10$2fd8xsY9JHSdLsVrjj9Jt.7CzTvpQJFSNOfX6wKgqNjB/tS341Kku','raG7hPHvTAfIKDg6USFTGcVn3DIocUbAZUqPTChr2tKptultJ73ZawekTkNmkHoL8K6yLPaPVxkmh56x',1,1,0,1,0,'bbab823b8387f4f7a629684450b17cd6',NULL,'2025-03-01 10:26:06','2025-03-01 10:26:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES
(12,'sku-2','simple','Икебана \"Искусство цветочной аранжировки\"',NULL,700.0000,2800.0000,4,4,0,4,0,300.0000,300.0000,1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,300.0000,300.0000,1200.0000,1200.0000,41,'Sakura\\Product\\Models\\Product',8,NULL,NULL,'{\"product_id\":\"41\",\"is_buy_now\":\"0\",\"quantity\":1,\"locale\":\"ru\"}','2025-03-01 10:29:55','2025-03-01 10:37:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
INSERT INTO `order_payment` VALUES
(8,8,'cashondelivery','Cash On Delivery',NULL,'2025-03-01 10:29:55','2025-03-01 10:29:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(8,'1','canceled','По умолчанию',0,'qqq@qqq.com','qqqqqqq','qqqqqqq','free_free','Free Shipping - Free Shipping','Free Shipping',NULL,0,1,4,'USD','RUB','RUB',1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,1200.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1200.0000,1200.0000,0.0000,0.0000,4,'Sakura\\Customer\\Models\\Customer',1,'Sakura\\Core\\Models\\Channel',18,NULL,'2025-03-01 10:29:55','2025-03-01 10:37:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(772,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,35,23,'35|23'),
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
(799,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,36,23,'36|23'),
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
(826,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,37,23,'37|23'),
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
(853,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,38,23,'38|23'),
(854,NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,38,34,'38|34'),
(855,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,NULL,38,35,'38|35'),
(856,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,NULL,38,36,'38|36'),
(857,NULL,NULL,NULL,NULL,NULL,400.0000,NULL,NULL,NULL,38,11,'38|11'),
(858,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,12,'38|12'),
(859,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,13,'38|13'),
(862,NULL,NULL,'200',NULL,NULL,NULL,NULL,NULL,NULL,40,19,'40|19'),
(863,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,40,21,'40|21'),
(864,NULL,NULL,'400',NULL,NULL,NULL,NULL,NULL,NULL,40,22,'40|22'),
(865,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,40,28,'40|28'),
(868,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,40,5,'40|5'),
(869,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,40,6,'40|6'),
(870,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,40,7,'40|7'),
(871,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,40,8,'default|40|8'),
(872,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,40,26,'40|26'),
(873,NULL,NULL,'sku-1',NULL,NULL,NULL,NULL,NULL,NULL,40,1,'40|1'),
(874,'ru',NULL,'Татами \"Традиция Японии\"',NULL,NULL,NULL,NULL,NULL,NULL,40,2,'ru|40|2'),
(875,'ru',NULL,'татами-традиция-японии',NULL,NULL,NULL,NULL,NULL,NULL,40,3,'ru|40|3'),
(876,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,40,23,'40|23'),
(877,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,40,27,'40|27'),
(878,'ru',NULL,'<p>Аутентичный японский татами, созданный из натуральных материалов для уюта и гармонии в вашем доме.</p>',NULL,NULL,NULL,NULL,NULL,NULL,40,9,'ru|40|9'),
(879,'ru',NULL,'<p>Татами \"Традиция Японии\" &mdash; это классический элемент японского интерьера, выполненный из высококачественного рисового соломы и обтянутый прочной текстильной наволочкой. Этот экологически чистый продукт не только красив, но и функционален: татами прекрасно регулирует уровень влажности и обеспечивает отличную теплоизоляцию.</p>\r\n<p>Идеален для создания традиционной японской атмосферы в любой комнате, татами подходит как для гостиной, так и для спальни. Его натуральные материалы способствуют расслаблению и создают уютное пространство для отдыха.</p>\r\n<p>Каждый татами тщательно изготовлен вручную, что гарантирует его долговечность и уникальность. Вы можете комбинировать несколько татами для создания собственного стиля или использовать их в сочетании с традиционной японской мебелью. Татами \"Традиция Японии\" &mdash; это не просто элемент декора, а настоящая часть японской культуры, которая привнесет в ваш дом атмосферу спокойствия и гармонии.</p>',NULL,NULL,NULL,NULL,NULL,NULL,40,10,'ru|40|10'),
(880,NULL,NULL,NULL,NULL,37,NULL,NULL,NULL,NULL,40,37,'40|37'),
(881,NULL,NULL,NULL,NULL,41,NULL,NULL,NULL,NULL,40,38,'40|38'),
(882,NULL,NULL,NULL,NULL,44,NULL,NULL,NULL,NULL,40,39,'40|39'),
(883,NULL,NULL,NULL,NULL,NULL,1000.0000,NULL,NULL,NULL,40,11,'40|11'),
(884,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,12,'40|12'),
(885,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,13,'40|13'),
(888,NULL,NULL,'50',NULL,NULL,NULL,NULL,NULL,NULL,41,19,'41|19'),
(889,NULL,NULL,'50',NULL,NULL,NULL,NULL,NULL,NULL,41,21,'41|21'),
(890,NULL,NULL,'700',NULL,NULL,NULL,NULL,NULL,NULL,41,22,'41|22'),
(891,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,41,28,'41|28'),
(894,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,41,5,'41|5'),
(895,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,41,6,'41|6'),
(896,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,41,7,'41|7'),
(897,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,41,8,'default|41|8'),
(898,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,41,26,'41|26'),
(899,NULL,NULL,'sku-2',NULL,NULL,NULL,NULL,NULL,NULL,41,1,'41|1'),
(900,'ru',NULL,'Икебана \"Искусство цветочной аранжировки\"',NULL,NULL,NULL,NULL,NULL,NULL,41,2,'ru|41|2'),
(901,'ru',NULL,'икебана-искусство-цветочнои-аранжировки',NULL,NULL,NULL,NULL,NULL,NULL,41,3,'ru|41|3'),
(902,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,41,23,'41|23'),
(903,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,41,27,'41|27'),
(904,'ru',NULL,'<p>Традиционная японская икебана, представляющая собой гармоничную композицию из живых цветов и зелени.</p>',NULL,NULL,NULL,NULL,NULL,NULL,41,9,'ru|41|9'),
(905,'ru',NULL,'<p>Икебана \"Искусство цветочной аранжировки\" &mdash; это уникальная форма флористического искусства, возникшая в Японии, которая подчеркивает красоту природы и стремление к гармонии. В отличие от обычных букетов, икебана акцентирует внимание на форме, линии и пространстве, создавая эстетически привлекательные композиции.</p>\r\n<p>Основными компонентами икебаны являются свежие цветы, ветви, листья и иногда даже природные элементы, такие как камни или вода. Каждая композиция создается с учетом принципов симметрии и асимметрии, а также с использованием различных техник, таких как \"shin\", \"soe\" и \"hikae\", которые определяют положение и высоту элементов.</p>\r\n<p>Икебана не только украшает интерьер, но и служит способом самовыражения, медитации и гармонизации пространства. Она может быть оформлена в различных стилях &mdash; от традиционных до современных, что делает ее универсальным элементом декора для любого дома. Икебана \"Искусство цветочной аранжировки\" станет прекрасным подарком или акцентом в вашем интерьере, придавая ему уникальность и изящество.</p>',NULL,NULL,NULL,NULL,NULL,NULL,41,10,'ru|41|10'),
(906,NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,NULL,41,37,'41|37'),
(907,NULL,NULL,NULL,NULL,43,NULL,NULL,NULL,NULL,41,39,'41|39'),
(908,NULL,NULL,NULL,NULL,NULL,300.0000,NULL,NULL,NULL,41,11,'41|11'),
(909,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,12,'41|12'),
(910,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,13,'41|13'),
(913,NULL,NULL,'100',NULL,NULL,NULL,NULL,NULL,NULL,42,19,'42|19'),
(914,NULL,NULL,'30',NULL,NULL,NULL,NULL,NULL,NULL,42,21,'42|21'),
(915,NULL,NULL,'300',NULL,NULL,NULL,NULL,NULL,NULL,42,22,'42|22'),
(916,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,42,28,'42|28'),
(919,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,42,5,'42|5'),
(920,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,42,6,'42|6'),
(921,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,42,7,'42|7'),
(922,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,42,8,'default|42|8'),
(923,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,42,26,'42|26'),
(924,NULL,NULL,'sku-4',NULL,NULL,NULL,NULL,NULL,NULL,42,1,'42|1'),
(925,'ru',NULL,'Японская подушка',NULL,NULL,NULL,NULL,NULL,NULL,42,2,'ru|42|2'),
(926,'ru',NULL,'японская-подушка',NULL,NULL,NULL,NULL,NULL,NULL,42,3,'ru|42|3'),
(927,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,42,23,'42|23'),
(928,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,42,27,'42|27'),
(929,'ru',NULL,'<h1 class=\"product_title entry-title nectar-inherit-default\">&nbsp;подушка из японской гречневой лузги</h1>',NULL,NULL,NULL,NULL,NULL,NULL,42,9,'ru|42|9'),
(930,'ru',NULL,'<p>Подушка и наволочка из гречневой лузги японской Sobagara светло-голубого цвета. Изготовлена ​​высококвалифицированным японским мастером из гречневой лузги, произведенной в Японии. Обеспечивает надежную поддержку спины и шеи. Подушка из гречневой лузги использовалась в Японии на протяжении столетий из-за ее воздухопроницаемости и гигиеничности. Наволочка из 100% хлопка. Использование: как подушка, так и в качестве подушки (см. фотографии).</p>',NULL,NULL,NULL,NULL,NULL,NULL,42,10,'ru|42|10'),
(931,NULL,NULL,NULL,NULL,39,NULL,NULL,NULL,NULL,42,37,'42|37'),
(932,NULL,NULL,NULL,NULL,44,NULL,NULL,NULL,NULL,42,39,'42|39'),
(933,NULL,NULL,NULL,NULL,NULL,1000.0000,NULL,NULL,NULL,42,11,'42|11'),
(934,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,12,'42|12'),
(935,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,13,'42|13'),
(938,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL,43,19,'43|19'),
(939,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,43,21,'43|21'),
(940,NULL,NULL,'300',NULL,NULL,NULL,NULL,NULL,NULL,43,22,'43|22'),
(941,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,43,28,'43|28'),
(944,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,43,5,'43|5'),
(945,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,43,6,'43|6'),
(946,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,43,7,'43|7'),
(947,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,43,8,'default|43|8'),
(948,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,43,26,'43|26'),
(949,NULL,NULL,'sku-5',NULL,NULL,NULL,NULL,NULL,NULL,43,1,'43|1'),
(950,'ru',NULL,'Ретро китайская и японская керамическая миска для супа и риса, расписанная вручную',NULL,NULL,NULL,NULL,NULL,NULL,43,2,'ru|43|2'),
(951,'ru',NULL,'ретро-китаиская-и-японская-керамическая-миска-для-супа-и-риса-расписанная-вручную',NULL,NULL,NULL,NULL,NULL,NULL,43,3,'ru|43|3'),
(952,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,43,27,'43|27'),
(953,'ru',NULL,'<p>Элегантная керамическая миска с уникальным цветочным узором, идеально подходящая для подачи супов и риса.</p>',NULL,NULL,NULL,NULL,NULL,NULL,43,9,'ru|43|9'),
(954,'ru',NULL,'<p>Наша ретро-миска для супа и риса сочетает в себе элементы китайского и японского стилей, создавая гармоничную и элегантную посуду для вашего стола. Изготовленная из высококачественной керамики, она прочная и долговечная, что делает ее идеальной для повседневного использования.</p>\r\n<p>Каждая миска украшена расписанными вручную цветочными мотивами, что делает ее уникальной и очаровательной. Яркие и живые цвета делают ее не только функциональной, но и стильным элементом декора. Эта миска отлично подходит для подачи самых разных блюд, от горячих супов до риса и салатов.</p>\r\n<p>Кроме того, она станет прекрасным подарком для любителей кулинарии и ценителей искусства. Добавьте нотку восточной элегантности к своим блюдам с помощью нашей расписанной вручную керамической миски.</p>',NULL,NULL,NULL,NULL,NULL,NULL,43,10,'ru|43|10'),
(955,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,43,23,'43|23'),
(956,NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,43,36,'43|36'),
(957,NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,NULL,43,40,'43|40'),
(958,NULL,NULL,NULL,NULL,NULL,1000.0000,NULL,NULL,NULL,43,11,'43|11'),
(959,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,12,'43|12'),
(960,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,13,'43|13'),
(963,NULL,NULL,'100',NULL,NULL,NULL,NULL,NULL,NULL,44,19,'44|19'),
(964,NULL,NULL,'75',NULL,NULL,NULL,NULL,NULL,NULL,44,21,'44|21'),
(965,NULL,NULL,'400',NULL,NULL,NULL,NULL,NULL,NULL,44,22,'44|22'),
(966,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,44,28,'44|28'),
(969,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,44,5,'44|5'),
(970,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,44,6,'44|6'),
(971,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,44,7,'44|7'),
(972,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,44,8,'default|44|8'),
(973,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,44,26,'44|26'),
(974,NULL,NULL,'sku-10',NULL,NULL,NULL,NULL,NULL,NULL,44,1,'44|1'),
(975,'ru',NULL,'Чайник \"Сейгайха\" с синими волнами',NULL,NULL,NULL,NULL,NULL,NULL,44,2,'ru|44|2'),
(976,'ru',NULL,'чаиник-сеигаиха-с-синими-волнами',NULL,NULL,NULL,NULL,NULL,NULL,44,3,'ru|44|3'),
(977,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,44,27,'44|27'),
(978,'ru',NULL,'<p>Элегантный японский чайник с дизайном в стиле \"сейгайха\", идеально подходящий для заваривания чая.</p>',NULL,NULL,NULL,NULL,NULL,NULL,44,9,'ru|44|9'),
(979,'ru',NULL,'<p>Чайник \"Сейгайха\" &mdash; это стильный и функциональный аксессуар для любителей японского чая. Объемом 23.7 фл. унций, он идеально подходит для заваривания чая для семьи или друзей.</p>\r\n<p>Дизайн в виде синих волн символизирует спокойствие и гармонию, что делает этот чайник не только практичным, но и красивым элементом вашего интерьера. Изготовленный из высококачественной керамики, он обеспечивает равномерное нагревание и сохранение температуры чая.</p>\r\n<p>Чайник снабжен удобной ручкой и изливом, что облегчает наливание. Он станет прекрасным дополнением к чайной церемонии или уютному чаепитию, а также отличным подарком для ценителей японской культуры. Откройте для себя наслаждение настоящим японским чаем с чайником \"Сейгайха\"!</p>',NULL,NULL,NULL,NULL,NULL,NULL,44,10,'ru|44|10'),
(980,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,44,23,'44|23'),
(981,NULL,NULL,NULL,NULL,36,NULL,NULL,NULL,NULL,44,36,'44|36'),
(982,NULL,NULL,NULL,NULL,46,NULL,NULL,NULL,NULL,44,40,'44|40'),
(983,NULL,NULL,NULL,NULL,NULL,2000.0000,NULL,NULL,NULL,44,11,'44|11'),
(984,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,12,'44|12'),
(985,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,13,'44|13'),
(990,'en',NULL,'Jade bracelet made of wood 5 mm, 108 Lignum vitae beads',NULL,NULL,NULL,NULL,NULL,NULL,35,2,'en|35|2'),
(991,'en',NULL,'jade-bracelet-made-of-wood-5-mm-108-lignum-vitae-beads',NULL,NULL,NULL,NULL,NULL,NULL,35,3,'en|35|3'),
(992,'en',NULL,'<p><strong><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Jadeite bracelet made from Lignum vitae wood</span></span></strong></p>',NULL,NULL,NULL,NULL,NULL,NULL,35,9,'en|35|9'),
(993,'en',NULL,'<p><strong><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">About Lignum Vitae&nbsp;</span></span></strong></p>\r\n<p><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Lignum vitae comes from Latin and means \"tree of life\" or \"tree of life\" due to its wide range of medicinal uses. This wood is one of the heaviest and hardest, and its strength makes it ideal for many uses. It has the ability to change color to a deeper green.</span></span></p>\r\n<p><strong><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">About jadeite</span></span></span></strong><span data-preserver-spaces=\"true\">&nbsp;</span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Jadeite was especially prized by the Chinese, who used this gemstone for a variety of purposes. Firstly, jadeite is believed to give you physical strength, thereby increasing longevity. Secondly, it is said to help you fight negative energy. According to Feng Shui, jadeite can also influence prosperity.&nbsp;</span></span></span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">In Japan, Buddhists have rosaries (juju, nenju). Kyoto is a famous center for the production of rosaries.</span></span></span></p>\r\n<p><strong><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Service</span></span></span></strong></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Remove before showering and sleeping. The material is sensitive to chemicals and excessive sweating. We recommend removing it when exercising or cleaning. Wipe with a soft cloth.</span></span></span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">※ The color may differ from the actual one depending on the color rendering of the monitor.</span></span></span></p>\r\n<p><span data-preserver-spaces=\"true\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">※Import duties, taxes and charges are not included in the item price or shipping charges. These charges are the buyer\'s responsibility. </span></span><br><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">Please check with your country\'s customs office to determine what these additional costs will be prior to bidding/buying.</span></span></span></p>',NULL,NULL,NULL,NULL,NULL,NULL,35,10,'en|35|10'),
(996,'en',NULL,'Ikebana \"The Art of Flower Arrangement\"',NULL,NULL,NULL,NULL,NULL,NULL,41,2,'en|41|2'),
(997,'en',NULL,'ikebana-the-art-of-flower-arrangement',NULL,NULL,NULL,NULL,NULL,NULL,41,3,'en|41|3'),
(998,'en',NULL,'<p>Traditional Japanese ikebana, which is a harmonious composition of fresh flowers and greenery.</p>',NULL,NULL,NULL,NULL,NULL,NULL,41,9,'en|41|9'),
(999,'en',NULL,'<p>Ikebana \"The Art of Flower Arrangement\" is a unique form of floral art that originated in Japan, emphasizing the beauty of nature and the desire for harmony. Unlike traditional bouquets, Ikebana emphasizes form, line, and space, creating aesthetically pleasing compositions.</p>\r\n<p>The main components of Ikebana are fresh flowers, branches, leaves, and sometimes even natural elements such as rocks or water. Each composition is created taking into account the principles of symmetry and asymmetry, as well as using various techniques such as \"shin\", \"soe\" and \"hikae\", which determine the position and height of the elements.</p>\r\n<p>Ikebana not only decorates the interior, but also serves as a way of self-expression, meditation, and harmonization of space. It can be designed in various styles - from traditional to modern, which makes it a universal decor element for any home. Ikebana \"The Art of Flower Arrangement\" will be a wonderful gift or an accent in your interior, giving it uniqueness and elegance.</p>',NULL,NULL,NULL,NULL,NULL,NULL,41,10,'en|41|10'),
(1002,'en',NULL,'Seigaiha teapot with blue waves',NULL,NULL,NULL,NULL,NULL,NULL,44,2,'en|44|2'),
(1003,'en',NULL,'seigaiha-teapot-with-blue-waves',NULL,NULL,NULL,NULL,NULL,NULL,44,3,'en|44|3'),
(1004,'en',NULL,'<p>An elegant Japanese teapot with a seigaiha design, ideal for brewing tea.</p>',NULL,NULL,NULL,NULL,NULL,NULL,44,9,'en|44|9'),
(1005,'en',NULL,'<p>The Seigaiha teapot is a stylish and functional accessory for Japanese tea lovers. With a capacity of 23.7 fl. oz., it is ideal for brewing tea for family or friends.</p>\r\n<p>The blue wave design symbolizes calm and harmony, making this teapot not only practical, but also a beautiful element of your interior. Made of high-quality ceramics, it ensures uniform heating and maintains the temperature of the tea.</p>\r\n<p>The teapot is equipped with a comfortable handle and spout, which makes pouring easier. It will be a wonderful addition to a tea ceremony or a cozy tea party, as well as a great gift for connoisseurs of Japanese culture. Discover the pleasure of real Japanese tea with the Seigaiha teapot!</p>',NULL,NULL,NULL,NULL,NULL,NULL,44,10,'en|44|10'),
(1008,'en',NULL,'Japanese pillow',NULL,NULL,NULL,NULL,NULL,NULL,42,2,'en|42|2'),
(1009,'en',NULL,'japanese-pillow',NULL,NULL,NULL,NULL,NULL,NULL,42,3,'en|42|3'),
(1010,'en',NULL,'<h1 class=\"product_title entry-title nectar-inherit-default\">Japanese Buckwheat Husk Pillow</h1>',NULL,NULL,NULL,NULL,NULL,NULL,42,9,'en|42|9'),
(1011,'en',NULL,'<p>Japanese Sobagara buckwheat husk pillow and pillowcase in light blue. Made by highly skilled Japanese craftsman from buckwheat husk produced in Japan. Provides reliable back and neck support. Buckwheat husk pillow has been used in Japan for centuries due to its breathability and hygiene. Pillowcase made of 100% cotton. Use: both as a pillow and as a cushion (see photos).</p>',NULL,NULL,NULL,NULL,NULL,NULL,42,10,'en|42|10'),
(1014,'en',NULL,'Tatami \"Tradition of Japan\"',NULL,NULL,NULL,NULL,NULL,NULL,40,2,'en|40|2'),
(1015,'en',NULL,'tatami-tradition-of-japan',NULL,NULL,NULL,NULL,NULL,NULL,40,3,'en|40|3'),
(1016,'en',NULL,'<p>Authentic Japanese tatami, created from natural materials for comfort and harmony in your home.</p>',NULL,NULL,NULL,NULL,NULL,NULL,40,9,'en|40|9'),
(1017,'en',NULL,'<p>Tatami \"Tradition of Japan\" is a classic element of Japanese interior, made of high-quality rice straw and covered with a durable textile pillowcase. This eco-friendly product is not only beautiful, but also functional: tatami perfectly regulates humidity levels and provides excellent thermal insulation.</p>\r\n<p>Ideal for creating a traditional Japanese atmosphere in any room, tatami is suitable for both the living room and the bedroom. Its natural materials promote relaxation and create a cozy space for rest.</p>\r\n<p>Each tatami is carefully handcrafted, which guarantees its durability and uniqueness. You can combine several tatami to create your own style or use them in combination with traditional Japanese furniture. Tatami \"Tradition of Japan\" is not just a decorative element, but a real part of Japanese culture that will bring an atmosphere of peace and harmony to your home.</p>',NULL,NULL,NULL,NULL,NULL,NULL,40,10,'en|40|10'),
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
(1038,'en',NULL,'Retro Chinese and Japanese Ceramic Hand Painted Soup Rice Bowl',NULL,NULL,NULL,NULL,NULL,NULL,43,2,'en|43|2'),
(1039,'en',NULL,'retro-chinese-and-japanese-ceramic-hand-painted-soup-rice-bowl',NULL,NULL,NULL,NULL,NULL,NULL,43,3,'en|43|3'),
(1040,'en',NULL,'<p>An elegant ceramic bowl with a unique floral pattern, ideal for serving soups and rice.</p>',NULL,NULL,NULL,NULL,NULL,NULL,43,9,'en|43|9'),
(1041,'en',NULL,'<p>Our retro soup and rice bowl combines elements of Chinese and Japanese styles to create a harmonious and elegant tableware for your table. Made from high-quality ceramic, it is durable and long-lasting, making it ideal for everyday use.</p>\r\n<p>Each bowl is decorated with hand-painted floral motifs, making it unique and charming. The bright and vivid colors make it not only functional, but also a stylish decorative element. This bowl is great for serving a variety of dishes, from hot soups to rice and salads.</p>\r\n<p>It also makes a wonderful gift for food lovers and art lovers. Add a touch of oriental elegance to your dishes with our hand-painted ceramic bowl.</p>',NULL,NULL,NULL,NULL,NULL,NULL,43,10,'en|43|10');
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
(40,29),
(41,29),
(42,29),
(43,30),
(44,30);
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
(40,1),
(41,1),
(42,1),
(43,1),
(44,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(79,'sku-1','simple','','Татами \"Традиция Японии\"','<p>Аутентичный японский татами, созданный из натуральных материалов для уюта и гармонии в вашем доме.</p>','<p>Татами \"Традиция Японии\" &mdash; это классический элемент японского интерьера, выполненный из высококачественного рисового соломы и обтянутый прочной текстильной наволочкой. Этот экологически чистый продукт не только красив, но и функционален: татами прекрасно регулирует уровень влажности и обеспечивает отличную теплоизоляцию.</p>\r\n<p>Идеален для создания традиционной японской атмосферы в любой комнате, татами подходит как для гостиной, так и для спальни. Его натуральные материалы способствуют расслаблению и создают уютное пространство для отдыха.</p>\r\n<p>Каждый татами тщательно изготовлен вручную, что гарантирует его долговечность и уникальность. Вы можете комбинировать несколько татами для создания собственного стиля или использовать их в сочетании с традиционной японской мебелью. Татами \"Традиция Японии\" &mdash; это не просто элемент декора, а настоящая часть японской культуры, которая привнесет в ваш дом атмосферу спокойствия и гармонии.</p>','татами-традиция-японии',1,1,1,'','',NULL,1000.0000,NULL,NULL,NULL,400.0000,'2025-02-27 23:54:46','ru','default',5,40,'2025-02-28 15:51:20',NULL,1),
(80,'sku-1','simple','','Tatami \"Tradition of Japan\"','<p>Authentic Japanese tatami, created from natural materials for comfort and harmony in your home.</p>','<p>Tatami \"Tradition of Japan\" is a classic element of Japanese interior, made of high-quality rice straw and covered with a durable textile pillowcase. This eco-friendly product is not only beautiful, but also functional: tatami perfectly regulates humidity levels and provides excellent thermal insulation.</p>\r\n<p>Ideal for creating a traditional Japanese atmosphere in any room, tatami is suitable for both the living room and the bedroom. Its natural materials promote relaxation and create a cozy space for rest.</p>\r\n<p>Each tatami is carefully handcrafted, which guarantees its durability and uniqueness. You can combine several tatami to create your own style or use them in combination with traditional Japanese furniture. Tatami \"Tradition of Japan\" is not just a decorative element, but a real part of Japanese culture that will bring an atmosphere of peace and harmony to your home.</p>','tatami-tradition-of-japan',1,1,1,'','',NULL,1000.0000,NULL,NULL,NULL,400.0000,'2025-02-27 23:54:46','en','default',5,40,'2025-02-28 15:51:20',NULL,1),
(81,'sku-2','simple','','Икебана \"Искусство цветочной аранжировки\"','<p>Традиционная японская икебана, представляющая собой гармоничную композицию из живых цветов и зелени.</p>','<p>Икебана \"Искусство цветочной аранжировки\" &mdash; это уникальная форма флористического искусства, возникшая в Японии, которая подчеркивает красоту природы и стремление к гармонии. В отличие от обычных букетов, икебана акцентирует внимание на форме, линии и пространстве, создавая эстетически привлекательные композиции.</p>\r\n<p>Основными компонентами икебаны являются свежие цветы, ветви, листья и иногда даже природные элементы, такие как камни или вода. Каждая композиция создается с учетом принципов симметрии и асимметрии, а также с использованием различных техник, таких как \"shin\", \"soe\" и \"hikae\", которые определяют положение и высоту элементов.</p>\r\n<p>Икебана не только украшает интерьер, но и служит способом самовыражения, медитации и гармонизации пространства. Она может быть оформлена в различных стилях &mdash; от традиционных до современных, что делает ее универсальным элементом декора для любого дома. Икебана \"Искусство цветочной аранжировки\" станет прекрасным подарком или акцентом в вашем интерьере, придавая ему уникальность и изящество.</p>','икебана-искусство-цветочнои-аранжировки',1,1,1,'','',NULL,300.0000,NULL,NULL,NULL,700.0000,'2025-02-28 00:01:39','ru','default',5,41,'2025-03-01 13:36:40',NULL,1),
(82,'sku-2','simple','','Ikebana \"The Art of Flower Arrangement\"','<p>Traditional Japanese ikebana, which is a harmonious composition of fresh flowers and greenery.</p>','<p>Ikebana \"The Art of Flower Arrangement\" is a unique form of floral art that originated in Japan, emphasizing the beauty of nature and the desire for harmony. Unlike traditional bouquets, Ikebana emphasizes form, line, and space, creating aesthetically pleasing compositions.</p>\r\n<p>The main components of Ikebana are fresh flowers, branches, leaves, and sometimes even natural elements such as rocks or water. Each composition is created taking into account the principles of symmetry and asymmetry, as well as using various techniques such as \"shin\", \"soe\" and \"hikae\", which determine the position and height of the elements.</p>\r\n<p>Ikebana not only decorates the interior, but also serves as a way of self-expression, meditation, and harmonization of space. It can be designed in various styles - from traditional to modern, which makes it a universal decor element for any home. Ikebana \"The Art of Flower Arrangement\" will be a wonderful gift or an accent in your interior, giving it uniqueness and elegance.</p>','ikebana-the-art-of-flower-arrangement',1,1,1,'','',NULL,300.0000,NULL,NULL,NULL,700.0000,'2025-02-28 00:01:39','en','default',5,41,'2025-03-01 13:36:40',NULL,1),
(83,'sku-4','simple','','Японская подушка','<h1 class=\"product_title entry-title nectar-inherit-default\">&nbsp;подушка из японской гречневой лузги</h1>','<p>Подушка и наволочка из гречневой лузги японской Sobagara светло-голубого цвета. Изготовлена ​​высококвалифицированным японским мастером из гречневой лузги, произведенной в Японии. Обеспечивает надежную поддержку спины и шеи. Подушка из гречневой лузги использовалась в Японии на протяжении столетий из-за ее воздухопроницаемости и гигиеничности. Наволочка из 100% хлопка. Использование: как подушка, так и в качестве подушки (см. фотографии).</p>','японская-подушка',0,1,1,'','',NULL,1000.0000,NULL,NULL,NULL,300.0000,'2025-02-28 00:12:23','ru','default',5,42,'2025-02-28 14:03:30',NULL,1),
(84,'sku-4','simple','','Japanese pillow','<h1 class=\"product_title entry-title nectar-inherit-default\">Japanese Buckwheat Husk Pillow</h1>','<p>Japanese Sobagara buckwheat husk pillow and pillowcase in light blue. Made by highly skilled Japanese craftsman from buckwheat husk produced in Japan. Provides reliable back and neck support. Buckwheat husk pillow has been used in Japan for centuries due to its breathability and hygiene. Pillowcase made of 100% cotton. Use: both as a pillow and as a cushion (see photos).</p>','japanese-pillow',0,1,1,'','',NULL,1000.0000,NULL,NULL,NULL,300.0000,'2025-02-28 00:12:23','en','default',5,42,'2025-02-28 14:03:30',NULL,1),
(85,'sku-5','simple','','Ретро китайская и японская керамическая миска для супа и риса, расписанная вручную','<p>Элегантная керамическая миска с уникальным цветочным узором, идеально подходящая для подачи супов и риса.</p>','<p>Наша ретро-миска для супа и риса сочетает в себе элементы китайского и японского стилей, создавая гармоничную и элегантную посуду для вашего стола. Изготовленная из высококачественной керамики, она прочная и долговечная, что делает ее идеальной для повседневного использования.</p>\r\n<p>Каждая миска украшена расписанными вручную цветочными мотивами, что делает ее уникальной и очаровательной. Яркие и живые цвета делают ее не только функциональной, но и стильным элементом декора. Эта миска отлично подходит для подачи самых разных блюд, от горячих супов до риса и салатов.</p>\r\n<p>Кроме того, она станет прекрасным подарком для любителей кулинарии и ценителей искусства. Добавьте нотку восточной элегантности к своим блюдам с помощью нашей расписанной вручную керамической миски.</p>','ретро-китаиская-и-японская-керамическая-миска-для-супа-и-риса-расписанная-вручную',0,1,1,'','',NULL,1000.0000,NULL,NULL,NULL,300.0000,'2025-02-28 00:29:43','ru','default',6,43,'2025-02-28 17:03:47',NULL,1),
(86,'sku-5','simple','','Retro Chinese and Japanese Ceramic Hand Painted Soup Rice Bowl','<p>An elegant ceramic bowl with a unique floral pattern, ideal for serving soups and rice.</p>','<p>Our retro soup and rice bowl combines elements of Chinese and Japanese styles to create a harmonious and elegant tableware for your table. Made from high-quality ceramic, it is durable and long-lasting, making it ideal for everyday use.</p>\r\n<p>Each bowl is decorated with hand-painted floral motifs, making it unique and charming. The bright and vivid colors make it not only functional, but also a stylish decorative element. This bowl is great for serving a variety of dishes, from hot soups to rice and salads.</p>\r\n<p>It also makes a wonderful gift for food lovers and art lovers. Add a touch of oriental elegance to your dishes with our hand-painted ceramic bowl.</p>','retro-chinese-and-japanese-ceramic-hand-painted-soup-rice-bowl',0,1,1,'','',NULL,1000.0000,NULL,NULL,NULL,300.0000,'2025-02-28 00:29:43','en','default',6,43,'2025-02-28 17:03:47',NULL,1),
(87,'sku-10','simple','','Чайник \"Сейгайха\" с синими волнами','<p>Элегантный японский чайник с дизайном в стиле \"сейгайха\", идеально подходящий для заваривания чая.</p>','<p>Чайник \"Сейгайха\" &mdash; это стильный и функциональный аксессуар для любителей японского чая. Объемом 23.7 фл. унций, он идеально подходит для заваривания чая для семьи или друзей.</p>\r\n<p>Дизайн в виде синих волн символизирует спокойствие и гармонию, что делает этот чайник не только практичным, но и красивым элементом вашего интерьера. Изготовленный из высококачественной керамики, он обеспечивает равномерное нагревание и сохранение температуры чая.</p>\r\n<p>Чайник снабжен удобной ручкой и изливом, что облегчает наливание. Он станет прекрасным дополнением к чайной церемонии или уютному чаепитию, а также отличным подарком для ценителей японской культуры. Откройте для себя наслаждение настоящим японским чаем с чайником \"Сейгайха\"!</p>','чаиник-сеигаиха-с-синими-волнами',0,1,1,'','',NULL,2000.0000,NULL,NULL,NULL,400.0000,'2025-02-28 00:35:22','ru','default',6,44,'2025-02-28 14:03:14',NULL,1),
(88,'sku-10','simple','','Seigaiha teapot with blue waves','<p>An elegant Japanese teapot with a seigaiha design, ideal for brewing tea.</p>','<p>The Seigaiha teapot is a stylish and functional accessory for Japanese tea lovers. With a capacity of 23.7 fl. oz., it is ideal for brewing tea for family or friends.</p>\r\n<p>The blue wave design symbolizes calm and harmony, making this teapot not only practical, but also a beautiful element of your interior. Made of high-quality ceramics, it ensures uniform heating and maintains the temperature of the tea.</p>\r\n<p>The teapot is equipped with a comfortable handle and spout, which makes pouring easier. It will be a wonderful addition to a tea ceremony or a cozy tea party, as well as a great gift for connoisseurs of Japanese culture. Discover the pleasure of real Japanese tea with the Seigaiha teapot!</p>','seigaiha-teapot-with-blue-waves',0,1,1,'','',NULL,2000.0000,NULL,NULL,NULL,400.0000,'2025-02-28 00:35:22','en','default',6,44,'2025-02-28 14:03:14',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(51,'images','product/40/CBy3ou3rKYwhrDyrmsBdf6Mk2Hfv9GeOEi3I0v8e.webp',40,1),
(52,'images','product/40/AIJhSqxuLGFZiCpsINdZi93AIgQaeJBlEEeqK19V.webp',40,2),
(53,'images','product/40/5ejp03TBY5QrIWBB8EHAKLbaJEkYLwKc1Xej9ln3.webp',40,3),
(54,'images','product/40/XDuwGMoYqsahh7PmmMuiUJSRluL4ZpOdYzNZJ6Uk.webp',40,4),
(55,'images','product/41/AkaDrpnqt3lBHv58fysaax5YxnSsqQXUjKxayuZ7.webp',41,1),
(56,'images','product/42/giYnrbDud9D7pGWMPjoHW3WTieOlqH6WIydGd7U6.webp',42,1),
(57,'images','product/42/CskoX2N93IxCXlK8aOfgJmKxs6Bgs7dabR00D9rT.webp',42,2),
(58,'images','product/42/q1J96k8u8n2BnZUraBCKkyyvUNnVmU7bC8cexNgi.webp',42,3),
(59,'images','product/43/GcLk6oaFgrTYqTZbXQ2rTQI78dQOZECtmB3AmgjI.webp',43,1),
(60,'images','product/43/Ltwjhj4Z8PyOErVkRAWP6Nu929kJFeVdmWzLcUzq.webp',43,2),
(61,'images','product/43/ci30K12wI5ZUelSaKhnAnhlPIeK5uSiB2RbGzrrp.webp',43,3),
(62,'images','product/44/df8iyUbz4ZMe1w9vBH3N9Mt27lhZtwrZ7AczfQgp.webp',44,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(31,100,40,0,1),
(32,100,41,0,1),
(33,100,42,0,1),
(34,100,43,0,1),
(35,100,44,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory_indices`
--

LOCK TABLES `product_inventory_indices` WRITE;
/*!40000 ALTER TABLE `product_inventory_indices` DISABLE KEYS */;
INSERT INTO `product_inventory_indices` VALUES
(30,100,35,1,NULL,NULL),
(31,100,36,1,NULL,'2025-02-28 14:04:05'),
(32,100,37,1,NULL,NULL),
(33,99,38,1,NULL,'2025-02-28 14:31:44'),
(34,100,40,1,NULL,NULL),
(35,100,41,1,NULL,'2025-03-01 10:37:30'),
(36,100,42,1,NULL,NULL),
(37,100,43,1,NULL,'2025-02-28 14:04:05'),
(38,100,44,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
INSERT INTO `product_ordered_inventories` VALUES
(5,1,38,1),
(6,0,36,1),
(7,0,43,1),
(8,0,41,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(100,40,1,1,1000.0000,1000.0000,1000.0000,1000.0000,NULL,NULL),
(101,40,2,1,1000.0000,1000.0000,1000.0000,1000.0000,NULL,NULL),
(102,40,3,1,1000.0000,1000.0000,1000.0000,1000.0000,NULL,NULL),
(103,41,1,1,300.0000,300.0000,300.0000,300.0000,NULL,NULL),
(104,41,2,1,300.0000,300.0000,300.0000,300.0000,NULL,NULL),
(105,41,3,1,300.0000,300.0000,300.0000,300.0000,NULL,NULL),
(106,42,1,1,1000.0000,1000.0000,1000.0000,1000.0000,NULL,NULL),
(107,42,2,1,1000.0000,1000.0000,1000.0000,1000.0000,NULL,NULL),
(108,42,3,1,1000.0000,1000.0000,1000.0000,1000.0000,NULL,NULL),
(109,43,1,1,1000.0000,1000.0000,1000.0000,1000.0000,NULL,NULL),
(110,43,2,1,1000.0000,1000.0000,1000.0000,1000.0000,NULL,NULL),
(111,43,3,1,1000.0000,1000.0000,1000.0000,1000.0000,NULL,NULL),
(112,44,1,1,2000.0000,2000.0000,2000.0000,2000.0000,NULL,NULL),
(113,44,2,1,2000.0000,2000.0000,2000.0000,2000.0000,NULL,NULL),
(114,44,3,1,2000.0000,2000.0000,2000.0000,2000.0000,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(40,'sku-1','simple',NULL,5,NULL,'2025-02-27 20:54:46','2025-02-27 20:54:46'),
(41,'sku-2','simple',NULL,5,NULL,'2025-02-27 21:01:39','2025-02-27 21:01:39'),
(42,'sku-4','simple',NULL,5,NULL,'2025-02-27 21:12:23','2025-02-27 21:12:23'),
(43,'sku-5','simple',NULL,6,NULL,'2025-02-27 21:29:43','2025-02-27 21:29:43'),
(44,'sku-10','simple',NULL,6,NULL,'2025-02-27 21:35:22','2025-02-27 21:35:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
INSERT INTO `search_terms` VALUES
(4,'Чайник \"Сейгайха\" с синими волнами Чайник \"Сейгайха\" с синими волнами',0,1,NULL,0,'ru',1,'2025-03-01 10:33:32','2025-03-01 10:33:32'),
(5,'Чайник \"Сейгайха\" с синими волнами',1,1,NULL,0,'ru',1,'2025-03-01 10:34:11','2025-03-01 10:34:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
INSERT INTO `shipment_items` VALUES
(6,'Икебана \"Искусство цветочной аранжировки\"',NULL,'sku-2',4,2800,300.0000,300.0000,1200.0000,1200.0000,300.0000,300.0000,41,'Sakura\\Product\\Models\\Product',12,4,'{\"product_id\":\"41\",\"is_buy_now\":\"0\",\"quantity\":1,\"locale\":\"ru\"}','2025-03-01 10:36:39','2025-03-01 10:36:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES
(4,NULL,4,2800,NULL,'kkkm','999',1,4,'Sakura\\Customer\\Models\\Customer',8,33,1,'По умолчанию','2025-03-01 10:36:39','2025-03-01 10:36:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customization_translations`
--

LOCK TABLES `theme_customization_translations` WRITE;
/*!40000 ALTER TABLE `theme_customization_translations` DISABLE KEYS */;
INSERT INTO `theme_customization_translations` VALUES
(1,1,'ru','{\"images\":[{\"title\":\"\\u0411\\u0435\\u0433\\u043e\\u043c \\u043a\\u0430\\u043a \\u043d\\u0430\\u0440\\u0443\\u0442\\u043e \\u0437\\u0430 \\u043f\\u043e\\u043a\\u0443\\u043f\\u043a\\u0430\\u043c\\u0438!\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/Sm4LuqGE4gdxB0sjpkSGAuk9cV1lYMKO8XqOX06j.webp\"},{\"title\":\"\\u041f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0448\\u0438 \\u043d\\u043e\\u0432\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b!\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/o57oVb2T05Gh0Ww6IoS8Ry09GDJ3HN3CEYVqR4x9.webp\"},{\"image\":\"storage\\/theme\\/1\\/a6H2hBrvQDHW6x0MRFx0BUhVY5L6sV7lkfYhkUTB.webp\",\"link\":\"\",\"title\":\"\\u041c\\u044b \\u043b\\u044e\\u0431\\u0438\\u043c \\u043d\\u0430\\u0448\\u0438\\u0445 \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439!\"}]}'),
(2,2,'ru','{\"html\":\"<div class=\\\"home-offer\\\"><h1>\\u0421\\u043a\\u0438\\u0434\\u043a\\u0430 \\u0434\\u043e 40% \\u043d\\u0430 \\u0432\\u0430\\u0448 \\u043f\\u0435\\u0440\\u0432\\u044b\\u0439 \\u0437\\u0430\\u043a\\u0430\\u0437! \\u041f\\u041e\\u041a\\u0423\\u041f\\u0410\\u0419\\u0422\\u0415 \\u0421\\u0415\\u0419\\u0427\\u0410\\u0421<\\/h1><\\/div>\",\"css\":\".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;padding-top: 10px;padding-bottom: 10px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;padding-top: 6px;padding-bottom: 6px;}}\"}'),
(3,3,'ru','{\"filters\":{\"parent_id\":1,\"sort\":\"asc\",\"limit\":10}}'),
(6,6,'ru','{\"html\":\"<div class=\\\"section-gap bold-collections container\\\">\\r\\n    <div class=\\\"inline-col-wrapper\\\">\\r\\n        <div class=\\\"inline-col-image-wrapper\\\">\\r\\n            <img class=\\\"lazy\\\" data-src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/6\\/0aQGO5c3tajnFk3kiiyQafivdUqRZo38YWV44Fo7.webp\\\">\\r\\n        <\\/div>\\r\\n        <div class=\\\"inline-col-content-wrapper\\\">\\r\\n             <h2 class=\\\"inline-col-title\\\">\\u041e\\u0442\\u043a\\u0440\\u043e\\u0439\\u0442\\u0435 \\u0434\\u043b\\u044f \\u0441\\u0435\\u0431\\u044f \\u043d\\u0430\\u0448\\u0438 \\u043d\\u043e\\u0432\\u044b\\u0435 \\u043f\\u043e\\u0441\\u0442\\u0443\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f!<\\/h2>\\r\\n\\r\\n            <p class=\\\"inline-col-description\\\">\\u041f\\u043e\\u0433\\u0440\\u0443\\u0437\\u0438\\u0442\\u0435\\u0441\\u044c \\u0432 \\u043c\\u0438\\u0440 \\u043f\\u043e\\u0441\\u043b\\u0435\\u0434\\u043d\\u0438\\u0445 \\u0442\\u0440\\u0435\\u043d\\u0434\\u043e\\u0432 \\u0438 \\u043d\\u043e\\u0432\\u044b\\u0445 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0439. \\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u0435 \\u0441\\u0432\\u043e\\u0439 \\u0441\\u0442\\u0438\\u043b\\u044c \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u0441\\u0432\\u0435\\u0436\\u0438\\u043c\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438 \\u0438 \\u0443\\u043d\\u0438\\u043a\\u0430\\u043b\\u044c\\u043d\\u044b\\u043c\\u0438 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\\u043c\\u0438.<\\/p>\\r\\n            <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">\\u041f\\u0440\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u043d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0438<\\/button>\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".section-gap {\\r\\n    margin-top:80px\\r\\n}\\r\\n.direction-ltr {\\r\\n    direction:ltr\\r\\n}\\r\\n.direction-rtl {\\r\\n    direction:rtl\\r\\n}\\r\\n.inline-col-wrapper {\\r\\n    display:grid;\\r\\n    grid-template-columns:auto 1fr;\\r\\n    grid-gap:60px;\\r\\n    align-items:center\\r\\n}\\r\\n.inline-col-wrapper .inline-col-image-wrapper {\\r\\n    overflow:hidden\\r\\n}\\r\\n.inline-col-wrapper .inline-col-image-wrapper img {\\r\\n    max-width:100%;\\r\\n    height:auto;\\r\\n    border-radius:16px;\\r\\n    text-indent:-9999px\\r\\n}\\r\\n.inline-col-wrapper .inline-col-content-wrapper {\\r\\n    display:flex;\\r\\n    flex-wrap:wrap;\\r\\n    gap:20px;\\r\\n    max-width:464px\\r\\n}\\r\\n.inline-col-wrapper .inline-col-content-wrapper .inline-col-title {\\r\\n    max-width:442px;\\r\\n    font-size:60px;\\r\\n    font-weight:400;\\r\\n    color:#060c3b;\\r\\n    line-height:70px;\\r\\n    font-family:DM Serif Display;\\r\\n    margin:0\\r\\n}\\r\\n.inline-col-wrapper .inline-col-content-wrapper .inline-col-description {\\r\\n    margin:0;\\r\\n    font-size:18px;\\r\\n    color:#6e6e6e;\\r\\n    font-family:Poppins\\r\\n}\\r\\n@media (max-width:991px) {\\r\\n    .inline-col-wrapper {\\r\\n        grid-template-columns:1fr;\\r\\n        grid-gap:16px\\r\\n    }\\r\\n    .inline-col-wrapper .inline-col-content-wrapper {\\r\\n        gap:10px\\r\\n    }\\r\\n}\\r\\n@media (max-width:768px) {\\r\\n    .inline-col-wrapper .inline-col-image-wrapper img {\\r\\n        width:100%;\\r\\n    }\\r\\n    .inline-col-wrapper .inline-col-content-wrapper .inline-col-title {\\r\\n        font-size:28px !important;\\r\\n        line-height:normal !important\\r\\n    }\\r\\n}\\r\\n@media (max-width:525px) {\\r\\n    .inline-col-wrapper .inline-col-content-wrapper .inline-col-title {\\r\\n        font-size:20px !important;\\r\\n    }\\r\\n    .inline-col-description {\\r\\n        font-size:16px\\r\\n    }\\r\\n    .inline-col-wrapper {\\r\\n        grid-gap:10px\\r\\n    }\\r\\n}\"}'),
(7,7,'ru','{\"title\":\"\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"12\",\"featured\":\"1\"}}'),
(9,9,'ru','{\"title\":\"\\u0412\\u0441\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"48\"}}'),
(10,10,'ru','{\"html\":\"<div class=\\\"section-gap special-offers container\\\">\\r\\n    <div class=\\\"inline-col-wrapper\\\">\\r\\n        <div class=\\\"inline-col-image-wrapper\\\">\\r\\n            <img class=\\\"lazy\\\" data-src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/10\\/HYShlwOY7C5dNeeSf3FFWuA8X0Sx5fZgPTkzqywM.webp\\\">\\r\\n        <\\/div>\\r\\n        <div class=\\\"inline-col-content-wrapper\\\">\\r\\n            <h2 class=\\\"inline-col-title\\\">\\u041d\\u0435 \\u043f\\u0440\\u043e\\u043f\\u0443\\u0441\\u0442\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0448\\u0438 \\u0441\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f!<\\/h2>\\r\\n            <p class=\\\"inline-col-description\\\">\\u0423\\u043d\\u0438\\u043a\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438 \\u0438 \\u0430\\u043a\\u0446\\u0438\\u0438 \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e \\u0434\\u043b\\u044f \\u0432\\u0430\\u0441! \\u041f\\u043e\\u0441\\u043f\\u0435\\u0448\\u0438\\u0442\\u0435 \\u0432\\u043e\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f \\u043e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0435\\u043d\\u043d\\u044b\\u043c\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438 \\u0438 \\u043e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u0435 \\u0441\\u0432\\u043e\\u0439 \\u0433\\u0430\\u0440\\u0434\\u0435\\u0440\\u043e\\u0431 \\u043f\\u043e \\u0432\\u044b\\u0433\\u043e\\u0434\\u043d\\u044b\\u043c \\u0446\\u0435\\u043d\\u0430\\u043c.<\\/p>\\r\\n            <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">\\u041f\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f<\\/button>\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}\"}'),
(11,11,'ru','{\"column_1\":[{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/about-us\",\"title\":\"\\u041e \\u043d\\u0430\\u0441\",\"sort_order\":\"1\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/contact-us\",\"title\":\"\\u0421\\u0432\\u044f\\u0436\\u0438\\u0442\\u0435\\u0441\\u044c \\u0441 \\u043d\\u0430\\u043c\\u0438\",\"sort_order\":\"2\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/customer-service\",\"title\":\"\\u0421\\u043b\\u0443\\u0436\\u0431\\u0430 \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u043a\\u0438\",\"sort_order\":\"3\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/whats-new\",\"title\":\"\\u0427\\u0442\\u043e \\u043d\\u043e\\u0432\\u043e\\u0433\\u043e\",\"sort_order\":\"4\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/terms-of-use\",\"title\":\"\\u0423\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f\",\"sort_order\":\"5\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/terms-conditions\",\"title\":\"\\u0423\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f \\u0438 \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f\",\"sort_order\":\"6\"}],\"column_2\":[{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/privacy-policy\",\"title\":\"\\u041f\\u043e\\u043b\\u0438\\u0442\\u0438\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0438\\u0434\\u0435\\u043d\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438\",\"sort_order\":\"1\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/payment-policy\",\"title\":\"\\u041f\\u043e\\u043b\\u0438\\u0442\\u0438\\u043a\\u0430 \\u043e\\u043f\\u043b\\u0430\\u0442\\u044b\",\"sort_order\":\"2\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/shipping-policy\",\"title\":\"\\u041f\\u043e\\u043b\\u0438\\u0442\\u0438\\u043a\\u0430 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0438\",\"sort_order\":\"3\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/refund-policy\",\"title\":\"\\u041f\\u043e\\u043b\\u0438\\u0442\\u0438\\u043a\\u0430 \\u0432\\u043e\\u0437\\u0432\\u0440\\u0430\\u0442\\u0430 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\",\"sort_order\":\"4\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/return-policy\",\"title\":\"\\u041f\\u043e\\u043b\\u0438\\u0442\\u0438\\u043a\\u0430 \\u0432\\u043e\\u0437\\u0432\\u0440\\u0430\\u0442\\u0430\",\"sort_order\":\"5\"}]}'),
(12,12,'ru','{\"services\":[{\"service_icon\":\"icon-truck\",\"description\":\"\\u041d\\u0430\\u0441\\u043b\\u0430\\u0436\\u0434\\u0430\\u0439\\u0442\\u0435\\u0441\\u044c \\u0431\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e\\u0439 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u043e\\u0439 \\u043d\\u0430 \\u0432\\u0441\\u0435 \\u0437\\u0430\\u043a\\u0430\\u0437\\u044b\",\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\"},{\"service_icon\":\"icon-product\",\"description\":\"\\u0414\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u0430 \\u043b\\u0435\\u0433\\u043a\\u0430\\u044f \\u0437\\u0430\\u043c\\u0435\\u043d\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430!\",\"title\":\"\\u0417\\u0430\\u043c\\u0435\\u043d\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430\"},{\"service_icon\":\"icon-dollar-sign\",\"description\":\"\\u041c\\u044b \\u043e\\u0431\\u0435\\u0449\\u0430\\u0435\\u043c \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u0438\\u0442\\u044c \\u043d\\u0430\\u0448\\u0438\\u043c \\u043a\\u043b\\u0438\\u0435\\u043d\\u0442\\u0430\\u043c \\u043b\\u0443\\u0447\\u0448\\u0438\\u0435 \\u0446\\u0435\\u043d\\u044b \\u043d\\u0430 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b. \\u041d\\u0435 \\u0443\\u043f\\u0443\\u0441\\u0442\\u0438\\u0442\\u0435 \\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c!\",\"title\":\"\\u0412\\u044b\\u0433\\u043e\\u0434\\u043d\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430\"}]}'),
(13,1,'en','{\"images\":[{\"title\":\"Go for shopping!\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/YcH6wUYK3W16Fyj1RX4QPtw0R6SbZ1y27DKrmTj6.webp\"},{\"title\":\"Go Go Go\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/hq6Mo3sxPYM69YGIAvkeIeLMHN152XhUcqSw4R5l.webp\"},{\"image\":\"storage\\/theme\\/1\\/iLguA3sHGwNNuDZvP3J74uGPSgy3Tu77U4MOEHIo.webp\",\"link\":\"\",\"title\":\"We love our clients!\"}]}'),
(14,2,'en','{\"html\":\"<div class=\\\"home-offer\\\"><h1>Get UPTO 40% OFF on your 1st order SHOP NOW<\\/h1><\\/div>\",\"css\":\".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;padding-top: 10px;padding-bottom: 10px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;padding-top: 6px;padding-bottom: 6px;}}\"}'),
(15,3,'en','{\"filters\":{\"parent_id\":1,\"sort\":\"asc\",\"limit\":10}}'),
(18,6,'en','{\"html\":\"<div class=\\\"section-gap bold-collections container\\\">\\r\\n    <div class=\\\"inline-col-wrapper\\\">\\r\\n        <div class=\\\"inline-col-image-wrapper\\\">\\r\\n            <img class=\\\"lazy\\\" data-src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/6\\/0aQGO5c3tajnFk3kiiyQafivdUqRZo38YWV44Fo7.webp\\\">\\r\\n        <\\/div>\\r\\n        <div class=\\\"inline-col-content-wrapper\\\">\\r\\n             <h2 class=\\\"inline-col-title\\\">Discover our new arrivals!<\\/h2>\\r\\n\\r\\n            <p class=\\\"inline-col-description\\\">Immerse yourself in the world of the latest trends and new collections. Update your style with our fresh offers and unique products.<\\/p>\\r\\n            <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View new items<\\/button>\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}} @media (max-width:768px){.inline-col-wrapper .inline-col-image-wrapper img {width:100%;} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:28px !important;line-height:normal !important}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px !important;} .inline-col-description{font-size:16px} .inline-col-wrapper{grid-gap:10px}}\"}'),
(19,7,'en','{\"title\":\"Featured Products\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"12\",\"featured\":\"1\"}}'),
(21,9,'en','{\"title\":\"All Products\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"48\",\"new\":\"1\"}}'),
(22,10,'en','{\"html\":\"<div class=\\\"section-gap special-offers container\\\">\\r\\n    <div class=\\\"inline-col-wrapper\\\">\\r\\n        <div class=\\\"inline-col-image-wrapper\\\">\\r\\n            <img class=\\\"lazy\\\" data-src=\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/theme\\/10\\/HYShlwOY7C5dNeeSf3FFWuA8X0Sx5fZgPTkzqywM.webp\\\">\\r\\n        <\\/div>\\r\\n        <div class=\\\"inline-col-content-wrapper\\\">\\r\\n             <h2 class=\\\"inline-col-title\\\">Don\'t miss our special offers!\\r\\n<\\/h2>\\r\\n\\r\\n            <p class=\\\"inline-col-description\\\">Unique discounts and promotions just for you! Hurry up to take advantage of limited offers and update your wardrobe at competitive prices.<\\/p>\\r\\n            <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View offers\\r\\n<\\/button>\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n<\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}\"}'),
(23,11,'en','{\"column_1\":[{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/about-us\",\"title\":\"About Us\",\"sort_order\":\"1\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/contact-us\",\"title\":\"Contact Us\",\"sort_order\":\"2\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/customer-service\",\"title\":\"Customer Service\",\"sort_order\":\"3\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/whats-new\",\"title\":\"What\'s New\",\"sort_order\":\"4\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/terms-of-use\",\"title\":\"Terms of Use\",\"sort_order\":\"5\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/terms-conditions\",\"title\":\"Terms & Conditions\",\"sort_order\":\"6\"}],\"column_2\":[{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/privacy-policy\",\"title\":\"Privacy Policy\",\"sort_order\":\"1\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/payment-policy\",\"title\":\"Payment Policy\",\"sort_order\":\"2\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/shipping-policy\",\"title\":\"Shipping Policy\",\"sort_order\":\"3\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/refund-policy\",\"title\":\"Refund Policy\",\"sort_order\":\"4\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/return-policy\",\"title\":\"Return Policy\",\"sort_order\":\"5\"}]}'),
(24,12,'en','{\"services\":[{\"service_icon\":\"icon-truck\",\"description\":\"Enjoy free shipping on all orders\",\"title\":\"Free Shipping\"},{\"service_icon\":\"icon-product\",\"description\":\"Easy Product Replacement Available!\",\"title\":\"Product Replace\"},{\"service_icon\":\"icon-dollar-sign\",\"description\":\"We promise to offer our customers the best prices on products. Don\'t miss out!\",\"title\":\"Great Price\"}]}'),
(25,13,'ru','{\"title\":\"\\u041d\\u043e\\u0432\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"48\",\"new\":\"1\"}}'),
(26,13,'en','{\"title\":\"New products\",\"filters\":{\"sort\":\"created_at-desc\",\"limit\":\"12\",\"new\":\"1\"}}');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customizations`
--

LOCK TABLES `theme_customizations` WRITE;
/*!40000 ALTER TABLE `theme_customizations` DISABLE KEYS */;
INSERT INTO `theme_customizations` VALUES
(1,'default','image_carousel','Карусель изображений',1,1,1,'2025-02-25 19:54:31','2025-02-28 15:01:31'),
(2,'default','static_content','Информация о предложениях',2,1,1,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(3,'default','category_carousel','Категории и коллекции',3,1,1,'2025-02-25 19:54:31','2025-02-25 19:54:31'),
(6,'default','static_content','Смелые коллекции',6,1,1,'2025-02-25 19:54:31','2025-02-28 13:51:53'),
(7,'default','product_carousel','Популярные товары',7,1,1,'2025-02-25 19:54:31','2025-02-28 12:53:24'),
(9,'default','product_carousel','Все товары',9,1,1,'2025-02-25 19:54:31','2025-02-28 13:38:58'),
(10,'default','static_content','Смелые коллекции',8,1,1,'2025-02-25 19:54:31','2025-02-28 14:10:14'),
(11,'default','footer_links','Ссылки внизу страницы',11,1,1,'2025-02-25 19:54:31','2025-02-28 15:16:34'),
(12,'default','services_content','Содержание услуг',12,1,1,'2025-02-25 19:54:31','2025-02-28 15:21:06'),
(13,'default','product_carousel','Новые товары',4,1,1,'2025-02-28 07:30:59','2025-03-01 10:41:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_items`
--

LOCK TABLES `wishlist_items` WRITE;
/*!40000 ALTER TABLE `wishlist_items` DISABLE KEYS */;
INSERT INTO `wishlist_items` VALUES
(30,1,42,4,NULL,NULL,NULL,'2025-03-01 10:32:32','2025-03-01 10:32:32');
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

-- Dump completed on 2025-03-02 18:52:55
