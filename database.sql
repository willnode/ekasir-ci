-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Apr 2020 pada 05.15
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekasir_barang`
--

CREATE TABLE `ekasir_barang` (
  `barang_id` int(11) NOT NULL,
  `barang_nama` varchar(255) NOT NULL,
  `barang_kode` varchar(255) DEFAULT NULL,
  `barang_modal` int(11) DEFAULT NULL,
  `barang_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ekasir_barang`
--

INSERT INTO `ekasir_barang` (`barang_id`, `barang_nama`, `barang_kode`, `barang_modal`, `barang_harga`) VALUES
(1, 'Fanta', '123', 3000, 3500),
(2, 'Coca-Cola', '321', 4000, 4500),
(4, 'TELOR', 'rt01', 22000, 25000),
(5, 'galon', 'rt02', 5000, 6000),
(6, 'lpg', 'rt03', 19000, 20000),
(7, 'kopi', 'rt05', 10000, 12000),
(8, 'sabun mandi', 'rt06', 3000, 5000),
(9, 'shampo', 'rtr07', 28000, 35000),
(10, 'deterjen', 'rt08', 3000, 5000),
(11, 'pembalut', 'kw01', 10000, 14000),
(12, 'gula', 'rt09', 11000, 12000),
(13, 'tea', 'rt10', 5000, 7000),
(14, 'minyak goreng', 'rt11', 20000, 24000),
(15, 'tisu', 'fc01', 11000, 14000),
(16, 'botol minum', 'rt12', 10000, 15000),
(17, 'mie instan', 'rt13', 32000, 40000),
(18, 'sandal', 'rt14', 10000, 14000),
(19, 'tepung', 'rt15', 100000, 12000),
(20, 'bumbu instan', 'rt16', 2500, 5000),
(21, 'buku', 'atk01', 3000, 4000),
(22, 'folio bergaris', 'atk02', 11000, 15000),
(23, 'susu', 'rt19', 13000, 17000),
(24, 'obat nyamuk', 'rt20', 4000, 6000),
(25, 'sabun cuci piring', 'rt21', 12000, 14000),
(26, 'beras ', 'rt22', 9000, 12000),
(27, 'pewangi pakaian', 'rt23', 9000, 12000),
(28, 'sosis', 'rt24', 500, 1000),
(154, 'TELOR', 'rtt', 22000, 25000),
(155, 'galon', 'rtgn', 5000, 6000),
(156, 'lpg', 'rtl', 19000, 20000),
(157, 'kopi', 'rtk', 10000, 12000),
(158, 'sabun mandi', 'rtsm', 3000, 5000),
(159, 'shampo', 'rtsp', 28000, 35000),
(160, 'deterjen', 'rtd', 3000, 5000),
(161, 'pembalut', 'kwp', 10000, 14000),
(162, 'gula', 'rtg', 11000, 12000),
(163, 'tea', 'rtte', 5000, 7000),
(164, 'minyak goreng', 'rtmg', 20000, 24000),
(165, 'tisu', 'fct', 11000, 14000),
(166, 'botol minum', 'rtbm', 10000, 15000),
(167, 'mie instan', 'rtmi', 32000, 40000),
(168, 'sandal', 'rts', 10000, 14000),
(169, 'tepung', 'rttpg', 100000, 12000),
(170, 'bumbu instan', 'rtbi', 2500, 5000),
(171, 'buku', 'atkb', 3000, 4000),
(172, 'folio bergaris', 'atkfb', 11000, 15000),
(173, 'susu', 'rtss', 13000, 17000),
(174, 'obat nyamuk', 'rton', 4000, 6000),
(175, 'sabun cuci piring', 'rtscp', 12000, 14000),
(176, 'beras ', 'rtbrs', 9000, 12000),
(177, 'pewangi pakaian', 'rtppkn', 9000, 12000),
(178, 'sosis', 'rtssi', 500, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekasir_login`
--

CREATE TABLE `ekasir_login` (
  `login_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` char(60) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `role` enum('admin') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ekasir_login`
--

INSERT INTO `ekasir_login` (`login_id`, `username`, `password`, `name`, `avatar`, `role`) VALUES
(1, 'admin', '$2y$10$OqTj4GxJK4ilsJfAB8iwRuWbYdEJFj52FHdSyaZtGzCJCCPYicivu', 'My Admin', '', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekasir_struk`
--

CREATE TABLE `ekasir_struk` (
  `barang_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `struk_modal_barang` int(11) NOT NULL,
  `struk_harga_barang` int(11) NOT NULL,
  `struk_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ekasir_struk`
--

INSERT INTO `ekasir_struk` (`barang_id`, `transaksi_id`, `struk_modal_barang`, `struk_harga_barang`, `struk_qty`) VALUES
(1, 2, 0, 3500, 1),
(1, 5, 3000, 3500, 1),
(1, 6, 3000, 3500, 1),
(1, 8, 3000, 3500, 1),
(1, 9, 3000, 3500, 5),
(1, 10, 3000, 3500, 9),
(1, 11, 3000, 3500, 1),
(1, 12, 3000, 3500, 1),
(1, 13, 3000, 3500, 1),
(2, 2, 0, 4500, 2),
(2, 5, 4000, 4500, 1),
(2, 6, 4000, 4500, 1),
(2, 7, 4000, 4500, 1),
(2, 9, 4000, 4500, 3),
(2, 11, 4000, 4500, 1),
(2, 12, 4000, 4500, 1),
(2, 13, 4000, 4500, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekasir_transaksi`
--

CREATE TABLE `ekasir_transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `transaksi_waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaksi_modal` int(11) NOT NULL,
  `transaksi_total` int(11) NOT NULL,
  `transaksi_uang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ekasir_transaksi`
--

INSERT INTO `ekasir_transaksi` (`transaksi_id`, `transaksi_waktu`, `transaksi_modal`, `transaksi_total`, `transaksi_uang`) VALUES
(2, '2020-03-30 14:33:47', 12000, 12500, 0),
(3, '2020-03-31 07:24:09', 0, 0, 0),
(4, '2020-03-31 07:24:29', 0, 0, 0),
(5, '2020-03-31 07:25:10', 7000, 8000, 0),
(6, '2020-04-01 00:13:17', 7000, 8000, 0),
(7, '2020-04-01 00:14:20', 4000, 4500, 0),
(8, '2020-04-01 00:29:52', 3000, 3500, 0),
(9, '2020-04-01 08:48:31', 27000, 31000, 31000),
(10, '2020-04-01 08:50:22', 27000, 31500, 31500),
(11, '2020-04-01 21:09:20', 7000, 8000, 8000),
(12, '2020-04-02 22:12:36', 7000, 8000, 8000),
(13, '2020-04-02 22:15:12', 7000, 8000, 10000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ekasir_barang`
--
ALTER TABLE `ekasir_barang`
  ADD PRIMARY KEY (`barang_id`),
  ADD UNIQUE KEY `barang_kode` (`barang_kode`);

--
-- Indeks untuk tabel `ekasir_login`
--
ALTER TABLE `ekasir_login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `ekasir_struk`
--
ALTER TABLE `ekasir_struk`
  ADD PRIMARY KEY (`barang_id`,`transaksi_id`);

--
-- Indeks untuk tabel `ekasir_transaksi`
--
ALTER TABLE `ekasir_transaksi`
  ADD PRIMARY KEY (`transaksi_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `ekasir_barang`
--
ALTER TABLE `ekasir_barang`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT untuk tabel `ekasir_login`
--
ALTER TABLE `ekasir_login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `ekasir_transaksi`
--
ALTER TABLE `ekasir_transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ekasir_struk`
--
ALTER TABLE `ekasir_struk`
  ADD CONSTRAINT `FK_struk_barang` FOREIGN KEY (`barang_id`) REFERENCES `ekasir_barang` (`barang_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
