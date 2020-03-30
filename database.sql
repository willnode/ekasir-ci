-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for dbkasir
CREATE DATABASE IF NOT EXISTS `dbkasir` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbkasir`;

-- Dumping structure for table dbkasir.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `barang_id` int(11) NOT NULL AUTO_INCREMENT,
  `barang_nama` varchar(255) NOT NULL,
  `barang_kode` varchar(255) DEFAULT NULL,
  `barang_harga_beli` int(11) DEFAULT NULL,
  `barang_harga_jual` int(11) NOT NULL,
  `barang_sisa_stok` int(11) DEFAULT NULL,
  PRIMARY KEY (`barang_id`),
  UNIQUE KEY `barang_kode` (`barang_kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table dbkasir.barang: ~2 rows (approximately)
DELETE FROM `barang`;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` (`barang_id`, `barang_nama`, `barang_kode`, `barang_harga_beli`, `barang_harga_jual`, `barang_sisa_stok`) VALUES
	(1, 'Fanta', '123', 3000, 3500, 20),
	(2, 'Coca-Cola', '321', 4000, 4500, 20);
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;

-- Dumping structure for table dbkasir.login
CREATE TABLE IF NOT EXISTS `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(60) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `role` enum('admin') NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table dbkasir.login: ~0 rows (approximately)
DELETE FROM `login`;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`login_id`, `username`, `password`, `name`, `avatar`, `role`) VALUES
	(1, 'admin', '$2y$10$OqTj4GxJK4ilsJfAB8iwRuWbYdEJFj52FHdSyaZtGzCJCCPYicivu', 'My Admin', '', 'admin');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

-- Dumping structure for table dbkasir.struk
CREATE TABLE IF NOT EXISTS `struk` (
  `barang_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `struk_qty` int(11) NOT NULL,
  `struk_harga_barang` int(11) NOT NULL,
  PRIMARY KEY (`barang_id`,`transaksi_id`),
  CONSTRAINT `FK_struk_barang` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dbkasir.struk: ~0 rows (approximately)
DELETE FROM `struk`;
/*!40000 ALTER TABLE `struk` DISABLE KEYS */;
INSERT INTO `struk` (`barang_id`, `transaksi_id`, `struk_qty`, `struk_harga_barang`) VALUES
	(1, 2, 1, 3500),
	(2, 2, 2, 4500);
/*!40000 ALTER TABLE `struk` ENABLE KEYS */;

-- Dumping structure for table dbkasir.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `transaksi_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaksi_waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaksi_total` int(11) NOT NULL,
  PRIMARY KEY (`transaksi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table dbkasir.transaksi: ~0 rows (approximately)
DELETE FROM `transaksi`;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` (`transaksi_id`, `transaksi_waktu`, `transaksi_total`) VALUES
	(2, '2020-03-30 21:33:47', 12500);
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
