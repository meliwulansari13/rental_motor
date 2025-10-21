-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Okt 2025 pada 10.51
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_motor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `history_bagi_hasil`
--

CREATE TABLE `history_bagi_hasil` (
  `id` int(11) NOT NULL,
  `pemesanan_id` int(11) DEFAULT NULL,
  `sewa_id` int(11) DEFAULT NULL,
  `motor_id` int(11) NOT NULL,
  `pemilik_id` int(11) NOT NULL,
  `total_pendapatan` decimal(15,2) NOT NULL DEFAULT 0.00,
  `bagi_pemilik` decimal(15,2) NOT NULL DEFAULT 0.00,
  `bagi_admin` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `settled_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `history_bagi_hasil`
--

INSERT INTO `history_bagi_hasil` (`id`, `pemesanan_id`, `sewa_id`, `motor_id`, `pemilik_id`, `total_pendapatan`, `bagi_pemilik`, `bagi_admin`, `tanggal`, `settled_at`) VALUES
(1, NULL, 8, 4, 2, 5000000.00, 3000000.00, 2000000.00, '2025-09-23 13:52:17', NULL),
(2, NULL, 9, 12, 11, 2000000.00, 1200000.00, 800000.00, '2025-09-23 14:54:36', NULL),
(3, NULL, 11, 15, 14, 6000000.00, 3600000.00, 2400000.00, '2025-09-29 14:28:31', NULL),
(4, NULL, 12, 5, 2, 500000.00, 300000.00, 200000.00, '2025-09-29 16:19:30', NULL),
(5, NULL, 13, 14, 14, 3000000.00, 1800000.00, 1200000.00, '2025-09-30 10:56:03', NULL),
(6, NULL, 14, 5, 2, 500000.00, 300000.00, 200000.00, '2025-09-30 12:49:31', NULL),
(7, NULL, 18, 8, 11, 60000.00, 36000.00, 24000.00, '2025-10-01 07:44:09', NULL),
(8, NULL, 25, 6, 2, 600000.00, 360000.00, 240000.00, '2025-10-01 12:22:53', NULL),
(9, NULL, 26, 6, 2, 600000.00, 360000.00, 240000.00, '2025-10-01 12:27:47', NULL),
(10, NULL, 27, 6, 2, 600000.00, 360000.00, 240000.00, '2025-10-01 12:28:00', NULL),
(11, NULL, 28, 6, 2, 600000.00, 360000.00, 240000.00, '2025-10-01 12:28:15', NULL),
(12, NULL, 29, 6, 2, 600000.00, 360000.00, 240000.00, '2025-10-01 13:32:50', NULL),
(13, NULL, 30, 6, 2, 600000.00, 360000.00, 240000.00, '2025-10-01 13:35:55', NULL),
(14, NULL, 31, 6, 2, 600000.00, 360000.00, 240000.00, '2025-10-01 13:37:33', NULL),
(15, NULL, 32, 7, 2, 700.00, 420.00, 280.00, '2025-10-01 13:37:50', NULL),
(16, NULL, 33, 14, 14, 60000.00, 36000.00, 24000.00, '2025-10-01 13:39:14', NULL),
(17, NULL, 38, 3, 2, 500000.00, 300000.00, 200000.00, '2025-10-02 12:51:13', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `motor`
--

CREATE TABLE `motor` (
  `id` int(11) NOT NULL,
  `pemilik_id` int(11) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `tipe_cc` varchar(10) NOT NULL,
  `plat_nomor` varchar(20) NOT NULL,
  `harga_sewa` decimal(10,2) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `dokumen_kepemilikan` text DEFAULT NULL,
  `status` enum('tersedia','disewa','perawatan') DEFAULT 'tersedia',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `harga_per_hari` int(11) DEFAULT 0,
  `harga_per_minggu` int(11) DEFAULT 0,
  `harga_per_bulan` int(11) DEFAULT 0,
  `verifikasi` enum('pending','diterima','ditolak') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `motor`
--

INSERT INTO `motor` (`id`, `pemilik_id`, `merk`, `tipe_cc`, `plat_nomor`, `harga_sewa`, `foto`, `photo`, `dokumen_kepemilikan`, `status`, `created_at`, `harga_per_hari`, `harga_per_minggu`, `harga_per_bulan`, `verifikasi`) VALUES
(3, 2, 'beat1', '125', 'B 2347 R', 0.00, NULL, '1758507698_1motor.webp', '[\"1758507698_bpkb\"]', 'tersedia', '2025-09-22 02:21:38', 0, 0, 0, 'diterima'),
(5, 2, 'scoppy', '100', 'r 5666', 0.00, NULL, '1758525754_motor2.webp', '[\"1758525754_bpkb\"]', 'disewa', '2025-09-22 07:22:34', 0, 0, 0, 'ditolak'),
(6, 2, 'beat', '125', 'T 123456 V5', 0.00, NULL, '1758525792_motor_listrik.jpg', '[\"1758525792_bpkb\"]', 'disewa', '2025-09-22 07:23:12', 0, 0, 0, 'pending'),
(7, 2, 'vio', '100', 'V 123', 0.00, NULL, '1758586826_1motor.webp', '[\"1758586826_bpkb\"]', 'disewa', '2025-09-23 00:20:26', 0, 0, 0, 'pending'),
(8, 11, 'honda', '100', 'RZ 123 BN', 0.00, NULL, '1758608426_motor3.webp', '[\"1758608426_bpkb1.png\"]', 'tersedia', '2025-09-23 06:20:26', 0, 0, 0, 'pending'),
(12, 11, 'scoppy', '100', 'T 12', 0.00, NULL, '1758613229_1758506768_motor_listrik.jpg', '[\"1758613229_1758608426_bpkb1.png\"]', 'disewa', '2025-09-23 07:40:29', 0, 0, 0, 'pending'),
(13, 11, 'scoppy', '100', 'cvcgf', 0.00, NULL, '1758613989_1758505974_motor_listrik.jpg', '[\"1758613989_1758505974_bpkb\"]', 'disewa', '2025-09-23 07:53:09', 0, 0, 0, 'pending'),
(14, 14, 'Vario', '125', 'BM 1098765 NM', 0.00, NULL, '1759110686_motor_vario.jpg', '[\"1759110686_images.jpg\"]', 'disewa', '2025-09-29 01:51:26', 0, 0, 0, 'diterima'),
(15, 14, 'mio mirza', '100', 'BN 9797 BN', 0.00, NULL, '1759110716_1758505974_motor_listrik.jpg', '[\"1759110716_1758608426_bpkb1.png\"]', 'tersedia', '2025-09-29 01:51:56', 0, 0, 0, 'diterima'),
(16, 14, 'motor genio', '150', 'MN 1234 CB', 0.00, NULL, '1759374326_motor2.webp', '[\"1759374326_images.jpg\"]', 'disewa', '2025-10-02 03:05:26', 0, 0, 0, 'diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `penyewa_id` int(11) DEFAULT NULL,
  `motor_id` int(11) DEFAULT NULL,
  `sewa_id` int(11) NOT NULL,
  `jumlah` decimal(12,2) NOT NULL,
  `total_bayar` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tanggal_bayar` timestamp NOT NULL DEFAULT current_timestamp(),
  `metode` enum('tunai','transfer') DEFAULT 'tunai',
  `status` enum('Pending','Lunas') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `penyewa_id`, `motor_id`, `sewa_id`, `jumlah`, `total_bayar`, `tanggal_bayar`, `metode`, `status`) VALUES
(2, NULL, NULL, 2, 2000000.00, 0.00, '2025-09-22 07:05:59', 'transfer', 'Pending'),
(3, NULL, NULL, 2, 9999999999.99, 0.00, '2025-09-22 07:18:08', 'tunai', 'Pending'),
(4, NULL, NULL, 3, 80000000.00, 0.00, '2025-09-22 07:25:02', 'transfer', 'Pending'),
(5, NULL, NULL, 3, 500000.00, 0.00, '2025-09-22 07:26:34', 'tunai', 'Pending'),
(6, NULL, NULL, 3, 20000.00, 0.00, '2025-09-22 07:32:02', 'transfer', 'Pending'),
(7, NULL, NULL, 3, 5000000.00, 0.00, '2025-09-22 07:32:30', 'tunai', 'Pending'),
(10, NULL, NULL, 6, 5000000.00, 0.00, '2025-09-22 17:00:00', 'tunai', 'Lunas'),
(11, NULL, NULL, 7, 200000.00, 0.00, '2025-09-23 06:41:19', 'transfer', 'Pending'),
(13, NULL, NULL, 7, 8000000.00, 0.00, '2025-09-23 07:54:09', 'tunai', 'Pending'),
(14, NULL, NULL, 9, 2000000.00, 0.00, '2025-09-22 17:00:00', 'tunai', 'Lunas'),
(15, NULL, NULL, 10, 600000000.00, 0.00, '2025-09-29 01:55:13', 'tunai', 'Pending'),
(18, NULL, NULL, 13, 3000000.00, 0.00, '2025-09-29 17:00:00', 'tunai', 'Pending'),
(19, NULL, NULL, 14, 500000.00, 0.00, '2025-09-29 17:00:00', 'tunai', 'Lunas'),
(20, NULL, NULL, 18, 60000.00, 0.00, '2025-09-30 17:00:00', 'tunai', 'Pending'),
(21, NULL, NULL, 6, 1000000.00, 0.00, '2025-10-01 00:46:44', 'transfer', 'Lunas'),
(22, NULL, NULL, 16, 70000000.00, 0.00, '2025-10-01 00:53:11', 'tunai', 'Pending'),
(23, NULL, NULL, 25, 600000.00, 0.00, '2025-09-30 17:00:00', '', 'Pending'),
(24, NULL, NULL, 26, 600000.00, 0.00, '2025-09-30 17:00:00', '', 'Pending'),
(26, NULL, NULL, 28, 600000.00, 0.00, '2025-09-30 17:00:00', '', 'Pending'),
(27, NULL, NULL, 29, 600000.00, 0.00, '2025-09-30 17:00:00', '', 'Pending'),
(28, NULL, NULL, 30, 600000.00, 0.00, '2025-09-30 17:00:00', '', 'Pending'),
(29, NULL, NULL, 31, 600000.00, 0.00, '2025-09-30 17:00:00', '', 'Pending'),
(30, NULL, NULL, 32, 700.00, 0.00, '2025-09-30 17:00:00', '', 'Pending'),
(31, NULL, NULL, 33, 60000.00, 0.00, '2025-09-30 17:00:00', '', 'Pending'),
(32, NULL, NULL, 38, 500000.00, 0.00, '2025-10-01 17:00:00', '', 'Pending'),
(33, NULL, NULL, 39, 0.00, 0.00, '2025-10-02 06:19:02', 'tunai', 'Lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sewa`
--

CREATE TABLE `sewa` (
  `id` int(11) NOT NULL,
  `motor_id` int(11) NOT NULL,
  `tanggal_sewa` date DEFAULT NULL,
  `penyewa_id` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `tipe_durasi` enum('harian','mingguan','bulanan') NOT NULL,
  `total_harga` decimal(12,2) NOT NULL,
  `status_bayar` varchar(20) DEFAULT 'Pending',
  `jumlah_dp` int(11) DEFAULT 0,
  `status` enum('aktif','selesai','dibatalkan') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `konfirmasi_pengembalian` enum('Menunggu Konfirmasi','Dikonfirmasi') DEFAULT 'Menunggu Konfirmasi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sewa`
--

INSERT INTO `sewa` (`id`, `motor_id`, `tanggal_sewa`, `penyewa_id`, `tanggal_mulai`, `tanggal_selesai`, `tipe_durasi`, `total_harga`, `status_bayar`, `jumlah_dp`, `status`, `created_at`, `konfirmasi_pengembalian`) VALUES
(2, 3, NULL, 5, '2025-09-12', '2025-09-13', 'harian', 45446578.00, 'Pending', 0, 'selesai', '2025-09-22 06:28:41', 'Menunggu Konfirmasi'),
(3, 5, NULL, 8, '2025-09-10', '2025-09-11', 'harian', 200000.00, 'Pending', 0, 'selesai', '2025-09-22 07:24:41', 'Menunggu Konfirmasi'),
(6, 8, '2025-09-23', 10, '2025-09-29', '2025-09-30', 'harian', 600000.00, 'Pending', 0, 'aktif', '2025-09-23 06:34:23', 'Menunggu Konfirmasi'),
(7, 8, NULL, 10, '2025-09-23', '2025-09-24', 'harian', 300000.00, 'Pending', 0, 'selesai', '2025-09-23 06:40:13', 'Menunggu Konfirmasi'),
(9, 12, '0000-00-00', 10, '2025-09-27', '2025-09-28', 'harian', 700000.00, 'Pending', 0, 'selesai', '2025-09-23 07:54:36', 'Menunggu Konfirmasi'),
(10, 8, NULL, 13, '2025-09-29', '2025-09-30', 'harian', 800000.00, 'Pending', 0, 'aktif', '2025-09-29 01:47:04', 'Menunggu Konfirmasi'),
(13, 14, '0000-00-00', 8, '2025-09-30', '2025-10-01', 'harian', 500000.00, 'Pending', 0, 'aktif', '2025-09-30 03:56:03', 'Menunggu Konfirmasi'),
(14, 5, NULL, 13, '2025-09-29', '2025-09-30', 'harian', 400000.00, 'Pending', 0, 'aktif', '2025-09-30 05:49:31', 'Menunggu Konfirmasi'),
(15, 12, NULL, 13, '2025-09-30', '2025-10-01', 'harian', 400000.00, 'Pending', 0, 'aktif', '2025-09-30 07:11:40', 'Menunggu Konfirmasi'),
(16, 15, NULL, 13, '2025-09-30', '2025-10-01', 'harian', 600000.00, 'Pending', 0, 'selesai', '2025-10-01 00:28:13', 'Menunggu Konfirmasi'),
(17, 14, NULL, 13, '2025-09-30', '2025-10-01', 'harian', 3000000.00, 'Pending', 0, 'aktif', '2025-10-01 00:28:46', 'Menunggu Konfirmasi'),
(18, 8, NULL, 13, '2025-10-01', '2025-10-02', 'harian', 4000000.00, 'Pending', 0, 'selesai', '2025-10-01 00:44:09', 'Menunggu Konfirmasi'),
(25, 6, NULL, 16, '2025-10-01', '2025-10-08', 'harian', 600000.00, 'Pending', 0, '', '2025-10-01 05:22:53', 'Menunggu Konfirmasi'),
(26, 6, NULL, 16, '2025-10-01', '2025-10-08', 'harian', 600000.00, 'Pending', 0, '', '2025-10-01 05:27:47', 'Menunggu Konfirmasi'),
(28, 6, NULL, 13, '2025-10-01', '2025-10-02', 'harian', 600000.00, 'Pending', 0, '', '2025-10-01 05:28:15', 'Menunggu Konfirmasi'),
(29, 6, NULL, 4, '2025-10-01', '2025-11-01', 'harian', 600000.00, 'Pending', 0, '', '2025-10-01 06:32:50', 'Menunggu Konfirmasi'),
(30, 6, NULL, 4, '2025-10-01', '2025-11-01', 'harian', 600000.00, 'Pending', 0, '', '2025-10-01 06:35:55', 'Menunggu Konfirmasi'),
(31, 6, NULL, 4, '2025-10-01', '2025-11-01', 'harian', 600000.00, 'Pending', 0, '', '2025-10-01 06:37:33', 'Menunggu Konfirmasi'),
(32, 7, NULL, 8, '2025-10-01', '2025-11-01', 'harian', 700.00, 'Pending', 0, '', '2025-10-01 06:37:50', 'Menunggu Konfirmasi'),
(33, 14, NULL, 16, '2025-10-01', '2025-10-02', 'harian', 60000.00, 'Pending', 0, '', '2025-10-01 06:39:14', 'Menunggu Konfirmasi'),
(37, 3, NULL, 13, '2025-10-02', '2025-10-02', 'harian', 0.00, 'Pending', 0, '', '2025-10-02 05:25:22', 'Menunggu Konfirmasi'),
(38, 3, NULL, 4, '2025-10-02', '2025-10-09', 'harian', 500000.00, 'Pending', 0, '', '2025-10-02 05:51:13', 'Menunggu Konfirmasi'),
(39, 16, NULL, 22, '2025-10-02', '2025-10-02', 'bulanan', 0.00, 'Pending', 0, 'aktif', '2025-10-02 06:12:29', 'Menunggu Konfirmasi'),
(40, 3, NULL, 13, '2025-10-02', '2025-10-31', 'mingguan', 0.00, 'Pending', 0, '', '2025-10-02 08:17:07', 'Menunggu Konfirmasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tarif`
--

CREATE TABLE `tarif` (
  `id` int(11) NOT NULL,
  `motor_id` int(11) NOT NULL,
  `tarif_harian` decimal(12,2) NOT NULL,
  `tarif_mingguan` decimal(12,2) NOT NULL,
  `tarif_bulanan` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `jenis` varchar(20) DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `harga_harian` int(11) DEFAULT 0,
  `harga_mingguan` int(11) DEFAULT 0,
  `harga_bulanan` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tarif`
--

INSERT INTO `tarif` (`id`, `motor_id`, `tarif_harian`, `tarif_mingguan`, `tarif_bulanan`, `created_at`, `jenis`, `harga`, `status`, `harga_harian`, `harga_mingguan`, `harga_bulanan`) VALUES
(23, 3, 0.00, 0.00, 0.00, '2025-09-29 01:54:08', 'harian', 500000, 'aktif', 0, 0, 0),
(24, 3, 0.00, 0.00, 0.00, '2025-09-29 01:54:08', 'mingguan', 6000000, 'aktif', 0, 0, 0),
(25, 3, 0.00, 0.00, 0.00, '2025-09-29 01:54:08', 'bulanan', 700000, 'aktif', 0, 0, 0),
(32, 13, 0.00, 0.00, 0.00, '2025-09-29 01:54:51', 'harian', 5000000, 'aktif', 0, 0, 0),
(33, 13, 0.00, 0.00, 0.00, '2025-09-29 01:54:51', 'mingguan', 10000000, 'aktif', 0, 0, 0),
(34, 13, 0.00, 0.00, 0.00, '2025-09-29 01:54:51', 'bulanan', 150000000, 'aktif', 0, 0, 0),
(35, 6, 0.00, 0.00, 0.00, '2025-09-30 08:36:59', 'harian', 600000, 'aktif', 0, 0, 0),
(36, 6, 0.00, 0.00, 0.00, '2025-09-30 08:36:59', 'mingguan', 700000, 'aktif', 0, 0, 0),
(37, 6, 0.00, 0.00, 0.00, '2025-09-30 08:36:59', 'bulanan', 80000, 'aktif', 0, 0, 0),
(38, 15, 0.00, 0.00, 0.00, '2025-10-01 00:31:28', 'harian', 40000, 'aktif', 0, 0, 0),
(39, 15, 0.00, 0.00, 0.00, '2025-10-01 00:31:28', 'mingguan', 50000, 'aktif', 0, 0, 0),
(40, 15, 0.00, 0.00, 0.00, '2025-10-01 00:31:28', 'bulanan', 60000, 'aktif', 0, 0, 0),
(41, 8, 0.00, 0.00, 0.00, '2025-10-01 00:43:28', 'harian', 60000, 'aktif', 0, 0, 0),
(42, 8, 0.00, 0.00, 0.00, '2025-10-01 00:43:28', 'mingguan', 70000, 'aktif', 0, 0, 0),
(43, 8, 0.00, 0.00, 0.00, '2025-10-01 00:43:28', 'bulanan', 80000, 'aktif', 0, 0, 0),
(44, 14, 0.00, 0.00, 0.00, '2025-10-01 00:55:51', 'harian', 60000, 'aktif', 0, 0, 0),
(45, 14, 0.00, 0.00, 0.00, '2025-10-01 00:55:51', 'mingguan', 40000, 'aktif', 0, 0, 0),
(46, 14, 0.00, 0.00, 0.00, '2025-10-01 00:55:51', 'bulanan', 300000, 'aktif', 0, 0, 0),
(47, 5, 0.00, 0.00, 0.00, '2025-10-01 00:56:10', 'harian', 100000, 'aktif', 0, 0, 0),
(48, 5, 0.00, 0.00, 0.00, '2025-10-01 00:56:10', 'mingguan', 20000, 'aktif', 0, 0, 0),
(49, 5, 0.00, 0.00, 0.00, '2025-10-01 00:56:10', 'bulanan', 800000, 'aktif', 0, 0, 0),
(50, 12, 0.00, 0.00, 0.00, '2025-10-01 01:31:30', 'harian', 80000, 'aktif', 0, 0, 0),
(51, 12, 0.00, 0.00, 0.00, '2025-10-01 01:31:30', 'mingguan', 50000, 'aktif', 0, 0, 0),
(52, 12, 0.00, 0.00, 0.00, '2025-10-01 01:31:30', 'bulanan', 70000, 'aktif', 0, 0, 0),
(56, 16, 0.00, 0.00, 0.00, '2025-10-02 04:40:16', 'harian', 4000000, 'aktif', 0, 0, 0),
(57, 16, 0.00, 0.00, 0.00, '2025-10-02 04:40:16', 'mingguan', 5000000, 'aktif', 0, 0, 0),
(58, 16, 0.00, 0.00, 0.00, '2025-10-02 04:40:16', 'bulanan', 60000000, 'aktif', 0, 0, 0),
(59, 7, 0.00, 0.00, 0.00, '2025-10-02 04:56:36', 'harian', 3000000, 'aktif', 0, 0, 0),
(60, 7, 0.00, 0.00, 0.00, '2025-10-02 04:56:36', 'mingguan', 400000, 'aktif', 0, 0, 0),
(61, 7, 0.00, 0.00, 0.00, '2025-10-02 04:56:36', 'bulanan', 500000, 'aktif', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `sewa_id` int(11) NOT NULL,
  `penyewa_id` int(11) NOT NULL,
  `motor_id` int(11) NOT NULL,
  `jumlah` decimal(12,2) NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('Pending','Lunas') DEFAULT 'Pending',
  `metode` varchar(50) DEFAULT 'Cash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_tlpn` varchar(20) DEFAULT NULL,
  `role` enum('admin','pemilik','penyewa') NOT NULL,
  `verifikasi` enum('Pending','Verified','Rejected') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `no_tlpn`, `role`, `verifikasi`) VALUES
(1, 'Admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', '08123456879', 'admin', 'Pending'),
(2, 'pemilik', 'pemilik@gmail.com', '202cb962ac59075b964b07152d234b70', '08123459867', 'pemilik', 'Pending'),
(3, 'penyewa', 'penyewa@gmail.com', '202cb962ac59075b964b07152d234b70', '08123498765', 'penyewa', 'Pending'),
(4, 'andi', 'andi@gmail', '0320116b2af221a6f673f93925b3fc62', '08543366', 'penyewa', 'Pending'),
(5, 'pii', 'pio@gmail.com', '99c5e07b4d5de9d18c350cdf64c5aa3d', '0976', 'penyewa', 'Pending'),
(8, 'hilma', 'hilma@gmail.com', '$2y$10$OW3h/Hr7TT1H3eQl1I5q5OB31iPOT8TEfciFpOfZztrbQG.tEbywW', '2345', 'penyewa', 'Pending'),
(9, 'beni', 'beni@gmail.com', '$2y$10$FfJFr1M/OdwGHCYfiuyuuOdfTShX2mbXO1DLbu62BD0iIml4e3ALG', '097854', 'penyewa', 'Pending'),
(10, 'meli', 'meli@gmail.com', '202cb962ac59075b964b07152d234b70', '08951729507', 'penyewa', 'Pending'),
(11, 'rosa', 'rosa3@gmail.com', '202cb962ac59075b964b07152d234b70', '24356768', 'pemilik', 'Pending'),
(13, 'meli wulansari', 'meliwulansari30@gmail.com', '202cb962ac59075b964b07152d234b70', '082537812654', 'penyewa', 'Pending'),
(14, 'rosa rosmaya', 'rosarosmaya@gmail.com', '202cb962ac59075b964b07152d234b70', '08236399736', 'pemilik', 'Pending'),
(16, 'sahrul', 'sahrul45@gmail.com', '$2y$10$OmN0/pa8JwCEFfFTSz0GD.E0SVMmzth29t18IkVdDQs460gXztHCC', '08127654321', 'penyewa', 'Pending'),
(17, 'Dimas Aditya', 'dimas@gmail.com', '$2y$10$CTP5c1aoA9Ti7pIgCc4bXewq/.7KiGwGijTuUURVUJrBk.8iZTEp6', '789699', 'pemilik', 'Pending'),
(19, 'melinda', 'meli2@gmail.com', '202cb962ac59075b964b07152d234b70', '09876545353', 'penyewa', 'Pending'),
(20, 'meli ', 'dheimora_mel@gmail.com', '202cb962ac59075b964b07152d234b70', '082318169219', 'admin', 'Pending'),
(21, 'radit', 'radit@gmail.com', '202cb962ac59075b964b07152d234b70', '09876533', 'admin', 'Pending'),
(22, 'Srimulyani', 'sri@gmail.com', '202cb962ac59075b964b07152d234b70', '0876543563', 'penyewa', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `history_bagi_hasil`
--
ALTER TABLE `history_bagi_hasil`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plat_nomor` (`plat_nomor`),
  ADD KEY `pemilik_id` (`pemilik_id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sewa_id` (`sewa_id`);

--
-- Indeks untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `motor_id` (`motor_id`),
  ADD KEY `penyewa_id` (`penyewa_id`);

--
-- Indeks untuk tabel `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `motor_id` (`motor_id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sewa_id` (`sewa_id`),
  ADD KEY `penyewa_id` (`penyewa_id`),
  ADD KEY `motor_id` (`motor_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `history_bagi_hasil`
--
ALTER TABLE `history_bagi_hasil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `motor`
--
ALTER TABLE `motor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tarif`
--
ALTER TABLE `tarif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `motor`
--
ALTER TABLE `motor`
  ADD CONSTRAINT `motor_ibfk_1` FOREIGN KEY (`pemilik_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`sewa_id`) REFERENCES `sewa` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`motor_id`) REFERENCES `motor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`penyewa_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tarif`
--
ALTER TABLE `tarif`
  ADD CONSTRAINT `tarif_ibfk_1` FOREIGN KEY (`motor_id`) REFERENCES `motor` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`sewa_id`) REFERENCES `sewa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`penyewa_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`motor_id`) REFERENCES `motor` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
