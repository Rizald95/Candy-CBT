-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cbtcandy
CREATE DATABASE IF NOT EXISTS `cbtcandy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cbtcandy`;

-- Dumping structure for table cbtcandy.agama
CREATE TABLE IF NOT EXISTS `agama` (
  `agamaku` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.agama: ~6 rows (approximately)
INSERT INTO `agama` (`agamaku`) VALUES
	('Islam'),
	('Kristen Katolik'),
	('Kristen Protestan'),
	('Hindu'),
	('Budha'),
	('Konghucu');

-- Dumping structure for table cbtcandy.berita
CREATE TABLE IF NOT EXISTS `berita` (
  `id_berita` int NOT NULL AUTO_INCREMENT,
  `id_mapel` int NOT NULL,
  `sesi` varchar(10) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `ikut` varchar(10) DEFAULT NULL,
  `susulan` varchar(10) DEFAULT NULL,
  `no_susulan` text,
  `mulai` varchar(10) DEFAULT NULL,
  `selesai` varchar(10) DEFAULT NULL,
  `nama_proktor` varchar(50) DEFAULT NULL,
  `nip_proktor` varchar(50) DEFAULT NULL,
  `nama_pengawas` varchar(50) DEFAULT NULL,
  `nip_pengawas` varchar(50) DEFAULT NULL,
  `catatan` text,
  `tgl_ujian` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_berita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.berita: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.file_pendukung
CREATE TABLE IF NOT EXISTS `file_pendukung` (
  `id_file` int NOT NULL AUTO_INCREMENT,
  `id_mapel` int DEFAULT '0',
  `nama_file` varchar(50) DEFAULT NULL,
  `status_file` int DEFAULT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.file_pendukung: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.jawaban
CREATE TABLE IF NOT EXISTS `jawaban` (
  `id_jawaban` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NOT NULL,
  `id_mapel` int NOT NULL,
  `id_soal` int NOT NULL,
  `id_ujian` int NOT NULL,
  `jawaban` char(1) DEFAULT NULL,
  `jawabx` char(1) DEFAULT NULL,
  `jenis` int NOT NULL,
  `esai` text,
  `nilai_esai` int NOT NULL DEFAULT '0',
  `ragu` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_jawaban`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.jawaban: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.jawaban_tugas
CREATE TABLE IF NOT EXISTS `jawaban_tugas` (
  `id_jawaban` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int DEFAULT NULL,
  `id_tugas` int DEFAULT NULL,
  `jawaban` longtext,
  `file` varchar(255) DEFAULT NULL,
  `tgl_dikerjakan` datetime DEFAULT NULL,
  `tgl_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nilai` varchar(5) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_jawaban`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.jawaban_tugas: ~0 rows (approximately)
INSERT INTO `jawaban_tugas` (`id_jawaban`, `id_siswa`, `id_tugas`, `jawaban`, `file`, `tgl_dikerjakan`, `tgl_update`, `nilai`, `status`) VALUES
	(1, 1, 1, '<p>nckxnkcnxkcnxkncxcxknnlxclxlcx</p>', '1_1.pdf', NULL, '2025-03-14 04:12:07', NULL, NULL);

-- Dumping structure for table cbtcandy.jenis
CREATE TABLE IF NOT EXISTS `jenis` (
  `id_jenis` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.jenis: ~3 rows (approximately)
INSERT INTO `jenis` (`id_jenis`, `nama`, `status`) VALUES
	('PTS', 'Penilaian Tengah Semester', 'tidak'),
	('UL', 'ULANGAN', 'aktif'),
	('USBK', 'Ujian Sekolah', 'tidak');

-- Dumping structure for table cbtcandy.jurusan
CREATE TABLE IF NOT EXISTS `jurusan` (
  `jurusan_id` varchar(25) NOT NULL,
  `nama_jurusan_sp` varchar(100) DEFAULT NULL,
  `kurikulum` varchar(120) DEFAULT NULL,
  `jurusan_sp_id` varchar(50) DEFAULT NULL,
  `kurikulum_id` varchar(20) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jurusan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.jurusan: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.kelas
CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` varchar(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.kelas: ~0 rows (approximately)
INSERT INTO `kelas` (`id_kelas`, `level`, `nama`, `rombongan_belajar_id`, `semester_id`) VALUES
	('xmipa1', 'xmipa', 'X MIPA 1', NULL, NULL);

-- Dumping structure for table cbtcandy.level
CREATE TABLE IF NOT EXISTS `level` (
  `kode_level` varchar(5) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kode_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.level: ~5 rows (approximately)
INSERT INTO `level` (`kode_level`, `keterangan`, `rombongan_belajar_id`) VALUES
	('12ipa', 'XII MIPA', NULL),
	('12Ips', 'XII IPS', NULL),
	('xiipa', 'XI MIPA', NULL),
	('xiips', 'XI IPS', NULL),
	('xips', 'X IPS', NULL),
	('xmipa', ' X MIPA', NULL);

-- Dumping structure for table cbtcandy.log
CREATE TABLE IF NOT EXISTS `log` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NOT NULL,
  `type` varchar(20) NOT NULL,
  `text` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.log: ~67 rows (approximately)
INSERT INTO `log` (`id_log`, `id_siswa`, `type`, `text`, `date`) VALUES
	(1, 3, 'login', 'masuk', '2020-04-12 07:58:45'),
	(2, 3, 'testongoing', 'sedang ujian', '2020-04-12 07:58:56'),
	(3, 3, 'login', 'Selesai Ujian', '2020-04-12 08:00:07'),
	(4, 3, 'testongoing', 'sedang ujian', '2020-04-12 08:00:35'),
	(5, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:43'),
	(6, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:43'),
	(7, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:43'),
	(8, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:43'),
	(9, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:43'),
	(10, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:43'),
	(11, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:43'),
	(12, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(13, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(14, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(15, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(16, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(17, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(18, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(19, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(20, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(21, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(22, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:44'),
	(23, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(24, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(25, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(26, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(27, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(28, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(29, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(30, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(31, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(32, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:45'),
	(33, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(34, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(35, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(36, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(37, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(38, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(39, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(40, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(41, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(42, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:46'),
	(43, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:47'),
	(44, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:47'),
	(45, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:47'),
	(46, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:47'),
	(47, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:47'),
	(48, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:47'),
	(49, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:47'),
	(50, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:47'),
	(51, 3, 'login', 'Selesai Ujian', '2020-04-12 08:03:47'),
	(52, 3, 'testongoing', 'sedang ujian', '2020-04-12 08:05:34'),
	(53, 3, 'login', 'Selesai Ujian', '2020-04-12 08:07:56'),
	(54, 4, 'login', 'masuk', '2020-04-12 11:26:09'),
	(55, 4, 'testongoing', 'sedang ujian', '2020-04-12 11:27:48'),
	(56, 4, 'logout', 'keluar', '2020-04-12 11:28:07'),
	(57, 4, 'login', 'masuk', '2020-04-12 11:28:16'),
	(58, 4, 'testongoing', 'sedang ujian', '2020-04-12 11:28:22'),
	(59, 4, 'login', 'Selesai Ujian', '2020-04-12 11:29:49'),
	(60, 4, 'login', 'Selesai Ujian', '2020-04-12 11:30:26'),
	(61, 4, 'testongoing', 'sedang ujian', '2020-04-12 11:36:46'),
	(62, 4, 'testongoing', 'sedang ujian', '2020-04-12 11:37:06'),
	(63, 4, 'login', 'Selesai Ujian', '2020-04-12 11:39:07'),
	(64, 4, 'login', 'Selesai Ujian', '2020-04-12 11:39:18'),
	(65, 4, 'testongoing', 'sedang ujian', '2020-04-12 11:39:56'),
	(66, 4, 'login', 'Selesai Ujian', '2020-04-12 11:42:17'),
	(67, 309, 'login', 'masuk', '2020-04-24 05:01:31'),
	(68, 1, 'login', 'masuk', '2025-03-14 11:03:58'),
	(69, 1, 'logout', 'keluar', '2025-03-14 11:05:42'),
	(70, 1, 'login', 'masuk', '2025-03-14 11:11:32'),
	(71, 1, 'logout', 'keluar', '2025-03-14 11:12:34'),
	(72, 1, 'login', 'masuk', '2025-03-14 15:03:38'),
	(73, 1, 'logout', 'keluar', '2025-03-14 15:07:35');

-- Dumping structure for table cbtcandy.mapel
CREATE TABLE IF NOT EXISTS `mapel` (
  `id_mapel` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) NOT NULL DEFAULT '0',
  `idpk` varchar(255) NOT NULL,
  `idguru` varchar(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jml_soal` int NOT NULL,
  `jml_esai` int NOT NULL DEFAULT '0',
  `tampil_pg` int NOT NULL,
  `tampil_esai` int NOT NULL DEFAULT '0',
  `bobot_pg` int NOT NULL,
  `bobot_esai` int NOT NULL DEFAULT '0',
  `level` varchar(5) NOT NULL,
  `opsi` int NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(2) NOT NULL,
  `kkm` int DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.mapel: ~0 rows (approximately)
INSERT INTO `mapel` (`id_mapel`, `kode`, `idpk`, `idguru`, `nama`, `jml_soal`, `jml_esai`, `tampil_pg`, `tampil_esai`, `bobot_pg`, `bobot_esai`, `level`, `opsi`, `kelas`, `date`, `status`, `kkm`, `soal_agama`) VALUES
	(1, 'KIM01', 'semua', '1', 'Kimia', 5, 0, 5, 0, 20, 0, 'xmipa', 5, 'a:1:{i:0;s:5:"X MIPA";}', '2025-03-14 03:58:09', '1', 70, NULL);

-- Dumping structure for table cbtcandy.mata_pelajaran
CREATE TABLE IF NOT EXISTS `mata_pelajaran` (
  `kode_mapel` varchar(20) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `mata_pelajaran_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`kode_mapel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.mata_pelajaran: ~11 rows (approximately)
INSERT INTO `mata_pelajaran` (`kode_mapel`, `nama_mapel`, `mata_pelajaran_id`) VALUES
	('IPA-1', 'Matematika Peminatan', NULL),
	('IPA-2', 'Fisika', NULL),
	('IPA-3', 'Kimia', NULL),
	('IPA-4', 'Biologi', NULL),
	('UMUM', 'Pendidikan Agama Islam dan Budi Pekerti', NULL),
	('UMUM-2', 'Bahasa Indonesia', NULL),
	('UMUM-3', 'Pendidikan Pancasila dan Kewarganegaraan', NULL),
	('UMUM-4', 'Matematika Wajib', NULL),
	('UMUM-5', 'Seni Budaya', NULL),
	('UMUM-6', 'Bahasa Inggris', NULL),
	('UMUM-7', 'Pendidikan Jasmani, Olahraga, dan Kesehatan (PJOK)', NULL),
	('UMUM-8', 'Prakarya dan Kewirausahaan (PKWU)', NULL);

-- Dumping structure for table cbtcandy.materi
CREATE TABLE IF NOT EXISTS `materi` (
  `id_materi` int NOT NULL AUTO_INCREMENT,
  `id_guru` int NOT NULL DEFAULT '0',
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `materi` longtext,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_materi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.materi: ~5 rows (approximately)
INSERT INTO `materi` (`id_materi`, `id_guru`, `kelas`, `mapel`, `judul`, `materi`, `file`, `tgl_mulai`, `youtube`, `tgl`, `status`) VALUES
	(6, 1, 'a:2:{i:0;s:6:"XITKJA";i:1;s:5:"XTKJB";}', 'KIMIA', 'hjhjhjh', '<p>&lt;iframe width="560" height="315" src="https://www.youtube.com/embed/t9FtOJBJJ3c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen&gt;&lt;/iframe&gt;</p>', NULL, '2020-04-23 09:20:00', NULL, '2020-04-23 11:23:40', 1),
	(7, 1, 'a:1:{i:0;s:5:"XTKJB";}', 'KIMIA', 'TEST', '<p><iframe width="560" height="315" src="https://www.youtube.com/embed/t9FtOJBJJ3c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>', 'Daftar hadir piket.xlsx', '2020-04-23 18:00:00', NULL, '2020-04-23 11:40:29', 1),
	(8, 1, 'a:1:{i:0;s:5:"semua";}', 'KIMIA', 'aaaaaaa', '', NULL, '2020-04-24 04:00:00', 'https://www.youtube.com/embed/t9FtOJBJJ3c', '2020-04-23 21:39:19', NULL),
	(9, 260, 'a:1:{i:0;s:5:"semua";}', 'KIMIA', 'NEW CANDY 2.5', '<p>200000000</p>', NULL, '2020-04-24 05:00:00', '', '2020-04-23 22:01:06', NULL),
	(10, 260, 'a:1:{i:0;s:5:"semua";}', 'KIMIA', 'test', '<p>teststtstst</p>', NULL, '2020-04-24 09:19:00', '', '2020-04-24 02:19:17', NULL);

-- Dumping structure for table cbtcandy.nilai
CREATE TABLE IF NOT EXISTS `nilai` (
  `id_nilai` int NOT NULL AUTO_INCREMENT,
  `id_ujian` int NOT NULL,
  `id_mapel` int NOT NULL,
  `id_siswa` int NOT NULL,
  `kode_ujian` varchar(30) NOT NULL,
  `ujian_mulai` varchar(20) NOT NULL,
  `ujian_berlangsung` varchar(20) DEFAULT NULL,
  `ujian_selesai` varchar(20) DEFAULT NULL,
  `jml_benar` int DEFAULT NULL,
  `jml_salah` int DEFAULT NULL,
  `nilai_esai` varchar(10) DEFAULT NULL,
  `skor` varchar(10) DEFAULT NULL,
  `total` varchar(10) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `hasil` int NOT NULL,
  `jawaban` text,
  `jawaban_esai` longtext,
  `nilai_esai2` text,
  `online` int NOT NULL DEFAULT '0',
  `id_soal` longtext,
  `id_opsi` longtext,
  `id_esai` text,
  `blok` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_nilai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.nilai: ~0 rows (approximately)
INSERT INTO `nilai` (`id_nilai`, `id_ujian`, `id_mapel`, `id_siswa`, `kode_ujian`, `ujian_mulai`, `ujian_berlangsung`, `ujian_selesai`, `jml_benar`, `jml_salah`, `nilai_esai`, `skor`, `total`, `status`, `ipaddress`, `hasil`, `jawaban`, `jawaban_esai`, `nilai_esai2`, `online`, `id_soal`, `id_opsi`, `id_esai`, `blok`) VALUES
	(1, 101, 5, 2001, 'UJIAN-MTK-01', '2025-03-14 08:00:00', '2025-03-14 08:30:00', '2025-03-14 09:00:00', 40, 10, '80', '90', '170', 1, '192.168.1.10', 1, 'A,B,C,D,A,C,B', 'Esai jawaban siswa', '85', 0, 'SOAL001,SOAL002', 'A,B,C,D', 'ESAI001', 0);

-- Dumping structure for table cbtcandy.pengawas
CREATE TABLE IF NOT EXISTS `pengawas` (
  `id_pengawas` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` text,
  `level` varchar(10) DEFAULT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `rt_rw` varchar(8) DEFAULT NULL,
  `dusun` varchar(50) DEFAULT NULL,
  `kelurahan` varchar(50) DEFAULT NULL,
  `kecamatan` varchar(30) DEFAULT NULL,
  `kode_pos` int DEFAULT NULL,
  `nuptk` varchar(20) DEFAULT NULL,
  `bidang_studi` varchar(50) DEFAULT NULL,
  `jenis_ptk` varchar(50) DEFAULT NULL,
  `tgs_tambahan` varchar(50) DEFAULT NULL,
  `status_pegawai` varchar(50) DEFAULT NULL,
  `status_aktif` varchar(20) DEFAULT NULL,
  `status_nikah` varchar(20) DEFAULT NULL,
  `sumber_gaji` varchar(30) DEFAULT NULL,
  `ahli_lab` varchar(10) DEFAULT NULL,
  `nama_ibu` varchar(40) DEFAULT NULL,
  `nama_suami` varchar(50) DEFAULT NULL,
  `nik_suami` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(20) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `keahlian_isyarat` varchar(10) DEFAULT NULL,
  `kewarganegaraan` varchar(10) DEFAULT NULL,
  `npwp` varchar(16) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `ptk_id` varchar(50) DEFAULT NULL,
  `password2` text,
  `ruang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pengawas`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.pengawas: ~3 rows (approximately)
INSERT INTO `pengawas` (`id_pengawas`, `nip`, `nama`, `jabatan`, `username`, `password`, `level`, `no_ktp`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_hp`, `email`, `alamat_jalan`, `rt_rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `nuptk`, `bidang_studi`, `jenis_ptk`, `tgs_tambahan`, `status_pegawai`, `status_aktif`, `status_nikah`, `sumber_gaji`, `ahli_lab`, `nama_ibu`, `nama_suami`, `nik_suami`, `pekerjaan`, `tmt`, `keahlian_isyarat`, `kewarganegaraan`, `npwp`, `foto`, `ptk_id`, `password2`, `ruang`) VALUES
	(1, '-', 'administrator', '', 'admin', '$2y$10$R5ycb9Yfe/fjmt8CTnJ1huULx/T2X8QvrzgoDsjRbpUnpO8AJr6eO', 'admin', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', NULL, NULL, NULL),
	(260, '-', 'PAJAR SIDIK', NULL, 'guru', '$2y$10$nEI4w/AkDG256FRG/UXYAefvZ0shy1qjovAy0eajuCgyI6b3b2lVi', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(261, '21106050098', 'Didit', NULL, 'didit', 'didit123', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table cbtcandy.pengumuman
CREATE TABLE IF NOT EXISTS `pengumuman` (
  `id_pengumuman` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `user` int NOT NULL,
  `text` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pengumuman`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.pengumuman: ~1 rows (approximately)
INSERT INTO `pengumuman` (`id_pengumuman`, `type`, `judul`, `user`, `text`, `date`) VALUES
	(8, 'eksternal', 'INFO JADWAL UJIAN', 1, '<p>Untuk ujian sekolah dilakukan secara daring atau online menggunakan Hp Android, PC, Laptop. Aplikasi ujian diakses dengan browser Google Chrome.</p>', '2020-04-04 15:23:29');

-- Dumping structure for table cbtcandy.pk
CREATE TABLE IF NOT EXISTS `pk` (
  `id_pk` varchar(10) NOT NULL,
  `program_keahlian` varchar(50) NOT NULL,
  `jurusan_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.pk: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.referensi_jurusan
CREATE TABLE IF NOT EXISTS `referensi_jurusan` (
  `jurusan_id` varchar(10) NOT NULL,
  `nama_jurusan` varchar(100) DEFAULT NULL,
  `untuk_sma` int NOT NULL,
  `untuk_smk` int NOT NULL,
  `jenjang_pendidikan_id` int DEFAULT NULL,
  PRIMARY KEY (`jurusan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.referensi_jurusan: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.ruang
CREATE TABLE IF NOT EXISTS `ruang` (
  `kode_ruang` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  PRIMARY KEY (`kode_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.ruang: ~2 rows (approximately)
INSERT INTO `ruang` (`kode_ruang`, `keterangan`) VALUES
	('LAB-01', 'Laboratorium Komputer -1'),
	('LAB-02', 'Laboratorium Komputer - 2');

-- Dumping structure for table cbtcandy.savsoft_options
CREATE TABLE IF NOT EXISTS `savsoft_options` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `qid` int NOT NULL,
  `q_option` text NOT NULL,
  `q_option_match` varchar(1000) DEFAULT NULL,
  `score` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.savsoft_options: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.savsoft_qbank
CREATE TABLE IF NOT EXISTS `savsoft_qbank` (
  `qid` int NOT NULL AUTO_INCREMENT,
  `question_type` varchar(100) NOT NULL DEFAULT 'Multiple Choice Single Answer',
  `question` text NOT NULL,
  `description` text NOT NULL,
  `cid` int NOT NULL,
  `lid` int NOT NULL,
  `no_time_served` int NOT NULL DEFAULT '0',
  `no_time_corrected` int NOT NULL DEFAULT '0',
  `no_time_incorrected` int NOT NULL DEFAULT '0',
  `no_time_unattempted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.savsoft_qbank: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.semester
CREATE TABLE IF NOT EXISTS `semester` (
  `semester_id` varchar(5) NOT NULL,
  `tahun_ajaran_id` varchar(4) NOT NULL,
  `nama_semester` varchar(50) NOT NULL,
  `semester` int NOT NULL,
  `periode_aktif` enum('1','0') NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.semester: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.server
CREATE TABLE IF NOT EXISTS `server` (
  `kode_server` varchar(20) NOT NULL,
  `nama_server` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.server: ~0 rows (approximately)
INSERT INTO `server` (`kode_server`, `nama_server`, `status`) VALUES
	('01', 'SERVER-01', 'aktif');

-- Dumping structure for table cbtcandy.sesi
CREATE TABLE IF NOT EXISTS `sesi` (
  `kode_sesi` varchar(10) NOT NULL,
  `nama_sesi` varchar(30) NOT NULL,
  PRIMARY KEY (`kode_sesi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.sesi: ~0 rows (approximately)
INSERT INTO `sesi` (`kode_sesi`, `nama_sesi`) VALUES
	('KIM-01', 'ULANGAN KIMIA');

-- Dumping structure for table cbtcandy.session
CREATE TABLE IF NOT EXISTS `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_time` varchar(10) NOT NULL,
  `session_hash` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.session: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.setting
CREATE TABLE IF NOT EXISTS `setting` (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `aplikasi` varchar(100) DEFAULT NULL,
  `kode_sekolah` varchar(10) DEFAULT NULL,
  `sekolah` varchar(50) DEFAULT NULL,
  `jenjang` varchar(5) DEFAULT NULL,
  `kepsek` varchar(50) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `alamat` text,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` text,
  `header` text,
  `header_kartu` text,
  `nama_ujian` text,
  `versi` varchar(10) DEFAULT NULL,
  `ip_server` varchar(100) DEFAULT NULL,
  `waktu` varchar(50) DEFAULT NULL,
  `server` varchar(50) DEFAULT NULL,
  `id_server` varchar(50) DEFAULT NULL,
  `url_host` varchar(50) DEFAULT NULL,
  `token_api` varchar(50) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  `npsn` varchar(10) DEFAULT NULL,
  `db_versi` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_setting`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.setting: ~1 rows (approximately)
INSERT INTO `setting` (`id_setting`, `aplikasi`, `kode_sekolah`, `sekolah`, `jenjang`, `kepsek`, `nip`, `alamat`, `kecamatan`, `kota`, `telp`, `fax`, `web`, `email`, `logo`, `header`, `header_kartu`, `nama_ujian`, `versi`, `ip_server`, `waktu`, `server`, `id_server`, `url_host`, `token_api`, `sekolah_id`, `npsn`, `db_versi`) VALUES
	(1, 'CANDY SCHOOL', 'K0248', 'CANDY SCHOOL', 'SD', 'CANDY SCHOOL', '-', 'Perum BSD <br />\r\n', 'Karang Bahagia                                    ', 'Bekasi', '021 123 123 123', '021 95878050', 'candycbt.sch.id', 'candycbt@gmail.com', 'dist/img/logo87.png', '', 'KARTU PESERTA', 'ULANGAN', '2.5', 'http://192.168.0.200/candycbt', 'Asia/Jakarta', 'pusat', 'SR01', 'xxxxxx', 'VKLuYN7Lwjjwu', '8cce47df-aae7-4274-83cb-5af3093eab56', '69787351', '2.8.1');

-- Dumping structure for table cbtcandy.sinkron
CREATE TABLE IF NOT EXISTS `sinkron` (
  `nama_data` varchar(50) NOT NULL,
  `data` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `status_sinkron` int DEFAULT NULL,
  PRIMARY KEY (`nama_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.sinkron: ~4 rows (approximately)
INSERT INTO `sinkron` (`nama_data`, `data`, `jumlah`, `tanggal`, `status_sinkron`) VALUES
	('DATA1', 'siswa', '', '', 0),
	('DATA2', 'bank soal', '', '', 0),
	('DATA3', 'soal', '', '', 0),
	('DATA4', 'jadwal', '', '', 0);

-- Dumping structure for table cbtcandy.siswa
CREATE TABLE IF NOT EXISTS `siswa` (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `id_kelas` varchar(11) DEFAULT NULL,
  `idpk` varchar(10) DEFAULT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `no_peserta` varchar(30) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `level` varchar(5) DEFAULT NULL,
  `ruang` varchar(10) DEFAULT NULL,
  `sesi` varchar(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text,
  `foto` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `kebutuhan_khusus` varchar(20) DEFAULT NULL,
  `alamat` text,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kode_pos` int DEFAULT NULL,
  `jenis_tinggal` varchar(100) DEFAULT NULL,
  `alat_transportasi` varchar(100) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `skhun` int DEFAULT NULL,
  `no_kps` varchar(50) DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `tahun_lahir_ayah` int DEFAULT NULL,
  `pendidikan_ayah` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(100) DEFAULT NULL,
  `penghasilan_ayah` varchar(100) DEFAULT NULL,
  `nohp_ayah` varchar(15) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `tahun_lahir_ibu` int DEFAULT NULL,
  `pendidikan_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(100) DEFAULT NULL,
  `penghasilan_ibu` varchar(100) DEFAULT NULL,
  `nohp_ibu` int DEFAULT NULL,
  `nama_wali` varchar(150) DEFAULT NULL,
  `tahun_lahir_wali` int DEFAULT NULL,
  `pendidikan_wali` varchar(50) DEFAULT NULL,
  `pekerjaan_wali` varchar(100) DEFAULT NULL,
  `penghasilan_wali` varchar(50) DEFAULT NULL,
  `angkatan` int DEFAULT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `peserta_didik_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `status` int DEFAULT '1',
  `online` int DEFAULT '0',
  PRIMARY KEY (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.siswa: ~2 rows (approximately)
INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
	(1, 'xmipa1', NULL, '21106050098', '01', 'Didit Ahmad Fauzi', 'xmipa', 'LAB-01', 'KIM-01', 'student-01', 'student01', NULL, '01', NULL, NULL, NULL, 'Islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
	(2, 'xmipa1', NULL, '21106050099', '02', 'Test', 'xmipa', 'LAB-02', 'KIM-01', 'test', 'test01', NULL, '01', NULL, NULL, NULL, 'Islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);

-- Dumping structure for table cbtcandy.soal
CREATE TABLE IF NOT EXISTS `soal` (
  `id_soal` int NOT NULL AUTO_INCREMENT,
  `id_mapel` int NOT NULL,
  `nomor` int DEFAULT NULL,
  `soal` longtext,
  `jenis` int DEFAULT NULL,
  `pilA` longtext,
  `pilB` longtext,
  `pilC` longtext,
  `pilD` longtext,
  `pilE` longtext,
  `jawaban` varchar(1) DEFAULT NULL,
  `file` mediumtext,
  `file1` mediumtext,
  `fileA` mediumtext,
  `fileB` mediumtext,
  `fileC` mediumtext,
  `fileD` mediumtext,
  `fileE` mediumtext,
  PRIMARY KEY (`id_soal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.soal: ~5 rows (approximately)
INSERT INTO `soal` (`id_soal`, `id_mapel`, `nomor`, `soal`, `jenis`, `pilA`, `pilB`, `pilC`, `pilD`, `pilE`, `jawaban`, `file`, `file1`, `fileA`, `fileB`, `fileC`, `fileD`, `fileE`) VALUES
	(1, 1, 1, 'Unsur manakah berikut ini yang termasuk gas mulia?', 1, 'Hidrogen', 'Oksigen', 'Nitrogen', 'Helium', 'Karbon', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 1, 2, 'Berikut yang termasuk senyawa adalah...', 1, 'O2', 'H2O', 'N2', 'He', 'Ar', 'B', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 1, 3, 'Berapa jumlah atom oksigen dalam molekul H2SO4?', 1, '1', '2', '3', '4', '5', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 1, 4, 'Perubahan fisika ditunjukkan oleh peristiwa...', 1, 'Kertas dibakar', 'Es mencair', 'Besi berkarat', 'Kayu membusuk', 'Nasi menjadi basi', 'B', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 1, 5, 'Partikel penyusun unsur adalah...', 1, 'Ion', 'Molekul', 'Atom', 'Proton', 'Elektron', 'C', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table cbtcandy.token
CREATE TABLE IF NOT EXISTS `token` (
  `id_token` int NOT NULL AUTO_INCREMENT,
  `token` varchar(6) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `masa_berlaku` time NOT NULL,
  PRIMARY KEY (`id_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.token: ~1 rows (approximately)
INSERT INTO `token` (`id_token`, `token`, `time`, `masa_berlaku`) VALUES
	(1, 'VGGPDF', '2020-04-04 16:29:17', '00:15:00');

-- Dumping structure for table cbtcandy.tugas
CREATE TABLE IF NOT EXISTS `tugas` (
  `id_tugas` int NOT NULL AUTO_INCREMENT,
  `id_guru` int NOT NULL DEFAULT '0',
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tugas` longtext NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_tugas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table cbtcandy.tugas: ~1 rows (approximately)
INSERT INTO `tugas` (`id_tugas`, `id_guru`, `kelas`, `mapel`, `judul`, `tugas`, `file`, `tgl_mulai`, `tgl_selesai`, `tgl`, `status`) VALUES
	(1, 260, 'a:1:{i:0;s:6:"xmipa1";}', 'KIMIA', 'TEST', '', 'Studi Kasus.pdf', '2025-03-14 11:08:00', '2025-03-21 11:08:00', '2025-03-14 04:08:45', NULL);

-- Dumping structure for table cbtcandy.ujian
CREATE TABLE IF NOT EXISTS `ujian` (
  `id_ujian` int NOT NULL AUTO_INCREMENT,
  `kode_nama` varchar(255) DEFAULT '0',
  `id_pk` varchar(255) NOT NULL,
  `id_guru` int NOT NULL,
  `id_mapel` int NOT NULL,
  `kode_ujian` varchar(30) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jml_soal` int NOT NULL,
  `jml_esai` int NOT NULL,
  `bobot_pg` int NOT NULL,
  `opsi` int NOT NULL,
  `bobot_esai` int NOT NULL,
  `tampil_pg` int NOT NULL,
  `tampil_esai` int NOT NULL,
  `lama_ujian` int NOT NULL,
  `tgl_ujian` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `waktu_ujian` time DEFAULT NULL,
  `selesai_ujian` time DEFAULT NULL,
  `level` varchar(5) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `sesi` varchar(1) DEFAULT NULL,
  `acak` int NOT NULL,
  `token` int NOT NULL,
  `status` int DEFAULT NULL,
  `hasil` int DEFAULT NULL,
  `kkm` varchar(128) DEFAULT NULL,
  `ulang` int DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  `reset` int DEFAULT NULL,
  PRIMARY KEY (`id_ujian`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cbtcandy.ujian: ~0 rows (approximately)

-- Dumping structure for table cbtcandy.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') DEFAULT 'student',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cbtcandy.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
	(1, 'admin2', '0192023a7bbd73250516f069df18b500', 'admin');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
