-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bangkegiogiang
CREATE DATABASE IF NOT EXISTS `bangkegiogiang` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bangkegiogiang`;

-- Dumping structure for table bangkegiogiang.bangke
CREATE TABLE IF NOT EXISTS `bangke` (
  `id_bang_ke` int(11) NOT NULL AUTO_INCREMENT,
  `id_index` int(11) DEFAULT NULL,
  `id_giang_vien` int(11) DEFAULT NULL,
  `noi_dung` varchar(50) DEFAULT NULL,
  `sum_giang_day` float DEFAULT NULL,
  `sum_nckh` float DEFAULT NULL,
  `sum_kq` float DEFAULT NULL,
  PRIMARY KEY (`id_bang_ke`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.bangke: ~5 rows (approximately)
INSERT INTO `bangke` (`id_bang_ke`, `id_index`, `id_giang_vien`, `noi_dung`, `sum_giang_day`, `sum_nckh`, `sum_kq`) VALUES
	(11, 1, 1, 'Số giờ chuẩn quy định', 285, 75, NULL),
	(12, 1, 1, 'Số giờ giảm trừ', 0, 0, NULL),
	(13, 1, 1, 'Số giờ chuẩn thực tế (đã giảm trừ)', 285, 75, NULL),
	(14, 1, 1, 'Số giờ hoàn thành thực tế (giảng dạy và NCKH)', 369, 122, NULL),
	(15, 1, 1, 'Số giờ còn lại', 84, 47, NULL);

-- Dumping structure for table bangkegiogiang.bangthamchieu
CREATE TABLE IF NOT EXISTS `bangthamchieu` (
  `id_bang_tham_chieu` int(11) NOT NULL AUTO_INCREMENT,
  `noi_dung` varchar(50) DEFAULT NULL,
  `sum_giang_day` float DEFAULT NULL,
  `sum_nckh` float DEFAULT NULL,
  `sum_kq` float DEFAULT NULL,
  `key_index` int(11) DEFAULT NULL,
  `ghi_chu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_bang_tham_chieu`) USING BTREE,
  UNIQUE KEY `key` (`key_index`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.bangthamchieu: ~5 rows (approximately)
INSERT INTO `bangthamchieu` (`id_bang_tham_chieu`, `noi_dung`, `sum_giang_day`, `sum_nckh`, `sum_kq`, `key_index`, `ghi_chu`) VALUES
	(1, 'Số giờ chuẩn quy định', 285, 75, 360, 1, NULL),
	(2, 'Số giờ giảm trừ\r\n', 0, 0, 0, 2, NULL),
	(3, 'Số giờ chuẩn thực tế (đã giảm trừ)\r\n', 285, 75, 360, 3, '(3) = (1) - (2)'),
	(4, 'Số giờ hoàn thành thực tế (giảng dạy và NCKH)', 0, 0, 0, 4, ''),
	(5, 'Số giờ còn lại\r\n', 285, 75, 360, 5, '(5) = (4) - (3)');

-- Dumping structure for table bangkegiogiang.canbokhoa
CREATE TABLE IF NOT EXISTS `canbokhoa` (
  `id_can_bo_khoa` int(11) NOT NULL AUTO_INCREMENT,
  `ma_can_bo_khoa` varchar(50) DEFAULT NULL,
  `ten_can_bo_khoa` varchar(50) DEFAULT NULL,
  `gioi_tinh` tinyint(4) DEFAULT 1,
  `ngay_sinh` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `so_dien_thoai_1` varchar(11) DEFAULT NULL,
  `so_dien_thoai_2` varchar(11) DEFAULT NULL,
  `dia_chi_lien_lac` text DEFAULT NULL,
  `dia_chi_thuong_tru` text DEFAULT NULL,
  `id_trinh_do` int(11) DEFAULT NULL,
  `trang_thai` tinyint(4) DEFAULT 1,
  `id_khoa` int(11) DEFAULT 1,
  PRIMARY KEY (`id_can_bo_khoa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.canbokhoa: ~8 rows (approximately)
INSERT INTO `canbokhoa` (`id_can_bo_khoa`, `ma_can_bo_khoa`, `ten_can_bo_khoa`, `gioi_tinh`, `ngay_sinh`, `email`, `so_dien_thoai_1`, `so_dien_thoai_2`, `dia_chi_lien_lac`, `dia_chi_thuong_tru`, `id_trinh_do`, `trang_thai`, `id_khoa`) VALUES
	(1, 'cb1', 'Cán bộ khoa 1', 1, '2001-06-05', 'cb1@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 1, 1, 1),
	(2, 'cb2', 'Cán bộ khoa 2', 0, '2001-06-05', 'cb2@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 1, 1, 1),
	(11, 'cb1', 'Cán bộ khoa 1', NULL, '2006-05-01', 'cb1@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 0, 1, 0),
	(12, 'cb2', 'Cán bộ khoa 2', NULL, '2006-05-01', 'cb2@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 0, 1, 0),
	(13, 'cb1', 'Cán bộ khoa 1', NULL, '2006-05-01', 'cb1@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 1, 1, 1),
	(14, 'cb2', 'Cán bộ khoa 2', NULL, '2006-05-01', 'cb2@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 1, 1, 1),
	(15, 'cb1', 'Cán bộ khoa 1', NULL, '2006-05-01', 'cb1@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 1, 1, 1),
	(16, 'cb2', 'Cán bộ khoa 2', NULL, '2006-05-01', 'cb2@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 1, 1, 1),
	(17, 'cb1', 'Cán bộ khoa 1', NULL, '2006-05-01', 'cb1@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 1, 1, 1),
	(18, 'cb2', 'Cán bộ khoa 2', NULL, '2006-05-01', 'cb2@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 1, 1, 1);

-- Dumping structure for table bangkegiogiang.congviec
CREATE TABLE IF NOT EXISTS `congviec` (
  `id_cong_viec` int(11) NOT NULL AUTO_INCREMENT,
  `id_index` int(11) NOT NULL DEFAULT 0,
  `id_giang_vien` int(11) NOT NULL DEFAULT 0,
  `id_quy_doi` int(11) NOT NULL DEFAULT 0,
  `ten_cong_viec` varchar(50) DEFAULT NULL,
  `quy_doi_so_tiet` float DEFAULT NULL,
  `so_luong` float DEFAULT NULL,
  `tong_so_tiet` float DEFAULT NULL,
  PRIMARY KEY (`id_cong_viec`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.congviec: ~4 rows (approximately)
INSERT INTO `congviec` (`id_cong_viec`, `id_index`, `id_giang_vien`, `id_quy_doi`, `ten_cong_viec`, `quy_doi_so_tiet`, `so_luong`, `tong_so_tiet`) VALUES
	(1, 1, 1, 2, 'cong viec 1', 60, 122, 182),
	(2, 1, 1, 3, 'cong viec 2', 30, 2, 3),
	(3, 1, 1, 2, 'cong viec 1', 60, 123, 7380),
	(4, 1, 1, 3, 'cong viec 2', 30, 123, 0),
	(5, 1, 1, 2, 'cong viec 1', 60, 2, 120),
	(6, 1, 1, 3, 'cong viec 2', 30, 2, 0);

-- Dumping structure for table bangkegiogiang.dongia
CREATE TABLE IF NOT EXISTS `dongia` (
  `id_don_gia` int(11) NOT NULL AUTO_INCREMENT,
  `don_gia` float DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  PRIMARY KEY (`id_don_gia`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bangkegiogiang.dongia: ~15 rows (approximately)
INSERT INTO `dongia` (`id_don_gia`, `don_gia`, `ghi_chu`) VALUES
	(2, NULL, NULL),
	(3, NULL, NULL),
	(4, NULL, NULL),
	(5, NULL, NULL),
	(6, NULL, NULL),
	(7, NULL, NULL),
	(8, NULL, NULL),
	(9, NULL, NULL),
	(10, NULL, NULL),
	(11, NULL, NULL),
	(12, NULL, NULL),
	(13, NULL, NULL),
	(14, NULL, NULL),
	(15, 2312, '\r\n'),
	(16, 324, '');

-- Dumping structure for table bangkegiogiang.giangday
CREATE TABLE IF NOT EXISTS `giangday` (
  `id_giang_day` int(11) NOT NULL AUTO_INCREMENT,
  `id_index` int(11) NOT NULL DEFAULT 0,
  `id_giang_vien` int(11) NOT NULL DEFAULT 0,
  `id_nhom_giang_day` int(11) NOT NULL DEFAULT 0,
  `ten_mon_hoc` varchar(50) DEFAULT NULL,
  `ten_lop_hoc` varchar(50) DEFAULT NULL,
  `so_sinh_vien` int(11) DEFAULT NULL,
  `so_nhom` int(11) DEFAULT NULL,
  `so_tiet_mon_hoc` float DEFAULT NULL,
  `so_tiet_thuc_giang` float DEFAULT NULL,
  `he_so_nhom` float DEFAULT NULL,
  `he_so_tin_chi` float DEFAULT NULL,
  `so_tiet_quy_chuan` float DEFAULT NULL,
  PRIMARY KEY (`id_giang_day`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bangkegiogiang.giangday: ~1 rows (approximately)
INSERT INTO `giangday` (`id_giang_day`, `id_index`, `id_giang_vien`, `id_nhom_giang_day`, `ten_mon_hoc`, `ten_lop_hoc`, `so_sinh_vien`, `so_nhom`, `so_tiet_mon_hoc`, `so_tiet_thuc_giang`, `he_so_nhom`, `he_so_tin_chi`, `so_tiet_quy_chuan`) VALUES
	(3, 1, 1, 0, 'ádsa', 'ad', 132, 123, 123, 123, 123, 123, 369),
	(4, 2, 1, 1, 'ádsa', 'ád', 12, 123, 123, 123, 123, 123, 369),
	(5, 2, 1, 0, '111', '11', 0, 0, 0, 0, 0, 0, 0);

-- Dumping structure for table bangkegiogiang.giangvien
CREATE TABLE IF NOT EXISTS `giangvien` (
  `id_giang_vien` int(11) NOT NULL AUTO_INCREMENT,
  `ma_giang_vien` varchar(50) DEFAULT NULL,
  `ten_giang_vien` varchar(50) DEFAULT NULL,
  `gioi_tinh` tinyint(4) DEFAULT 1,
  `ngay_sinh` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `so_dien_thoai_1` varchar(11) DEFAULT NULL,
  `so_dien_thoai_2` varchar(11) DEFAULT NULL,
  `dia_chi_lien_lac` text DEFAULT NULL,
  `dia_chi_thuong_tru` text DEFAULT NULL,
  `id_trinh_do` int(11) DEFAULT NULL,
  `trang_thai` tinyint(4) DEFAULT 1,
  `id_khoa` int(11) DEFAULT 1,
  PRIMARY KEY (`id_giang_vien`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.giangvien: ~2 rows (approximately)
INSERT INTO `giangvien` (`id_giang_vien`, `ma_giang_vien`, `ten_giang_vien`, `gioi_tinh`, `ngay_sinh`, `email`, `so_dien_thoai_1`, `so_dien_thoai_2`, `dia_chi_lien_lac`, `dia_chi_thuong_tru`, `id_trinh_do`, `trang_thai`, `id_khoa`) VALUES
	(1, 'gv1', 'Giảng viên 1', 1, '2001-06-05', 'gv1@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 2, 1, 1),
	(2, 'gv2', 'Giảng viên 2', 0, '2001-06-05', 'gv2@gmail.com', '0123456789', '0123456789', 'CT', 'CT', 2, 1, 1);

-- Dumping structure for table bangkegiogiang.indexcount
CREATE TABLE IF NOT EXISTS `indexcount` (
  `id_index` int(11) NOT NULL AUTO_INCREMENT,
  `ten_index` varchar(50) DEFAULT NULL,
  `ghi_chu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_index`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bangkegiogiang.indexcount: ~2 rows (approximately)
INSERT INTO `indexcount` (`id_index`, `ten_index`, `ghi_chu`) VALUES
	(1, 'Đợt 1', ''),
	(2, 'Đợt 2', NULL);

-- Dumping structure for table bangkegiogiang.khoa
CREATE TABLE IF NOT EXISTS `khoa` (
  `id_khoa` int(11) NOT NULL AUTO_INCREMENT,
  `ten_khoa` varchar(50) DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  PRIMARY KEY (`id_khoa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.khoa: ~3 rows (approximately)
INSERT INTO `khoa` (`id_khoa`, `ten_khoa`, `ghi_chu`) VALUES
	(1, 'Khoa KTCN', ''),
	(2, 'Khoa QTKD', ''),
	(4, 'Khoa Dược - Điều Dưỡng', 'Khoa Dược - Điều Dưỡng');

-- Dumping structure for table bangkegiogiang.nckh
CREATE TABLE IF NOT EXISTS `nckh` (
  `id_nckh` int(11) NOT NULL AUTO_INCREMENT,
  `id_index` int(11) NOT NULL DEFAULT 0,
  `id_giang_vien` int(11) NOT NULL DEFAULT 0,
  `noi_dung` varchar(50) DEFAULT NULL,
  `the_loai` varchar(50) DEFAULT NULL,
  `so_tiet_quy_chuan` float DEFAULT NULL,
  PRIMARY KEY (`id_nckh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.nckh: ~1 rows (approximately)
INSERT INTO `nckh` (`id_nckh`, `id_index`, `id_giang_vien`, `noi_dung`, `the_loai`, `so_tiet_quy_chuan`) VALUES
	(2, 1, 1, 'qưe', 'qưe', 122),
	(3, 2, 1, '23', '1', 122);

-- Dumping structure for table bangkegiogiang.nhomcongviec
CREATE TABLE IF NOT EXISTS `nhomcongviec` (
  `id_nhom_cong_viec` int(11) NOT NULL AUTO_INCREMENT,
  `ten_nhom_cong_viec` varchar(50) DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  PRIMARY KEY (`id_nhom_cong_viec`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.nhomcongviec: ~2 rows (approximately)
INSERT INTO `nhomcongviec` (`id_nhom_cong_viec`, `ten_nhom_cong_viec`, `ghi_chu`) VALUES
	(2, 'Nhom1', ''),
	(3, 'Nhom2', '');

-- Dumping structure for table bangkegiogiang.nhomgiangday
CREATE TABLE IF NOT EXISTS `nhomgiangday` (
  `id_nhom_giang_day` int(11) NOT NULL AUTO_INCREMENT,
  `ten_nhom_giang_day` varchar(50) DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  PRIMARY KEY (`id_nhom_giang_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bangkegiogiang.nhomgiangday: ~3 rows (approximately)
INSERT INTO `nhomgiangday` (`id_nhom_giang_day`, `ten_nhom_giang_day`, `ghi_chu`) VALUES
	(1, 'Lý thuyết', NULL),
	(2, 'Thực hành', NULL),
	(3, 'Lý thuyết + Thực hành', NULL);

-- Dumping structure for table bangkegiogiang.phannhom
CREATE TABLE IF NOT EXISTS `phannhom` (
  `id_phan_nhom` int(11) NOT NULL AUTO_INCREMENT,
  `ten_phan_nhom` varchar(50) DEFAULT NULL,
  `cap_bac` int(11) DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  PRIMARY KEY (`id_phan_nhom`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.phannhom: ~3 rows (approximately)
INSERT INTO `phannhom` (`id_phan_nhom`, `ten_phan_nhom`, `cap_bac`, `ghi_chu`) VALUES
	(0, 'Quản trị', 1, ''),
	(1, 'Cán bộ khoa', 0, NULL),
	(2, 'Giảng viên', 2, '');

-- Dumping structure for table bangkegiogiang.phanquyen
CREATE TABLE IF NOT EXISTS `phanquyen` (
  `id_phan_quyen` int(11) NOT NULL AUTO_INCREMENT,
  `ten_phan_quyen` varchar(50) DEFAULT NULL,
  `cap_bac` int(11) NOT NULL DEFAULT 3,
  `ghi_chu` text DEFAULT NULL,
  PRIMARY KEY (`id_phan_quyen`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.phanquyen: ~3 rows (approximately)
INSERT INTO `phanquyen` (`id_phan_quyen`, `ten_phan_quyen`, `cap_bac`, `ghi_chu`) VALUES
	(1, 'Admin', 1, ''),
	(2, 'Manager', 2, ''),
	(3, 'User', 3, '');

-- Dumping structure for table bangkegiogiang.quydoi
CREATE TABLE IF NOT EXISTS `quydoi` (
  `id_quy_doi` int(11) NOT NULL AUTO_INCREMENT,
  `id_nhom_cong_viec` int(11) NOT NULL DEFAULT 0,
  `ma_cong_viec` int(11) NOT NULL DEFAULT 0,
  `ten_cong_viec` varchar(50) DEFAULT NULL,
  `dieu_kien` text DEFAULT NULL,
  `quy_doi_so_tiet` float DEFAULT NULL,
  PRIMARY KEY (`id_quy_doi`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.quydoi: ~2 rows (approximately)
INSERT INTO `quydoi` (`id_quy_doi`, `id_nhom_cong_viec`, `ma_cong_viec`, `ten_cong_viec`, `dieu_kien`, `quy_doi_so_tiet`) VALUES
	(2, 1, 1, 'cong viec 1', 'x', 60),
	(3, 1, 2, 'cong viec 2', 'x', 30);

-- Dumping structure for table bangkegiogiang.sumcongviec
CREATE TABLE IF NOT EXISTS `sumcongviec` (
  `id_sum_cong_viec` int(11) NOT NULL AUTO_INCREMENT,
  `id_index` int(11) DEFAULT NULL,
  `id_giang_vien` int(11) DEFAULT NULL,
  `sum_so_tiet` float DEFAULT NULL,
  PRIMARY KEY (`id_sum_cong_viec`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.sumcongviec: ~0 rows (approximately)

-- Dumping structure for table bangkegiogiang.sumggnckh
CREATE TABLE IF NOT EXISTS `sumggnckh` (
  `id_sum_gg_nckh` int(11) NOT NULL AUTO_INCREMENT,
  `id_index` int(11) DEFAULT NULL,
  `id_giang_vien` int(11) DEFAULT NULL,
  `sum_so_tiet` float DEFAULT NULL,
  PRIMARY KEY (`id_sum_gg_nckh`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.sumggnckh: ~0 rows (approximately)

-- Dumping structure for table bangkegiogiang.sumthanhtoan
CREATE TABLE IF NOT EXISTS `sumthanhtoan` (
  `id_sum_thanh_toan` int(11) NOT NULL AUTO_INCREMENT,
  `id_index` int(11) DEFAULT NULL,
  `id_giang_vien` int(11) DEFAULT NULL,
  `id_don_gia` int(11) DEFAULT NULL,
  `so_tiet` float DEFAULT NULL,
  `don_gia` float DEFAULT NULL,
  `thanh_tien` float DEFAULT NULL,
  PRIMARY KEY (`id_sum_thanh_toan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bangkegiogiang.sumthanhtoan: ~1 rows (approximately)
INSERT INTO `sumthanhtoan` (`id_sum_thanh_toan`, `id_index`, `id_giang_vien`, `id_don_gia`, `so_tiet`, `don_gia`, `thanh_tien`) VALUES
	(1, 1, 1, 16, 7687, 324, 2490590);

-- Dumping structure for table bangkegiogiang.taikhoan
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `id_tai_khoan` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `mat_khau` varchar(50) DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  `id_phan_quyen` int(11) DEFAULT NULL,
  `id_phan_nhom` int(11) DEFAULT NULL,
  `id_nguoi_dung` int(11) DEFAULT NULL,
  `trang_thai` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id_tai_khoan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.taikhoan: ~3 rows (approximately)
INSERT INTO `taikhoan` (`id_tai_khoan`, `email`, `mat_khau`, `ghi_chu`, `id_phan_quyen`, `id_phan_nhom`, `id_nguoi_dung`, `trang_thai`) VALUES
	(2, 'gv1@gmail.com', '1', '2023-06-20 03:23:26', 3, 2, 1, 1),
	(3, 'gv2@gmail.com', 'giangvien2@2326', '2023-06-20 03:23:26', 3, 2, 2, 1),
	(4, 'admin@gmail.com', '123456', NULL, 1, 0, 0, 1);

-- Dumping structure for table bangkegiogiang.trinhdo
CREATE TABLE IF NOT EXISTS `trinhdo` (
  `id_trinh_do` int(11) NOT NULL AUTO_INCREMENT,
  `ten_trinh_do` varchar(50) DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  PRIMARY KEY (`id_trinh_do`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table bangkegiogiang.trinhdo: ~5 rows (approximately)
INSERT INTO `trinhdo` (`id_trinh_do`, `ten_trinh_do`, `ghi_chu`) VALUES
	(1, 'Đại học', NULL),
	(2, 'Thạc sĩ', NULL),
	(3, 'Tiến sĩ', NULL),
	(4, 'Phó giáo sư', NULL),
	(5, 'Giáo sư', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
