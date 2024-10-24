-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: hjh_image
-- ------------------------------------------------------
-- Server version       8.0.37

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT '用户',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `intro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简介',
  `image_num` bigint unsigned NOT NULL DEFAULT '0' COMMENT '图片数量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `albums_user_id_foreign` (`user_id`),
  CONSTRAINT `albums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configs` (
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名',
  `value` longtext COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `configs_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES ('app_name','Lsky Pro','2024-10-23 12:25:42','2024-10-23 12:25:42'),('app_version','V 2.1','2024-10-23 12:25:42','2024-10-23 12:25:42'),('icp_no','','2024-10-23 12:25:42','2024-10-23 12:25:42'),('is_allow_guest_upload','1','2024-10-23 12:25:42','2024-10-23 12:25:42'),('is_enable_api','1','2024-10-23 12:25:42','2024-10-23 12:25:42'),('is_enable_gallery','1','2024-10-23 12:25:42','2024-10-23 12:25:42'),('is_enable_registration','1','2024-10-23 12:25:42','2024-10-23 12:25:42'),('is_user_need_verify','0','2024-10-23 12:25:42','2024-10-23 12:25:42'),('mail','{\"default\":\"smtp\",\"mailers\":{\"smtp\":{\"smtp\":\"smtp\",\"host\":\"smtp.mailgun.org\",\"port\":587,\"encryption\":\"tls\",\"username\":\"\",\"password\":\"\",\"timeout\":null}}}','2024-10-23 12:25:42','2024-10-23 12:25:42'),('site_description','Lsky Pro, Your photo album on the cloud.','2024-10-23 12:25:42','2024-10-23 12:25:42'),('site_keywords','Lsky Pro,lsky,兰空图床','2024-10-23 12:25:42','2024-10-23 12:25:42'),('site_notice','','2024-10-23 12:25:42','2024-10-23 12:25:42'),('user_initial_capacity','512000','2024-10-23 12:25:42','2024-10-23 12:25:42');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
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
-- Table structure for table `group_strategy`
--

DROP TABLE IF EXISTS `group_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_strategy` (
  `group_id` bigint unsigned NOT NULL COMMENT '角色组',
  `strategy_id` bigint unsigned NOT NULL COMMENT '策略',
  KEY `group_strategy_group_id_foreign` (`group_id`),
  KEY `group_strategy_strategy_id_foreign` (`strategy_id`),
  CONSTRAINT `group_strategy_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_strategy_strategy_id_foreign` FOREIGN KEY (`strategy_id`) REFERENCES `strategies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_strategy`
--

LOCK TABLES `group_strategy` WRITE;
/*!40000 ALTER TABLE `group_strategy` DISABLE KEYS */;
INSERT INTO `group_strategy` VALUES (1,1);
/*!40000 ALTER TABLE `group_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色组名称',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为游客组',
  `configs` json NOT NULL COMMENT '组配置',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'系统默认组&游客组',1,1,'{\"scan_configs\": {\"driver\": \"tencent\", \"drivers\": {\"aliyun\": {\"scenes\": [\"porn\"], \"biz_type\": \"\", \"region_id\": \"\", \"access_key_id\": \"\", \"access_key_secret\": \"\"}, \"nsfwjs\": {\"api_url\": \"\", \"attr_name\": \"image\", \"threshold\": 60}, \"tencent\": {\"region\": \"\", \"biz_type\": \"\", \"endpoint\": \"ims.tencentcloudapi.com\", \"secret_id\": \"\", \"secret_key\": \"\"}}}, \"limit_per_day\": 300, \"is_enable_scan\": 0, \"limit_per_hour\":
100, \"limit_per_week\": 600, \"scanned_action\": \"mark\", \"image_cache_ttl\": 2626560, \"limit_per_month\": 999, \"file_naming_rule\": \"{uniqid}\", \"limit_per_minute\": 20,
\"path_naming_rule\": \"{Y}/{m}/{d}\", \"image_save_format\": \"\", \"maximum_file_size\": 5120, \"watermark_configs\": {\"mode\": 1, \"driver\": \"font\", \"drivers\": {\"font\": {\"x\": 10, \"y\": 10, \"font\": \"\", \"size\": 50, \"text\": \"Lsky Pro\", \"angle\": 0, \"color\": \"#000000\", \"position\": \"bottom-right\"}, \"image\": {\"x\": 10, \"y\": 10, \"image\": \"\", \"width\": 0, \"height\": 0, \"rotate\": 0, \"opacity\": 100, \"position\": \"bottom-right\"}}}, \"image_save_quality\": 75, \"is_enable_watermark\": 0, \"concurrent_upload_num\": 3, \"accepted_file_suffixes\": [\"jpeg\", \"jpg\", \"png\", \"gif\", \"tif\", \"bmp\", \"ico\", \"psd\", \"webp\"], \"is_enable_original_protection\": 0}','2024-10-23 12:25:42','2024-10-23 12:25:42');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户',
  `album_id` bigint unsigned DEFAULT NULL COMMENT '相册',
  `group_id` bigint unsigned DEFAULT NULL COMMENT '角色组',
  `strategy_id` bigint unsigned DEFAULT NULL COMMENT '策略',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'key',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '保存路径',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '保存名称',
  `origin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原始名称',
  `alias_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '别名',
  `size` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '图片大小(kb)',
  `mimetype` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件类型',
  `extension` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件后缀',
  `md5` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件MD5',
  `sha1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件SHA1',
  `width` int unsigned NOT NULL DEFAULT '0' COMMENT '宽',
  `height` int unsigned NOT NULL DEFAULT '0' COMMENT '高',
  `permission` tinyint NOT NULL DEFAULT '0' COMMENT '访问权限',
  `is_unhealthy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为不健康的',
  `uploaded_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '上传IP',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `images_key_unique` (`key`),
  KEY `images_user_id_foreign` (`user_id`),
  KEY `images_album_id_foreign` (`album_id`),
  KEY `images_group_id_foreign` (`group_id`),
  KEY `images_strategy_id_foreign` (`strategy_id`),
  CONSTRAINT `images_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE SET NULL,
  CONSTRAINT `images_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `images_strategy_id_foreign` FOREIGN KEY (`strategy_id`) REFERENCES `strategies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,NULL,1,1,'tsE5De','2024/10/23','6718ebf08ab3f.png','88805d8d6acdb8c61b2d31c37996b6cf60e693903e5d95a5a188f2dba8ca7f63.png','',927.66,'image/png','png','5b22a871a3cfcf15a912cf67357115e3','ca1eb2b2b275d591374223d3da7e33f17b3fd4d4',768,800,0,0,'122.4.120.27','2024-10-23 12:28:32','2024-10-23 12:28:32');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_10_000000_create_groups_table',1),(2,'2014_10_12_000000_create_users_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2021_12_11_184521_create_strategies_table',1),(7,'2021_12_11_185759_create_albums_table',1),(8,'2021_12_11_191158_create_images_table',1),(9,'2021_12_11_200033_create_configs_table',1),(10,'2022_01_20_201231_create_group_strategy_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategies`
--

DROP TABLE IF EXISTS `strategies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` tinyint unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '策略名称',
  `intro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简介',
  `configs` json NOT NULL COMMENT '策略配置',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategies`
--

LOCK TABLES `strategies` WRITE;
/*!40000 ALTER TABLE `strategies` DISABLE KEYS */;
INSERT INTO `strategies` VALUES (1,1,'默认本地策略','系统默认的本地策略','{\"url\": \"https://hjh-image1.wepromo.cn/i\", \"root\": \"/data/home/hjh/git/lsky-pro/storage/app/uploads\", \"driver\": \"local\", \"visibility\": \"public\"}','2024-10-23 12:25:42','2024-10-23 12:25:42');
/*!40000 ALTER TABLE `strategies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint unsigned DEFAULT NULL COMMENT '角色组',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_adminer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为管理员',
  `capacity` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '总容量(kb)',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '个人主页',
  `configs` json NOT NULL COMMENT '配置',
  `image_num` bigint unsigned NOT NULL DEFAULT '0' COMMENT '图片数量',
  `album_num` bigint unsigned NOT NULL DEFAULT '0' COMMENT '相册数量',
  `registered_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册IP',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_group_id_foreign` (`group_id`),
  CONSTRAINT `users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'超级管理员','admin@ai-space.net','$2y$10$jlKk8WyS1TU8sFOWAPUqUONHpDoOmFE2K7fByTAWl0CF/OpN0WDf6',NULL,1,512000.00,'','{\"default_album\": 0, \"pasted_action\": 1, \"default_strategy\": 0, \"default_permission\": 0, \"is_auto_clear_preview\": false}',1,0,'122.4.120.27',1,'2024-10-23 12:25:42','2024-10-23 12:25:42','2024-10-23 12:28:32');
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

-- Dump completed on 2024-10-24 15:49:48