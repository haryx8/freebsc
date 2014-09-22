-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.38-0ubuntu0.14.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table freebsc.bagian
CREATE TABLE IF NOT EXISTS `bagian` (
  `id_bagian` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_bagian` char(255) NOT NULL COMMENT 'Nama Bagian',
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `update_by` int(11) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bagian`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table freebsc.bagian: ~5 rows (approximately)
DELETE FROM `bagian`;
/*!40000 ALTER TABLE `bagian` DISABLE KEYS */;
INSERT INTO `bagian` (`id_bagian`, `nama_bagian`, `status`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
	(1, 'BAGIAN SUPPORT', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(2, 'BAGIAN PRODUCT', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(3, 'BAGIAN REGIONAL SALES', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(4, 'BAGIAN PENSION & OTHER ALLIANCE', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(5, 'BAGIAN RETAIL FINANCING & MONITORING', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `bagian` ENABLE KEYS */;


-- Dumping structure for table freebsc.jabatan
CREATE TABLE IF NOT EXISTS `jabatan` (
  `id_jabatan` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_jabatan` char(255) NOT NULL COMMENT 'Nama Jabatan',
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `update_by` int(11) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table freebsc.jabatan: ~2 rows (approximately)
DELETE FROM `jabatan`;
/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`, `status`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
	(1, 'PELAKSANA WARUNG MIKRO', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(2, 'ANALIS WARUNG MIKRO', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;


-- Dumping structure for table freebsc.pegawai
CREATE TABLE IF NOT EXISTS `pegawai` (
  `id_pegawai` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_jabatan` int(11) unsigned NOT NULL COMMENT 'Jabatan Pegawai',
  `id_bagian` int(11) unsigned NOT NULL DEFAULT '0',
  `nip` char(9) NOT NULL COMMENT 'Nomor Induk Pegawai',
  `nama` char(255) NOT NULL COMMENT 'Nama Pegawai',
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `update_by` int(11) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pegawai`),
  UNIQUE KEY `UNIQUE` (`nip`),
  KEY `FK_pegawai_jabatan` (`id_jabatan`),
  KEY `FK_pegawai_bagian` (`id_bagian`),
  CONSTRAINT `FK_pegawai_bagian` FOREIGN KEY (`id_bagian`) REFERENCES `bagian` (`id_bagian`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pegawai_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table freebsc.pegawai: ~5 rows (approximately)
DELETE FROM `pegawai`;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` (`id_pegawai`, `id_jabatan`, `id_bagian`, `nip`, `nama`, `status`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
	(1, 1, 1, '088273655', 'ACHMAD SUBARKAT', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(2, 1, 1, '128110866', 'AEP SAEFUL BAHRI', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(3, 1, 1, '123456789', 'CHADIJAH AMALIA MAULIDYA', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(4, 1, 4, '987654321', 'AMELIA', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(5, 1, 2, '123456777', 'INNA WAHYU KUSUMANINGRUM', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;


-- Dumping structure for table freebsc.pencapaian
CREATE TABLE IF NOT EXISTS `pencapaian` (
  `id_kinerja` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_pic` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'PIC Kerjaan',
  `bulan` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Bulan kerja',
  `kerja` text NOT NULL COMMENT 'Nama Kerjaan',
  `target` float NOT NULL COMMENT 'Target Kerja',
  `ukuran` char(225) NOT NULL COMMENT 'Ukuran kinerja',
  `dateline` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Target kerja',
  `pencapaian` float NOT NULL COMMENT 'Pencapaian kinerja',
  `nilai` float unsigned NOT NULL DEFAULT '0' COMMENT 'Nilai kinerja',
  `keterangan` text NOT NULL COMMENT 'Keterangan',
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `update_by` int(11) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kinerja`),
  KEY `FK_pencapaian_pic` (`id_pic`),
  CONSTRAINT `FK_pencapaian_pic` FOREIGN KEY (`id_pic`) REFERENCES `pic` (`id_pic`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table freebsc.pencapaian: ~6 rows (approximately)
DELETE FROM `pencapaian`;
/*!40000 ALTER TABLE `pencapaian` DISABLE KEYS */;
INSERT INTO `pencapaian` (`id_kinerja`, `id_pic`, `bulan`, `kerja`, `target`, `ukuran`, `dateline`, `pencapaian`, `nilai`, `keterangan`, `status`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
	(1, 1, '2014-07-02 00:00:00', 'Pembuatan monitoring sistim kinerja CND', 25, 'Sistim tersedia', '0000-00-00', 0, 0, '', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(2, 1, '2014-07-02 00:00:00', 'Pembuatan monitoring sistim kinerja CND', 25, 'Sistim tersedia', '0000-00-00', 0, 0, '', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(3, 1, '2014-07-02 00:00:00', 'Pembuatan monitoring sistim kinerja CND', 25, 'Sistim tersedia', '0000-00-00', 0, 0, '', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(4, 1, '2014-07-02 00:00:00', 'Pembuatan monitoring sistim kinerja CND', 25, 'Sistim tersedia', '0000-00-00', 0, 0, '', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(5, 3, '2014-07-02 00:00:00', 'Membuat Template Kinerja Pegawai', 100, 'Template tersedia, terkirim ke semua bagian', '2014-01-01', 0, 0, '', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(6, 5, '2014-07-02 00:00:00', 'Evaluasi TW II', 100, 'Mengirimkan surat ke vendor', '2014-07-01', 0, 0, '', '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `pencapaian` ENABLE KEYS */;


-- Dumping structure for table freebsc.pic
CREATE TABLE IF NOT EXISTS `pic` (
  `id_pic` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) unsigned NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `update_by` int(11) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pic`),
  KEY `FK_pic_pegawai` (`id_pegawai`),
  CONSTRAINT `FK_pic_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table freebsc.pic: ~5 rows (approximately)
DELETE FROM `pic`;
/*!40000 ALTER TABLE `pic` DISABLE KEYS */;
INSERT INTO `pic` (`id_pic`, `id_pegawai`, `status`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
	(1, 1, '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(2, 2, '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(3, 3, '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(4, 4, '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00'),
	(5, 5, '0', NULL, '1970-01-01 00:00:01', NULL, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `pic` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
