-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for osms_db
CREATE DATABASE IF NOT EXISTS `osms_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `osms_db`;

-- Dumping structure for table osms_db.adminlogin_tb
CREATE TABLE IF NOT EXISTS `adminlogin_tb` (
  `a_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `a_email` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `a_password` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`a_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Dumping data for table osms_db.adminlogin_tb: ~1 rows (approximately)
DELETE FROM `adminlogin_tb`;
/*!40000 ALTER TABLE `adminlogin_tb` DISABLE KEYS */;
INSERT INTO `adminlogin_tb` (`a_login_id`, `a_name`, `a_email`, `a_password`) VALUES
	(1, 'Admin Adrian', 'admin@djsrs.com', 'adminpassword');
/*!40000 ALTER TABLE `adminlogin_tb` ENABLE KEYS */;

-- Dumping structure for table osms_db.assets_tb
CREATE TABLE IF NOT EXISTS `assets_tb` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `pdop` date NOT NULL,
  `pava` int(11) NOT NULL,
  `ptotal` int(11) NOT NULL,
  `poriginalcost` int(11) NOT NULL,
  `psellingcost` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Dumping data for table osms_db.assets_tb: ~1 rows (approximately)
DELETE FROM `assets_tb`;
/*!40000 ALTER TABLE `assets_tb` DISABLE KEYS */;
INSERT INTO `assets_tb` (`pid`, `pname`, `pdop`, `pava`, `ptotal`, `poriginalcost`, `psellingcost`) VALUES
	(1, 'Air Purifier', '2022-02-02', 3, 10, 2350, 2350);
/*!40000 ALTER TABLE `assets_tb` ENABLE KEYS */;

-- Dumping structure for table osms_db.assignwork_tb
CREATE TABLE IF NOT EXISTS `assignwork_tb` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `request_info` text COLLATE utf8mb3_bin NOT NULL,
  `request_desc` text COLLATE utf8mb3_bin NOT NULL,
  `request_quantity` int(11) DEFAULT NULL,
  `requester_name` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `requester_add1` text COLLATE utf8mb3_bin NOT NULL,
  `requester_add2` text COLLATE utf8mb3_bin NOT NULL,
  `requester_city` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `requester_state` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `requester_zip` int(11) NOT NULL,
  `requester_email` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `requester_mobile` bigint(11) NOT NULL,
  `assign_tech` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `assign_date` date NOT NULL,
  `requester_id` int(11) NOT NULL,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Dumping data for table osms_db.assignwork_tb: ~2 rows (approximately)
DELETE FROM `assignwork_tb`;
/*!40000 ALTER TABLE `assignwork_tb` DISABLE KEYS */;
INSERT INTO `assignwork_tb` (`rno`, `request_id`, `request_info`, `request_desc`, `request_quantity`, `requester_name`, `requester_add1`, `requester_add2`, `requester_city`, `requester_state`, `requester_zip`, `requester_email`, `requester_mobile`, `assign_tech`, `assign_date`, `requester_id`) VALUES
	(4, 5, '2', 'paayos ng washing machine!!!!!!!!!! grr', 1, 'Test User', 'Dito lang', 'Condo', 'City', 'State', 1116, 'keenplify@gmail.com', 9983886697, 'Jacob Advincula', '2022-06-23', 3);
/*!40000 ALTER TABLE `assignwork_tb` ENABLE KEYS */;

-- Dumping structure for table osms_db.customer_tb
CREATE TABLE IF NOT EXISTS `customer_tb` (
  `custid` int(11) NOT NULL AUTO_INCREMENT,
  `custname` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `custadd` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `cpname` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `cpquantity` int(11) NOT NULL,
  `cpeach` int(11) NOT NULL,
  `cptotal` int(11) NOT NULL,
  `cpdate` date NOT NULL,
  PRIMARY KEY (`custid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Dumping data for table osms_db.customer_tb: ~2 rows (approximately)
DELETE FROM `customer_tb`;
/*!40000 ALTER TABLE `customer_tb` DISABLE KEYS */;
INSERT INTO `customer_tb` (`custid`, `custname`, `custadd`, `cpname`, `cpquantity`, `cpeach`, `cptotal`, `cpdate`) VALUES
	(1, 'Genesis', 'Origin', 'Air Purifier', 5, 2350, 11750, '2022-06-14'),
	(2, 'Johnny Sins', 'Pennsylvania', 'Air Purifier', 2, 2350, 4700, '2022-06-16');
/*!40000 ALTER TABLE `customer_tb` ENABLE KEYS */;

-- Dumping structure for table osms_db.requesterlogin_tb
CREATE TABLE IF NOT EXISTS `requesterlogin_tb` (
  `r_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `r_email` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `r_password` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`r_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Dumping data for table osms_db.requesterlogin_tb: ~2 rows (approximately)
DELETE FROM `requesterlogin_tb`;
/*!40000 ALTER TABLE `requesterlogin_tb` DISABLE KEYS */;
INSERT INTO `requesterlogin_tb` (`r_login_id`, `r_name`, `r_email`, `r_password`) VALUES
	(1, 'Adrian', 'adrian@djsrs.com', 'password'),
	(2, 'Wilmer', 'wilmer@djsrs.com', 'password'),
	(3, 'Test User', 'testuser@gmail.com', 'testuser');
/*!40000 ALTER TABLE `requesterlogin_tb` ENABLE KEYS */;

-- Dumping structure for table osms_db.requestinfo_tb
CREATE TABLE IF NOT EXISTS `requestinfo_tb` (
  `ri_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ri_details` varchar(128) NOT NULL,
  `ri_price` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`ri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Contains request info and its prices';

-- Dumping data for table osms_db.requestinfo_tb: ~4 rows (approximately)
DELETE FROM `requestinfo_tb`;
/*!40000 ALTER TABLE `requestinfo_tb` DISABLE KEYS */;
INSERT INTO `requestinfo_tb` (`ri_id`, `ri_details`, `ri_price`) VALUES
	(1, 'Clean', 500),
	(2, 'Repair', 800),
	(3, 'Checkup', 300),
	(6, 'Testing', 500);
/*!40000 ALTER TABLE `requestinfo_tb` ENABLE KEYS */;

-- Dumping structure for table osms_db.submitrequest_tb
CREATE TABLE IF NOT EXISTS `submitrequest_tb` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_info` text COLLATE utf8mb3_bin NOT NULL,
  `request_quantity` int(11) NOT NULL,
  `request_desc` text COLLATE utf8mb3_bin NOT NULL,
  `requester_name` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `requester_add1` text COLLATE utf8mb3_bin NOT NULL,
  `requester_add2` text COLLATE utf8mb3_bin NOT NULL,
  `requester_city` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `requester_state` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `requester_zip` int(11) NOT NULL,
  `requester_email` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `requester_mobile` bigint(11) NOT NULL,
  `request_date` date NOT NULL,
  `requester_id` int(11) NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Dumping data for table osms_db.submitrequest_tb: ~1 rows (approximately)
DELETE FROM `submitrequest_tb`;
/*!40000 ALTER TABLE `submitrequest_tb` DISABLE KEYS */;
INSERT INTO `submitrequest_tb` (`request_id`, `request_info`, `request_quantity`, `request_desc`, `requester_name`, `requester_add1`, `requester_add2`, `requester_city`, `requester_state`, `requester_zip`, `requester_email`, `requester_mobile`, `request_date`, `requester_id`) VALUES
	(5, '2', 1, 'paayos ng washing machine!!!!!!!!!! grr', 'Test User', 'Dito lang', 'Condo', 'City', 'State', 1116, 'keenplify@gmail.com', 9983886697, '2022-06-18', 3),
	(6, '6', 1, 'Patesting ng washing machin', 'Cardo Dalisay', '43 Marawi St.', 'Duplex', 'Marawi', 'Lanao del Sur', 6342, 'cardo@gmail.com', 412312312, '2022-06-29', 3);
/*!40000 ALTER TABLE `submitrequest_tb` ENABLE KEYS */;

-- Dumping structure for table osms_db.technician_tb
CREATE TABLE IF NOT EXISTS `technician_tb` (
  `empid` int(11) NOT NULL AUTO_INCREMENT,
  `empName` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `empCity` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `empMobile` bigint(11) NOT NULL,
  `empEmail` varchar(60) COLLATE utf8mb3_bin NOT NULL,
  `empPassword` varchar(256) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Dumping data for table osms_db.technician_tb: ~2 rows (approximately)
DELETE FROM `technician_tb`;
/*!40000 ALTER TABLE `technician_tb` DISABLE KEYS */;
INSERT INTO `technician_tb` (`empid`, `empName`, `empCity`, `empMobile`, `empEmail`, `empPassword`) VALUES
	(1, 'Jacob Advincula', 'QC', 9123456789, 'techjacob@djsrs.com', '$2y$12$2WvUntK.sywrotfyr6IbHuYk1jUnoEIubbepNmYYw1ipNC93TSEHS'),
	(14, 'Test Technician', 'Quezon City', 9062281049, 'testtechnician@gmail.com', '$2y$12$B9j9o7l8Mv4N3VXeCt.lpODM0vKtRuMhoaQ36HYNC0H3pMGbSB5Ge');
/*!40000 ALTER TABLE `technician_tb` ENABLE KEYS */;

-- Dumping structure for table osms_db.workreport_tb
CREATE TABLE IF NOT EXISTS `workreport_tb` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignwork_id` int(11) NOT NULL DEFAULT 0,
  `report_details` text COLLATE utf8mb3_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `technician_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Dumping data for table osms_db.workreport_tb: ~3 rows (approximately)
DELETE FROM `workreport_tb`;
/*!40000 ALTER TABLE `workreport_tb` DISABLE KEYS */;
INSERT INTO `workreport_tb` (`report_id`, `assignwork_id`, `report_details`, `created_at`, `technician_id`) VALUES
	(1, 4, 'Finished working', '2022-06-16 00:55:01', 14),
	(2, 4, 'Finished working pero not me', '2022-06-16 01:30:41', 1),
	(12, 4, 'together', '2022-06-16 01:34:27', 14),
	(13, 4, 'may nangyari', '2022-06-20 16:16:20', 1);
/*!40000 ALTER TABLE `workreport_tb` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
