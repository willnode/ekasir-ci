-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for dbkasir
CREATE DATABASE IF NOT EXISTS `dbkasir` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbkasir`;

-- Dumping structure for table dbkasir.ekasir_barang
CREATE TABLE IF NOT EXISTS `ekasir_barang` (
  `barang_id` int(11) NOT NULL AUTO_INCREMENT,
  `barang_nama` varchar(255) NOT NULL,
  `barang_kode` varchar(255) DEFAULT NULL,
  `barang_modal` int(11) DEFAULT NULL,
  `barang_harga` int(11) NOT NULL,
  PRIMARY KEY (`barang_id`),
  UNIQUE KEY `barang_kode` (`barang_kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table dbkasir.ekasir_barang: ~2 rows (approximately)
DELETE FROM `ekasir_barang`;
/*!40000 ALTER TABLE `ekasir_barang` DISABLE KEYS */;
INSERT INTO `ekasir_barang` (`barang_id`, `barang_nama`, `barang_kode`, `barang_modal`, `barang_harga`) VALUES
	(1, 'Fanta', '123', 3000, 3500),
	(2, 'Coca-Cola', '321', 4000, 4500);
/*!40000 ALTER TABLE `ekasir_barang` ENABLE KEYS */;

-- Dumping structure for table dbkasir.ekasir_login
CREATE TABLE IF NOT EXISTS `ekasir_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(60) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `role` enum('admin') NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table dbkasir.ekasir_login: ~0 rows (approximately)
DELETE FROM `ekasir_login`;
/*!40000 ALTER TABLE `ekasir_login` DISABLE KEYS */;
INSERT INTO `ekasir_login` (`login_id`, `username`, `password`, `name`, `avatar`, `role`) VALUES
	(1, 'admin', '$2y$10$OqTj4GxJK4ilsJfAB8iwRuWbYdEJFj52FHdSyaZtGzCJCCPYicivu', 'My Admin', '', 'admin');
/*!40000 ALTER TABLE `ekasir_login` ENABLE KEYS */;

-- Dumping structure for table dbkasir.ekasir_struk
CREATE TABLE IF NOT EXISTS `ekasir_struk` (
  `barang_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `struk_modal_barang` int(11) NOT NULL,
  `struk_harga_barang` int(11) NOT NULL,
  `struk_qty` int(11) NOT NULL,
  PRIMARY KEY (`barang_id`,`transaksi_id`),
  CONSTRAINT `FK_struk_barang` FOREIGN KEY (`barang_id`) REFERENCES `ekasir_barang` (`barang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dbkasir.ekasir_struk: ~2 rows (approximately)
DELETE FROM `ekasir_struk`;
/*!40000 ALTER TABLE `ekasir_struk` DISABLE KEYS */;
INSERT INTO `ekasir_struk` (`barang_id`, `transaksi_id`, `struk_modal_barang`, `struk_harga_barang`, `struk_qty`) VALUES
	(1, 2, 0, 3500, 1),
	(2, 2, 0, 4500, 2);
/*!40000 ALTER TABLE `ekasir_struk` ENABLE KEYS */;

-- Dumping structure for table dbkasir.ekasir_transaksi
CREATE TABLE IF NOT EXISTS `ekasir_transaksi` (
  `transaksi_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaksi_waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaksi_modal` int(11) NOT NULL,
  `transaksi_total` int(11) NOT NULL,
  PRIMARY KEY (`transaksi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table dbkasir.ekasir_transaksi: ~1 rows (approximately)
DELETE FROM `ekasir_transaksi`;
/*!40000 ALTER TABLE `ekasir_transaksi` DISABLE KEYS */;
INSERT INTO `ekasir_transaksi` (`transaksi_id`, `transaksi_waktu`, `transaksi_modal`, `transaksi_total`) VALUES
	(2, '2020-03-30 21:33:47', 12000, 12500);
/*!40000 ALTER TABLE `ekasir_transaksi` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
