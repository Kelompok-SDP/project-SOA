-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Apr 2021 pada 10.38
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_apotik_soa`
--
CREATE DATABASE IF NOT EXISTS `db_apotik_soa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_apotik_soa`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_kategori`
--

DROP TABLE IF EXISTS `mh_kategori`;
CREATE TABLE `mh_kategori` (
  `kode` varchar(8) NOT NULL,
  `nama` varchar(127) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `catatan` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mh_kategori`
--

INSERT INTO `mh_kategori` (`kode`, `nama`, `deskripsi`, `keterangan`, `catatan`) VALUES
('KA_AK001', 'ALAT KESEHATAN', 'Kategori untuk semua jenis alat kesehatan', NULL, NULL),
('KA_HE001', 'HERBAL', 'Kategori untuk semua jenis obat herbal (dari bahan alami) atau jamu', NULL, NULL),
('KA_KE001', 'KECANTIKAN', 'Kategori untuk semua jenis produk untuk kecantikan dan perawatan', NULL, NULL),
('KA_NA001', 'NARKOTIKA', 'Distribusi obat dalam golongan ini diawasi secara ketat karena rawan penyalahgunaan sehingga hanya bisa dibeli dengan resep asli', NULL, NULL),
('KA_NU001', 'NUTRISI', 'Kategori untuk semua jenis nutrisi', NULL, NULL),
('KA_OB001', 'OBAT BEBAS', 'Obat yang bisa dibeli tanpa resep dokter dan bisa dijual di apotek maupun toko obat', NULL, NULL),
('KA_OB002', 'OBAT BEBAS TERBATAS', 'Obat yang termasuk obat keras, namun hingga batas tertentu bisa diperoleh di apotek tanpa resep dokter.', NULL, NULL),
('KA_OK001', 'OBAT KERAS', 'Semua jenis psikotropika dan antibiotik termasuk dalam golongan ini. Disebut juga obat golongan G (gevaarlijk: berbahaya) atau Ethical. Hanya bisa dibeli dengan resep dokter', NULL, NULL),
('KA_PB001', 'PRODUK BAYI', 'Kategori untuk semua jenis produk bayi dan perlengkapan bayi', NULL, NULL),
('KA_SU001', 'SUPLEMEN', 'Kategori untuk semua jenis suplemen dan vitamin', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_pelanggan`
--

DROP TABLE IF EXISTS `mh_pelanggan`;
CREATE TABLE `mh_pelanggan` (
  `kode` varchar(8) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `jeniskelamin` varchar(1) DEFAULT NULL,
  `api_hit` int(11) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `saldo` int(11) NOT NULL,
  `tipe_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mh_pelanggan`
--

INSERT INTO `mh_pelanggan` (`kode`, `nama`, `email`, `password`, `telepon`, `jeniskelamin`, `api_hit`, `api_key`, `saldo`, `tipe_user`) VALUES
('PE_AM001', 'Anita Mandala', 'caket.haryanti@manullang.name', '', '(+62) 678 4799 351', 'P', '0', '0', 0, 0),
('PE_AN001', 'Ani Najmudin', 'hakim.agus@sudiati.name', '', '0589 7354 192', 'P', '0', '0', 0, 0),
('PE_AR001', 'Atmaja Rajata', 'qkuswandari@gmail.co.id', '', '0854 3756 628', 'L', '0', '0', 0, 0),
('PE_AS001', 'Ade Sihombing', 'firgantoro.clara@yahoo.com', '', '0245 6939 0168', 'P', '0', '0', 0, 0),
('PE_AT001', 'Atma', 'sarah46@rahayu.web.id', '', '(+62) 846 292 123', 'L', '0', '0', 0, 0),
('PE_AU001', 'Amalia Utami', 'puji03@yahoo.co.id', '', '(+62) 992 4328 6673', 'P', '0', '0', 0, 0),
('PE_AU002', 'Azalea Uwais', 'galang.hartati@latupono.sch.id', '', '0496 5272 714', 'P', '0', '0', 0, 0),
('PE_AY001', 'Ayu', 'kuswandari.diana@pradana.asia', '', '0834 6439 442', 'P', '0', '0', 0, 0),
('PE_BA001', 'Balapati', 'ddamanik@gmail.co.id', '', '0336 7907 5491', 'L', '0', '0', 0, 0),
('PE_BA002', 'Bagya', 'hyulianti@waluyo.web.id', '', '0517 0820 056', 'L', '0', '0', 0, 0),
('PE_CA001', 'Cahyono', 'pyulianti@puspita.co.id', '', '0888 1669 154', 'L', '0', '0', 0, 0),
('PE_CA002', 'Cahyadi', 'mala.situmorang@gmail.com', '', '(+62) 501 0334 5784', 'L', '0', '0', 0, 0),
('PE_CN001', 'Cinta Natsir', 'gunarto.daryani@gmail.com', '', '(+62) 26 7064 733', 'P', '0', '0', 0, 0),
('PE_CP001', 'Carla Padmasari', 'soleh27@gmail.com', '', '(+62) 941 3343 4736', 'P', '0', '0', 0, 0),
('PE_CS001', 'Cakrawangsa Sitorus', 'elma51@novitasari.sch.id', '', '026 6815 893', 'L', '0', '0', 0, 0),
('PE_CW001', 'Cager Wahyuni', 'lulut43@yahoo.com', '', '(+62) 26 3378 145', 'L', '0', '0', 0, 0),
('PE_DA001', 'Daru', 'wasita.putri@yahoo.co.id', '', '(+62) 296 5555 1047', 'L', '0', '0', 0, 0),
('PE_DK001', 'Diah Kuswoyo', 'makara70@gmail.co.id', '', '0222 5047 1788', 'P', '0', '0', 0, 0),
('PE_DM001', 'Dian Maheswara', 'samiah47@yahoo.com', '', '0822 8512 3512', 'P', '0', '0', 0, 0),
('PE_DN001', 'Daliono Nuraini', 'padma35@yahoo.co.id', '', '0561 1147 3305', 'L', '0', '0', 0, 0),
('PE_DU001', 'Diana Uyainah', 'lalita01@pradana.info', '', '(+62) 484 1108 793', 'P', '0', '0', 0, 0),
('PE_ED001', 'Embuh Damanik', 'hasna20@yahoo.com', '', '(+62) 277 2739 8746', 'L', '0', '0', 0, 0),
('PE_EL001', 'Elvina', 'silvia64@budiman.biz.id', '', '0318 1351 979', 'P', '0', '0', 0, 0),
('PE_ES001', 'Eman Suryatmi', 'ksafitri@siregar.web.id', '', '0744 5909 8677', 'L', '0', '0', 0, 0),
('PE_EV001', 'Eva', 'natsir.raihan@gmail.co.id', '', '0210 1642 2136', 'P', '0', '0', 0, 0),
('PE_GA001', 'Gamani', 'koko58@yuliarti.go.id', '', '0739 9261 3526', 'L', '0', '0', 0, 0),
('PE_GA002', 'Gandi', 'bajragin17@gmail.com', '', '(+62) 23 8920 6723', 'L', '0', '0', 0, 0),
('PE_HA001', 'Hari', 'dirja54@wastuti.name', '', '0856 9071 878', 'L', '0', '0', 0, 0),
('PE_HE001', 'Hesti', 'luwes48@yolanda.name', '', '(+62) 973 8517 535', 'P', '0', '0', 0, 0),
('PE_HP001', 'Hendri Prayoga', 'krajata@januar.name', '', '(+62) 345 0869 385', 'L', '0', '0', 0, 0),
('PE_HS001', 'Harsaya Simbolon', 'mmulyani@saragih.asia', '', '0827 1567 1726', 'L', '0', '0', 0, 0),
('PE_HS002', 'Harsaya Saptono', 'dpudjiastuti@yahoo.co.id', '', '025 5501 8620', 'L', '0', '0', 0, 0),
('PE_IA001', 'Ira Astuti', 'nprasasta@gmail.co.id', '', '0498 6637 4557', 'P', '0', '0', 0, 0),
('PE_ID001', 'Ida', 'adriansyah.sadina@yahoo.com', '', '(+62) 652 0358 967', 'P', '0', '0', 0, 0),
('PE_IF001', 'Ikhsan Firgantoro', 'opan01@lestari.net', '', '0361 1774 1052', 'L', '0', '0', 0, 0),
('PE_IH001', 'Iriana Hardiansyah', 'legawa63@gmail.com', '', '(+62) 527 6923 5022', 'P', '0', '0', 0, 0),
('PE_IK001', 'Ikhsan', 'nalar86@gmail.com', '', '(+62) 784 3164 7059', 'L', '0', '0', 0, 0),
('PE_IR001', 'Irfan', 'tasdik.rajasa@suryono.mil.id', '', '0833 8218 2212', 'L', '0', '0', 0, 0),
('PE_IS001', 'Ikhsan Sihombing', 'ymansur@puspasari.my.id', '', '025 6526 5647', 'L', '0', '0', 0, 0),
('PE_JA001', 'Jamil', 'omarpaung@gmail.co.id', '', '0409 9433 2433', 'L', '0', '0', 0, 0),
('PE_JA002', 'Jamalia', 'jail.prayoga@suryono.or.id', '', '(+62) 20 4055 4891', 'P', '0', '0', 0, 0),
('PE_JE001', 'Jelita', 'bmelani@yahoo.co.id', '', '0334 8531 0539', 'P', '0', '0', 0, 0),
('PE_JH001', 'Jayadi Hutagalung', 'vicky.yuniar@yahoo.com', '', '(+62) 258 5253 2054', 'L', '0', '0', 0, 0),
('PE_JN001', 'Jaya Nababan', 'rpuspasari@marbun.go.id', '', '0414 4312 1725', 'L', '0', '0', 0, 0),
('PE_JO001', 'Jono', 'wasita.zelaya@yahoo.com', '', '(+62) 20 0384 929', 'L', '0', '0', 0, 0),
('PE_JT001', 'Juli Tampubolon', 'fnasyidah@yahoo.co.id', '', '028 8154 585', 'P', '0', '0', 0, 0),
('PE_JU001', 'Jumadi', 'ganjaran.gunawan@gmail.co.id', '', '(+62) 771 9213 151', 'L', '0', '0', 0, 0),
('PE_KA001', 'Karma Agustina', 'apranowo@wahyudin.info', '', '(+62) 663 0650 415', 'L', '0', '0', 0, 0),
('PE_KA002', 'Kawaya', 'dmaryati@utama.com', '', '0731 2358 632', 'L', '0', '0', 0, 0),
('PE_KA003', 'Kamaria', 'yuliarti.jelita@gmail.co.id', '', '(+62) 789 1147 1282', 'P', '0', '0', 0, 0),
('PE_KA004', 'Kamila', 'perkasa.waskita@yahoo.com', '', '0997 0209 3121', 'P', '0', '0', 0, 0),
('PE_KH001', 'Kani Hakim', 'panca61@yahoo.co.id', '', '(+62) 884 3002 133', 'P', '0', '0', 0, 0),
('PE_KI001', 'Kiandra', 'kamaria01@lestari.or.id', '', '0397 0649 925', 'P', '0', '0', 0, 0),
('PE_KP001', 'Kamal Prayoga', 'cornelia10@nashiruddin.name', '', '(+62) 868 0531 6449', 'L', '0', '0', 0, 0),
('PE_LA001', 'Laksana', 'rahmi.mayasari@susanti.ac.id', '', '0258 4213 4167', 'L', '0', '0', 0, 0),
('PE_LL001', 'Lasmono Lailasari', 'nurdiyanti.jelita@yahoo.com', '', '0561 3235 210', 'L', '0', '0', 0, 0),
('PE_LU001', 'Luis', 'mardhiyah.wisnu@namaga.com', '', '0824 269 886', 'L', '0', '0', 0, 0),
('PE_LU002', 'Luwes', 'bsuryatmi@gmail.co.id', '', '(+62) 515 3596 461', 'L', '0', '0', 0, 0),
('PE_MA001', 'Makara', 'galak62@gmail.com', '', '0908 5677 3605', 'L', '0', '0', 0, 0),
('PE_MN001', 'Maman Nugroho', 'pratama.jamalia@irawan.org', '', '0677 2001 1308', 'L', '0', '0', 0, 0),
('PE_MR001', 'Mila Rahimah', 'wulandari.restu@gmail.co.id', '', '025 9086 289', 'P', '0', '0', 0, 0),
('PE_MU001', 'Mulyanto', 'marbun.sari@aryani.net', '', '028 0930 057', 'L', '0', '0', 0, 0),
('PE_NA001', 'Natalia', 'waskita.victoria@gmail.com', '', '0677 5735 309', 'P', '0', '0', 0, 0),
('PE_NA002', 'Nardi', 'belinda95@novitasari.sch.id', '', '(+62) 722 4611 314', 'L', '0', '0', 0, 0),
('PE_NA003', 'Naradi', 'oprakasa@gmail.com', '', '(+62) 206 7008 188', 'L', '0', '0', 0, 0),
('PE_NH001', 'Nardi Hidayat', 'zaenab.pranowo@gmail.co.id', '', '0575 4226 890', 'L', '0', '0', 0, 0),
('PE_NP001', 'Novi Permadi', 'yunita.kuswandari@saputra.name', '', '0545 6055 1608', 'P', '0', '0', 0, 0),
('PE_OH001', 'Oliva Habibi', 'jaka.mandala@gmail.com', '', '022 0285 3808', 'P', '0', '0', 0, 0),
('PE_OZ001', 'Ozy', 'aditya16@waskita.web.id', '', '(+62) 21 6522 5480', 'L', '0', '0', 0, 0),
('PE_PM001', 'Putri Manullang', 'pratiwi.gasti@gmail.co.id', '', '0847 1759 838', 'P', '0', '0', 0, 0),
('PE_PM002', 'Pardi Mulyani', 'widodo.aditya@gmail.com', '', '0832 2324 568', 'L', '0', '0', 0, 0),
('PE_PM003', 'Pranawa Mardhiyah', 'yuni37@yahoo.co.id', '', '0794 3191 8130', 'L', '0', '0', 0, 0),
('PE_PR001', 'Prasetya', 'kajen.firmansyah@yahoo.co.id', '', '0395 1571 6194', 'L', '0', '0', 0, 0),
('PE_PS001', 'Panca Salahudin', 'fbudiyanto@saptono.com', '', '0989 6826 5263', 'L', '0', '0', 0, 0),
('PE_RA001', 'Rama', 'ckuswandari@astuti.com', '', '0259 0614 799', 'L', '0', '0', 0, 0),
('PE_RH001', 'Raharja Halim', 'mwidiastuti@yahoo.co.id', '', '0770 3805 306', 'L', '0', '0', 0, 0),
('PE_RP001', 'Rachel Prastuti', 'nsiregar@yahoo.co.id', '', '(+62) 509 3363 238', 'P', '0', '0', 0, 0),
('PE_RW001', 'Ratna Winarsih', 'megantara.rizki@usada.tv', '', '0308 7258 142', 'P', '0', '0', 0, 0),
('PE_SA001', 'Sadina', 'dfarida@yahoo.com', '', '0470 9631 932', 'P', '0', '0', 0, 0),
('PE_SI001', 'Siti', 'yuliarti.eka@usada.sch.id', '', '0813 208 136', 'P', '0', '0', 0, 0),
('PE_SL001', 'Salwa Laksmiwati', 'najib.lestari@wasita.net', '', '0379 9146 3028', 'P', '0', '0', 0, 0),
('PE_SM001', 'Safina Mustofa', 'csetiawan@gmail.com', '', '0636 8200 747', 'P', '0', '0', 0, 0),
('PE_SW001', 'Samiah Wibisono', 'septi14@yahoo.com', '', '(+62) 852 067 467', 'P', '0', '0', 0, 0),
('PE_SY001', 'Syahrini', 'saragih.novi@gmail.com', '', '0751 0519 4595', 'P', '0', '0', 0, 0),
('PE_TD001', 'Tina Dongoran', 'farida.ciaobella@damanik.info', '', '0896 419 720', 'P', '0', '0', 0, 0),
('PE_TI001', 'Tina', 'aryani.nadine@yahoo.co.id', '', '0425 7195 783', 'P', '0', '0', 0, 0),
('PE_TS001', 'Tedi Setiawan', 'tira.permadi@santoso.go.id', '', '(+62) 476 6366 518', 'L', '0', '0', 0, 0),
('PE_TW001', 'Tirta Wijayanti', 'wpuspita@gmail.co.id', '', '(+62) 397 5987 175', 'L', '0', '0', 0, 0),
('PE_UL001', 'Ulva', 'utami.irwan@sudiati.co', '', '(+62) 207 2805 141', 'P', '0', '0', 0, 0),
('PE_US001', 'Usyi', 'kayla.samosir@rajata.desa.id', '', '0741 6573 781', 'P', '0', '0', 0, 0),
('PE_VM001', 'Victoria Marpaung', 'hastuti.ghaliyati@gmail.com', '', '(+62) 24 0188 9001', 'P', '0', '0', 0, 0),
('PE_WI001', 'Wirda', 'lukman88@hutagalung.ac.id', '', '0852 8001 8049', 'P', '0', '0', 0, 0),
('PE_WP001', 'Warta Pertiwi', 'rahmi.manullang@gmail.co.id', '', '0354 8696 184', 'L', '0', '0', 0, 0),
('PE_WW001', 'Wani Winarsih', 'gunarto.tiara@pradipta.go.id', '', '0532 0000 8255', 'P', '0', '0', 0, 0),
('PE_YA001', 'Yani', 'lmustofa@iswahyudi.name', '', '0929 3260 118', 'P', '0', '0', 0, 0),
('PE_YF001', 'Yusuf Fujiati', 'ganda81@hutasoit.mil.id', '', '(+62) 273 9714 163', 'L', '0', '0', 0, 0),
('PE_YU001', 'Yulia', 'juli.pratama@haryanti.or.id', '', '(+62) 844 4301 0503', 'P', '0', '0', 0, 0),
('PE_ZP001', 'Zelda Padmasari', 'wijayanti.winda@gmail.com', '', '(+62) 418 9588 7750', 'P', '0', '0', 0, 0),
('PE_ZS001', 'Zizi Siregar', 'tri50@andriani.mil.id', '', '0528 8766 0849', 'P', '0', '0', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_produk`
--

DROP TABLE IF EXISTS `mh_produk`;
CREATE TABLE `mh_produk` (
  `kode` varchar(8) NOT NULL,
  `fk_kategori` varchar(8) DEFAULT NULL,
  `fk_produsen` varchar(8) DEFAULT NULL,
  `fk_satuan` varchar(8) DEFAULT NULL,
  `nama` varchar(127) DEFAULT NULL,
  `indikasi` longtext DEFAULT NULL COMMENT 'Kegunaan Obat',
  `komposisi` longtext DEFAULT NULL,
  `dosis` varchar(127) DEFAULT NULL,
  `aturan_pakai` varchar(127) DEFAULT NULL,
  `kemasan` varchar(127) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL,
  `butuh_resep` varchar(1) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `dibuat_oleh` varchar(63) DEFAULT NULL,
  `dibuat_pada` date DEFAULT NULL,
  `diubah_oleh` varchar(63) DEFAULT NULL,
  `diubah_pada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mh_produk`
--

INSERT INTO `mh_produk` (`kode`, `fk_kategori`, `fk_produsen`, `fk_satuan`, `nama`, `indikasi`, `komposisi`, `dosis`, `aturan_pakai`, `kemasan`, `harga`, `butuh_resep`, `keterangan`, `dibuat_oleh`, `dibuat_pada`, `diubah_oleh`, `diubah_pada`) VALUES
('PR_AC001', 'KA_OB002', 'PO_UD001', 'SA_TA001', 'ACTRAPID HM', 'Menyembukan penyakit', 'CAIRAN INJEKSI 100 IU/ML', '5x sehari', 'sebelum makan', NULL, 317532, '0', NULL, NULL, NULL, NULL, NULL),
('PR_AC002', 'KA_OB001', 'PO_UD003', 'SA_PU002', 'ACYCLOVIR', 'Menyembukan penyakit', 'KRIM 5%', '1x sehari', 'sesudah makan', NULL, 487731, '1', NULL, NULL, NULL, NULL, NULL),
('PR_AL001', 'KA_OB002', 'PO_UD001', 'SA_EK001', 'ALOFAR', 'Menyembukan penyakit', 'KAPLET 300 MG', '3x sehari', 'sebelum makan', NULL, 216588, '1', NULL, NULL, NULL, NULL, NULL),
('PR_AL002', 'KA_OB002', 'PO_UD014', 'SA_IN002', 'ALPRAZOLAM', 'Menyembukan penyakit', 'TABLET 1 MG', '2x sehari', 'sesudah makan', NULL, 96225, '0', NULL, NULL, NULL, NULL, NULL),
('PR_AN001', 'KA_OK001', 'PO_PE010', 'SA_SU001', 'ANAKONIDIN', 'Menyembukan penyakit', 'SIRUP 50/7,5/5/1 MG PER 5 ML', '4x sehari', 'sebelum makan', NULL, 119650, '1', NULL, NULL, NULL, NULL, NULL),
('PR_AN002', 'KA_OB002', 'PO_PE019', 'SA_IN002', 'ANAKONIDIN', 'Menyembukan penyakit', 'SIRUP 50/7,5/5/1 MG PER 5 ML', '5x sehari', 'sesudah makan', NULL, 167608, '0', NULL, NULL, NULL, NULL, NULL),
('PR_AR001', 'KA_OB001', 'PO_PE019', 'SA_LA001', 'ARBITEN-I 300', 'Menyembukan penyakit', 'KAPLET 300 MG', '5x sehari', 'sesudah makan', NULL, 330018, '0', NULL, NULL, NULL, NULL, NULL),
('PR_AR002', 'KA_OB001', 'PO_UD004', 'SA_TA001', 'ARBITEN-I 150', 'Menyembukan penyakit', 'KAPLET 150 MG', '4x sehari', 'sebelum makan', NULL, 69421, '1', NULL, NULL, NULL, NULL, NULL),
('PR_BE001', 'KA_OK001', 'PO_PT012', 'SA_EM001', 'BERLOSID', 'Menyembukan penyakit', 'SUSPENSI 200/200/50 MG PER 5 ML', '1x sehari', 'sebelum makan', NULL, 219649, '1', NULL, NULL, NULL, NULL, NULL),
('PR_BE002', 'KA_OB001', 'PO_PD020', 'SA_PU001', 'BERSOL', 'Menyembukan penyakit', 'KRIM 0,05 %', '5x sehari', 'sebelum makan', NULL, 396465, '1', NULL, NULL, NULL, NULL, NULL),
('PR_BE003', 'KA_OB002', 'PO_CV013', 'SA_TA001', 'BERSOL', 'Menyembukan penyakit', 'KRIM 0,05 %', '4x sehari', 'sesudah makan', NULL, 447289, '0', NULL, NULL, NULL, NULL, NULL),
('PR_BI001', 'KA_OB002', 'PO_PT011', 'SA_PU002', 'BINTAMOX', 'Menyembukan penyakit', 'KAPLET 500 MG', '1x sehari', 'sesudah makan', NULL, 273137, '1', NULL, NULL, NULL, NULL, NULL),
('PR_BR001', 'KA_OB001', 'PO_PD001', 'SA_GA001', 'BREXEL', 'Menyembukan penyakit', 'CAIRAN INJEKSI 40 MG/ML', '1x sehari', 'sesudah makan', NULL, 484432, '0', NULL, NULL, NULL, NULL, NULL),
('PR_BR002', 'KA_OK001', 'PO_PE012', 'SA_PU002', 'BREXEL', 'Menyembukan penyakit', 'CAIRAN INJEKSI 40 MG/ML', '4x sehari', 'sesudah makan', NULL, 139972, '0', NULL, NULL, NULL, NULL, NULL),
('PR_BR003', 'KA_OB002', 'PO_CV014', 'SA_EK001', 'BROMHEXINE HCL', 'Menyembukan penyakit', 'TABLET 8 MG', '4x sehari', 'sebelum makan', NULL, 124439, '1', NULL, NULL, NULL, NULL, NULL),
('PR_BR004', 'KA_OK001', 'PO_PD021', 'SA_PU001', 'BROMEDCYL', 'Menyembukan penyakit', 'TABLET 8 MG', '1x sehari', 'sesudah makan', NULL, 309999, '1', NULL, NULL, NULL, NULL, NULL),
('PR_CA001', 'KA_OK001', 'PO_PE004', 'SA_EM001', 'CALMDION', 'Menyembukan penyakit', 'KRIM 0,25 MG/G', '2x sehari', 'sebelum makan', NULL, 198085, '0', NULL, NULL, NULL, NULL, NULL),
('PR_CA002', 'KA_OB002', 'PO_UD008', 'SA_PU002', 'CAZETIN', 'Menyembukan penyakit', 'DROPS 100000 IU/ML', '5x sehari', 'sesudah makan', NULL, 490099, '0', NULL, NULL, NULL, NULL, NULL),
('PR_CA003', 'KA_OK001', 'PO_PT020', 'SA_LA001', 'CAPTOPRIL', 'Menyembukan penyakit', 'TABLET 50 MG', '4x sehari', 'sebelum makan', NULL, 82859, '0', NULL, NULL, NULL, NULL, NULL),
('PR_CE001', 'KA_OB002', 'PO_CV001', 'SA_OT001', 'CEFMER', 'Menyembukan penyakit', 'SERBUK INJEKSI 1 G', '2x sehari', 'sesudah makan', NULL, 451721, '0', NULL, NULL, NULL, NULL, NULL),
('PR_CH001', 'KA_OK001', 'PO_PE010', 'SA_PI001', 'CHOLVASTIN', 'Menyembukan penyakit', 'TABLET 20 MG', '1x sehari', 'sebelum makan', NULL, 206446, '1', NULL, NULL, NULL, NULL, NULL),
('PR_CI001', 'KA_OB001', 'PO_PE016', 'SA_SU001', 'CIFLOS', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 500 MG', '4x sehari', 'sebelum makan', NULL, 205670, '1', NULL, NULL, NULL, NULL, NULL),
('PR_CO001', 'KA_OB002', 'PO_PD001', 'SA_SU001', 'COTRIM FORTE', 'Menyembukan penyakit', 'KAPLET 800/160 MG', '1x sehari', 'sesudah makan', NULL, 57327, '1', NULL, NULL, NULL, NULL, NULL),
('PR_CU001', 'KA_OB002', 'PO_PD009', 'SA_PU001', 'CUSTODIOL', 'Menyembukan penyakit', 'TABLET SALUT ENTERIK 5 MG', '2x sehari', 'sesudah makan', NULL, 279083, '1', NULL, NULL, NULL, NULL, NULL),
('PR_DA001', 'KA_OB001', 'PO_PE012', 'SA_OT001', 'DAMABEN', 'Menyembukan penyakit', 'DROPS 4 MG/ML', '1x sehari', 'sesudah makan', NULL, 58835, '0', NULL, NULL, NULL, NULL, NULL),
('PR_DE001', 'KA_OK001', 'PO_PT020', 'SA_LA001', 'DECAFIL', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 150 MG', '4x sehari', 'sesudah makan', NULL, 155424, '0', NULL, NULL, NULL, NULL, NULL),
('PR_DE002', 'KA_OB002', 'PO_CV015', 'SA_OT001', 'DEXA - M', 'Menyembukan penyakit', 'TABLET 0,75 MG', '5x sehari', 'sebelum makan', NULL, 357990, '0', NULL, NULL, NULL, NULL, NULL),
('PR_DE003', 'KA_OB001', 'PO_PD012', 'SA_LA001', 'DEXYCLAV FORTE', 'Menyembukan penyakit', 'SIRUP KERING 250 MG/5 ML', '1x sehari', 'sesudah makan', NULL, 277503, '0', NULL, NULL, NULL, NULL, NULL),
('PR_DE004', 'KA_OB002', 'PO_PT004', 'SA_PU002', 'DEXYCLAV', 'Menyembukan penyakit', 'SIRUP KERING 125 MG/5 ML', '4x sehari', 'sesudah makan', NULL, 220578, '1', NULL, NULL, NULL, NULL, NULL),
('PR_DI001', 'KA_OB002', 'PO_PE010', 'SA_PU001', 'DIOVAN', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 80 MG', '2x sehari', 'sebelum makan', NULL, 160220, '1', NULL, NULL, NULL, NULL, NULL),
('PR_DI002', 'KA_OK001', 'PO_UD012', 'SA_KA001', 'DIOVAN', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 160 MG', '3x sehari', 'sebelum makan', NULL, 136996, '0', NULL, NULL, NULL, NULL, NULL),
('PR_DI003', 'KA_OK001', 'PO_PT009', 'SA_GA001', 'DIOVAN', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 80 MG', '1x sehari', 'sebelum makan', NULL, 120540, '0', NULL, NULL, NULL, NULL, NULL),
('PR_DI004', 'KA_OB001', 'PO_PT013', 'SA_KA001', 'DIOVAN', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 160 MG', '1x sehari', 'sebelum makan', NULL, 310335, '0', NULL, NULL, NULL, NULL, NULL),
('PR_DI005', 'KA_OK001', 'PO_PT017', 'SA_LA001', 'DINAZEN', 'Menyembukan penyakit', 'TABLET 10 MG', '2x sehari', 'sebelum makan', NULL, 202147, '1', NULL, NULL, NULL, NULL, NULL),
('PR_DU001', 'KA_OB001', 'PO_PD015', 'SA_SU001', 'DURAMYCIN', 'Menyembukan penyakit', 'KAPLET 500 MG', '4x sehari', 'sesudah makan', NULL, 60882, '0', NULL, NULL, NULL, NULL, NULL),
('PR_ER001', 'KA_OB002', 'PO_PD013', 'SA_LA001', 'ERPHAHEXIN', 'Menyembukan penyakit', 'TABLET 8 MG', '2x sehari', 'sebelum makan', NULL, 214699, '0', NULL, NULL, NULL, NULL, NULL),
('PR_EU001', 'KA_OB002', 'PO_PE018', 'SA_KA002', 'EUVAX B (ADULT)', 'Menyembukan penyakit', 'CAIRAN INJEKSI 20 MCG/DOSIS', '1x sehari', 'sebelum makan', NULL, 114032, '1', NULL, NULL, NULL, NULL, NULL),
('PR_EU002', 'KA_OB002', 'PO_UD019', 'SA_SA001', 'EUVAX B (PEDIATRIC)', 'Menyembukan penyakit', 'CAIRAN INJEKSI 10 MCG/DOSIS', '2x sehari', 'sesudah makan', NULL, 46614, '1', NULL, NULL, NULL, NULL, NULL),
('PR_EY001', 'KA_OB001', 'PO_PE013', 'SA_LA001', 'EYEFRESH PLUS', 'Menyembukan penyakit', 'TETES MATA 5/2/1 MG PER 5 ML', '5x sehari', 'sesudah makan', NULL, 258423, '1', NULL, NULL, NULL, NULL, NULL),
('PR_EY002', 'KA_OB002', 'PO_CV007', 'SA_KA001', 'EYEFRESH PLUS', 'Menyembukan penyakit', 'TETES MATA 5/2/1 MG PER 5 ML', '5x sehari', 'sesudah makan', NULL, 20062, '0', NULL, NULL, NULL, NULL, NULL),
('PR_FA001', 'KA_OK001', 'PO_PD005', 'SA_EK001', 'FASIDOL', 'Menyembukan penyakit', 'DROPS 100 MG/ML', '5x sehari', 'sebelum makan', NULL, 303209, '1', NULL, NULL, NULL, NULL, NULL),
('PR_FE001', 'KA_OK001', 'PO_PD021', 'SA_OT001', 'FENAREN 50', 'Menyembukan penyakit', 'TABLET SALUT ENTERIK 50 MG', '3x sehari', 'sesudah makan', NULL, 91937, '0', NULL, NULL, NULL, NULL, NULL),
('PR_FL001', 'KA_OB001', 'PO_CV003', 'SA_TA001', 'FLOTAVID 200', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 200 MG', '2x sehari', 'sesudah makan', NULL, 82869, '0', NULL, NULL, NULL, NULL, NULL),
('PR_FL002', 'KA_OK001', 'PO_CV010', 'SA_SA001', 'FLUTOP-C', 'Menyembukan penyakit', 'SIRUP ', '1x sehari', 'sesudah makan', NULL, 285177, '1', NULL, NULL, NULL, NULL, NULL),
('PR_GU001', 'KA_OK001', 'PO_UD011', 'SA_SA001', 'GUNACETA', 'Menyembukan penyakit', 'TABLET 500 MG', '4x sehari', 'sesudah makan', NULL, 363222, '1', NULL, NULL, NULL, NULL, NULL),
('PR_GU002', 'KA_OB002', 'PO_PE007', 'SA_KA002', 'GUNACETA', 'Menyembukan penyakit', 'KAPLET 650 MG', '5x sehari', 'sebelum makan', NULL, 174256, '0', NULL, NULL, NULL, NULL, NULL),
('PR_IB001', 'KA_OK001', 'PO_UD015', 'SA_IN001', 'IBUPROFEN', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 400 MG', '2x sehari', 'sebelum makan', NULL, 196509, '1', NULL, NULL, NULL, NULL, NULL),
('PR_IF001', 'KA_OB001', 'PO_UD007', 'SA_OT001', 'IFARSYL', 'Menyembukan penyakit', 'KAPLET 100/2/15 MG', '1x sehari', 'sesudah makan', NULL, 382281, '1', NULL, NULL, NULL, NULL, NULL),
('PR_IN001', 'KA_OB001', 'PO_PE019', 'SA_TA001', 'INFELON', 'Menyembukan penyakit', 'TABLET 25 MG', '3x sehari', 'sebelum makan', NULL, 26350, '0', NULL, NULL, NULL, NULL, NULL),
('PR_KI001', 'KA_OK001', 'PO_UD012', 'SA_KA001', 'KIT MIBI', 'Menyembukan penyakit', 'SERBUK INJEKSI ', '3x sehari', 'sebelum makan', NULL, 269279, '1', NULL, NULL, NULL, NULL, NULL),
('PR_KI002', 'KA_OB002', 'PO_PE003', 'SA_IN001', 'KIT DTPA', 'Menyembukan penyakit', 'SERBUK INJEKSI 10/0,8 MG', '1x sehari', 'sesudah makan', NULL, 488938, '1', NULL, NULL, NULL, NULL, NULL),
('PR_LA001', 'KA_OB001', 'PO_PE015', 'SA_LA001', 'LACOLDIN', 'Menyembukan penyakit', 'SIRUP 250/7,5/6/1 MG PER 5 ML', '3x sehari', 'sebelum makan', NULL, 417785, '1', NULL, NULL, NULL, NULL, NULL),
('PR_LI001', 'KA_OB002', 'PO_PT010', 'SA_SU001', 'LICOPRIMA FORTE', 'Menyembukan penyakit', 'KAPLET 800/160 MG', '2x sehari', 'sesudah makan', NULL, 499586, '1', NULL, NULL, NULL, NULL, NULL),
('PR_LI002', 'KA_OK001', 'PO_PD020', 'SA_TA001', 'LISINOPRIL DIHYDRATE', 'Menyembukan penyakit', 'TABLET 5 MG', '4x sehari', 'sebelum makan', NULL, 93257, '0', NULL, NULL, NULL, NULL, NULL),
('PR_ME001', 'KA_OB001', 'PO_CV003', 'SA_PU002', 'MELOCID', 'Menyembukan penyakit', 'TABLET 7,5 MG', '4x sehari', 'sebelum makan', NULL, 26979, '0', NULL, NULL, NULL, NULL, NULL),
('PR_NO001', 'KA_OK001', 'PO_PE015', 'SA_EK001', 'NOOTRISOL', 'Menyembukan penyakit', 'KAPLET SALUT SELAPUT 400 MG', '1x sehari', 'sebelum makan', NULL, 314627, '0', NULL, NULL, NULL, NULL, NULL),
('PR_NO002', 'KA_OB001', 'PO_UD014', 'SA_IN002', 'NOOCEPHAL', 'Menyembukan penyakit', 'SIRUP 200 MG/5 ML', '5x sehari', 'sesudah makan', NULL, 34877, '0', NULL, NULL, NULL, NULL, NULL),
('PR_NO003', 'KA_OK001', 'PO_UD013', 'SA_EK001', 'NOZA', 'Menyembukan penyakit', 'KAPLET 500/30/2 MG', '2x sehari', 'sebelum makan', NULL, 47542, '1', NULL, NULL, NULL, NULL, NULL),
('PR_OB001', 'KA_OB001', 'PO_CV011', 'SA_SU001', 'OBH COMBI ANAK BATUK PLUS FLU (RASA APEL)', 'Menyembukan penyakit', 'SIRUP 120/100/50/7.5/1 MG/5 ML', '3x sehari', 'sesudah makan', NULL, 428561, '1', NULL, NULL, NULL, NULL, NULL),
('PR_OT001', 'KA_OB002', 'PO_CV007', 'SA_IN001', 'OTSU - D5, NS', 'Menyembukan penyakit', 'INFUS ', '5x sehari', 'sesudah makan', NULL, 390962, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PA001', 'KA_OK001', 'PO_PT006', 'SA_IM001', 'PANTOPRAZOLE SODIUM', 'Menyembukan penyakit', 'SERBUK INJEKSI 40 MG', '1x sehari', 'sebelum makan', NULL, 112726, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PA002', 'KA_OK001', 'PO_PD002', 'SA_IN002', 'PAXUS', 'Menyembukan penyakit', 'CAIRAN INJEKSI 6 MG/ML', '5x sehari', 'sesudah makan', NULL, 151048, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PA003', 'KA_OK001', 'PO_PT021', 'SA_SA001', 'PAPAVERINE HCL', 'Menyembukan penyakit', 'TABLET 40 MG', '1x sehari', 'sesudah makan', NULL, 446380, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PE001', 'KA_OB002', 'PO_PE008', 'SA_IM001', 'PEMEXEN 500', 'Menyembukan penyakit', 'SERBUK INJEKSI LIOFILISASI 500 MG', '5x sehari', 'sebelum makan', NULL, 233789, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PE002', 'KA_OB001', 'PO_PE021', 'SA_IM001', 'PEMEXEN 100', 'Menyembukan penyakit', 'SERBUK INJEKSI LIOFILISASI 100 MG', '1x sehari', 'sebelum makan', NULL, 86975, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PE003', 'KA_OB001', 'PO_PT009', 'SA_SU001', 'PEPZOL', 'Menyembukan penyakit', 'SERBUK INJEKSI 40 MG (LYOPHILIZED)', '3x sehari', 'sesudah makan', NULL, 173549, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PH001', 'KA_OB002', 'PO_CV006', 'SA_KA001', 'PHENOBIOTIC', 'Menyembukan penyakit', 'KAPSUL 500 MG', '5x sehari', 'sebelum makan', NULL, 19055, '1', NULL, NULL, NULL, NULL, NULL),
('PR_PH002', 'KA_OB002', 'PO_CV002', 'SA_IN001', 'PHYTOMENADIONE', 'Menyembukan penyakit', 'CAIRAN INJEKSI 2 MG/ML', '3x sehari', 'sebelum makan', NULL, 392124, '1', NULL, NULL, NULL, NULL, NULL),
('PR_PI001', 'KA_OK001', 'PO_PD015', 'SA_EK001', 'PIOGLITAZONE HCL', 'Menyembukan penyakit', 'TABLET 30 MG', '4x sehari', 'sebelum makan', NULL, 125278, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PL001', 'KA_OB001', 'PO_PT019', 'SA_PI001', 'PLASBUMIN 25', 'Menyembukan penyakit', 'INFUS 25 %', '5x sehari', 'sesudah makan', NULL, 380528, '1', NULL, NULL, NULL, NULL, NULL),
('PR_PL002', 'KA_OK001', 'PO_PT005', 'SA_IN002', 'PLASBUMIN 25', 'Menyembukan penyakit', 'INFUS 25 %', '3x sehari', 'sebelum makan', NULL, 339586, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PL003', 'KA_OK001', 'PO_PT015', 'SA_TA001', 'PLASBUMIN 25', 'Menyembukan penyakit', 'INFUS 25 %', '1x sehari', 'sebelum makan', NULL, 67766, '0', NULL, NULL, NULL, NULL, NULL),
('PR_PR001', 'KA_OB001', 'PO_UD001', 'SA_PU002', 'PRIMPERAN PAEDIATRIC', 'Menyembukan penyakit', 'DROPS 2 MG/ML', '4x sehari', 'sesudah makan', NULL, 28399, '1', NULL, NULL, NULL, NULL, NULL),
('PR_RA001', 'KA_OB001', 'PO_UD006', 'SA_IM001', 'RANTIN', 'Menyembukan penyakit', 'CAIRAN INJEKSI 25 MG/ML', '2x sehari', 'sesudah makan', NULL, 403254, '1', NULL, NULL, NULL, NULL, NULL),
('PR_RE001', 'KA_OK001', 'PO_PE008', 'SA_IN001', 'RENABETIC', 'Menyembukan penyakit', 'TABLET 5 MG', '1x sehari', 'sebelum makan', NULL, 444401, '1', NULL, NULL, NULL, NULL, NULL),
('PR_RE002', 'KA_OB002', 'PO_PD005', 'SA_SA001', 'RETAPHYL SR', 'Menyembukan penyakit', 'KAPLET PELEPASAN LAMBAT 300 MG', '4x sehari', 'sebelum makan', NULL, 217036, '0', NULL, NULL, NULL, NULL, NULL),
('PR_RH001', 'KA_OB002', 'PO_PE012', 'SA_PU001', 'RHINATHIOL ROMETHAZINE', 'Menyembukan penyakit', 'SIRUP 100 MG/ 5 ML', '3x sehari', 'sesudah makan', NULL, 43469, '0', NULL, NULL, NULL, NULL, NULL),
('PR_RI001', 'KA_OB002', 'PO_UD019', 'SA_PU002', 'RINDOPUMP', 'Menyembukan penyakit', 'SERBUK INJEKSI 40 MG/VIAL', '3x sehari', 'sebelum makan', NULL, 458995, '1', NULL, NULL, NULL, NULL, NULL),
('PR_RI002', 'KA_OB001', 'PO_UD009', 'SA_OT001', 'RINCLO', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 75 MG', '4x sehari', 'sesudah makan', NULL, 490567, '0', NULL, NULL, NULL, NULL, NULL),
('PR_RI003', 'KA_OK001', 'PO_PT021', 'SA_KA002', 'RINDOBION 5000', 'Menyembukan penyakit', 'KAPLET SALUT SELAPUT 100/100/5 MG', '1x sehari', 'sebelum makan', NULL, 90301, '0', NULL, NULL, NULL, NULL, NULL),
('PR_SA001', 'KA_OB001', 'PO_PT017', 'SA_EM001', 'SALBUTAMOL', 'Menyembukan penyakit', 'TABLET 2 MG', '4x sehari', 'sesudah makan', NULL, 389075, '0', NULL, NULL, NULL, NULL, NULL),
('PR_SE001', 'KA_OB001', 'PO_UD004', 'SA_PU002', 'SERADOL', 'Menyembukan penyakit', 'TABLET 5 MG', '1x sehari', 'sebelum makan', NULL, 433872, '1', NULL, NULL, NULL, NULL, NULL),
('PR_SI001', 'KA_OK001', 'PO_UD013', 'SA_IN001', 'SIRAMID', 'Menyembukan penyakit', 'KAPLET SALUT SELAPUT 500 MG', '2x sehari', 'sesudah makan', NULL, 12685, '0', NULL, NULL, NULL, NULL, NULL),
('PR_TE001', 'KA_OB002', 'PO_UD013', 'SA_PU002', 'TENSINOP', 'Menyembukan penyakit', 'TABLET 10 MG', '5x sehari', 'sebelum makan', NULL, 57111, '1', NULL, NULL, NULL, NULL, NULL),
('PR_TI001', 'KA_OB001', 'PO_UD017', 'SA_EM001', 'TIDIFAR 200', 'Menyembukan penyakit', 'TABLET 200 MG', '2x sehari', 'sebelum makan', NULL, 439590, '1', NULL, NULL, NULL, NULL, NULL),
('PR_TI002', 'KA_OB002', 'PO_PE004', 'SA_SA001', 'TIBITOL', 'Menyembukan penyakit', 'TABLET SALUT SELAPUT 500 MG', '4x sehari', 'sesudah makan', NULL, 6483, '0', NULL, NULL, NULL, NULL, NULL),
('PR_TR001', 'KA_OK001', 'PO_PE019', 'SA_EM001', 'TRESIBA', 'Menyembukan penyakit', 'CAIRAN INJEKSI 100 U/ML', '4x sehari', 'sesudah makan', NULL, 348797, '1', NULL, NULL, NULL, NULL, NULL),
('PR_VI001', 'KA_OB001', 'PO_CV011', 'SA_GA001', 'VITKA INFANT', 'Menyembukan penyakit', 'CAIRAN INJEKSI 2 MG/ML', '5x sehari', 'sesudah makan', NULL, 269938, '1', NULL, NULL, NULL, NULL, NULL),
('PR_VO001', 'KA_OK001', 'PO_PE014', 'SA_PI001', 'VOLTAREN', 'Menyembukan penyakit', 'GEL 10 MG/G', '4x sehari', 'sebelum makan', NULL, 239070, '1', NULL, NULL, NULL, NULL, NULL),
('PR_VO002', 'KA_OB001', 'PO_PT002', 'SA_PI001', 'VOLTAREN', 'Menyembukan penyakit', 'GEL 10 MG/G', '3x sehari', 'sesudah makan', NULL, 135727, '0', NULL, NULL, NULL, NULL, NULL),
('PR_VO003', 'KA_OB002', 'PO_PT004', 'SA_LA001', 'VOLTAREN', 'Menyembukan penyakit', 'GEL 10 MG/G', '5x sehari', 'sesudah makan', NULL, 381497, '0', NULL, NULL, NULL, NULL, NULL),
('PR_XE001', 'KA_OB001', 'PO_PE021', 'SA_KA002', 'XENICAL', 'Menyembukan penyakit', 'KAPSUL 120 MG', '4x sehari', 'sebelum makan', NULL, 296168, '0', NULL, NULL, NULL, NULL, NULL),
('PR_XE002', 'KA_OB002', 'PO_PD014', 'SA_EM001', 'XENICAL', 'Menyembukan penyakit', 'KAPSUL 120 MG', '4x sehari', 'sebelum makan', NULL, 401829, '1', NULL, NULL, NULL, NULL, NULL),
('PR_XY001', 'KA_OB002', 'PO_PD008', 'SA_PU001', 'XYLESTESIN - A', 'Menyembukan penyakit', 'CAIRAN INJEKSI 20 MG/ML ; 0.0125 MG/ML', '1x sehari', 'sebelum makan', NULL, 395781, '1', NULL, NULL, NULL, NULL, NULL),
('PR_XY002', 'KA_OK001', 'PO_PT011', 'SA_TA001', 'XYLOCAINE', 'Menyembukan penyakit', 'GEL 20 MG/G', '2x sehari', 'sebelum makan', NULL, 481824, '0', NULL, NULL, NULL, NULL, NULL),
('PR_YA001', 'KA_OK001', 'PO_PD017', 'SA_IN001', 'YARIDON', 'Menyembukan penyakit', 'TABLET 10 MG', '4x sehari', 'sesudah makan', NULL, 27143, '1', NULL, NULL, NULL, NULL, NULL),
('PR_ZO001', 'KA_OB002', 'PO_PT010', 'SA_PU002', 'ZORVOLEX', 'Menyembukan penyakit', 'KAPSUL 18 MG', '5x sehari', 'sesudah makan', NULL, 443750, '0', NULL, NULL, NULL, NULL, NULL),
('PR_ZO002', 'KA_OB001', 'PO_PE020', 'SA_IM001', 'ZORVOLEX', 'Menyembukan penyakit', 'KAPSUL 18 MG', '4x sehari', 'sebelum makan', NULL, 427860, '1', NULL, NULL, NULL, NULL, NULL),
('PR_ZO003', 'KA_OK001', 'PO_UD011', 'SA_SU001', 'ZORVOLEX', 'Menyembukan penyakit', 'KAPSUL 35 MG', '4x sehari', 'sebelum makan', NULL, 342637, '1', NULL, NULL, NULL, NULL, NULL),
('PR_ZO004', 'KA_OB001', 'PO_UD012', 'SA_EM001', 'ZORVOLEX', 'Menyembukan penyakit', 'KAPSUL 35 MG', '4x sehari', 'sesudah makan', NULL, 427660, '1', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_produsen`
--

DROP TABLE IF EXISTS `mh_produsen`;
CREATE TABLE `mh_produsen` (
  `kode` varchar(8) NOT NULL,
  `nama` varchar(127) DEFAULT NULL,
  `bidangusaha` varchar(63) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` varchar(127) DEFAULT NULL,
  `kota` varchar(127) DEFAULT NULL,
  `kodepos` varchar(7) DEFAULT NULL,
  `cp_nama` varchar(127) DEFAULT NULL,
  `cp_jabatan` varchar(31) DEFAULT NULL,
  `cp_telepon` varchar(20) DEFAULT NULL,
  `cp_email` varchar(127) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `catatan` longtext DEFAULT NULL,
  `dibuat_oleh` varchar(63) DEFAULT NULL,
  `dibuat_pada` datetime DEFAULT NULL,
  `diubah_oleh` varchar(63) DEFAULT NULL,
  `diubah_pada` datetime DEFAULT NULL,
  `dihapus_oleh` varchar(63) DEFAULT NULL,
  `dihapus_pada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mh_produsen`
--

INSERT INTO `mh_produsen` (`kode`, `nama`, `bidangusaha`, `email`, `telepon`, `alamat`, `kota`, `kodepos`, `cp_nama`, `cp_jabatan`, `cp_telepon`, `cp_email`, `keterangan`, `catatan`, `dibuat_oleh`, `dibuat_pada`, `diubah_oleh`, `diubah_pada`, `dihapus_oleh`, `dihapus_pada`) VALUES
('PO_CV001', 'CV Namaga', 'Mandatory dynamic hierarchy', 'padmasari.uda@gmail.co.id', '877-655-7167', 'Ds. Abang No. 555', 'Ambon', '26916', 'Karimah Ira Yuliarti', 'non', '029 2268 460', 'lprakasa@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV002', 'CV Wasita Tbk', 'Streamlined 5thgeneration website', 'saragih.icha@gmail.co.id', '(844) 628-4383', 'Ds. Abdul Rahmat No. 837', 'Pontianak', '42827', 'Nilam Rahmawati S.Ked', 'est', '0314 4382 7958', 'dadap.wibisono@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV003', 'CV Susanti Tbk', 'Reverse-engineered background orchestration', 'nasyiah.ajiman@yahoo.co.id', '1-888-300-4721', 'Jln. R.M. Said No. 871', 'Tangerang', '52466', 'Mulya Irawan S.Sos', 'est', '0364 6132 182', 'kmandasari@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV004', 'CV Farida Iswahyudi', 'Object-based composite installation', 'suci23@prasetyo.name', '(888) 327-8505', 'Ki. Dipenogoro No. 944', 'Madiun', '98946', 'Cindy Aryani', 'voluptas', '0848 3682 0376', 'nlailasari@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV005', 'CV Waluyo Tampubolon Tbk', 'De-engineered attitude-oriented productivity', 'clara.kusumo@padmasari.sch.id', '(877) 573-5630', 'Kpg. Salam No. 685', 'Bima', '92223', 'Vera Aryani', 'quo', '0844 9968 3308', 'bakianto.halimah@suryatmi.in', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV006', 'CV Hariyah (Persero) Tbk', 'Organic demand-driven toolset', 'tari.purwanti@anggriawan.name', '855-805-4957', 'Jr. Cihampelas No. 246', 'Langsa', '28590', 'Titin Kusmawati', 'reiciendis', '(+62) 838 080 847', 'halim.gabriella@puspasari.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV007', 'CV Mayasari Halim', 'Universal static protocol', 'dina11@melani.ac.id', '844-325-6254', 'Jr. Casablanca No. 258', 'Lhokseumawe', '50991', 'Mariadi Permadi', 'sequi', '(+62) 786 0350 319', 'kartika.siregar@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV008', 'CV Napitupulu Budiman', 'Polarised secondary portal', 'swijaya@kurniawan.or.id', '888-348-6466', 'Ki. Raden No. 943', 'Palopo', '51319', 'Zahra Farida', 'soluta', '0555 3378 924', 'msuartini@mahendra.name', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV009', 'CV Saefullah (Persero) Tbk', 'Pre-emptive mission-critical moderator', 'pratama.yance@gmail.co.id', '1-877-272-4403', 'Ds. Bakhita No. 7', 'Padangpanjang', '63970', 'Hairyanto Putra', 'architecto', '0474 2544 4211', 'uanggraini@damanik.biz.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV010', 'CV Padmasari', 'Open-architected contextually-based strategy', 'rpradana@gmail.co.id', '855.991.6991', 'Ki. Bakti No. 145', 'Tebing Tinggi', '32217', 'Anita Lailasari', 'accusantium', '(+62) 629 8812 3190', 'osamosir@maheswara.my.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV011', 'CV Budiyanto Maheswara Tbk', 'Inverse uniform array', 'tirta.wasita@gmail.co.id', '1-855-492-8330', 'Jr. Abdul. Muis No. 768', 'Sorong', '74317', 'Bakiadi Adriansyah', 'pariatur', '0775 6456 712', 'ifa14@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV012', 'CV Wastuti Laksita Tbk', 'Distributed scalable project', 'wacana.rudi@gmail.com', '844-723-1532', 'Ki. Ujung No. 430', 'Balikpapan', '93309', 'Kezia Endah Permata', 'aut', '022 1853 1170', 'kagustina@sudiati.sch.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV013', 'CV Rajata Andriani', 'Synergistic methodical core', 'marbun.bambang@yahoo.co.id', '888.878.6128', 'Ki. Abang No. 159', 'Bontang', '34916', 'Reksa Pradipta', 'impedit', '0609 2144 7608', 'rama47@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV014', 'CV Uyainah', 'User-centric nextgeneration website', 'irwan16@gmail.co.id', '888-575-0286', 'Ds. Ujung No. 480', 'Jambi', '54184', 'Winda Yuniar S.IP', 'et', '(+62) 897 3793 5934', 'lanang.damanik@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV015', 'CV Melani Tbk', 'Multi-lateral logistical toolset', 'yhassanah@yahoo.com', '877-207-8845', 'Psr. Otista No. 346', 'Gorontalo', '28712', 'Ulva Puti Usamah', 'et', '(+62) 21 8909 615', 'rrahayu@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_CV016', 'CV Hidayanto Tbk', 'Polarised explicit access', 'daliman.tamba@gmail.co.id', '855.928.7839', 'Jr. Dago No. 687', 'Palopo', '54154', 'Warta Sihotang', 'dolorem', '0414 4232 5816', 'teguh35@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD001', 'PD Rahayu Astuti', 'Multi-layered tertiary neural-net', 'qthamrin@lailasari.co.id', '(888) 508-4697', 'Jln. Bazuka Raya No. 935', 'Bontang', '73017', 'Lanang Hamzah Samosir', 'odit', '(+62) 971 4635 640', 'zwibisono@farida.biz.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD002', 'PD Hartati (Persero) Tbk', 'Triple-buffered web-enabled processimprovement', 'gatot.saragih@budiman.in', '(866) 379-8691', 'Dk. Otista No. 128', 'Palu', '40514', 'Paris Maimunah Astuti', 'repellendus', '0246 1321 2608', 'nadine.nasyiah@permadi.tv', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD003', 'PD Salahudin Padmasari Tbk', 'Innovative needs-based moderator', 'pnovitasari@gmail.com', '888.929.7038', 'Jln. Imam Bonjol No. 622', 'Denpasar', '98478', 'Mala Wijayanti', 'repellat', '026 1080 886', 'eka.sitorus@safitri.asia', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD004', 'PD Mardhiyah', 'Realigned demand-driven support', 'yunita43@agustina.sch.id', '(800) 452-2176', 'Jln. Bakau No. 296', 'Semarang', '89428', 'Salimah Jane Yolanda S.Pt', 'quas', '(+62) 592 5919 4268', 'pradana.ega@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD005', 'PD Andriani (Persero) Tbk', 'Adaptive tertiary firmware', 'salahudin.wardaya@yahoo.com', '888.351.9885', 'Ds. Jayawijaya No. 564', 'Pematangsiantar', '93238', 'Kawaya Luis Samosir', 'natus', '(+62) 673 0142 520', 'adriansyah.ihsan@nurdiyanti.co', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD006', 'PD Mandasari Tbk', 'Multi-channelled web-enabled productivity', 'gpurwanti@yahoo.com', '(844) 691-9299', 'Kpg. Suryo Pranoto No. 203', 'Tomohon', '32407', 'Pardi Prakasa S.Farm', 'quia', '0631 0579 911', 'humaira61@yahoo.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD007', 'PD Firgantoro Tbk', 'Reverse-engineered logistical attitude', 'wanggriawan@ramadan.net', '1-844-692-4074', 'Ds. Bagas Pati No. 863', 'Tarakan', '55877', 'Teguh Sihombing S.E.', 'itaque', '0309 2887 5708', 'usamah.winda@yuniar.desa.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD008', 'PD Rahimah', 'Function-based real-time hardware', 'haryanti.karsa@yahoo.co.id', '(877) 542-8443', 'Ds. Pattimura No. 162', 'Blitar', '81876', 'Samiah Zizi Wastuti', 'velit', '(+62) 929 0507 561', 'ana04@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD009', 'PD Wijaya Yulianti (Persero) Tbk', 'Re-engineered system-worthy protocol', 'bmaryati@nurdiyanti.asia', '(877) 309-0614', 'Kpg. Supomo No. 567', 'Balikpapan', '39281', 'Gamani Uwais M.M.', 'laborum', '(+62) 318 9351 6510', 'ratih.winarsih@kusumo.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD010', 'PD Hasanah Uyainah Tbk', 'Ergonomic multi-state firmware', 'mulyani.mariadi@gmail.com', '844-875-0618', 'Ds. Untung Suropati No. 917', 'Singkawang', '45572', 'Irma Purnawati', 'explicabo', '(+62) 439 3669 0871', 'lantar82@widodo.in', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD011', 'PD Halim Mardhiyah Tbk', 'Profit-focused regional securedline', 'mala.hassanah@riyanti.org', '(844) 573-8183', 'Jln. Batako No. 46', 'Tasikmalaya', '11507', 'Olivia Namaga', 'atque', '0928 9410 443', 'nuraini.natalia@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD012', 'PD Farida Pudjiastuti', 'Robust maximized structure', 'reksa.hartati@gmail.co.id', '800-829-3820', 'Psr. Madrasah No. 463', 'Tangerang', '78043', 'Galih Irawan', 'et', '(+62) 889 2346 8465', 'kawaya49@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD013', 'PD Maryadi', 'Business-focused 5thgeneration artificialintelligence', 'jabal99@sitompul.ac.id', '(877) 348-5529', 'Ds. Jambu No. 547', 'Bogor', '80211', 'Kenes Ajiono Pradipta S.Sos', 'nihil', '(+62) 986 3017 179', 'gabriella22@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD014', 'PD Zulkarnain Fujiati (Persero) Tbk', 'Up-sized national protocol', 'cawuk.yulianti@tarihoran.org', '855.707.0438', 'Ki. Badak No. 834', 'Pagar Alam', '25480', 'Jatmiko Rajasa', 'natus', '(+62) 589 9093 729', 'wahyu85@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD015', 'PD Lailasari', 'Front-line static project', 'tpranowo@gmail.co.id', '866.643.8973', 'Dk. Teuku Umar No. 565', 'Probolinggo', '17384', 'Sabrina Hasanah', 'aut', '(+62) 811 4196 667', 'canggraini@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD016', 'PD Yuniar (Persero) Tbk', 'Synergistic multi-state portal', 'oktaviani.shania@nuraini.sch.id', '(866) 613-5211', 'Jln. Bata Putih No. 772', 'Pasuruan', '62141', 'Rina Keisha Rahimah', 'enim', '(+62) 24 7368 744', 'cawuk86@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD017', 'PD Usada', 'Multi-layered maximized pricingstructure', 'pangeran.tamba@yahoo.com', '877.955.0495', 'Jln. Kali No. 137', 'Ambon', '94146', 'Cawuk Kenzie Tamba S.I.Kom', 'temporibus', '(+62) 213 6381 552', 'sutama@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD018', 'PD Iswahyudi', 'Triple-buffered tangible database', 'vanggraini@gmail.com', '800.830.7485', 'Psr. Rajawali Timur No. 994', 'Sabang', '49721', 'Ozy Wasita', 'nihil', '0221 0492 7211', 'bsantoso@yahoo.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD019', 'PD Sitorus Pradipta (Persero) Tbk', 'Reduced modular openarchitecture', 'martana73@narpati.ac.id', '(855) 431-0649', 'Gg. Abdul Muis No. 478', 'Surakarta', '11900', 'Tasdik Suwarno', 'reprehenderit', '0927 4438 1647', 'gprayoga@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD020', 'PD Mangunsong Wibisono', 'Mandatory 6thgeneration openarchitecture', 'lazuardi.elon@purnawati.web.id', '855-821-8915', 'Dk. Baranang Siang Indah No. 194', 'Depok', '21266', 'Vera Intan Rahayu S.Farm', 'adipisci', '(+62) 931 6847 7753', 'nugroho.aswani@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PD021', 'PD Nashiruddin Tbk', 'Multi-layered background emulation', 'unjani.maheswara@yahoo.com', '(888) 851-8772', 'Jln. Pelajar Pejuang 45 No. 877', 'Semarang', '50116', 'Olivia Pertiwi', 'provident', '0604 8109 9225', 'uardianto@hassanah.net', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE001', 'Perum Samosir', 'Balanced eco-centric solution', 'talia42@yolanda.net', '877.691.1406', 'Psr. Basuki No. 922', 'Pekalongan', '93961', 'Gawati Raisa Nuraini', 'saepe', '0747 4947 887', 'naradi42@utami.biz', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE002', 'Perum Sudiati Rajata', 'Cloned directional openarchitecture', 'hgunarto@safitri.asia', '800-616-5940', 'Gg. Wahid No. 928', 'Tual', '48367', 'Iriana Amalia Kuswandari', 'tenetur', '(+62) 308 2004 8607', 'permata.suci@dabukke.web.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE003', 'Perum Lailasari (Persero) Tbk', 'Synergized leadingedge success', 'trahimah@yahoo.com', '(877) 742-9313', 'Ds. Baranang Siang No. 246', 'Parepare', '33032', 'Oni Gina Mayasari S.Sos', 'aut', '0431 4103 559', 'farah.tamba@suartini.asia', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE004', 'Perum Sihotang Rahmawati (Persero) Tbk', 'Grass-roots dynamic function', 'winarsih.hana@yuliarti.mil.id', '1-844-660-5020', 'Kpg. Batako No. 865', 'Kediri', '89859', 'Gada Zulkarnain', 'molestias', '(+62) 454 7260 755', 'zsusanti@lailasari.asia', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE005', 'Perum Maulana (Persero) Tbk', 'Team-oriented incremental complexity', 'harsana.wibisono@yahoo.co.id', '877.762.2013', 'Ki. Abdul Muis No. 675', 'Gorontalo', '12836', 'Maryadi Latupono', 'asperiores', '0595 0774 660', 'vwinarsih@purnawati.in', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE006', 'Perum Hidayat', 'Synergized 4thgeneration attitude', 'syahrini66@farida.ac.id', '800.212.3335', 'Jln. Rajawali Barat No. 101', 'Kendari', '31624', 'Ika Kuswandari S.Pd', 'beatae', '(+62) 903 7753 4507', 'sitompul.kardi@suryono.info', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE007', 'Perum Mardhiyah', 'Innovative contextually-based concept', 'gasti53@gmail.com', '(800) 769-8158', 'Ki. Wahid Hasyim No. 632', 'Prabumulih', '37555', 'Paiman Hutagalung M.Pd', 'suscipit', '(+62) 661 5399 997', 'qori83@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE008', 'Perum Saragih Tbk', 'Automated contextually-based utilisation', 'rachel39@yahoo.co.id', '(877) 905-5312', 'Kpg. Umalas No. 989', 'Gorontalo', '26342', 'Rusman Sirait', 'voluptas', '0485 2629 7251', 'eputra@handayani.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE009', 'Perum Pratama', 'Cross-group dedicated encoding', 'putri.laksita@lestari.info', '866.684.9072', 'Ki. Krakatau No. 360', 'Jambi', '60093', 'Vinsen Kasusra Sihotang S.Pd', 'quasi', '0258 4183 0380', 'nabila.pudjiastuti@zulkarnain.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE010', 'Perum Wibisono Prastuti', 'Monitored stable archive', 'rahmi.yuniar@gunawan.desa.id', '(800) 681-7002', 'Ki. Ters. Jakarta No. 319', 'Bandung', '76133', 'Lamar Ikhsan Pangestu', 'optio', '(+62) 718 7234 468', 'waluyo.vera@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE011', 'Perum Haryanti', 'Customer-focused 6thgeneration orchestration', 'shakila53@wastuti.my.id', '1-888-778-4672', 'Ki. Nakula No. 585', 'Batam', '47729', 'Bakti Ihsan Sihombing', 'cupiditate', '0781 8479 643', 'prasetya.widya@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE012', 'Perum Pratiwi Rahmawati', 'Horizontal discrete migration', 'kadir.winarno@gmail.co.id', '(800) 336-6192', 'Gg. Jend. Sudirman No. 410', 'Kediri', '13566', 'Prasetya Setiawan S.Pt', 'molestiae', '(+62) 732 2736 0193', 'wahyuni.puspa@mardhiyah.biz.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE013', 'Perum Januar Yolanda (Persero) Tbk', 'Facetoface tangible service-desk', 'udongoran@rahimah.mil.id', '(888) 908-3071', 'Jln. Panjaitan No. 609', 'Tidore Kepulauan', '39115', 'Endah Cornelia Lestari', 'est', '(+62) 737 4411 1945', 'chelsea90@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE014', 'Perum Nashiruddin Tbk', 'Inverse well-modulated info-mediaries', 'yahya.iswahyudi@suryatmi.co.id', '877-854-8416', 'Jln. Gambang No. 15', 'Salatiga', '69436', 'Padmi Lailasari', 'non', '(+62) 413 7289 674', 'swinarno@yuliarti.co', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE015', 'Perum Wulandari (Persero) Tbk', 'Horizontal real-time adapter', 'safitri.wani@yahoo.co.id', '866.900.3875', 'Kpg. Laksamana No. 369', 'Sukabumi', '57717', 'Melinda Ophelia Rahimah', 'reiciendis', '0519 1403 1076', 'aris.sitorus@hutasoit.co', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE016', 'Perum Uyainah', 'Persevering 24/7 access', 'gilda.mansur@yahoo.com', '(877) 906-0822', 'Psr. Pelajar Pejuang 45 No. 515', 'Cirebon', '72954', 'Cengkir Sihotang', 'et', '0238 3067 045', 'kayla94@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE017', 'Perum Handayani Uwais', 'Reduced intermediate matrix', 'makuta.laksita@yahoo.com', '(888) 430-6144', 'Psr. Bappenas No. 446', 'Mataram', '74788', 'Lili Mulyani', 'et', '(+62) 241 1645 746', 'kyulianti@ramadan.web.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE018', 'Perum Waskita Uwais', 'Vision-oriented object-oriented parallelism', 'dhandayani@pertiwi.biz', '888-920-6403', 'Jr. Juanda No. 306', 'Tasikmalaya', '64889', 'Drajat Hutasoit S.Ked', 'et', '0310 2773 0749', 'hthamrin@hardiansyah.tv', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE019', 'Perum Suryono', 'Object-based even-keeled service-desk', 'yulianti.jais@yahoo.co.id', '(800) 350-1703', 'Dk. Bank Dagang Negara No. 681', 'Bima', '57942', 'Zulaikha Hartati', 'vel', '0527 8029 5289', 'sakura23@yahoo.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE020', 'Perum Mangunsong Widodo Tbk', 'User-centric methodical website', 'ypurnawati@purwanti.tv', '(888) 613-6317', 'Dk. Baing No. 278', 'Bengkulu', '23758', 'Samiah Susanti', 'eos', '0843 9393 6824', 'saefullah.lintang@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PE021', 'Perum Fujiati Mayasari Tbk', 'Triple-buffered even-keeled projection', 'nyana72@yahoo.co.id', '877-492-5539', 'Ds. Asia Afrika No. 23', 'Kendari', '28983', 'Wardi Koko Waskita', 'sed', '(+62) 872 062 336', 'ardianto.elma@saragih.asia', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT001', 'PT Nugroho Mulyani (Persero) Tbk', 'Distributed transitional groupware', 'simbolon.hani@thamrin.co.id', '844.640.8112', 'Psr. Hasanuddin No. 397', 'Tegal', '43803', 'Widya Ani Safitri', 'numquam', '(+62) 204 8815 9314', 'cemeti.dabukke@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT002', 'PT Kusumo', 'Self-enabling secondary throughput', 'hprabowo@gmail.co.id', '844-201-1321', 'Ds. Peta No. 321', 'Manado', '36164', 'Emil Tamba S.E.I', 'aliquid', '(+62) 482 4506 610', 'sidiq88@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT003', 'PT Widiastuti', 'Grass-roots encompassing service-desk', 'padmi38@sirait.org', '800.318.1227', 'Psr. Honggowongso No. 800', 'Gunungsitoli', '57869', 'Limar Saptono', 'ratione', '0553 5134 0112', 'yuni.anggraini@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT004', 'PT Mandala Wacana (Persero) Tbk', 'Open-source reciprocal infrastructure', 'luis56@yahoo.co.id', '855.276.8384', 'Kpg. Bass No. 425', 'Makassar', '20876', 'Cindy Permata', 'impedit', '0988 7917 893', 'usirait@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT005', 'PT Zulaika Dongoran', 'Open-source heuristic internetsolution', 'astuti.restu@gmail.co.id', '800-480-3197', 'Psr. Laksamana No. 760', 'Dumai', '25976', 'Ulya Usamah', 'amet', '0942 2677 895', 'kuswandari.mala@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT006', 'PT Yuliarti Utama', 'Innovative secondary firmware', 'unababan@gmail.co.id', '855.800.9997', 'Ki. Rajawali Barat No. 694', 'Administrasi Jakarta Utara', '61984', 'Viktor Dono Najmudin', 'voluptas', '0703 3626 476', 'mlaksita@haryanti.info', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT007', 'PT Prayoga Saptono', 'Stand-alone discrete database', 'cawuk48@sitorus.org', '(844) 787-2083', 'Kpg. Sadang Serang No. 2', 'Tanjung Pinang', '49395', 'Emas Prayoga', 'quod', '0634 8003 4110', 'calista.wijayanti@yahoo.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT008', 'PT Lailasari', 'Sharable mission-critical GraphicalUserInterface', 'wani93@gmail.co.id', '1-888-880-7503', 'Jr. Bakit  No. 495', 'Tidore Kepulauan', '92717', 'Daru Napitupulu', 'et', '(+62) 573 5525 996', 'prabu.laksita@gunawan.net', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT009', 'PT Wijayanti Sinaga Tbk', 'Down-sized upward-trending processimprovement', 'wastuti.damu@yahoo.co.id', '1-800-435-9179', 'Ki. Yoga No. 497', 'Kotamobagu', '26011', 'Ajiman Dabukke', 'aut', '0543 1436 232', 'bhidayanto@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT010', 'PT Safitri', 'Inverse system-worthy benchmark', 'pastuti@yahoo.com', '855-721-9632', 'Jr. Gading No. 162', 'Padangsidempuan', '71446', 'Unjani Nasyidah', 'rem', '0820 6513 993', 'nuraini.rachel@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT011', 'PT Salahudin Hakim', 'Progressive dedicated artificialintelligence', 'marpaung.rudi@gmail.com', '844-285-9595', 'Ds. Bazuka Raya No. 436', 'Cilegon', '10454', 'Oman Prabowo', 'voluptates', '(+62) 772 8593 632', 'sudiati.harjaya@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT012', 'PT Marpaung Safitri', 'Versatile contextually-based task-force', 'dian31@yahoo.com', '1-844-550-4592', 'Jr. Bakin No. 45', 'Bandung', '71744', 'Ayu Mulyani M.Farm', 'voluptatibus', '0464 1008 100', 'oktaviani.lalita@gmail.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT013', 'PT Utami', 'Multi-layered scalable success', 'hutapea.karimah@gmail.co.id', '1-844-754-6232', 'Ki. Wahid Hasyim No. 441', 'Bogor', '29662', 'Icha Calista Rahmawati', 'sunt', '(+62) 599 2408 220', 'gilda.puspasari@mayasari.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT014', 'PT Rahimah (Persero) Tbk', 'Operative coherent neural-net', 'lurhur82@yahoo.com', '(855) 461-7016', 'Kpg. Jamika No. 72', 'Cimahi', '84690', 'Ajiman Sitompul', 'inventore', '0573 6259 3043', 'teddy14@yahoo.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT015', 'PT Latupono Gunarto', 'Up-sized motivating encoding', 'mumpuni48@rahimah.biz.id', '855-807-6623', 'Ds. Pelajar Pejuang 45 No. 286', 'Kendari', '36267', 'Pardi Kuswoyo', 'velit', '022 6307 7920', 'yyuniar@habibi.asia', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT016', 'PT Hardiansyah (Persero) Tbk', 'Advanced holistic customerloyalty', 'hariyah.kamila@gmail.co.id', '(800) 725-1066', 'Ki. Zamrud No. 696', 'Tarakan', '51455', 'Ilsa Andriani', 'aperiam', '(+62) 257 1799 428', 'ghakim@wijayanti.desa.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT017', 'PT Hastuti Widiastuti (Persero) Tbk', 'Object-based global artificialintelligence', 'rahmi84@agustina.co', '1-844-727-4082', 'Gg. Bata Putih No. 302', 'Pekanbaru', '12270', 'Maimunah Tiara Yolanda', 'laboriosam', '(+62) 290 3121 160', 'asitorus@hassanah.mil.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT018', 'PT Firgantoro', 'Team-oriented grid-enabled opensystem', 'suartini.baktiadi@pradipta.my.id', '1-877-668-8290', 'Gg. Badak No. 373', 'Tangerang Selatan', '78813', 'Lanjar Hidayanto', 'quibusdam', '(+62) 907 0573 844', 'martana28@gunarto.sch.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT019', 'PT Rahmawati Mandasari', 'Facetoface attitude-oriented moratorium', 'suartini.rachel@pertiwi.biz', '855.964.7037', 'Psr. Jend. A. Yani No. 756', 'Solok', '95051', 'Radit Gunarto', 'quae', '(+62) 449 7776 2683', 'novi13@simanjuntak.in', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT020', 'PT Oktaviani (Persero) Tbk', 'Virtual incremental protocol', 'titi53@yahoo.co.id', '1-844-479-6538', 'Kpg. Cikutra Barat No. 935', 'Bima', '99528', 'Balangga Tampubolon', 'sunt', '0832 3418 290', 'saputra.nurul@yahoo.com', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT021', 'PT Kuswandari', 'Digitized assymetric info-mediaries', 'kurniawan.rusman@widodo.tv', '(800) 270-5779', 'Jr. Baranang Siang No. 282', 'Pontianak', '99353', 'Najam Permadi', 'labore', '(+62) 906 0915 710', 'wasis99@pudjiastuti.tv', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_PT022', 'PT Mulyani (Persero) Tbk', 'Pre-emptive even-keeled hierarchy', 'sudiati.umar@namaga.com', '844-375-1892', 'Ds. Raya Setiabudhi No. 839', 'Bandar Lampung', '40181', 'Kiandra Uyainah', 'eos', '0265 3277 6499', 'mayasari.shakila@haryanti.my.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD001', 'UD Agustina Pradipta (Persero) Tbk', 'Profound well-modulated contingency', 'pnarpati@ramadan.co.id', '(800) 425-4058', 'Ds. Sukajadi No. 128', 'Tasikmalaya', '73240', 'Vanesa Anggraini S.Gz', 'doloremque', '(+62) 718 8451 845', 'damanik.tari@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD002', 'UD Sihombing Namaga (Persero) Tbk', 'Reduced even-keeled model', 'nardi.wibisono@gmail.com', '888.414.0732', 'Gg. Bak Air No. 224', 'Sorong', '59007', 'Natalia Purwanti', 'officia', '(+62) 861 232 472', 'aoktaviani@wahyudin.in', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD003', 'UD Utami Wastuti', 'Organized 6thgeneration challenge', 'anggraini.ellis@prastuti.mil.id', '1-888-461-4134', 'Ds. Honggowongso No. 494', 'Bengkulu', '39712', 'Farah Mardhiyah', 'libero', '0305 0494 1693', 'farida.kala@yuniar.web.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD004', 'UD Yuniar Astuti', 'Organic content-based infrastructure', 'pkusmawati@gmail.com', '(844) 652-0627', 'Psr. B.Agam 1 No. 549', 'Banjar', '48448', 'Melinda Usamah S.E.I', 'totam', '(+62) 884 7019 927', 'viswahyudi@tampubolon.co', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD005', 'UD Maulana', 'Mandatory client-driven alliance', 'zulfa36@gmail.com', '866-862-1329', 'Jln. Eka No. 435', 'Medan', '76427', 'Cecep Hardiansyah', 'consectetur', '0570 3085 744', 'humaira.agustina@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD006', 'UD Palastri Usada', 'Persevering bifurcated service-desk', 'napitupulu.dina@hariyah.ac.id', '(877) 517-8999', 'Gg. Baranangsiang No. 554', 'Jayapura', '60084', 'Bagas Ikhsan Maulana S.T.', 'in', '0667 1080 313', 'raisa86@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD007', 'UD Habibi Simanjuntak (Persero) Tbk', 'Up-sized heuristic interface', 'mustofa.bakijan@lazuardi.ac.id', '844.262.8546', 'Ds. Dahlia No. 891', 'Pekalongan', '39282', 'Shania Wastuti', 'sunt', '0300 6786 7605', 'anggraini.humaira@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD008', 'UD Sirait Suryatmi', 'Secured multi-state task-force', 'cindy49@santoso.web.id', '844-274-6579', 'Jr. Baranang Siang Indah No. 144', 'Pekanbaru', '83069', 'Mursinin Siregar S.IP', 'recusandae', '(+62) 754 9256 685', 'hutagalung.dimaz@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD009', 'UD Rajasa', 'Open-source high-level service-desk', 'mustofa.cindy@novitasari.web.id', '(844) 345-4901', 'Jr. Industri No. 781', 'Sungai Penuh', '27128', 'Eluh Jinawi Marpaung S.E.', 'aut', '(+62) 878 245 019', 'zulfa.uyainah@wahyuni.org', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD010', 'UD Prasasta (Persero) Tbk', 'Extended foreground knowledgeuser', 'jaga.thamrin@gmail.com', '(844) 963-6663', 'Jr. Rumah Sakit No. 452', 'Makassar', '79639', 'Dipa Pradipta', 'tenetur', '(+62) 282 0743 3281', 'gnashiruddin@wacana.tv', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD011', 'UD Novitasari Mayasari Tbk', 'Synergized well-modulated support', 'tira48@maryati.web.id', '1-866-256-8623', 'Dk. Bakin No. 344', 'Bima', '37642', 'Agus Hutagalung', 'eius', '(+62) 767 2550 943', 'owinarsih@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD012', 'UD Pudjiastuti Nasyiah', 'Intuitive client-server knowledgebase', 'sitompul.sakura@rajasa.biz', '844-255-4594', 'Jln. Thamrin No. 110', 'Batam', '56152', 'Darmanto Prasetyo', 'dolor', '0357 5769 870', 'galuh82@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD013', 'UD Nasyidah', 'Reverse-engineered 3rdgeneration toolset', 'juli.suartini@wastuti.biz', '855-496-1154', 'Dk. Yosodipuro No. 306', 'Jambi', '41538', 'Padma Palastri M.M.', 'voluptatem', '(+62) 949 6090 969', 'silvia.adriansyah@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD014', 'UD Kuswandari', 'Focused stable instructionset', 'jpangestu@gmail.com', '877.605.8860', 'Gg. Dipenogoro No. 942', 'Bandar Lampung', '99865', 'Suci Halimah S.Gz', 'totam', '(+62) 962 8171 933', 'suwarno.wadi@prasetyo.my.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD015', 'UD Usamah Widiastuti (Persero) Tbk', 'Persevering optimal infrastructure', 'pandu.yulianti@gmail.co.id', '(888) 372-8263', 'Gg. BKR No. 930', 'Bogor', '86663', 'Asman Gunawan S.Sos', 'repellendus', '0290 6643 6858', 'jhalim@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD016', 'UD Prasetyo Utami (Persero) Tbk', 'Streamlined dedicated access', 'ahassanah@gmail.co.id', '866.421.8447', 'Kpg. Abdullah No. 279', 'Parepare', '91079', 'Hesti Nasyiah', 'at', '(+62) 720 6211 294', 'padma72@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD017', 'UD Purnawati (Persero) Tbk', 'Future-proofed systemic firmware', 'patricia99@yahoo.co.id', '(866) 630-9977', 'Kpg. Halim No. 739', 'Bukittinggi', '47450', 'Ophelia Nasyidah M.M.', 'voluptas', '(+62) 383 6241 8235', 'raditya.zulkarnain@gmail.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD018', 'UD Samosir Tamba', 'Multi-channelled neutral throughput', 'nnugroho@gmail.co.id', '1-800-291-9807', 'Kpg. Bakau No. 49', 'Padang', '40468', 'Salimah Lestari S.I.Kom', 'architecto', '0737 8412 9547', 'yono.prasetya@anggriawan.desa.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD019', 'UD Suryatmi Yolanda (Persero) Tbk', 'Focused neutral pricingstructure', 'bagus.rahimah@padmasari.in', '877-433-7120', 'Ki. Reksoninten No. 206', 'Manado', '39990', 'Ani Maryati', 'neque', '(+62) 440 4438 2545', 'arsipatra56@yahoo.co.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('PO_UD020', 'UD Budiyanto Kuswoyo Tbk', 'Synergized bandwidth-monitored superstructure', 'usamah.emong@maryadi.name', '844.264.4123', 'Dk. Baing No. 845', 'Banjarbaru', '17355', 'Bala Satya Permadi M.M.', 'aliquid', '(+62) 839 779 385', 'bsimanjuntak@wasita.desa.id', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_satuan`
--

DROP TABLE IF EXISTS `mh_satuan`;
CREATE TABLE `mh_satuan` (
  `kode` varchar(8) NOT NULL,
  `nama` varchar(127) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `catatan` longtext DEFAULT NULL,
  `dibuat_oleh` varchar(63) DEFAULT NULL,
  `dibuat_pada` datetime DEFAULT NULL,
  `diubah_oleh` varchar(63) DEFAULT NULL,
  `diubah_pada` datetime DEFAULT NULL,
  `dihapus_oleh` varchar(63) DEFAULT NULL,
  `dihapus_pada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mh_satuan`
--

INSERT INTO `mh_satuan` (`kode`, `nama`, `deskripsi`, `keterangan`, `catatan`, `dibuat_oleh`, `dibuat_pada`, `diubah_oleh`, `diubah_pada`, `dihapus_oleh`, `dihapus_pada`) VALUES
('SA_EK001', 'EKSTRAK', 'Merupakan sediaan yang pekat yang diperoleh dengan mengekstraksi zat dari simplisisa nabati atau simplisia hewani menggunakan zat pelarut yang sesuai.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_EM001', 'EMULSI', 'Merupakan sediaan berupa campuran dari dua fase dalam sistem dispersi.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_GA001', 'GALENIK', 'Merupakan sediaan yang dibuat dari bahan baku yang berasal dari hewan atau tumbuhan yang disari.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_IM001', 'IMUNOSERUM', 'Merupakan sediaan yang mengandung imunoglobulin khas yang diperoleh dari serum hewan dengan pemurnian.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_IN001', 'INFUSA', 'Merupakan sediaan cair yang dibuat dengan mengekstraksi simplisia nabati dengan air pada suhu 90 derajat celcius selama 15 menit.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_IN002', 'INJEKSI', 'Merupakan sediaan steril berupa larutan,emulsi atau suspensi atau serbuk yang harus dilarutkan atau disuspensikan terlebih dahulu sebelum digunakan.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_KA001', 'KAPSUL', 'Merupakan sediaan padat yang terdiri dari obat dalam cangkang keras atau lunak yang dapat larut.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_KA002', 'KAPLET', 'Merupakan sedian padat kompak dibuat secara kempa cetak, bentuknya oval seperti kapsul.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_LA001', 'LARUTAN', 'Merupakan sedian cair yang mengandung satu atau lebih zat kimia yang dapat larut, biasanya dilarutkan dalam air.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_OT001', 'OBAT TETES', 'Merupakan sediaan cair berupa larutan,emulsi atau suspensi, dimaksudkan untuk obat dalam atau obat luar.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_PI001', 'PIL', 'Merupakan bentuk sediaan padat bundar dan kecil mengandung bahan obat dan dimaksudkan untuk pemakaian oral. Saat ini sudah jarang ditemukan karena tergusur tablet dan kapsul. Masih banyak ditemukan pada seduhan jamu.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_PU001', 'PULVIS', 'Merupakan campuran kering bahan obat atau zat kimia yang dihaluskan, ditujukan untuk pemakaian luar.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_PU002', 'PULVERES', 'Merupakan serbuk yang dibagi bobot yang kurang lebih sama, dibungkus menggunakan bahan pengemas yang cocok untuk sekali minum.Contohnya adalah puyer.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_SA001', 'SALEP', 'Merupakan sediaan setengah padat ditujukan untuk pemakaian topikal pada kulit atau selaput lendir.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_SU001', 'SUSPENSI', 'Merupakan sedian cair mengandung partikel padat tidak larut terdispersi dalam fase cair.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_SU002', 'SUPPOSITORIA', 'Merupakan sedian padat dalam berbagai bobot dan bentuk, yang diberikan melalui rektal, vagina atau uretra,umumnya meleleh, melunak atau melarut pada suhu tubuh.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL),
('SA_TA001', 'TABLET', 'Merupakan sediaan padat kompak dibuat secara kempa cetak dalam bentuk tabung pipih atau sirkuler kedua permukaan rata atau cembung mengandung satu jenis obat atau lebih dengan atau tanpa bahan tambahan.', 'INIT_DATA', NULL, 'SYSTEM', '2021-04-19 20:08:53', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `td_jual`
--

DROP TABLE IF EXISTS `td_jual`;
CREATE TABLE `td_jual` (
  `kode` varchar(17) NOT NULL,
  `fk_TH_jual` varchar(14) DEFAULT NULL,
  `fk_produk` varchar(14) DEFAULT NULL,
  `tipe_produk` varchar(30) DEFAULT NULL,
  `instruksi` varchar(255) DEFAULT NULL,
  `jumlah` bigint(20) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `catatan` longtext DEFAULT NULL,
  `dibuat_oleh` varchar(63) DEFAULT NULL,
  `dibuat_pada` date DEFAULT NULL,
  `diubah_oleh` varchar(63) DEFAULT NULL,
  `diubah_pada` date DEFAULT NULL,
  `dihapus_oleh` varchar(63) DEFAULT NULL,
  `dihapus_pada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `td_jual`
--

INSERT INTO `td_jual` (`kode`, `fk_TH_jual`, `fk_produk`, `tipe_produk`, `instruksi`, `jumlah`, `harga`, `subtotal`, `keterangan`, `catatan`, `dibuat_oleh`, `dibuat_pada`, `diubah_oleh`, `diubah_pada`, `dihapus_oleh`, `dihapus_pada`) VALUES
('HJ20180128001_01', 'HJ20180128001', 'PR_RA001', 'MH_PRODUK', '2x sehari sesudah makan', 2, 403254, 806508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180128001_02', 'HJ20180128001', 'HR20190704001', 'TH_RACIK', '2x sehari sebelum makan', 1, 91937, 91937, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180302001_01', 'HJ20180302001', 'HR20190316001', 'TH_RACIK', '2x sehari sesudah makan', 1, 43469, 43469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180302001_02', 'HJ20180302001', 'PR_CA001', 'MH_PRODUK', '2x sehari sebelum makan', 1, 198085, 198085, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180302001_03', 'HJ20180302001', 'HR20181005001', 'TH_RACIK', '1x sehari sesudah makan', 1, 484432, 484432, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180320001_01', 'HJ20180320001', 'HR20180809001', 'TH_RACIK', '2x sehari sesudah makan', 1, 120540, 120540, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180320001_02', 'HJ20180320001', 'HR20200110001', 'TH_RACIK', '1x sehari sebelum makan', 1, 120540, 120540, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180330001_01', 'HJ20180330001', 'HR20190316001', 'TH_RACIK', '3x sehari sesudah makan', 2, 220578, 441156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180515001_01', 'HJ20180515001', 'HR20200207001', 'TH_RACIK', '2x sehari sebelum makan', 2, 47542, 95084, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180515001_02', 'HJ20180515001', 'HR20191006001', 'TH_RACIK', '1x sehari sebelum makan', 1, 26979, 26979, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180515001_03', 'HJ20180515001', 'HR20190704001', 'TH_RACIK', '2x sehari sesudah makan', 2, 69421, 138842, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180529001_01', 'HJ20180529001', 'HR20191006001', 'TH_RACIK', '2x sehari sesudah makan', 2, 484432, 968864, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180529001_02', 'HJ20180529001', 'HR20190316001', 'TH_RACIK', '1x sehari sesudah makan', 2, 96225, 192450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180617001_01', 'HJ20180617001', 'PR_CA003', 'MH_PRODUK', '4x sehari sebelum makan', 1, 82859, 82859, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180617001_02', 'HJ20180617001', 'HR20180815001', 'TH_RACIK', '1x sehari sebelum makan', 1, 82859, 82859, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180617001_03', 'HJ20180617001', 'PR_VO002', 'MH_PRODUK', '3x sehari sesudah makan', 2, 135727, 271454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180617001_04', 'HJ20180617001', 'PR_AR002', 'MH_PRODUK', '4x sehari sebelum makan', 1, 69421, 69421, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180730001_01', 'HJ20180730001', 'HR20190704001', 'TH_RACIK', '1x sehari sesudah makan', 2, 390962, 781924, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180730001_02', 'HJ20180730001', 'PR_AC002', 'MH_PRODUK', '1x sehari sesudah makan', 1, 487731, 487731, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180730001_03', 'HJ20180730001', 'PR_RH001', 'MH_PRODUK', '3x sehari sesudah makan', 2, 43469, 86938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180808001_01', 'HJ20180808001', 'PR_VO003', 'MH_PRODUK', '5x sehari sesudah makan', 1, 381497, 381497, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180808001_02', 'HJ20180808001', 'HR20200106001', 'TH_RACIK', '2x sehari sebelum makan', 1, 381497, 381497, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180808001_03', 'HJ20180808001', 'HR20190207001', 'TH_RACIK', '1x sehari sebelum makan', 1, 396465, 396465, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180808001_04', 'HJ20180808001', 'PR_ZO003', 'MH_PRODUK', '4x sehari sebelum makan', 2, 342637, 685274, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180928001_01', 'HJ20180928001', 'PR_DI001', 'MH_PRODUK', '2x sehari sebelum makan', 1, 160220, 160220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180928001_02', 'HJ20180928001', 'HR20190716001', 'TH_RACIK', '1x sehari sesudah makan', 1, 93257, 93257, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180928001_03', 'HJ20180928001', 'HR20180327001', 'TH_RACIK', '1x sehari sesudah makan', 2, 389075, 778150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180928001_04', 'HJ20180928001', 'PR_YA001', 'MH_PRODUK', '4x sehari sesudah makan', 2, 27143, 54286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181013001_01', 'HJ20181013001', 'PR_DE002', 'MH_PRODUK', '5x sehari sebelum makan', 2, 357990, 715980, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181013001_02', 'HJ20181013001', 'HR20190911001', 'TH_RACIK', '1x sehari sebelum makan', 2, 198085, 396170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181013001_03', 'HJ20181013001', 'HR20191006001', 'TH_RACIK', '3x sehari sebelum makan', 1, 43469, 43469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181013002_01', 'HJ20181013002', 'HR20191201001', 'TH_RACIK', '1x sehari sesudah makan', 1, 484432, 484432, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181013002_02', 'HJ20181013002', 'PR_EY002', 'MH_PRODUK', '5x sehari sesudah makan', 1, 20062, 20062, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181014001_01', 'HJ20181014001', 'PR_ME001', 'MH_PRODUK', '4x sehari sebelum makan', 1, 26979, 26979, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181014001_02', 'HJ20181014001', 'PR_PE003', 'MH_PRODUK', '3x sehari sesudah makan', 2, 173549, 347098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181014001_03', 'HJ20181014001', 'HR20190207001', 'TH_RACIK', '2x sehari sesudah makan', 2, 439590, 879180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181014001_04', 'HJ20181014001', 'PR_DI002', 'MH_PRODUK', '3x sehari sebelum makan', 1, 136996, 136996, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181026001_01', 'HJ20181026001', 'HR20191127001', 'TH_RACIK', '2x sehari sesudah makan', 1, 499586, 499586, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181026001_02', 'HJ20181026001', 'HR20191127001', 'TH_RACIK', '3x sehari sebelum makan', 2, 439590, 879180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181026001_03', 'HJ20181026001', 'HR20180327001', 'TH_RACIK', '2x sehari sesudah makan', 1, 484432, 484432, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181111001_01', 'HJ20181111001', 'PR_CE001', 'MH_PRODUK', '2x sehari sesudah makan', 1, 451721, 451721, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181111001_02', 'HJ20181111001', 'HR20190315001', 'TH_RACIK', '2x sehari sesudah makan', 2, 136996, 273992, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181112001_01', 'HJ20181112001', 'HR20191006001', 'TH_RACIK', '1x sehari sebelum makan', 2, 439590, 879180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181112001_02', 'HJ20181112001', 'HR20190613001', 'TH_RACIK', '1x sehari sesudah makan', 2, 82859, 165718, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190120001_01', 'HJ20190120001', 'HR20190911001', 'TH_RACIK', '1x sehari sesudah makan', 1, 96225, 96225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190123001_01', 'HJ20190123001', 'PR_KI001', 'MH_PRODUK', '3x sehari sebelum makan', 1, 269279, 269279, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190217001_01', 'HJ20190217001', 'PR_RI002', 'MH_PRODUK', '4x sehari sesudah makan', 2, 490567, 981134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190217001_02', 'HJ20190217001', 'HR20180225001', 'TH_RACIK', '3x sehari sebelum makan', 2, 389075, 778150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190217001_03', 'HJ20190217001', 'PR_BR003', 'MH_PRODUK', '4x sehari sebelum makan', 2, 124439, 248878, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190401001_01', 'HJ20190401001', 'PR_KI002', 'MH_PRODUK', '1x sehari sesudah makan', 2, 488938, 977876, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190401001_02', 'HJ20190401001', 'HR20191113001', 'TH_RACIK', '1x sehari sebelum makan', 2, 239070, 478140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190403001_01', 'HJ20190403001', 'HR20180605001', 'TH_RACIK', '1x sehari sesudah makan', 2, 82859, 165718, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190403001_02', 'HJ20190403001', 'HR20190207001', 'TH_RACIK', '1x sehari sesudah makan', 1, 202147, 202147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190403001_03', 'HJ20190403001', 'PR_DU001', 'MH_PRODUK', '4x sehari sesudah makan', 2, 60882, 121764, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190413001_01', 'HJ20190413001', 'HR20180327001', 'TH_RACIK', '2x sehari sesudah makan', 1, 381497, 381497, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190413001_02', 'HJ20190413001', 'HR20190207001', 'TH_RACIK', '3x sehari sebelum makan', 2, 314627, 629254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190717001_01', 'HJ20190717001', 'HR20180815001', 'TH_RACIK', '2x sehari sebelum makan', 1, 310335, 310335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190717001_02', 'HJ20190717001', 'HR20191127001', 'TH_RACIK', '1x sehari sesudah makan', 1, 43469, 43469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190730001_01', 'HJ20190730001', 'PR_CI001', 'MH_PRODUK', '4x sehari sebelum makan', 2, 205670, 411340, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190801001_01', 'HJ20190801001', 'PR_PH002', 'MH_PRODUK', '3x sehari sebelum makan', 1, 392124, 392124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190809001_01', 'HJ20190809001', 'PR_AL002', 'MH_PRODUK', '2x sehari sesudah makan', 2, 96225, 192450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190818001_01', 'HJ20190818001', 'HR20190207001', 'TH_RACIK', '1x sehari sebelum makan', 2, 57327, 114654, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190818001_02', 'HJ20190818001', 'PR_LI001', 'MH_PRODUK', '2x sehari sesudah makan', 1, 499586, 499586, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190818001_03', 'HJ20190818001', 'HR20190911001', 'TH_RACIK', '2x sehari sebelum makan', 2, 484432, 968864, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190818001_04', 'HJ20190818001', 'PR_DE001', 'MH_PRODUK', '4x sehari sesudah makan', 2, 155424, 310848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20191108001_01', 'HJ20191108001', 'HR20191127001', 'TH_RACIK', '2x sehari sesudah makan', 1, 155424, 155424, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20191108001_02', 'HJ20191108001', 'PR_BR001', 'MH_PRODUK', '1x sehari sesudah makan', 2, 484432, 968864, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20191108001_03', 'HJ20191108001', 'HR20180809001', 'TH_RACIK', '2x sehari sebelum makan', 1, 47542, 47542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20200115001_01', 'HJ20200115001', 'PR_SA001', 'MH_PRODUK', '4x sehari sesudah makan', 2, 389075, 778150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20200115001_02', 'HJ20200115001', 'PR_RE002', 'MH_PRODUK', '4x sehari sebelum makan', 2, 217036, 434072, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20200115001_03', 'HJ20200115001', 'HR20190207001', 'TH_RACIK', '1x sehari sebelum makan', 2, 155424, 310848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20200115001_04', 'HJ20200115001', 'HR20180315001', 'TH_RACIK', '2x sehari sebelum makan', 2, 135727, 271454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20200124001_01', 'HJ20200124001', 'PR_CO001', 'MH_PRODUK', '1x sehari sesudah makan', 1, 57327, 57327, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20200124001_02', 'HJ20200124001', 'HR20180727001', 'TH_RACIK', '1x sehari sesudah makan', 1, 357990, 357990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `td_racik`
--

DROP TABLE IF EXISTS `td_racik`;
CREATE TABLE `td_racik` (
  `kode` varchar(17) NOT NULL,
  `fk_TH_racik` varchar(14) DEFAULT NULL,
  `fk_produk` varchar(8) DEFAULT NULL,
  `jumlah` bigint(20) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `catatan` longtext DEFAULT NULL,
  `dibuat_oleh` varchar(63) DEFAULT NULL,
  `dibuat_pada` date DEFAULT NULL,
  `diubah_oleh` varchar(63) DEFAULT NULL,
  `diubah_pada` date DEFAULT NULL,
  `dihapus_oleh` varchar(63) DEFAULT NULL,
  `dihapus_pada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `td_racik`
--

INSERT INTO `td_racik` (`kode`, `fk_TH_racik`, `fk_produk`, `jumlah`, `harga`, `subtotal`, `keterangan`, `catatan`, `dibuat_oleh`, `dibuat_pada`, `diubah_oleh`, `diubah_pada`, `dihapus_oleh`, `dihapus_pada`) VALUES
('HR20180118001_01', 'HR20180118001', 'PR_RI001', 1, 458995, 458995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180118001_02', 'HR20180118001', 'PR_EY002', 1, 20062, 20062, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180118001_03', 'HR20180118001', 'PR_KI001', 1, 269279, 269279, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180118001_04', 'HR20180118001', 'PR_CO001', 2, 57327, 114654, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180118001_05', 'HR20180118001', 'PR_LI002', 2, 93257, 186514, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180119001_01', 'HR20180119001', 'PR_ZO003', 1, 342637, 342637, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180119001_02', 'HR20180119001', 'PR_RI002', 2, 490567, 981134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180119001_03', 'HR20180119001', 'PR_RE002', 2, 217036, 434072, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180225001_01', 'HR20180225001', 'PR_LI001', 2, 499586, 999172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180225001_02', 'HR20180225001', 'PR_KI001', 2, 269279, 538558, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180315001_01', 'HR20180315001', 'PR_DI001', 1, 160220, 160220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180315001_02', 'HR20180315001', 'PR_BR001', 2, 484432, 968864, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180315001_03', 'HR20180315001', 'PR_CA003', 1, 82859, 82859, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180315001_04', 'HR20180315001', 'PR_CA003', 1, 82859, 82859, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180327001_01', 'HR20180327001', 'PR_PE003', 2, 173549, 347098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180327001_02', 'HR20180327001', 'PR_RE002', 1, 217036, 217036, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180327001_03', 'HR20180327001', 'PR_CE001', 2, 451721, 903442, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180605001_01', 'HR20180605001', 'PR_RI001', 1, 458995, 458995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180727001_01', 'HR20180727001', 'PR_BE002', 1, 396465, 396465, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180727001_02', 'HR20180727001', 'PR_LI002', 2, 93257, 186514, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180809001_01', 'HR20180809001', 'PR_PA001', 2, 112726, 225452, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180815001_01', 'HR20180815001', 'PR_YA001', 2, 27143, 54286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180914001_01', 'HR20180914001', 'PR_AL002', 1, 96225, 96225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180914001_02', 'HR20180914001', 'PR_NO003', 1, 47542, 47542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180914001_03', 'HR20180914001', 'PR_GU002', 1, 174256, 174256, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180914001_04', 'HR20180914001', 'PR_TI001', 1, 439590, 439590, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181005001_01', 'HR20181005001', 'PR_DE003', 2, 277503, 555006, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181005001_02', 'HR20181005001', 'PR_DE002', 2, 357990, 715980, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181005001_03', 'HR20181005001', 'PR_DA001', 1, 58835, 58835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181208001_01', 'HR20181208001', 'PR_PA001', 1, 112726, 112726, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181208001_02', 'HR20181208001', 'PR_TI001', 2, 439590, 879180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181208001_03', 'HR20181208001', 'PR_EU002', 2, 46614, 93228, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181208001_04', 'HR20181208001', 'PR_KI002', 2, 488938, 977876, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181224001_01', 'HR20181224001', 'PR_RA001', 1, 403254, 403254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181224001_02', 'HR20181224001', 'PR_DE003', 1, 277503, 277503, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181224001_03', 'HR20181224001', 'PR_EU001', 2, 114032, 228064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190207001_01', 'HR20190207001', 'PR_RH001', 2, 43469, 86938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190207001_02', 'HR20190207001', 'PR_ME001', 2, 26979, 53958, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190207001_03', 'HR20190207001', 'PR_RI001', 1, 458995, 458995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190315001_01', 'HR20190315001', 'PR_SE001', 1, 433872, 433872, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190315001_02', 'HR20190315001', 'PR_ZO003', 1, 342637, 342637, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190315001_03', 'HR20190315001', 'PR_AR002', 1, 69421, 69421, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190315001_04', 'HR20190315001', 'PR_DI005', 1, 202147, 202147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190316001_01', 'HR20190316001', 'PR_SA001', 1, 389075, 389075, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190325001_01', 'HR20190325001', 'PR_FE001', 2, 91937, 183874, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190325001_02', 'HR20190325001', 'PR_AL002', 2, 96225, 192450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190325001_03', 'HR20190325001', 'PR_BR004', 2, 309999, 619998, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190325001_04', 'HR20190325001', 'PR_DI004', 1, 310335, 310335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190325001_05', 'HR20190325001', 'PR_GU002', 2, 174256, 348512, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190613001_01', 'HR20190613001', 'PR_CH001', 2, 206446, 412892, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190613001_02', 'HR20190613001', 'PR_CA003', 2, 82859, 165718, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190613001_03', 'HR20190613001', 'PR_DE003', 2, 277503, 555006, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190704001_01', 'HR20190704001', 'PR_PA001', 1, 112726, 112726, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190704001_02', 'HR20190704001', 'PR_RI002', 1, 490567, 490567, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190704001_03', 'HR20190704001', 'PR_PE003', 2, 173549, 347098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190704001_04', 'HR20190704001', 'PR_NO001', 1, 314627, 314627, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190708001_01', 'HR20190708001', 'PR_NO001', 1, 314627, 314627, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190708001_02', 'HR20190708001', 'PR_AC001', 2, 317532, 635064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190708001_03', 'HR20190708001', 'PR_OT001', 1, 390962, 390962, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190716001_01', 'HR20190716001', 'PR_DE002', 1, 357990, 357990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190716001_02', 'HR20190716001', 'PR_DE002', 2, 357990, 715980, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190819001_01', 'HR20190819001', 'PR_DE002', 1, 357990, 357990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190819001_02', 'HR20190819001', 'PR_NO001', 2, 314627, 629254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190819001_03', 'HR20190819001', 'PR_CA003', 2, 82859, 165718, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190819001_04', 'HR20190819001', 'PR_SE001', 1, 433872, 433872, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190819001_05', 'HR20190819001', 'PR_AC001', 2, 317532, 635064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190911001_01', 'HR20190911001', 'PR_BR003', 1, 124439, 124439, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190911001_02', 'HR20190911001', 'PR_PI001', 2, 125278, 250556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190911001_03', 'HR20190911001', 'PR_PA001', 1, 112726, 112726, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191006001_01', 'HR20191006001', 'PR_DI004', 1, 310335, 310335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191006001_02', 'HR20191006001', 'PR_AR002', 1, 69421, 69421, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191006001_03', 'HR20191006001', 'PR_DE003', 1, 277503, 277503, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191006001_04', 'HR20191006001', 'PR_NO003', 1, 47542, 47542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191006001_05', 'HR20191006001', 'PR_SA001', 2, 389075, 778150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191113001_01', 'HR20191113001', 'PR_RI002', 2, 490567, 981134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191127001_01', 'HR20191127001', 'PR_NO001', 2, 314627, 629254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191127001_02', 'HR20191127001', 'PR_LI002', 2, 93257, 186514, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191201001_01', 'HR20191201001', 'PR_PE003', 2, 173549, 347098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191201001_02', 'HR20191201001', 'PR_YA001', 1, 27143, 27143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191201001_03', 'HR20191201001', 'PR_BR001', 1, 484432, 484432, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191201001_04', 'HR20191201001', 'PR_LI001', 2, 499586, 999172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200106001_01', 'HR20200106001', 'PR_RI002', 2, 490567, 981134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200106001_02', 'HR20200106001', 'PR_AR001', 2, 330018, 660036, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200110001_01', 'HR20200110001', 'PR_VO003', 3, 381497, 381497, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200110001_02', 'HR20200110001', 'PR_DI004', 1, 310335, 310335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200110001_03', 'HR20200110001', 'PR_ZO003', 3, 342637, 342637, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200110001_04', 'HR20200110001', 'PR_PH002', 1, 392124, 392124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200207001_01', 'HR20200207001', 'PR_RA001', 1, 403254, 403254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200207001_02', 'HR20200207001', 'PR_VO002', 1, 135727, 135727, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `th_jual`
--

DROP TABLE IF EXISTS `th_jual`;
CREATE TABLE `th_jual` (
  `kode` varchar(14) NOT NULL,
  `fk_pelanggan` varchar(8) DEFAULT NULL,
  `nama_dokter` varchar(128) DEFAULT NULL,
  `tgl_resep` date DEFAULT NULL,
  `waktu_transaksi` date DEFAULT NULL,
  `grandtotal` bigint(20) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `catatan` longtext DEFAULT NULL,
  `dibuat_oleh` varchar(63) DEFAULT NULL,
  `dibuat_pada` date DEFAULT NULL,
  `diubah_oleh` varchar(63) DEFAULT NULL,
  `diubah_pada` date DEFAULT NULL,
  `dihapus_oleh` varchar(63) DEFAULT NULL,
  `dihapus_pada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `th_jual`
--

INSERT INTO `th_jual` (`kode`, `fk_pelanggan`, `nama_dokter`, `tgl_resep`, `waktu_transaksi`, `grandtotal`, `keterangan`, `catatan`, `dibuat_oleh`, `dibuat_pada`, `diubah_oleh`, `diubah_pada`, `dihapus_oleh`, `dihapus_pada`) VALUES
('HJ20180128001', 'PE_AS001', 'DARWIN HARTANTO', NULL, NULL, 898445, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180302001', 'PE_SM001', 'PHILIP PURNOMO', NULL, NULL, 725986, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180320001', 'PE_AN001', 'IWAN PURNOMO', NULL, NULL, 241080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180330001', 'PE_LA001', 'THOMAS WIJAYA', NULL, NULL, 441156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180515001', 'PE_CS001', 'MICHAEL WIJAYA', NULL, NULL, 260905, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180529001', 'PE_NA002', 'IWAN WIBOWO', NULL, NULL, 1161314, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180617001', 'PE_HS001', 'THOMAS SUBIANTO', NULL, NULL, 506593, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180730001', 'PE_KP001', 'RONALD SANJAYA', NULL, NULL, 1356593, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180808001', 'PE_MN001', 'MICHAEL SANJAYA', NULL, NULL, 1844733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20180928001', 'PE_DK001', 'MICHAEL HERMAWAN', NULL, NULL, 1085913, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181013001', 'PE_JH001', 'PHILIP SUBIANTO', NULL, NULL, 1155619, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181013002', 'PE_CW001', 'THOMAS HARTANTO', NULL, NULL, 504494, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181014001', 'PE_HE001', 'PHILIP WILSON', NULL, NULL, 1390253, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181026001', 'PE_JA002', 'DARWIN SUBIANTO', NULL, NULL, 1863198, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181111001', 'PE_TW001', 'PHILIP HARTANTO', NULL, NULL, 725713, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20181112001', 'PE_CN001', 'ALDO WILSON', NULL, NULL, 1044898, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190120001', 'PE_SW001', 'BUDI HARTANTO', NULL, NULL, 96225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190123001', 'PE_JA001', 'IWAN WIBOWO', NULL, NULL, 269279, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190217001', 'PE_EL001', 'RONALD WILSON', NULL, NULL, 2008162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190401001', 'PE_WW001', 'MICHAEL WIJAYA', NULL, NULL, 1456016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190403001', 'PE_OZ001', 'DARWIN WIJAYA', NULL, NULL, 489629, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190413001', 'PE_RP001', 'BUDI WIJAYA', NULL, NULL, 1010751, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190717001', 'PE_TS001', 'DARWIN HERMAWAN', NULL, NULL, 353804, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190730001', 'PE_DN001', 'AHMAD WILSON', NULL, NULL, 411340, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190801001', 'PE_SM001', 'IWAN MULYANTO', NULL, NULL, 392124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190809001', 'PE_JU001', 'THOMAS WIBOWO', NULL, NULL, 192450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20190818001', 'PE_NA002', 'IWAN HERMAWAN', NULL, NULL, 1893952, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20191108001', 'PE_LL001', 'ALDO MULYANTO', NULL, NULL, 1171830, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20200115001', 'PE_AT001', 'MICHAEL SANJAYA', NULL, NULL, 1794524, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HJ20200124001', 'PE_DM001', 'THOMAS PURNOMO', NULL, NULL, 415317, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `th_racik`
--

DROP TABLE IF EXISTS `th_racik`;
CREATE TABLE `th_racik` (
  `kode` varchar(14) NOT NULL,
  `fk_pelanggan` varchar(8) DEFAULT NULL,
  `nama_dokter` varchar(128) DEFAULT NULL,
  `waktu_order` date DEFAULT NULL,
  `grandtotal` bigint(20) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `catatan` longtext DEFAULT NULL,
  `dibuat_oleh` varchar(63) DEFAULT NULL,
  `dibuat_pada` date DEFAULT NULL,
  `diubah_oleh` varchar(63) DEFAULT NULL,
  `diubah_pada` date DEFAULT NULL,
  `dihapus_oleh` varchar(63) DEFAULT NULL,
  `dihapus_pada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `th_racik`
--

INSERT INTO `th_racik` (`kode`, `fk_pelanggan`, `nama_dokter`, `waktu_order`, `grandtotal`, `keterangan`, `catatan`, `dibuat_oleh`, `dibuat_pada`, `diubah_oleh`, `diubah_pada`, `dihapus_oleh`, `dihapus_pada`) VALUES
('HR20180118001', 'PE_NA002', 'DARWIN WILSON', NULL, 1049504, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180119001', 'PE_MA001', 'THOMAS PURNOMO', NULL, 1757843, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180225001', 'PE_CA001', 'JOHN SANJAYA', NULL, 1537730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180315001', 'PE_WP001', 'DARWIN SANJAYA', NULL, 1294802, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180327001', 'PE_DN001', 'PHILIP WILSON', NULL, 1467576, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180605001', 'PE_AS001', 'RONALD WIJAYA', NULL, 458995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180727001', 'PE_CW001', 'JOHN MULYANTO', NULL, 582979, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180809001', 'PE_RA001', 'PHILIP MULYANTO', NULL, 225452, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180815001', 'PE_HS002', 'RONALD WIJAYA', NULL, 54286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20180914001', 'PE_CA002', 'MICHAEL WILSON', NULL, 757613, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181005001', 'PE_LU002', 'RONALD SUBIANTO', NULL, 1329821, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181208001', 'PE_AU001', 'JOHN WILSON', NULL, 2063010, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20181224001', 'PE_AR001', 'ALDO HARTANTO', NULL, 908821, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190207001', 'PE_NH001', 'PHILIP WIBOWO', NULL, 599891, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190315001', 'PE_KP001', 'PHILIP SANJAYA', NULL, 1048077, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190316001', 'PE_JN001', 'BUDI SUBIANTO', NULL, 389075, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190325001', 'PE_JU001', 'ALDO WIBOWO', NULL, 1655169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190613001', 'PE_AM001', 'THOMAS WIJAYA', NULL, 1133616, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190704001', 'PE_PR001', 'THOMAS WIJAYA', NULL, 1265018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190708001', 'PE_OH001', 'BUDI KARMAN', NULL, 1340653, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190716001', 'PE_YF001', 'IWAN SUBIANTO', NULL, 1073970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190819001', 'PE_AR001', 'IWAN WILSON', NULL, 2221898, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20190911001', 'PE_GA001', 'RONALD HARTANTO', NULL, 487721, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191006001', 'PE_PR001', 'PHILIP HARTANTO', NULL, 1482951, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191113001', 'PE_DU001', 'JOHN KARMAN', NULL, 981134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191127001', 'PE_CA001', 'DARWIN HARTANTO', NULL, 815768, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20191201001', 'PE_NA002', 'IWAN HERMAWAN', NULL, 1857845, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200106001', 'PE_TD001', 'RONALD SANJAYA', NULL, 1641170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200110001', 'PE_PM003', 'DARWIN WILSON', NULL, 1426593, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HR20200207001', 'PE_JH001', 'THOMAS KARMAN', NULL, 538981, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `th_stok`
--

DROP TABLE IF EXISTS `th_stok`;
CREATE TABLE `th_stok` (
  `kode` varchar(14) NOT NULL,
  `fk_produk` varchar(8) DEFAULT NULL,
  `waktu_transaksi` date DEFAULT NULL,
  `tgl_produksi` date DEFAULT NULL,
  `tgl_expired` date DEFAULT NULL,
  `jumlah` bigint(20) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `catatan` longtext DEFAULT NULL,
  `dibuat_oleh` varchar(63) DEFAULT NULL,
  `dibuat_pada` date DEFAULT NULL,
  `diubah_oleh` varchar(63) DEFAULT NULL,
  `diubah_pada` date DEFAULT NULL,
  `dihapus_oleh` varchar(63) DEFAULT NULL,
  `dihapus_pada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `th_stok`
--

INSERT INTO `th_stok` (`kode`, `fk_produk`, `waktu_transaksi`, `tgl_produksi`, `tgl_expired`, `jumlah`, `keterangan`, `catatan`, `dibuat_oleh`, `dibuat_pada`, `diubah_oleh`, `diubah_pada`, `dihapus_oleh`, `dihapus_pada`) VALUES
('HS_20200210001', 'PR_CA003', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210002', 'PR_AL002', NULL, NULL, NULL, 110, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210003', 'PR_PE002', NULL, NULL, NULL, 170, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210004', 'PR_LI001', NULL, NULL, NULL, 100, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210005', 'PR_NO001', NULL, NULL, NULL, 70, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210006', 'PR_KI002', NULL, NULL, NULL, 110, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210007', 'PR_AR001', NULL, NULL, NULL, 90, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210008', 'PR_DI005', NULL, NULL, NULL, 150, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210009', 'PR_AC001', NULL, NULL, NULL, 160, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210010', 'PR_SE001', NULL, NULL, NULL, 170, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210011', 'PR_RH001', NULL, NULL, NULL, 140, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210012', 'PR_LI001', NULL, NULL, NULL, 110, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210013', 'PR_BE002', NULL, NULL, NULL, 80, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210014', 'PR_RI002', NULL, NULL, NULL, 150, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210015', 'PR_EY002', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210016', 'PR_VO002', NULL, NULL, NULL, 190, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210017', 'PR_ME001', NULL, NULL, NULL, 190, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210018', 'PR_RI001', NULL, NULL, NULL, 50, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210019', 'PR_NO003', NULL, NULL, NULL, 170, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210020', 'PR_GU002', NULL, NULL, NULL, 120, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210021', 'PR_EU002', NULL, NULL, NULL, 100, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210022', 'PR_RH001', NULL, NULL, NULL, 70, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210023', 'PR_EY002', NULL, NULL, NULL, 200, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210024', 'PR_DE002', NULL, NULL, NULL, 120, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210025', 'PR_CU001', NULL, NULL, NULL, 80, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210026', 'PR_CA001', NULL, NULL, NULL, 190, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210027', 'PR_CO001', NULL, NULL, NULL, 140, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210028', 'PR_VO002', NULL, NULL, NULL, 120, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210029', 'PR_LI001', NULL, NULL, NULL, 70, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210030', 'PR_PH002', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210031', 'PR_PE002', NULL, NULL, NULL, 70, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210032', 'PR_DE003', NULL, NULL, NULL, 120, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210033', 'PR_DI004', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210034', 'PR_DI003', NULL, NULL, NULL, 80, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210035', 'PR_VO001', NULL, NULL, NULL, 70, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210036', 'PR_TI001', NULL, NULL, NULL, 130, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210037', 'PR_BR001', NULL, NULL, NULL, 190, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210038', 'PR_SA001', NULL, NULL, NULL, 120, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210039', 'PR_CE001', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210040', 'PR_PI001', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210041', 'PR_PA001', NULL, NULL, NULL, 170, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210042', 'PR_RE002', NULL, NULL, NULL, 190, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210043', 'PR_AC002', NULL, NULL, NULL, 180, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210044', 'PR_DI004', NULL, NULL, NULL, 140, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210045', 'PR_DI001', NULL, NULL, NULL, 140, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210046', 'PR_RH001', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210047', 'PR_AN001', NULL, NULL, NULL, 90, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210048', 'PR_LI002', NULL, NULL, NULL, 170, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210049', 'PR_CH001', NULL, NULL, NULL, 170, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210050', 'PR_DU001', NULL, NULL, NULL, 140, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210051', 'PR_PE002', NULL, NULL, NULL, 140, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210052', 'PR_CU001', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210053', 'PR_ZO003', NULL, NULL, NULL, 70, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210054', 'PR_TI001', NULL, NULL, NULL, 150, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210055', 'PR_VO002', NULL, NULL, NULL, 100, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210056', 'PR_DE001', NULL, NULL, NULL, 170, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210057', 'PR_YA001', NULL, NULL, NULL, 130, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210058', 'PR_PE003', NULL, NULL, NULL, 110, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210059', 'PR_KI002', NULL, NULL, NULL, 120, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210060', 'PR_KI002', NULL, NULL, NULL, 140, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210061', 'PR_AN001', NULL, NULL, NULL, 100, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210062', 'PR_RI002', NULL, NULL, NULL, 110, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210063', 'PR_RI002', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210064', 'PR_ZO003', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210065', 'PR_BR001', NULL, NULL, NULL, 90, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210066', 'PR_BR003', NULL, NULL, NULL, 180, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210067', 'PR_TI001', NULL, NULL, NULL, 130, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210068', 'PR_RA001', NULL, NULL, NULL, 190, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210069', 'PR_ME001', NULL, NULL, NULL, 110, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210070', 'PR_DI002', NULL, NULL, NULL, 80, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210071', 'PR_CE001', NULL, NULL, NULL, 130, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210072', 'PR_FA001', NULL, NULL, NULL, 70, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210073', 'PR_BE003', NULL, NULL, NULL, 130, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210074', 'PR_KI001', NULL, NULL, NULL, 80, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210075', 'PR_PH002', NULL, NULL, NULL, 70, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210076', 'PR_VO003', NULL, NULL, NULL, 90, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210077', 'PR_NO003', NULL, NULL, NULL, 90, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210078', 'PR_CA003', NULL, NULL, NULL, 80, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210079', 'PR_EU001', NULL, NULL, NULL, 90, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210080', 'PR_SE001', NULL, NULL, NULL, 200, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210081', 'PR_CU001', NULL, NULL, NULL, 50, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210082', 'PR_CA001', NULL, NULL, NULL, 100, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210083', 'PR_AR002', NULL, NULL, NULL, 130, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210084', 'PR_DE004', NULL, NULL, NULL, 140, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210085', 'PR_DA001', NULL, NULL, NULL, 90, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210086', 'PR_CI001', NULL, NULL, NULL, 200, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210087', 'PR_CA003', NULL, NULL, NULL, 170, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210088', 'PR_RE002', NULL, NULL, NULL, 140, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210089', 'PR_FE001', NULL, NULL, NULL, 100, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210090', 'PR_DI003', NULL, NULL, NULL, 150, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210091', 'PR_DI005', NULL, NULL, NULL, 160, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210092', 'PR_DI004', NULL, NULL, NULL, 120, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210093', 'PR_BR004', NULL, NULL, NULL, 200, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210094', 'PR_DE003', NULL, NULL, NULL, 130, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210095', 'PR_DU001', NULL, NULL, NULL, 80, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210096', 'PR_CO001', NULL, NULL, NULL, 180, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200210097', 'PR_OT001', NULL, NULL, NULL, 120, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211001', 'PR_DE002', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211002', 'PR_ME001', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211003', 'PR_CA003', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211004', 'PR_VO003', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211005', 'PR_AL002', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211006', 'PR_CE001', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211007', 'PR_SA001', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211008', 'PR_CO001', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211009', 'PR_RA001', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211010', 'PR_PE003', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211011', 'PR_DI001', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211012', 'PR_RI002', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211013', 'PR_KI001', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211014', 'PR_CI001', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211015', 'PR_VO002', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211016', 'PR_LI001', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211017', 'PR_RE002', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211018', 'PR_KI002', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211019', 'PR_PH002', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211020', 'PR_CA001', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211021', 'PR_AC002', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211022', 'PR_BR003', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211023', 'PR_BR001', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211024', 'PR_RH001', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211025', 'PR_ZO003', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211026', 'PR_DU001', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211027', 'PR_DI002', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211028', 'PR_AR002', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211029', 'PR_EY002', NULL, NULL, NULL, -1, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211030', 'PR_DE001', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200211031', 'PR_YA001', NULL, NULL, NULL, -2, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL),
('HS_20200225001', 'PR_VO003', NULL, NULL, NULL, 60, NULL, NULL, 'SYSTEM', NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mh_kategori`
--
ALTER TABLE `mh_kategori`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `mh_pelanggan`
--
ALTER TABLE `mh_pelanggan`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `mh_produk`
--
ALTER TABLE `mh_produk`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `fk_kategori` (`fk_kategori`),
  ADD KEY `fk_produsen` (`fk_produsen`),
  ADD KEY `fk_satuan` (`fk_satuan`);

--
-- Indeks untuk tabel `mh_produsen`
--
ALTER TABLE `mh_produsen`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `mh_satuan`
--
ALTER TABLE `mh_satuan`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `td_jual`
--
ALTER TABLE `td_jual`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `fk_TH_jual` (`fk_TH_jual`);

--
-- Indeks untuk tabel `td_racik`
--
ALTER TABLE `td_racik`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `fk_TH_racik` (`fk_TH_racik`),
  ADD KEY `fk_produk` (`fk_produk`);

--
-- Indeks untuk tabel `th_jual`
--
ALTER TABLE `th_jual`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `fk_pelanggan` (`fk_pelanggan`);

--
-- Indeks untuk tabel `th_racik`
--
ALTER TABLE `th_racik`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `fk_pelanggan` (`fk_pelanggan`);

--
-- Indeks untuk tabel `th_stok`
--
ALTER TABLE `th_stok`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `fk_produk` (`fk_produk`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mh_produk`
--
ALTER TABLE `mh_produk`
  ADD CONSTRAINT `mh_produk_ibfk_1` FOREIGN KEY (`fk_kategori`) REFERENCES `mh_kategori` (`kode`),
  ADD CONSTRAINT `mh_produk_ibfk_2` FOREIGN KEY (`fk_produsen`) REFERENCES `mh_produsen` (`kode`),
  ADD CONSTRAINT `mh_produk_ibfk_3` FOREIGN KEY (`fk_satuan`) REFERENCES `mh_satuan` (`kode`);

--
-- Ketidakleluasaan untuk tabel `td_jual`
--
ALTER TABLE `td_jual`
  ADD CONSTRAINT `td_jual_ibfk_1` FOREIGN KEY (`fk_TH_jual`) REFERENCES `th_jual` (`kode`);

--
-- Ketidakleluasaan untuk tabel `td_racik`
--
ALTER TABLE `td_racik`
  ADD CONSTRAINT `td_racik_ibfk_1` FOREIGN KEY (`fk_TH_racik`) REFERENCES `th_racik` (`kode`),
  ADD CONSTRAINT `td_racik_ibfk_2` FOREIGN KEY (`fk_produk`) REFERENCES `mh_produk` (`kode`);

--
-- Ketidakleluasaan untuk tabel `th_jual`
--
ALTER TABLE `th_jual`
  ADD CONSTRAINT `th_jual_ibfk_1` FOREIGN KEY (`fk_pelanggan`) REFERENCES `mh_pelanggan` (`kode`);

--
-- Ketidakleluasaan untuk tabel `th_racik`
--
ALTER TABLE `th_racik`
  ADD CONSTRAINT `th_racik_ibfk_1` FOREIGN KEY (`fk_pelanggan`) REFERENCES `mh_pelanggan` (`kode`);

--
-- Ketidakleluasaan untuk tabel `th_stok`
--
ALTER TABLE `th_stok`
  ADD CONSTRAINT `th_stok_ibfk_1` FOREIGN KEY (`fk_produk`) REFERENCES `mh_produk` (`kode`);
COMMIT;


-- --------------------------------------------------------

--
-- Struktur dari tabel `log_transaksi`
--

DROP TABLE IF EXISTS `log_transaksi`;
CREATE TABLE `log_transaksi` (
  `kode` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `kode_pelanggan` varchar(50) NOT NULL,
  `jenis_transaksi` varchar(100) NOT NULL,
  `nominal` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_transaksi`
--

INSERT INTO `log_transaksi` (`kode`, `tgl_transaksi`, `kode_pelanggan`, `jenis_transaksi`, `nominal`) VALUES
(1, '2021-05-04', 'PE_YY001', 'Upgrade', 10000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `log_transaksi`
--
ALTER TABLE `log_transaksi`
  ADD PRIMARY KEY (`kode`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `log_transaksi`
--
ALTER TABLE `log_transaksi`
  MODIFY `kode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
