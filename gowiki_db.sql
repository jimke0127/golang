/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.41-0ubuntu0.22.04.1 : Database - go_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`go_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `go_db`;

/*Table structure for table `articles` */

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `author` varchar(60) DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `publish_time` datetime DEFAULT NULL,
  `category` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `articles` */

insert  into `articles`(`id`,`title`,`author`,`body`,`publish_time`,`category`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Tom  22','Jack','This is a test','2025-03-22 10:57:04',2,'2025-03-22 10:57:04','2025-03-22 15:43:55',NULL),
(2,'Tom','Jack','This is a test 22','2025-03-22 11:04:57',2,'2025-03-22 11:04:57','2025-03-22 15:43:52',NULL),
(3,'111','dsdfg','333','2025-03-22 11:30:25',5,'2025-03-22 11:30:25','2025-03-22 11:30:25',NULL),
(4,'aa','dfg','bb','2025-03-22 11:32:13',2,'2025-03-22 11:32:13','2025-03-22 11:32:13',NULL),
(5,'asdasd50','sdfdg60','dfgfghfgh70','2025-03-22 11:34:48',20,'2025-03-22 11:34:48','2025-03-22 13:29:21',NULL),
(6,'11','22','33','2025-03-22 13:39:56',4,'2025-03-22 13:39:56','2025-03-22 13:39:56',NULL),
(7,'213234','34534','645657567 好的','2025-03-22 13:42:39',8,'2025-03-22 13:42:39','2025-03-22 13:42:51',NULL),
(8,'This is a  first  test','alin','You can also use variant modifiers to target media queries like responsive breakpoints, dark mode, prefers-reduced-motion, and more. For example, use md:w-full to apply the w-full utility at only medium screen sizes and above.\r\n\r\nFor a complete list of all available state modifiers, check out the Hover, Focus, & Other States documentation.','2025-03-22 14:36:23',2,'2025-03-22 14:36:23','2025-03-22 14:36:23',NULL),
(9,'12312432','23345435','546564757 bb\r\nvvvv','2025-03-22 15:33:41',7,'2025-03-22 15:33:41','2025-03-22 15:33:51',NULL),
(10,'xcvxcv','xcvx','c','2025-03-22 15:40:08',4,'2025-03-22 15:40:08','2025-03-22 15:40:08',NULL);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `code` longtext,
  `price` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_products_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`created_at`,`updated_at`,`deleted_at`,`code`,`price`) values 
(1,'2023-05-26 17:50:40.327','2023-05-26 18:27:28.924',NULL,'aaa',55),
(2,'2023-05-26 18:21:29.497','2023-05-26 18:21:29.497',NULL,'1002',99),
(4,'2025-03-21 16:15:12.032','2025-03-21 16:15:12.032',NULL,'1002',99),
(5,'2025-03-21 16:16:27.266','2025-03-21 16:16:27.266',NULL,'1002',99);

/*Table structure for table `user_tbl` */

DROP TABLE IF EXISTS `user_tbl`;

CREATE TABLE `user_tbl` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT '',
  `PASSWORD` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_tbl` */

insert  into `user_tbl`(`id`,`username`,`PASSWORD`) values 
(1,'tom','123'),
(2,'李四','666'),
(3,'zhangsan','zs123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
