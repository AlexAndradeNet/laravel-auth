-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: laravelAuth
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`),
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laravel2step`
--

DROP TABLE IF EXISTS `laravel2step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laravel2step` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint unsigned NOT NULL,
  `authCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authCount` int NOT NULL,
  `authStatus` tinyint(1) NOT NULL DEFAULT '0',
  `authDate` datetime DEFAULT NULL,
  `requestDate` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laravel2step_userid_index` (`userId`),
  CONSTRAINT `laravel2step_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laravel2step`
--

LOCK TABLES `laravel2step` WRITE;
/*!40000 ALTER TABLE `laravel2step` DISABLE KEYS */;
/*!40000 ALTER TABLE `laravel2step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laravel_blocker`
--

DROP TABLE IF EXISTS `laravel_blocker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laravel_blocker` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `typeId` int unsigned NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `userId` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `laravel_blocker_value_unique` (`value`),
  KEY `laravel_blocker_typeid_index` (`typeId`),
  KEY `laravel_blocker_userid_index` (`userId`),
  CONSTRAINT `laravel_blocker_typeid_foreign` FOREIGN KEY (`typeId`) REFERENCES `laravel_blocker_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laravel_blocker`
--

LOCK TABLES `laravel_blocker` WRITE;
/*!40000 ALTER TABLE `laravel_blocker` DISABLE KEYS */;
INSERT INTO `laravel_blocker` VALUES (1,3,'test.com','Block all domains/emails @test.com',NULL,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(2,3,'test.ca','Block all domains/emails @test.ca',NULL,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(3,3,'fake.com','Block all domains/emails @fake.com',NULL,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(4,3,'example.com','Block all domains/emails @example.com',NULL,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(5,3,'mailinator.com','Block all domains/emails @mailinator.com',NULL,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL);
/*!40000 ALTER TABLE `laravel_blocker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laravel_blocker_types`
--

DROP TABLE IF EXISTS `laravel_blocker_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laravel_blocker_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `laravel_blocker_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laravel_blocker_types`
--

LOCK TABLES `laravel_blocker_types` WRITE;
/*!40000 ALTER TABLE `laravel_blocker_types` DISABLE KEYS */;
INSERT INTO `laravel_blocker_types` VALUES (1,'email','E-mail','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(2,'ipAddress','IP Address','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(3,'domain','Domain Name','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(4,'user','User','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(5,'city','City','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(6,'state','State','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(7,'country','Country','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(8,'countryCode','Country Code','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(9,'continent','Continent','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(10,'region','Region','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL);
/*!40000 ALTER TABLE `laravel_blocker_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laravel_logger_activity`
--

DROP TABLE IF EXISTS `laravel_logger_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laravel_logger_activity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int DEFAULT NULL,
  `route` longtext COLLATE utf8mb4_unicode_ci,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `methodType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laravel_logger_activity`
--

LOCK TABLES `laravel_logger_activity` WRITE;
/*!40000 ALTER TABLE `laravel_logger_activity` DISABLE KEYS */;
INSERT INTO `laravel_logger_activity` VALUES (1,'Logged In','Registered',2,'http://192.168.10.10/login','192.168.10.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15','en-us','http://192.168.10.10/login','POST','2021-05-12 10:26:14','2021-05-12 10:26:14',NULL),(2,'Viewed home','Registered',2,'http://192.168.10.10/home','192.168.10.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15','en-us','http://192.168.10.10/login','GET','2021-05-12 10:26:14','2021-05-12 10:26:14',NULL),(3,'Logged Out','Registered',2,'http://192.168.10.10/logout','192.168.10.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15','en-us','http://192.168.10.10/home','POST','2021-05-12 10:26:27','2021-05-12 10:26:27',NULL),(4,'Logged In','Registered',1,'http://192.168.10.10/login','192.168.10.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15','en-us','http://192.168.10.10/login','POST','2021-05-12 10:26:46','2021-05-12 10:26:46',NULL),(5,'Viewed home','Registered',1,'http://192.168.10.10/home','192.168.10.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15','en-us','http://192.168.10.10/login','GET','2021-05-12 10:26:46','2021-05-12 10:26:46',NULL),(6,'Viewed profile/Admin','Registered',1,'http://192.168.10.10/profile/Admin','192.168.10.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15','en-us','http://192.168.10.10/home','GET','2021-05-12 10:26:54','2021-05-12 10:26:54',NULL),(7,'Logged Out','Registered',1,'http://192.168.10.10/logout','192.168.10.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15','en-us','http://192.168.10.10/profile/Admin','POST','2021-05-12 10:26:58','2021-05-12 10:26:58',NULL);
/*!40000 ALTER TABLE `laravel_logger_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2015_07_31_1_email_log',1),(4,'2016_01_15_105324_create_roles_table',1),(5,'2016_01_15_114412_create_role_user_table',1),(6,'2016_01_26_115212_create_permissions_table',1),(7,'2016_01_26_115523_create_permission_role_table',1),(8,'2016_02_09_132439_create_permission_user_table',1),(9,'2016_09_21_001638_add_bcc_column_email_log',1),(10,'2017_03_09_082449_create_social_logins_table',1),(11,'2017_03_09_082526_create_activations_table',1),(12,'2017_03_20_213554_create_themes_table',1),(13,'2017_03_21_042918_create_profiles_table',1),(14,'2017_11_04_103444_create_laravel_logger_activity_table',1),(15,'2017_11_10_001638_add_more_mail_columns_email_log',1),(16,'2017_12_09_070937_create_two_step_auth_table',1),(17,'2018_05_11_115355_use_longtext_for_attachments',1),(18,'2019_02_19_032636_create_laravel_blocker_types_table',1),(19,'2019_02_19_045158_create_laravel_blocker_table',1),(20,'2019_08_19_000000_create_failed_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1,1,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(2,2,1,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(3,3,1,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(4,4,1,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Can View Users','view.users','Can view users','Permission','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(2,'Can Create Users','create.users','Can create new users','Permission','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(3,'Can Edit Users','edit.users','Can edit users','Permission','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(4,'Can Delete Users','delete.users','Can delete users','Permission','2021-05-12 10:22:30','2021-05-12 10:22:30',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `theme_id` bigint unsigned NOT NULL DEFAULT '1',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `twitter_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_theme_id_foreign` (`theme_id`),
  KEY `profiles_user_id_index` (`user_id`),
  CONSTRAINT `profiles_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL,0,'2021-05-12 10:22:30','2021-05-12 10:22:30'),(2,2,1,NULL,NULL,NULL,NULL,NULL,0,'2021-05-12 10:22:30','2021-05-12 10:22:30');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(2,2,2,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','admin','Admin Role',5,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(2,'User','user','User Role',1,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(3,'Unverified','unverified','Unverified Role',0,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_logins_user_id_index` (`user_id`),
  CONSTRAINT `social_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `themes_name_unique` (`name`),
  UNIQUE KEY `themes_link_unique` (`link`),
  KEY `themes_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  KEY `themes_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'Default','null',NULL,1,'theme',1,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(2,'Darkly','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/darkly/bootstrap.min.css',NULL,1,'theme',2,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(3,'Cyborg','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/cyborg/bootstrap.min.css',NULL,1,'theme',3,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(4,'Cosmo','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/cosmo/bootstrap.min.css',NULL,1,'theme',4,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(5,'Cerulean','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/cerulean/bootstrap.min.css',NULL,1,'theme',5,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(6,'Flatly','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/flatly/bootstrap.min.css',NULL,1,'theme',6,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(7,'Journal','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/journal/bootstrap.min.css',NULL,1,'theme',7,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(8,'Lumen','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/lumen/bootstrap.min.css',NULL,1,'theme',8,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(9,'Paper','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/paper/bootstrap.min.css',NULL,1,'theme',9,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(10,'Readable','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/readable/bootstrap.min.css',NULL,1,'theme',10,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(11,'Sandstone','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/sandstone/bootstrap.min.css',NULL,1,'theme',11,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(12,'Simplex','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/simplex/bootstrap.min.css',NULL,1,'theme',12,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(13,'Slate','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/slate/bootstrap.min.css',NULL,1,'theme',13,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(14,'Spacelab','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/spacelab/bootstrap.min.css',NULL,1,'theme',14,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(15,'Superhero','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/superhero/bootstrap.min.css',NULL,1,'theme',15,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(16,'United','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/united/bootstrap.min.css',NULL,1,'theme',16,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(17,'Yeti','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/yeti/bootstrap.min.css',NULL,1,'theme',17,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(18,'Bootstrap 4.3.1','https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css',NULL,1,'theme',18,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(19,'Materialize','https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.css',NULL,1,'theme',19,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(20,'Material Design for Bootstrap (MDB) 4.8.7','https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.7/css/mdb.css',NULL,1,'theme',20,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(21,'mdbootstrap','https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.1/css/mdb.min.css',NULL,1,'theme',21,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(22,'Litera','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css',NULL,1,'theme',22,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(23,'Lux','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css',NULL,1,'theme',23,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(24,'Materia','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/materia/bootstrap.min.css',NULL,1,'theme',24,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(25,'Minty','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/minty/bootstrap.min.css',NULL,1,'theme',25,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(26,'Pulse','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/pulse/bootstrap.min.css',NULL,1,'theme',26,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(27,'Sketchy','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/sketchy/bootstrap.min.css',NULL,1,'theme',27,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(28,'Solar','https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/solar/bootstrap.min.css',NULL,1,'theme',28,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_confirmation_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_sm_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Harry','Potter','admin@admin.com',NULL,'$2y$10$6Nufu8FUGwnoWPcZ8m1b0u2gNKJgrvsdfEACFqbXtgroBltYUVYpW',NULL,1,'5kSyJFYH2ef1gKkVZoobNGZQfhhOlG5w1m7ajqsekufrqn9AGD4L67jbaWURTba9',NULL,'127.0.0.1',NULL,'127.0.0.1',NULL,NULL,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL),(2,'User','Hermione','Granger','user@user.com',NULL,'$2y$10$GciYVRnjn.K2rJt.tDVmvua6jCTuOYWYmfkG3VbYtgAfJTP2ZHx4u',NULL,1,'bHxkT4PXOzuijW4oHeh007swMR0XFKgtdeQtSO5zOoxmQOZW3Qh2JO6mJlqaDiJ1','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,'2021-05-12 10:22:30','2021-05-12 10:22:30',NULL);
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

-- Dump completed on 2021-05-12 10:34:17
