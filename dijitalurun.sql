-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 29 Ara 2024, 18:38:24
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `dijitalurun`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL,
  `adminkadi` varchar(300) DEFAULT NULL,
  `adminposta` varchar(300) DEFAULT NULL,
  `adminsifre` varchar(300) DEFAULT NULL,
  `adminkodu` varchar(300) DEFAULT NULL,
  `adminekleyen` varchar(300) DEFAULT NULL,
  `admindurum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif',
  `ekleme` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 izinli 2 izin verilmedi',
  `duzenleme` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 izinli 2 izin verilmedi',
  `silme` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 izinli 2 izin verilmedi',
  `listeleme` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 izinli 2 izin verilmedi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`adminid`, `adminkadi`, `adminposta`, `adminsifre`, `adminkodu`, `adminekleyen`, `admindurum`, `ekleme`, `duzenleme`, `silme`, `listeleme`) VALUES
(12, 'admin', 'admin@gmail.com', 'adcd7048512e64b48da55b027577886ee5a36350', '677183d80f929', 'admin', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayarlar`
--

CREATE TABLE `ayarlar` (
  `id` int(11) NOT NULL,
  `site_baslik` varchar(300) DEFAULT NULL,
  `site_url` varchar(300) DEFAULT NULL,
  `site_admin_url` varchar(300) DEFAULT NULL,
  `site_logo` varchar(300) DEFAULT NULL,
  `site_favicon` varchar(300) DEFAULT NULL,
  `site_footer` text DEFAULT NULL,
  `site_gecerli_smtp` int(11) DEFAULT NULL,
  `site_gecerli_pos` int(11) DEFAULT NULL,
  `site_gecerli_sms` int(11) DEFAULT NULL,
  `smsbildirim` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif',
  `mailbildirim` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif',
  `adres` text DEFAULT NULL,
  `tel` varchar(300) DEFAULT NULL,
  `whatsapp` varchar(300) DEFAULT NULL,
  `mail` varchar(300) DEFAULT NULL,
  `sabitresim` varchar(300) DEFAULT NULL,
  `sabityazi1` text DEFAULT NULL,
  `sabityazi2` text DEFAULT NULL,
  `sidelogo` varchar(300) DEFAULT NULL,
  `footerlogo` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `ayarlar`
--

INSERT INTO `ayarlar` (`id`, `site_baslik`, `site_url`, `site_admin_url`, `site_logo`, `site_favicon`, `site_footer`, `site_gecerli_smtp`, `site_gecerli_pos`, `site_gecerli_sms`, `smsbildirim`, `mailbildirim`, `adres`, `tel`, `whatsapp`, `mail`, `sabitresim`, `sabityazi1`, `sabityazi2`, `sidelogo`, `footerlogo`) VALUES
(1, 'NexusEmporio Satış Sitesi', 'http://localhost/NexusEmporio2.0', 'http://localhost/NexusEmporio2.0/admin-panel', 'logo1.png', 'fav1.png', '©2024 CopyRight NexusEmporio |  Tüm Hakları Saklıdır.', 1, 2, 3, 1, 1, 'deneme adres deneme sokak deneme mahalle', '+90 05123 456 78 90', '+90 05123 456 78 90', 'nexusemporioofficiall@gmail.com', 'homebanner.png', '    <h2>NexusEmporio <br> <span> Mutlu Yıllarda Yeni Koleksiyonlarla</span></h2>', '<p>NexusEmporio, 2025\'e girerken yeni koleksiyonlarıyla tarzınızı yenilemeye davet ediyor. Şıklığı ve zarafeti bir arada keşfedin!</p>\n', 'sidelogo.png', 'footerlogo.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bankalar`
--

CREATE TABLE `bankalar` (
  `bankaid` int(11) NOT NULL,
  `bankaadi` varchar(300) DEFAULT NULL,
  `bankahesap` varchar(300) DEFAULT NULL,
  `bankasube` varchar(300) DEFAULT NULL,
  `bankaiban` varchar(300) DEFAULT NULL,
  `bankadurum` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `bankalar`
--

INSERT INTO `bankalar` (`bankaid`, `bankaadi`, `bankahesap`, `bankasube`, `bankaiban`, `bankadurum`) VALUES
(1, 'Garanti', '123', 'Balıkesir', 'TR 33 0006 1005 1978 6457 8413 2600', 1),
(2, 'İş Bankası', '123', 'Balıkesir', 'TR 44 0006 1005 1978 6457 8413 2600', 1),
(3, 'Ziraat Bankası', '123', 'Balıkesir', 'TR 23 0006 1005 1978 6457 8413 2600', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blog`
--

CREATE TABLE `blog` (
  `blogid` int(11) NOT NULL,
  `blogbaslik` varchar(500) NOT NULL,
  `blogsef` varchar(500) NOT NULL,
  `blogkisa` text DEFAULT NULL,
  `blogicerik` longtext NOT NULL,
  `blogresim` varchar(300) DEFAULT NULL,
  `blogdurum` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif',
  `blogtarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `blogekleyen` varchar(300) DEFAULT NULL,
  `bloggoruntulenme` int(11) NOT NULL DEFAULT 0,
  `blogickapak` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `blog`
--

INSERT INTO `blog` (`blogid`, `blogbaslik`, `blogsef`, `blogkisa`, `blogicerik`, `blogresim`, `blogdurum`, `blogtarih`, `blogekleyen`, `bloggoruntulenme`, `blogickapak`) VALUES
(1, 'Deneme Blog1', 'deneme-blog-1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>\n\n<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>\n\n<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>', '1.png', 1, '2024-12-16 13:21:54', 'admin', 2, '1.png'),
(2, 'Deneme Blog 2', 'deneme-blog-2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>\n\n<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>\n\n<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>', '1.png', 1, '2024-12-16 13:21:54', 'admin', 2, '1.png'),
(3, 'Deneme Blog 3', 'deneme-blog-3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>\n\n<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>\n\n<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>', '1.png', 1, '2024-12-16 13:21:54', 'admin', 2, '1.png'),
(4, 'Deneme Blog 4', 'deneme-blog-4', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>\n\n<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>\n\n<p>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n</p>', '1.png', 1, '2024-12-16 13:21:54', 'admin', 3, '1.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `katid` int(11) NOT NULL,
  `katadi` varchar(300) NOT NULL,
  `katsef` varchar(300) NOT NULL,
  `katkodu` varchar(300) NOT NULL,
  `kattarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `katdurum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif',
  `katekleyen` varchar(300) DEFAULT NULL,
  `katvitrin` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 vitrinde 2 listede'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`katid`, `katadi`, `katsef`, `katkodu`, `kattarih`, `katdurum`, `katekleyen`, `katvitrin`) VALUES
(1, 'Erkek', 'erkek', 'erkek', '2024-12-16 13:03:49', 1, 'admin', 1),
(2, 'Kadın', 'kadin', 'kadin', '2024-12-16 13:03:49', 1, 'admin', 1),
(3, 'Erkek Çocuk', 'erkek-cocuk', 'erkek-cocuk', '2024-12-16 13:03:49', 1, 'admin', 1),
(4, 'Kız Çocuk', 'kiz-cocuk', 'kiz-cocuk', '2024-12-16 13:03:49', 1, 'admin', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `loglar`
--

CREATE TABLE `loglar` (
  `lodid` int(11) NOT NULL,
  `logbaslik` varchar(300) DEFAULT NULL,
  `logaciklama` text DEFAULT NULL,
  `logekleyen` varchar(300) DEFAULT NULL,
  `logtarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `logtarihpanel` varchar(300) DEFAULT NULL,
  `logip` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `loglar`
--

INSERT INTO `loglar` (`lodid`, `logbaslik`, `logaciklama`, `logekleyen`, `logtarih`, `logtarihpanel`, `logip`) VALUES
(1, 'Üye Girişi', 'Üye girişi yapıldı', '676303223107d', '2024-12-18 17:16:00', '2024-12-18', '::1'),
(2, 'Üye Girişi', 'Üye girişi yapıldı', '676303223107d', '2024-12-18 17:20:34', '2024-12-18', '::1'),
(3, 'Üye Girişi', 'Üye girişi yapıldı', '676303223107d', '2024-12-18 17:24:06', '2024-12-18', '::1'),
(4, 'Üye Girişi', 'Üye girişi yapıldı', '676303223107d', '2024-12-18 17:30:23', '2024-12-18', '::1'),
(5, 'Üye Girişi', 'Üye girişi yapıldı', '676303223107d', '2024-12-18 20:54:47', '2024-12-18', '::1'),
(6, 'Üye Girişi', 'Üye girişi yapıldı', '676303223107d', '2024-12-18 23:04:04', '2024-12-18', '::1'),
(7, 'Üye Girişi', 'Üye girişi yapıldı', '676303223107d', '2024-12-19 12:05:34', '2024-12-19', '::1'),
(8, 'Üye Girişi', 'Üye girişi yapıldı', '676303223107d', '2024-12-19 12:21:45', '2024-12-19', '::1'),
(9, 'Üye Girişi', 'Üye girişi yapıldı', '67643f32cc9e7', '2024-12-19 16:54:25', '2024-12-19', '::1'),
(10, 'Üye Girişi', 'Üye girişi yapıldı', '676450babc806', '2024-12-19 16:59:22', '2024-12-19', '::1'),
(11, 'Çıkış', 'Kullanıcı çıkış yaptı', '676450babc806', '2024-12-19 17:27:18', '2024-12-19', '::1'),
(12, 'Üye Girişi', 'Üye girişi yapıldı', '676450babc806', '2024-12-19 17:28:45', '2024-12-19', '::1'),
(13, 'Üye Girişi', 'Üye girişi yapıldı', '676450babc806', '2024-12-19 17:30:22', '2024-12-19', '::1'),
(14, 'Üye Girişi', 'Üye girişi yapıldı', '6764511065815', '2024-12-19 17:31:32', '2024-12-19', '::1'),
(15, 'Üye Girişi', 'Üye girişi yapıldı', '676450babc806', '2024-12-19 17:34:49', '2024-12-19', '::1'),
(16, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-19 17:36:47', '2024-12-19', '::1'),
(17, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-19 17:37:40', '2024-12-19', '::1'),
(18, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-19 17:47:30', '2024-12-19', '::1'),
(19, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-19 17:50:12', '2024-12-19', '::1'),
(20, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-19 18:12:57', '2024-12-19', '::1'),
(21, 'Admin Girişi', 'Admin girişi yapıldı', '6764687ab805b', '2024-12-19 18:41:04', '2024-12-19', '::1'),
(22, 'Admin Girişi', 'Admin girişi yapıldı', '67646a31db3af', '2024-12-19 19:16:30', '2024-12-19', '::1'),
(23, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-19 20:48:31', '2024-12-19', '::1'),
(24, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-20 17:11:01', '2024-12-20', '::1'),
(25, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-20 18:04:23', '2024-12-20', '::1'),
(26, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-20 19:57:43', '2024-12-20', '::1'),
(27, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-20 20:04:19', '2024-12-20', '::1'),
(28, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-21 09:00:36', '2024-12-21', '::1'),
(29, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-22 02:53:05', '2024-12-22', '::1'),
(30, 'Üye Girişi', 'Üye girişi yapıldı', '6768098deb218', '2024-12-22 12:48:14', '2024-12-22', '::1'),
(31, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-22 12:48:41', '2024-12-22', '::1'),
(32, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-22 13:38:59', '2024-12-22', '::1'),
(33, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-22 17:19:56', '2024-12-22', '::1'),
(34, 'Admin Girişi', 'Admin girişi yapıldı', '67684b926c456', '2024-12-22 17:25:48', '2024-12-22', '::1'),
(35, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-24 15:11:33', '2024-12-24', '::1'),
(36, 'Üye Girişi', 'Üye girişi yapıldı', '6768098deb218', '2024-12-24 15:12:43', '2024-12-24', '::1'),
(37, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-29 11:09:12', '2024-12-29', '::1'),
(38, 'Üye Girişi', 'Üye girişi yapıldı', '6768098deb218', '2024-12-29 13:05:59', '2024-12-29', '::1'),
(39, 'Admin Girişi', 'Admin girişi yapıldı', '676450babc806', '2024-12-29 15:51:39', '2024-12-29', '::1'),
(40, 'Üye Girişi', 'Üye girişi yapıldı', '6768098deb218', '2024-12-29 16:39:21', '2024-12-29', '::1'),
(41, 'Üye Girişi', 'Üye girişi yapıldı', '6771835c9457f', '2024-12-29 17:15:27', '2024-12-29', '::1'),
(42, 'Admin Girişi', 'Admin girişi yapıldı', '677183d80f929', '2024-12-29 17:16:16', '2024-12-29', '::1'),
(43, 'Admin Girişi', 'Admin girişi yapıldı', '677183d80f929', '2024-12-29 17:17:39', '2024-12-29', '::1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mesajlar`
--

CREATE TABLE `mesajlar` (
  `mesajid` int(11) NOT NULL,
  `mesajisim` varchar(300) NOT NULL,
  `mesajikonu` varchar(300) DEFAULT NULL,
  `mesajmail` varchar(300) NOT NULL,
  `mesajicerik` text DEFAULT NULL,
  `mesajip` varchar(300) DEFAULT NULL,
  `mesajtarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `mesajdurum` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 okundu 2 okunmadı'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posfirmalari`
--

CREATE TABLE `posfirmalari` (
  `posid` int(11) NOT NULL,
  `posmerchantkey` varchar(300) DEFAULT NULL,
  `posmerchantsalt` varchar(300) DEFAULT NULL,
  `posmerchantid` varchar(300) DEFAULT NULL,
  `posadi` varchar(300) DEFAULT NULL,
  `possef` varchar(300) DEFAULT NULL,
  `ekleyen` varchar(300) DEFAULT NULL,
  `durum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif',
  `tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `basariliurl` varchar(300) DEFAULT NULL,
  `hataurl` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sayfalar`
--

CREATE TABLE `sayfalar` (
  `sayfaid` int(11) NOT NULL,
  `sayfaadi` varchar(300) DEFAULT NULL,
  `sayfasef` varchar(300) DEFAULT NULL,
  `sayfaicerik` longtext DEFAULT NULL,
  `sayfadurum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif',
  `sayfaekleyen` varchar(300) DEFAULT NULL,
  `sayfatarih` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sayfalar`
--

INSERT INTO `sayfalar` (`sayfaid`, `sayfaadi`, `sayfasef`, `sayfaicerik`, `sayfadurum`, `sayfaekleyen`, `sayfatarih`) VALUES
(1, 'Hakkımızda', 'hakkimizda', '<p>1988’de İstanbul Kuzguncuk’ta açılan 25 metrekarelik bir mağaza ile başlayan hikayemizi, bugün uluslararası bir moda perakende markası olarak devam ettiriyoruz. En güncel trendleri yansıtan koleksiyonlarımızla Türkiye’nin moda ve perakende öncüsüyüz. 1996 yılında Münih’te açtığımız ilk yurtdışı showroomumuz ardından 2002 yılında Ortadoğu, Rusya ve Balkanlarda mağaza açılışlarımızı gerçekleştirdik. Yurtiçinde 241, yurtdışında 192 olmak üzere toplam 433 mağazada, dünya genelinde ise 1000’den fazla toptan ve perakende satış noktasında faaliyetlerimizi sürdürüyoruz.</p>\r\n\r\n<p>Bugün online ve offline kanallarımızla birlikte Asya’dan Avrupa\'ya, Ortadoğu’dan Afrika\'ya, Amerikad\'an İngiltere\'ye dünya üzerinde 69 ülkeye NexusEmporio modasını ulaştırıyoruz. Master franchise ve toptan satış gibi farklı kanallarla satış ağımızı genişletmeye devam ediyoruz. Geniş ve yetenekli tasarım ekibimizle her yaşa ve tarza uyum sağlayabilecek çeşitlilikte oluşturduğumuz koleksiyonlarımızla kadın, erkek, çocuk, aksesuar, bebek gibi pek çok farklı kategoride en moda ve trend tasarımları mağazalarımızda ve NexusEmporio.com’da müşterilerimize sunuyoruz. Geniş ürün yelpazemiz ve yaratıcı, yenilikçi ve müşteri odaklı yaklaşımımızla global bir marka olarak moda ve perakende sektöründe hızla büyümeye devam ediyoruz. Attığımız her adımda müşteri memnuniyetini ön planda tutuyoruz. Müşterilerimizin alışverişlerini kolaylaştırmak, onların beğeni ve tercihlerine en iyi alışveriş deneyimini sunmak için Nisan 2023’te hayata geçirdiğimiz sadakat programımız NexusEmporio Club 2023 Eylül itibarıyla 2,5 milyon üyeye ulaştı.</p>\r\n\r\n<p>Sezon trendlerini özgün tasarımlarla buluştururken moda perakendesinde öncü uygulamalara imza atıyor, işimizi insan ve teknoloji odağında geliştirmek için büyük bir tutku ve heyecanla çalışıyoruz. Ödüllü Tasarım merkezimiz 83 kişilik kadrosuyla bugüne kadar 74 proje üretti, 7 üniversite ve moda okuluyla iş birliği gerçekleştirdi ve 46 patent aldı. NexusEmporio’da Dünyamıza, Topluma, İnsana ve İşimize saygı duyarak “Yaşama Saygı” önceliğiyle üretim ve tasarımlarımızı gerçekleştiriyoruz. Sürdürülebilirlik anlayışımız ve fırsat eşitliği yaratan politikalarımızla tüm paydaşlarımıza değer katma hedefiyle 35 yıldır müşterilerimizin hayatına tarz ve güzellik katmaya devam ediyoruz.</p>', 1, 'admin', '2024-12-16 14:38:52'),
(2, 'Misyon & Vizyon', 'misyon-vizyon', '<h3>Misyonumuz:</h3>\r\n<p>“İyi giyinmek herkesin hakkı” inancından hareketle \"müşterilerimizin ihtiyacına, tarzına, bütçesine uygun ürünleri kolay ve keyifli alışveriş yapacağı bir ortamda sunarak iyi hissettirmek\" tir.</p>\r\n\r\n<h3>Vizyonumuz:</h3>\r\n<p>\"Avrupa’nın en başarılı üç giyim perakendecisinden biri olmak” tır.</p>\r\n\r\n<p>Bu başarı EBITDA karlılık oranı; çalışan, müşteri, tedarikçi memnuniyeti, sosyal sorumluluk ve sürdürülebilirlik ilkelerini temel almaktadır.</p>\r\n\r\n<h3>Değerlerimiz</h3>\r\n<ul>\r\n    <li>Erdemli Olma</li>\r\n    <li>Birlikte Başarma</li>\r\n    <li>Derinlemesine Uzmanlaşma</li>\r\n    <li>Müşteri Odaklı Olma</li>\r\n    <li>Zorluklara Meydan Okuma</li>\r\n</ul>\r\n\r\n<h3>NexusEmporio Kalite Politikası</h3>\r\n<p>“İyi Giyinmek Herkesin Hakkı” felsefesiyle müşterinin tarzına ve bütçesine uygun, müşteri ihtiyaç ve beklentileri doğrultusunda ürünler tasarlayan, mevzuata ve ürün şartlarına uygun üretim yaptıran ve ürünleri müşterilerinin beğenisine sunarak satan, müşteri memnuniyetini her zaman odağında tutarak kendini ve paydaşlarını sürekli geliştiren, süreçlerini belirlediği hedefler ve prensipler doğrultusunda veri bilimi ve robotik proses otomasyon araçlarını kullanarak dijitalleştirerek iyileştiren, risk bakış açısıyla hep daha iyisini ve doğrusunu yapmayı hedefleyen, sektöründe lider ve örnek bir firma olmak.</p>\r\n\r\n<h3>NexusEmporio Ekoloji Politikası</h3>\r\n<p>NexusEmporio olarak, dünya kaynaklarının bir sonraki kuşaklara doğal olarak aktarımını sağlayacak şekilde üretim yapmayı ve ürünlerin sağlıklı koşullarda ve tüketicilerin insan sağlığına uygun bir şekilde üretilmesi için veriye dayalı, bilgi aktarımını esas alan, seviyeli şeffaflığı sağlamayı teyit ediyoruz.</p>\r\n\r\n<h4>Bu kapsamda taahhütlerimiz;</h4>\r\n<ul>\r\n    <li>NexusEmporio Çevre ve Ekolojik ürün politikamızı tüm tedarikçilerimiz, alt tedarikçilerimiz, çalışanlarımız ve müşterilerimizle paylaşmak, yaptığımız çalışma ve bilgilendirmeler ile toplum farkındalığına katkı sağlamak,</li>\r\n    <li>NexusEmporio değerlerini benimsemiş, şeffaf, ekolojik, çevre ve insan sağlığı kriterlerimize uyan tedarikçi ve üreticilerimizle yeni değer zinciri oluşturmak,</li>\r\n    <li>Yasalara uyarken aynı zamanda kendi çalışmalarımız ve standartlarımızca da ekolojiyi ve ürünlerimizi olumsuz etkileyeceğini belirlediğimiz konularda tedarikçilerimizin geliştirilebilir alanlarını tespit etmek ve sürekli iyileştirmenin sağlanmasına teşvik etmek,</li>\r\n    <li>Tüketicilerimize sunduğumuz ürünlerin insan sağlığına uygunluğu için gerekli testleri bilimsel risk analizleri çerçevesinde belirlenmiş örnekleme test sıklıkları ile yapmak ve uygunsuz (insan sağlığı için risk içeren) ürünleri tüketicilere sunmamak,</li>\r\n    <li>Kullandığımız kaynakların azaltılması yönünde iyileştirmeler yapmak, kullanılan kaynakların yerine yenisini katmak üzere tasarlanmış yeni iş modelleri oluşturmak.</li>\r\n</ul>\r\n\r\n<h4>Aksiyonlarımız;</h4>\r\n<ul>\r\n    <li>Ekolojik ürün ve çevre politikamızın anlaşılır olmasını sağlamak amacı ile benimsediğimiz ilkeleri tüm üretici ve tedarikçilerimize açık bir nokta kalmayacak şekilde anlatmak, konu ile ilgili gerekli eğitimlerin verilmesini sağlamak ve farkındalığı arttırmak,</li>\r\n    <li>Denetim mekanizmaları ile riskli tüm üretici ve tedarikçilerimizin yerinde denetimlerini gerçekleştirmek ve değer zinciri risk haritasını oluşturmak,</li>\r\n    <li>Kapsayıcı ve sistematik bir test modellemesiyle ürünlerin güvenliğinin devamını sağlamak,</li>\r\n    <li>Prosesler bazında su gibi doğal kaynakların ve enerji kaynaklarının (elektrik, doğalgaz) kullanımının kontrol altına alınarak takip edilebilir sistemler oluşturmasını ve daha etkin kullanılmasını sağlamak,</li>\r\n    <li>Sürecin başında hammaddelerin kontrollü kullanılmasını sağlayarak daha az atık oluşmasını, açığa çıkan atıklardan mümkün olabilecek geri kazanımlarını sağlamak, geri kazanımı mümkün olmayan atıkların ise uygun bir şekilde bertarafının sağlanarak temelde kirliliği azaltmak,</li>\r\n    <li>Karbon ve su ayak izimizi hesaplarken, öncelikle kimyasal ayak izimizi belirlemek ve iyileştirmek,</li>\r\n    <li>Kendi merkezlerimizden başlayarak karbon ve su ayak izimizi hesaplamak, mevcut durumu iyileştirmek ve faaliyetler düzenlemek,</li>\r\n    <li>Çevre ve insan sağlığını olumsuz etkileyebilecek hammaddelerin, risk analizleri doğrultusunda kaynağında azaltılmasını/kullanılmamasını sağlamak.</li>\r\n</ul>\r\n\r\n<h3>Sosyal Yardımlar Politikası</h3>\r\n<p>Şirketimiz sosyal sorumluluk politikası gereği başta yetimler olmak üzere ihtiyaç sahiplerini giydirmeyi ve onların eğitim hayatlarına katkı sağlamayı ana hedeflerinden bir olarak belirlemiştir. Bu hedef doğrultusunda her yıl net karının yüzde 15\'ini sosyal yardımlara ayırmaya ve bu yardımları da başta Valilik ve Kaymakamlıklara bağlı Sosyal Yardımlaşma Vakıfları ve Kızılay olmak üzere resmi ve bakanlıkça onaylı vakıflar aracılığı ile yapmaya karar vermiştir.</p>\r\n\r\n<h4>Yardımlarımızın detayı:</h4>\r\n<ul>\r\n    <li>2008’de 4.129 öğrenciye eğitim yardım desteği, 911.867 adet giyim yardımı</li>\r\n    <li>2009’da 6.162 öğrenciye eğitim yardım desteği, 2.244.231 adet giyim yardımı</li>\r\n    <li>2010’da 9.155 öğrenciye eğitim yardım desteği, 2.622.252 adet giyim yardımı</li>\r\n    <li>2011’de 8.123 öğrenciye eğitim yardım desteği, 3.796.466 adet giyim yardımı</li>\r\n    <li>2012’de 7.224 öğrenciye eğitim yardım desteği, 2.787.931 adet giyim yardımı</li>\r\n    <li>2013’te 8.180 öğrenciye eğitim yardım desteği, 4.528.870 adet giyim yardımı</li>\r\n    <li>2014’te 9.335 öğrenciye eğitim yardım desteği, 5.411.042 adet giyim yardımı</li>\r\n    <li>2015’te 10.177 öğrenciye eğitim yardım desteği, 5.709.948 adet giyim yardımı</li>\r\n    <li>2016’da 11.701 öğrenciye eğitim yardım desteği, 5.882.431 adet giyim yardımı</li>\r\n    <li>2017’de 13.691 öğrenciye eğitim yardım desteği, 8.783.732 adet giyim yardımı</li>\r\n    <li>2018’de 16.992 öğrenciye eğitim yardım desteği, 13.857.576 adet giyim yardımı</li>\r\n    <li>2019’da 15.867 öğrenciye eğitim yardım desteği, 4.290.180 adet giyim yardımı</li>\r\n    <li>2020’de 13.639 öğrenciye eğitim yardım desteği, 12.332.946 adet giyim yardımı</li>\r\n    <li>2021’de 14.196 öğrenciye eğitim yardım desteği, 12.282.549 adet giyim yardımı</li>\r\n    <li>2022’de 15.020 öğrenciye eğitim yardım desteği, 16.079.724 adet giyim yardımı</li>\r\n    <li>2023’de 14.433 öğrenciye eğitim yardım desteği, 18.774.055 adet giyim yardımı yapılmıştır.</li>\r\n</ul>\r\n\r\n<h3>İş Sağlığı ve Güvenliği Politikası</h3>\r\n<p>NexusEmporio Mağazacılık Hizmetleri Ticaret A.Ş. olarak; Çalışanlarımız, tedarikçilerimiz, müşterilerimiz ve ziyaretçilerimiz de dahil olmak üzere ilgili tüm paydaşlarımız için güvenli ve sağlıklı bir iş ortamı oluşturmaya yönelik çalışmaları yürütür, İSG mevzuatı ve diğer yükümlülüklerimizi yerine getiririz. Üst yönetimimizin liderliği, organizasyonumuzun her kademesinden çalışanlarımız ve diğer paydaşlarımızın katılımıyla iş sağlığı ve güvenliği uygulamalarını sürekli iyileştirmeyi ve İSG risklerini proaktif şekilde yöneterek işle ilgili tehlikeleri, yaralanmaları ve meslek hastalıklarını en aza indireceğimizi taahhüt ederiz.</p>\r\n\r\n<h3>NexusEmporio Bilgi Güvenliği Yönetim Sistemi Ve Kişisel Veri Yönetim Sistemi Politikası</h3>\r\n<p>Çalışanlarımızın, müşterilerimizin, tedarikçilerimizin ve kamuoyu nezdindeki itibar ve marka değerimiz ile ilgili şahısların kişisel verilerinin yasalara uygun şekilde korunması; Yasalara ve üçüncü taraflar (iş ortakları, müşteriler, tedarikçiler) ile yapılan sözleşmelere uyulması amacı doğrultusunda, bilgi varlıklarımızın “gizlilik”, “bütünlük” ve “kullanılabilirliğine” yönelik bilgi güvenliği ve kişisel veri risklerinin etkin bir şekilde yönetilerek, bilgi güvenliği yönetim sistemimizin ve kişisel veri yönetim sistemimizin sürekli iyileştirilmesini öngörür.</p>\r\n\r\n<h3>NexusEmporio ve Grup Şirketleri Rüşvetle Mücadele Politikası</h3>\r\n<p>NexusEmporio Mağazacılık Hizmetleri Ticaret A.Ş., Taha Giyim San. ve Tic. A.Ş. ve İsna Tekstil San. ve Tic. A.Ş. olarak çalışanlarımız, tedarikçilerimiz ve iş ortaklarımız dahil olmak üzere tüm paydaşlarımız rüşvete karşıdır. Rüşvetle ilişkili bir durumun söz konusu olması durumunda tüm taraflarla ilişkiler sonlandırılır. Şirketin kuruluşundan itibaren sahiplendiği etik ilkelere, değerlere ve ilgili mevzuatlara uygun biçimde rüşveti engellemeye yönelik uyum çalışmaları yürütülür. Üst yönetimin bağımsız biçimde gerçekleştirdiği gözden geçirmeleri ve yönetişim ile rüşvetle mücadele sisteminin sürekliliği ve iyileştirilmesi sağlanır. Rüşvetle Mücadele Sistemi gerekliliklerinin uygulanması konusunda Üst Yönetim’in liderliği ile organizasyonun her kademesindeki çalışan ve diğer paydaşların farkındalığı arttırılır. Şeffaflık, dürüstlük ve şirketimizin diğer etik ilke ve değerlerine aykırı davranılması halinde oluşabilecek şirket zararı ve itibar kayıplarının önüne geçebilmek için rüşvetin sıfırlanması hedefi doğrultusunda gerekli önlemleri almayı taahhüt ederiz.</p>\r\n\r\n<h3>Sosyal Uygunluk Politikamız</h3>\r\n<p>NexusEmporio olarak yasal ve gönüllük esasıyla benimsediğimiz yükümlülüklerimizi yerine getirmeye kararlıyız. Üretim sürecine dahil olan ticari faaliyetlerimizi iş ortaklarımız ile birlikte devam ettiriyor, insan ve çevre kaynağının sürdürülebilirliğini sağlamayı hedefliyoruz.</p>\r\n\r\n<p>Tedarik yaptığımız tüm ülkelerde, bu konuda özel eğitim almış denetçiler ve firmalar ile birlikte çalışıyoruz. Sadece denetim odaklı olarak değil, tedarikçilerimizi geliştirip birlikte büyümek için onlara danışmanlık yapıyor ve eğitimler düzenliyoruz.</p>\r\n\r\n<p>Faaliyet göstermekte olduğumuz ve olacağımız her yerde temel önceliğimizi “insana ve çevreye saygı” olarak belirliyoruz. Paylaşılmayan hiçbir değerin ya da bilginin katma değer sağlamayacağını düşünüyoruz ve kuruluşumuzdan beri süregelen değerlerimiz doğrultusunda tüm zorluklara meydan okuyarak birlikte başaracağımıza inanıyoruz.</p>\r\n\r\n<h3>NexusEmporio Enerji Politikası</h3>\r\n<p>NexusEmporio olarak, dünya kaynaklarının bir sonraki kuşaklara doğal olarak aktarımını sağlayacak şekilde faaliyetlerimizi gerçekleştirerek enerjiyi etkin kullanacağımızı, Enerji Yönetim Sistemimizi ve Enerji Performansımızı sürekli iyileştireceğimizi taahhüt etmekteyiz.</p>\r\n\r\n<h4>Bu kapsamda taahhütlerimiz;</h4>\r\n<ul>\r\n    <li>Enerji amaçları ve hedeflerine ulaşmak için bilgilerin ve gerekli kaynakların kullanılabilirliği sağlamak,</li>\r\n    <li>Enerji kullanımına, verimliliğine ve tüketimine ilişkin tüm uygulanabilir yasal mevzuat ve diğer şartlara uymak,</li>\r\n    <li>Çalışanlarımızda verimlilik bilincini oluşturmak için gerekli faaliyetleri gerçekleştirmek,</li>\r\n    <li>Enerji performansını etkileyen, enerji bakımından verimli ürün ve hizmetlerin tedarik edilmesini desteklemek,</li>\r\n    <li>Enerji performansının iyileştirilmesini dikkate alan tasarım faaliyetlerini desteklemektir.</li>\r\n</ul>\r\n\r\n<p>Oluşturulan sistemin sürekliliğini sağlamak için Enerji Politikası kayıt altına alınarak sürekli gözden geçirilecek ve gerektiğinde güncellenecektir.</p>', 1, 'admin', '2024-12-16 14:38:52'),
(3, 'Gizlilik Sözleşmesi', 'gizlilik-sozlesmesi', '<p>NexusEmporio Mağazacılık Tekstil ve Ticaret A.Ş. olarak bilgi güvenliği politikamız dahilinde;</p>\r\n\r\n<ul>\r\n    <li>Bilgi varlıklarını yönetmeyi, varlıkların güvenlik değerlerini, ihtiyaçlarını ve risklerini belirlemeyi, güvenlik risklerine yönelik kontrolleri geliştirmeyi ve uygulamayı,</li>\r\n    <li>Bilgi varlıkları, değerleri, güvenlik ihtiyaçları, zafiyetleri, varlıklara yönelik tehditlerin, tehditlerin sıklıklarının saptanması için yöntemlerin belirleyeceği çerçeveyi tanımlamayı,</li>\r\n    <li>Tehditlerin varlıklar üzerindeki gizlilik, bütünlük, erişilebilirlik etkilerini değerlendirmeye yönelik bir çerçeveyi tanımlamayı,</li>\r\n    <li>Risklerin işlenmesi için çalışma esaslarını ortaya koymayı,</li>\r\n    <li>Hizmet verilen kapsam bağlamında teknolojik beklentileri gözden geçirerek riskleri sürekli takip etmeyi,</li>\r\n    <li>Tabi olduğu ulusal veya uluslararası düzenlemelerden, yasal ve ilgili mevzuat gereklerini yerine getirmekten, anlaşmalardan doğan yükümlülüklerini karşılamaktan, iç ve dış paydaşlara yönelik kurumsal sorumluluklarından kaynaklanan bilgi güvenliği gereksinimlerini sağlamayı,</li>\r\n    <li>Hizmet sürekliliğine yönelik bilgi güvenliği tehditlerinin etkisini azaltmayı ve sürekliliğe katkıda bulunmayı,</li>\r\n    <li>Gerçekleşebilecek bilgi güvenliği olaylarına hızla müdahale edebilecek ve olayın etkisini minimize edecek yetkinliğe sahip olmayı,</li>\r\n    <li>Maliyet etkin bir kontrol altyapısı ile bilgi güvenliği seviyesini zaman içinde korumayı ve iyileştirmeyi,</li>\r\n    <li>Kurum itibarını geliştirmeyi, bilgi güvenliği temelli olumsuz etkilerden korumayı,</li>\r\n    <li>Bilgi Güvenliği Yönetim Sisteminin sürekliliğini sağlamayı,</li>\r\n    <li>Bilgi Güvenliği Yönetim Sistemini uluslararası standardına uygun olarak sürekli iyileştirmeyi,</li>\r\n    <li>6698 sayılı Kişisel Verilerin Korunması Kanunu (KVKK) ve ilgili diğer mevzuat kapsamında çalışanlara, stajyerlere, ziyaretçilere, tedarikçilere ve ilgili diğer 3. taraflara ait kişisel bilgilerin işlenmesi, korunması ve imhası konusunda tüm sorumlulukları karşılamayı, taahhüt ederiz.</li>\r\n</ul>', 1, 'admin', '2024-12-16 14:38:52'),
(4, 'Mesafeli Satış Sözleşmesi', 'mesafeli-satis-sozlesmesi', '<h2>Mesafeli Satış Sözleşmesi</h2>\r\n\r\n    <h3>Madde 1 – Sözleşmenin Tarafları</h3>\r\n    <p>Bu Mesafeli Satış Sözleşmesi (\"Sözleşme\"), aşağıda belirtilen taraflar arasında yapılmıştır:</p>\r\n    <ul>\r\n        <li><strong>Satıcı:</strong> NexusEmporio</li>\r\n        <li><strong>Adres:</strong> http://localhost/NexusEmporio2.0</li>\r\n        <li><strong>E-posta:</strong> destek@nexusemporio.com</li>\r\n        <li><strong>Telefon:</strong> 0(555) 123 45 67</li>\r\n    </ul>\r\n\r\n    <h3>Madde 2 – Sözleşmenin Konusu</h3>\r\n    <p>Bu Sözleşme, Satıcı\'nın Alicı\'ya NexusEmporio web sitesi üzerinden satışını yaptığı ürünlerin satışı ve teslimine ilişkin olarak düzenlenmiştir.</p>\r\n\r\n    <h3>Madde 3 – Sözleşme Konusunda Tarafların Hak ve Yükümlülükleri</h3>\r\n    <p>- Satıcı:</p>\r\n    <ul>\r\n        <li>Alicı\'ya sunulan ürünlerin açıklamalarını ve görsellerini doğru şekilde sunar.</li>\r\n        <li>Alicı tarafından satın alınan ürünlerin eksiksiz ve hasarsız olarak teslimini sağlar.</li>\r\n        <li>Mesafeli satış sözleşmesinde belirtilen bilgilendirmeleri Alicı\'ya sunar.</li>\r\n    </ul>\r\n    <p>- Alicı:</p>\r\n    <ul>\r\n        <li>Satın alacağı ürünleri belirlenen süre içinde ve ödeme koşulları çerçevesinde öder.</li>\r\n        <li>Teslimat adresinde belirtilen adreste teslimatı kabul eder.</li>\r\n    </ul>\r\n\r\n    <h3>Madde 4 – Teslimat ve Fiyat</h3>\r\n    <p>- Ürünler, siparişin onaylandığı tarihten itibaren belirtilen sürede Alicı\'ya teslim edilir.</p>\r\n    <p>- Teslimat süresi, ürünün stok durumu ve tedarik sürecine bağlı olarak değişebilir.</p>\r\n\r\n    <h3>Madde 5 – Cayma Hakkı</h3>\r\n    <p>- Alicı, satın aldığı ürünleri teslim aldıktan itibaren 14 gün içinde iade etme hakkına sahiptir.</p>\r\n    <p>- İade talebi, Satıcı\'ya bildirildikten sonra ürün, kargo firması aracılığıyla belirtilen adrese gönderilir.</p>\r\n\r\n    <h3>Madde 6 – Uygulama ve Yargı</h3>\r\n    <p>Bu Sözleşme, Türkiye Cumhuriyeti kanunlarına tabidir. Taraflar arasında çıkacak herhangi bir ihtilaf halinde İstanbul Mahkemeleri ve İcra Daireleri yetkilidir.</p>\r\n\r\n    <h3>Madde 7 – Yürürlük</h3>\r\n    <p>Bu Sözleşme, Alicı\'nın NexusEmporio web sitesi üzerinden sipariş oluşturması ile yürürlüğe girer.</p>', 1, 'admin', '2024-12-16 14:38:52'),
(5, 'İade Politikası', 'iade-politikasi', '<h2>NexusEmporio İade Politikası</h2>\r\n\r\n    <h3>1. Genel Bilgiler</h3>\r\n    <p>NexusEmporio olarak, müşteri memnuniyetini ön planda tutmak bizim için önemlidir. Satın aldığınız ürünlerin kalitesinden memnun kalmanız bizim için değerlidir. Ancak, çeşitli nedenlerle ürünlerin iade edilmesi gerekebilir. Aşağıda, ürün iade sürecine dair detaylı bir politika sunulmuştur.</p>\r\n\r\n    <h3>2. Cayma Hakkı</h3>\r\n    <p>Tüketici Kanunu’nun ilgili maddeleri uyarınca, aldığınız ürünleri teslim aldığınız tarihten itibaren 14 gün içinde herhangi bir gerekçe göstermeksizin iade etme hakkına sahipsiniz. İade süreci hakkında detaylı bilgi için lütfen aşağıdaki adımları dikkatlice okuyunuz.</p>\r\n\r\n    <h3>3. İade Şartları</h3>\r\n    <ul>\r\n        <li>Ürünler, kullanılmamış, orijinal ambalajında ve etiketleri ile birlikte iade edilmelidir.</li>\r\n        <li>Ürünler, kargo hasarı veya yıpranma olmadan teslim edilmelidir.</li>\r\n        <li>İade süreci yalnızca ilgili ürünlerin orijinal kutusu veya ambalajıyla yapılmalıdır.</li>\r\n    </ul>\r\n\r\n    <h3>4. İade Prosedürü</h3>\r\n    <p>- İade işlemi için <a href=\"mailto:destek@nexusemporio.com\">destek@nexusemporio.com</a> adresinden veya web sitemizdeki İade Talebi Formu aracılığıyla bize ulaşabilirsiniz.</p>\r\n    <p>- İade talebinizin işleme alınabilmesi için fatura ve/veya sipariş numarasının sağlanması gerekmektedir.</p>\r\n    <p>- Talebiniz incelendikten sonra, iade işleminiz için gerekli adımlar tarafınıza bildirilecektir.</p>\r\n\r\n    <h3>5. İade Süreci</h3>\r\n    <p>- İade talebiniz onaylandıktan sonra, ürün belirttiğiniz adrese geri gönderilir.</p>\r\n    <p>- Ürün teslim alındığında, tarafımızca kontrol edilir ve iade koşullarına uygunluğu değerlendirilir.</p>\r\n    <p>- İade işleminiz onaylandıktan sonra, ödemeniz 14 gün içinde gerçekleştirilecektir.</p>\r\n\r\n    <h3>6. İade Ücretleri</h3>\r\n    <p>- İade süreçleri müşteri tarafından karşılanabilir. Teslimat veya iade işlemleri sırasında meydana gelen kargo masrafları, ürünün türüne ve müşteri ile yapılan anlaşmaya bağlı olarak değişkenlik gösterebilir.</p>\r\n\r\n    <h3>7. İade Kabul Edilmeyen Durumlar</h3>\r\n    <p>Aşağıda belirtilen durumlarda iade kabul edilmeyecektir:</p>\r\n    <ul>\r\n        <li>Ürünlerin kullanılmış olması veya hasar görmüş olması.</li>\r\n        <li>İade süresi dolmuş ürünlerin iade edilmesi.</li>\r\n        <li>Orijinal ambalaj ve etiketi bulunmayan ürünlerin iadesi.</li>\r\n    </ul>\r\n\r\n    <h3>8. İptal ve Değişim</h3>\r\n    <p>- Sipariş iptalleri ve değişiklikler, ürünün kargoya teslim edilmeden önce talep edilmelidir.</p>\r\n    <p>- Kargoya teslim edilen ürünlerde değişim veya iptal talepleri iade süreci kapsamında değerlendirilecektir.</p>\r\n\r\n    <h3>9. İade Koşullarında Değişiklikler</h3>\r\n    <p>Bu politika, NexusEmporio tarafından herhangi bir zamanda değiştirilebilir. Değişiklikler, web sitemizde veya tarafınıza e-posta yoluyla bildirilecektir.</p>\r\n\r\n    <h3>10. Sorular ve Bilgi</h3>\r\n    <p>Daha fazla bilgi için <a href=\"mailto:destek@nexusemporio.com\">destek@nexusemporio.com</a> adresinden veya müşteri hizmetleri numarasından bize ulaşabilirsiniz.</p>', 1, 'admin', '2024-12-16 14:38:52');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `sipid` int(11) NOT NULL,
  `sipno` varchar(300) DEFAULT NULL,
  `sipuye` varchar(300) DEFAULT NULL,
  `sipurun` varchar(300) DEFAULT NULL,
  `siptutar` double(15,2) DEFAULT NULL,
  `siptarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `siptarihs` varchar(300) DEFAULT NULL,
  `sipmusterinot` text DEFAULT NULL,
  `sipdurum` varchar(300) DEFAULT NULL,
  `odemedurum` tinyint(1) NOT NULL DEFAULT 2 COMMENT 'kredi kartı ödemeleri için kontrol',
  `sipodemekodu` varchar(300) DEFAULT NULL,
  `siparissonrasi` text DEFAULT NULL,
  `odemeaciklama` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `smsfirmalari`
--

CREATE TABLE `smsfirmalari` (
  `smsid` int(11) NOT NULL,
  `smsfirma` varchar(300) DEFAULT NULL,
  `smsfirmasef` varchar(300) DEFAULT NULL,
  `smsbaslik` varchar(300) DEFAULT NULL,
  `smskadi` varchar(300) DEFAULT NULL,
  `smsikincibaslik` varchar(300) DEFAULT NULL,
  `smssifre` varchar(300) DEFAULT NULL,
  `smsdurum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif',
  `smstarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `smsekleyen` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `smtpbilgileri`
--

CREATE TABLE `smtpbilgileri` (
  `smtp_id` int(11) NOT NULL,
  `smtp_mail` varchar(300) DEFAULT NULL,
  `smtp_sec` varchar(300) DEFAULT NULL,
  `smtp_port` varchar(300) DEFAULT NULL,
  `smtp_host` varchar(300) DEFAULT NULL,
  `smtp_sifre` varchar(300) DEFAULT NULL,
  `smtp_ekleyen` varchar(300) DEFAULT NULL,
  `smtp_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `smtp_durum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `smtpbilgileri`
--

INSERT INTO `smtpbilgileri` (`smtp_id`, `smtp_mail`, `smtp_sec`, `smtp_port`, `smtp_host`, `smtp_sifre`, `smtp_ekleyen`, `smtp_tarih`, `smtp_durum`) VALUES
(2, 'alikaplanofficiall@gmail.com', 'ssl', '465', 'ssl://smtp.gmail.com', 'iafv raeq fxsr vyzr', 'admin', '2024-12-18 20:02:42', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sosyalmedyalar`
--

CREATE TABLE `sosyalmedyalar` (
  `sosid` int(11) NOT NULL,
  `sosikon` varchar(300) DEFAULT NULL,
  `sosbaslik` varchar(300) DEFAULT NULL,
  `soslink` varchar(300) DEFAULT NULL,
  `sostarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `sosekleyen` varchar(300) DEFAULT NULL,
  `sosdurum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sosyalmedyalar`
--

INSERT INTO `sosyalmedyalar` (`sosid`, `sosikon`, `sosbaslik`, `soslink`, `sostarih`, `sosekleyen`, `sosdurum`) VALUES
(1, '<i class=\"fab fa-facebook-f\" aria-hidden=\"true\"></i>', 'Facebook', 'https://www.facebook.com/', '2024-12-16 14:29:01', 'admin', 1),
(2, '<i class=\"fab fa-twitter\" aria-hidden=\"true\"></i>', 'X', 'https://x.com/', '2024-12-16 14:30:00', 'admin', 1),
(3, '<i class=\"fab fa-google-plus-g\" aria-hidden=\"true\"></i>', 'Google', 'https://www.google.com.tr/', '2024-12-16 14:31:11', 'admin', 1),
(4, '<i class=\"fab fa-instagram\" aria-hidden=\"true\"></i>', 'İnstagram', 'https://instagram.com/', '2024-12-16 14:32:31', 'admin', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `urun_id` int(11) NOT NULL,
  `urun_adi` varchar(300) DEFAULT NULL,
  `urun_sef` varchar(300) DEFAULT NULL,
  `urun_resim` varchar(300) DEFAULT NULL,
  `urun_fiyat` double(15,2) DEFAULT NULL,
  `urun_stok` int(11) NOT NULL DEFAULT 1,
  `urun_kdv` tinyint(4) NOT NULL DEFAULT 20 COMMENT '1 8 18 20 gibi oranlar',
  `urun_kodu` varchar(300) DEFAULT NULL,
  `urun_kategori` varchar(300) DEFAULT NULL,
  `urun_demo` text DEFAULT NULL,
  `urun_yonetimdemo` text DEFAULT NULL,
  `urun_demokadi` varchar(300) DEFAULT NULL,
  `urun_demosifre` varchar(300) DEFAULT NULL,
  `urun_demoyonetimkadi` varchar(300) DEFAULT NULL,
  `urun_demoyonetimsifre` varchar(300) DEFAULT NULL,
  `urun_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `urun_durum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 2 pasif',
  `urun_kisa` text DEFAULT NULL,
  `urun_icerik` longtext DEFAULT NULL,
  `urun_ekleyen` varchar(300) DEFAULT NULL,
  `urun_indirmelink` text DEFAULT NULL,
  `urun_vitrin` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 vitrin 2 liste',
  `urun_goruntulenme` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`urun_id`, `urun_adi`, `urun_sef`, `urun_resim`, `urun_fiyat`, `urun_stok`, `urun_kdv`, `urun_kodu`, `urun_kategori`, `urun_demo`, `urun_yonetimdemo`, `urun_demokadi`, `urun_demosifre`, `urun_demoyonetimkadi`, `urun_demoyonetimsifre`, `urun_tarih`, `urun_durum`, `urun_kisa`, `urun_icerik`, `urun_ekleyen`, `urun_indirmelink`, `urun_vitrin`, `urun_goruntulenme`) VALUES
(1, 'Gri Ceket Yaka Desenli Kadın Kaşe Kaban', 'gri-ceket-yaka-desenli-kadin-kase-kaban', 'kadin_kaban.png', 1800.00, 10, 20, '1', 'kadin', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Sıcak tutan kaşe kaban.', 'Ceket yaka kaşe kaban, eşyalarını taşıyabilmen için cep detaylıdır. Önden düğme kapama detayı ile soğuk havalarda seni sıcacık tutar.', 'admin', NULL, 1, 3),
(2, 'Kırmızı Bisiklet Yaka Yılbaşı Temalı Kadın Pijama Takımı', 'kirmizi-bisiklet-yaka-yilbasi-temali-pijama-takimi', 'kadin_gecelik.png', 900.00, 10, 20, '2', 'kadin', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Rahat ve desenli pijama takımı', 'Bisiklet yaka pijama üstü ve beli lastikli pijama altından oluşan 2\'li pijama takımı, polar kumaştan üretilmiştir. Soğuk havalarda sıcak tutan yumuşacık kumaşı sayesinde rahat bir uyku deneyimi sunar. Yılbaşı temasıyla eğlenceli bir görünüm sunar.', 'admin', NULL, 1, 3),
(3, 'Gri Dar Fit Kadın Pantolon', 'gri-dar-fit-kadin-pantolon', 'kadin_pantolon.png', 800.00, 10, 20, '3', 'kadin', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Şık ve konforlu rahat giyim kadın pantolonu', 'Dar kesimiyle vücuda oturan kadın pantolon, şık ve modern bir görünüm sağlar. Esnek ve kaliteli kumaşıyla konforlu bir kullanım sunar.', 'admin', NULL, 1, 3),
(4, 'Siyah Deri Görünümlü Kadın Topuklu Ayakkabı', 'siyah-deri-gorunumlu-kadin-topuklu-ayakkabi', 'kadin_topuklu.png', 1300.00, 10, 20, '4', 'kadin', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Koku yapmaz, havadar yapısıyla kışın vazgeçilmezi.', 'Şıklığı ve zarafeti bir araya getiren ve her türlü özel etkinlik veya günlük giyim için mükemmel olanak sunar. Yanındaki fermuar yapısı sayesinde hızlı giyme avantajı sağlar.', 'admin', NULL, 1, 3),
(5, 'Bej Pelüş Kadın Ev Terliği', 'bej-pelus-kadin-ev-terligi', 'kadin_terlik.png', 600.00, 10, 20, '5', 'kadin', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Düz tasarım, rahat, sıcak tutan kadın ev terliği.', 'Ev terliği yuvarlak burunlu ve düz bir tasarıma sahiptir. Pelüş malzemesi, ayakları rahat ettirirken aynı zamanda sıcak tutar. Hafif tabanı sayesinde evde rahatça hareket edebilirsiniz.', 'admin', NULL, 1, 3),
(6, 'Yeşil Bisiklet Yaka Puantiyeli Kadın Tişört', 'yesil-bisiklet-yaka-puantiyeli-kadi-tisort', 'kadin_tisort.png', 360.00, 10, 20, '6', 'kadin', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Şık, hafif ve günlük kullanıma uygun bisiklet yaka kadın tişörtü.', 'Bisiklet yaka puantiyeli tişört, dar kalıba sahiptir ve penye kumaştan üretilmiştir. Bu sayede vücuda tam oturarak mükemmel bir uyum ve şık bir görünüm sunar. Orta kalınlıkta ki kumaş yapısı, mevsim geçişlerinde ekstra konfor ve sıcaklık sağlar.', 'admin', NULL, 1, 4),
(7, 'Kahverengi Standart Kalıp Ceket Yaka Erkek Kaşe Kaban', 'kahverengi-standart-kalip-ceket-yaka-erkek-kase-kaban', 'erkek_kaban.png', 1800.00, 10, 20, '7', 'erkek', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Kaşe kumaşı ile soğuk havalarda terletmeyen, sıcak tutucu erkek kaban.', 'Kaşe kumaştan üretilen bu kaban, kalın yapısıyla sıcaklık ve dayanıklılık sunar. Düğme kapamalı tasarımı, hem kolay kullanım sağlar hem de kabanın klasik bir estetiğe sahip olmasını garantiler.', 'admin', NULL, 1, 4),
(8, 'Kahverengi Standart Kalıp Erkek Pijama Takımı', 'kahverengi-standart-kalip-erkek-pijama-takimi', 'erkek_gecelik.png', 1000.00, 10, 20, '8', 'erkek', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Sıcaklık ve yumuşaklık sunan evde rahatça giymelik erkek pijama takımı.', 'Sıcaklık ve yumuşaklık sunan flanel kumaştan üretilmiştir. Beli lastikli ve ayarlanabilir ipli özelliği sayesinde mükemmel bir oturuş sağlar. Hem rahat bir gece uykusu için hem de evde keyifli zaman geçirmek için ideal bir seçenektir.', 'admin', NULL, 1, 4),
(9, 'Haki Standart Kalıp Gabardin Erkek Kargo Pantolon', 'haki-standart-kalip-gabardin-erkek-kargo-pantolon', 'erkek_pantolon.png', 900.00, 10, 20, '9', 'erkek', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Gabardin kumaştan hem şık hemde kullanışlı yüksek kalite erkek kargo pantolon.', 'Gabardin kumaştan üretilen kargo pantolon, beli lastikli bağlama detayıyla rahat bir kullanım sunar. Hem şık hem de kullanışlı olan bu pantolon, yüksek kaliteli malzemesiyle uzun ömürlüdür. Tarzınıza pratik bir dokunuş ekleyin.', 'admin', NULL, 1, 3),
(10, 'Siyah Deri Görünümlü Fermuarlı Erkek Bot', 'siyah-deri-gorunumlu-fermuarli-erkek-bot', 'erkek_bot.png', 1000.00, 10, 20, '10', 'erkek', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Yüksek tabanlı, sıcak tutan, su geçirmez erkek bot.', 'Bağcık ve fermuarlı tasarımı ile kolay giyme imkanı sağlayan botumuz içi sıcak tutan yapıya sahiptir.', 'admin', NULL, 1, 3),
(11, 'Kahverengi Erkek Ev Ayakkabısı', 'kahverengi-erkek-ev-ayakkabisi', 'erkek_terlik.png', 450.00, 10, 20, '11', 'erkek', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Düz tasarım, rahat, sıcak tutan erkek ev terliği.', 'İçi yünlü ev ayakkabısı, ayakları sıcak ve rahat tutmak için mükemmel bir seçenektir. Rahat tabanı sayesinde gün boyu konforu ayağınıza getirir.', 'admin', NULL, 1, 3),
(12, 'Beyaz Bisiklet Yaka Kısa Kollu Nostaljik Baskılı Erkek Tişört', 'beyaz-bisiklet-yaka-kisa-kollu-nostaljik-baskili-erkek-tisort', 'erkek_tisort.png', 250.00, 10, 20, '12', 'erkek', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Şık, hafif ve günlük kullanıma uygun bisiklet yaka erkek tişörtü.', '%100 pamuklu penye kumaşı sayesinde yaz aylarında rahat bir kullanım sağlıyor. Baskılı tasarımı sırt kısmında yer alarak farklı bir tarz sunuyor. Hem günlük hayatta hem de özel günlerde kullanabileceğiniz bir parça.', 'admin', NULL, 1, 4),
(13, 'Siyah Kapüşonlu Erkek Çocuk Kaban', 'siyah-kapusonlu-erkek-cocuk-kaban', 'ecocu_mont.png', 1300.00, 10, 20, '13', 'erkek-cocuk', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Soğuk havada minik yavruları sıcak tutan erkek çocuğu kaban.', 'Soğuk havalarda sıcak tutan polar astarlı yapısı, fermuar kapamalı ve sabit kapüşonu sayesinde çocuklarınıza koruyucu bir özellik sunar. Ayrıca su itici ve rüzgar geçirmez kumaştan yapılmış olması, dış etkenlerden korunmayı sağlar.', 'admin', NULL, 1, 5),
(14, 'Lacivert Bisiklet Yaka Erkek Çocuk Pijama Takımı', 'lacivert-bisiklet-yaka-erkek-cocuk-pijama-takimi', 'ecocu_gecelik.png', 500.00, 10, 20, '14', 'erkek-cocuk', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Sıcaklık ve yumuşaklık sunan evde rahatça giymelik erkek çocuk pijama takımı.', 'Rahatlık ve tarzı bir arada sunan erkek çocuk pijama takımı pamuklu penye kumaştan üretilmiştir. Paçaları ribanalı tasarımı, rahat bir oturuş sağlar. Baskılı tasarımıyla çocuğunuzun keyifle uyuyacağı bir seçenek.', 'admin', NULL, 1, 6),
(15, 'Bej Beli Lastikli Basic Erkek Çocuk Pantolon', 'bej-beli-lastikli-basic-erkek-cocuk-pantolon', 'ecocu_pantolon.png', 500.00, 10, 20, '15', 'erkek-cocuk', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Lastikli bel yapısı ile rahatlık sunan erkek çocuğu pantolon.', 'Beli lastikli basic erkek bebek pantolon, kolay giydirilip çıkarılabilir tasarımıyla pratiklik sunar. Rahat kesimi, bebeğinizin gün boyu özgürce hareket etmesine olanak tanır.', 'admin', NULL, 1, 7),
(16, 'Siyah Erkek Çocuk Outdoor Bot', 'siyah-erkek-cocuk-outdoor-bot', 'ecocu_bot.png', 900.00, 10, 20, '16', 'erkek-cocuk', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Sıcak tutan yapısı ve su geçirmezliği ile bilinen erkek çocuğu bot tarzı.', 'Siyah renk tasarımı ve sağlam yapısıyla dikkat çeken bot, şık bir görünüm sunarken dayanıklı yapısı sayesinde uzun süre kullanım imkanı sağlar. İçi sıcak tutan malzemeden üretilen bot, soğuk havalarda ayaklarınızı korur.', 'admin', NULL, 1, 7),
(17, 'Lila Kapüşonlu Kız Çocuk Mont', 'lila-kapusonlu-kiz-cocuk-mont', 'kizmont.png', 1300.00, 10, 20, '17', 'kiz-cocuk', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Sıcak tutan yapısı ve su geçirmez kötü hava şartleına dayanıklı kız çocuğu montu.', 'Çıkarılabilir kol detayı sayesinde yelek olarak da kullanılabilen mont, taffeta astarıyla hafifliği ve rahatlığı bir arada sunar. Kapüşonlu tasarımıyla her türlü hava koşuluna uyum sağlar ve pratik kullanım imkanı sunar.', 'admin', NULL, 1, 7),
(18, ' Lacivert Kız Çocuk Uzun Kollu %100 Pamuklu Düğmeli Pijama Takımı Lovely', 'lacivert-kiz-cocuk-uzun-kollu', 'kizpijama.png', 1300.00, 10, 20, '18', 'kiz-cocuk', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Şık , hafif ve uykuda terleme yapmayan dayanıklı kumaşıyla kalpli kız pijama takımımız.', 'LOVELY KIZ DÜĞMELİ PİJAMA', 'admin', NULL, 1, 8),
(19, 'Lacivert Bisiklet Yaka Yılbaşı Temalı Kız Çocuk Triko Kazak', 'kiz-cocuk-triko-kazak', 'kiztriko.png', 500.00, 10, 20, '19', 'kiz-cocuk', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Kaşıntı yapmaz , sıcak tutucu şık triko.', 'Yılbaşı temalı bisiklet yaka triko kazak, kış mevsiminin coşkusunu ve neşesini yansıtır. Hem sıcacık, hem de eğlenceli tasarımıyla yılbaşı ruhunu çocukların üzerinde taşır. Soğuk günlerin en sevimli ve konforlu parçası olacak.', 'admin', NULL, 1, 10),
(20, 'Lila Kız Çocuk Worker Bot', 'lila-kiz-cocuk-worker-bot', 'kizayakkabi.png', 900.00, 10, 20, '20', 'kiz-cocuk', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:41:28', 1, 'Koku yapmaz su geçirmeyen kız botu.', 'Lila Kız Çocuk Worker Bot.', 'admin', NULL, 1, 11);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunozellikler`
--

CREATE TABLE `urunozellikler` (
  `ozid` int(11) NOT NULL,
  `ozurun` varchar(300) DEFAULT NULL,
  `ozbaslik` varchar(300) DEFAULT NULL,
  `ozicerik` text DEFAULT NULL,
  `oztarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `ozekleyen` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `urunozellikler`
--

INSERT INTO `urunozellikler` (`ozid`, `ozurun`, `ozbaslik`, `ozicerik`, `oztarih`, `ozekleyen`) VALUES
(1, '1', 'Beden', 'L', '2024-12-16 22:53:06', 'admin'),
(2, '1', 'Astar', '%100 Polyester', '2024-12-16 22:53:06', 'admin'),
(3, '1', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(4, '1', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(7, '1', 'Ürün Tipi', 'Kaşe Kaban', '2024-12-28 22:35:18', NULL),
(8, '1', 'Cinsiyet', 'Kadın', '2024-12-28 22:35:53', NULL),
(9, '1', 'Kalıp', 'Loose & Bol', '2024-12-28 22:36:41', NULL),
(10, '1', 'Kumaş', 'Kaşe', '2024-12-28 22:37:04', NULL),
(11, '1', 'Desen', 'Desenli', '2024-12-28 22:37:25', NULL),
(12, '1', 'Yaka', 'Ceket Yaka', '2024-12-28 22:37:46', NULL),
(13, '1', 'Kol Boyu', 'Uzun Kollu', '2024-12-28 22:38:19', NULL),
(14, '1', 'Astar Detay', 'Teffeta Astar', '2024-12-28 22:38:44', NULL),
(15, '1', 'Uzunluk', 'Midi', '2024-12-28 22:39:11', NULL),
(16, '2', 'Beden', 'L', '2024-12-28 22:58:21', NULL),
(17, '2', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(18, '2', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(19, '2', 'Ürün Tipi', 'Pijama Takımı', '2024-12-28 22:35:18', NULL),
(20, '2', 'Cinsiyet', 'Kadın', '2024-12-28 22:35:53', NULL),
(21, '2', 'Kalıp', 'Standart & Regular', '2024-12-28 22:36:41', NULL),
(22, '2', 'Kumaş', 'Polar', '2024-12-28 22:37:04', NULL),
(23, '2', 'Desen', 'Baskılı', '2024-12-28 22:37:25', NULL),
(24, '2', 'Yaka', 'Bisiklet Yaka', '2024-12-28 22:37:46', NULL),
(25, '2', 'Kol Boyu', 'Uzun Kollu', '2024-12-28 22:38:19', NULL),
(26, '2', 'Koleksiyon', 'Yılbaşı', '2024-12-28 23:04:22', NULL),
(27, '2', 'Parça Sayısı', '2 Parça', '2024-12-28 23:04:39', NULL),
(28, '3', 'Beden', 'L', '2024-12-28 22:58:21', 'admin'),
(29, '3', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(30, '3', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(31, '3', 'Ürün Tipi', 'Pantolon', '2024-12-28 22:35:18', 'admin'),
(32, '3', 'Cinsiyet', 'Kadın', '2024-12-28 22:35:53', 'admin'),
(33, '3', 'Kalıp', 'Dar & Slim', '2024-12-28 22:36:41', 'admin'),
(34, '3', 'Kumaş', 'Çift Yüzlü Kumaş', '2024-12-28 22:37:04', 'admin'),
(35, '3', 'Desen', 'Düz', '2024-12-28 22:37:25', 'admin'),
(36, '3', 'Kalınlık', 'Orta Kalınlık', '2024-12-28 23:18:56', NULL),
(37, '3', 'Uzunluk', 'Bilek Boy', '2024-12-28 22:39:11', 'admin'),
(38, '3', 'Koleksiyon', 'Büyük Beden', '2024-12-28 23:04:22', 'admin'),
(39, '4', 'Beden', '36.5', '2024-12-16 22:53:06', 'admin'),
(40, '4', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(41, '4', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(42, '4', 'Ürün Tipi', 'Topuklu Ayakkabı', '2024-12-28 22:35:18', 'admin'),
(43, '4', 'Cinsiyet', 'Kadın', '2024-12-28 22:35:53', 'admin'),
(44, '4', 'Kumaş', 'Suni Deri', '2024-12-28 22:37:04', 'admin'),
(45, '4', 'Topuk Yüksekliği', '5 cm', '2024-12-28 23:28:25', NULL),
(46, '4', 'Topuk Şekli', 'Platform Topuk', '2024-12-28 23:28:45', NULL),
(47, '4', 'Desen', 'Düz', '2024-12-28 22:37:25', 'admin'),
(48, '4', 'Ayakkabı Kapanma Şekli', 'Fermuarlı', '2024-12-28 23:29:41', NULL),
(49, '5', 'Beden', '36.5', '2024-12-16 22:53:06', 'admin'),
(50, '5', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(51, '5', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(52, '5', 'Ürün Tipi', 'Ev Terliği', '2024-12-28 22:35:18', 'admin'),
(53, '5', 'Cinsiyet', 'Kadın', '2024-12-28 22:35:53', 'admin'),
(54, '5', 'Kumaş', 'Pelüş', '2024-12-28 22:37:04', 'admin'),
(55, '5', 'Burun Şekli', 'Yuvarlak Burun', '2024-12-28 23:42:27', NULL),
(56, '5', 'Desen', 'Düz', '2024-12-28 22:37:25', 'admin'),
(57, '6', 'Beden', 'L', '2024-12-16 22:53:06', 'admin'),
(58, '6', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(59, '6', 'Marka', 'NexusEmporio', '2024-12-28 22:35:18', 'admin'),
(60, '6', 'Ürün Tipi', 'Tişört', '2024-12-28 22:35:53', 'admin'),
(61, '6', 'Cinsiyet', 'Kadın', '2024-12-28 22:36:41', 'admin'),
(62, '6', 'Kalıp', 'Dar & Slim', '2024-12-28 22:37:46', 'admin'),
(63, '6', 'Yaka', 'Bisiklet Yaka', '2024-12-28 22:37:25', 'admin'),
(64, '6', 'Desen', 'Puantiye', '2024-12-28 22:37:04', 'admin'),
(65, '6', 'Kumaş', 'Penye', '2024-12-28 23:18:56', 'admin'),
(66, '6', 'Kalınlık', 'Orta Kalınlık', '2024-12-28 22:38:19', 'admin'),
(67, '6', 'Kol Boyu', 'Uzun Kollu', '2024-12-28 23:04:22', 'admin'),
(68, '6', 'Koleksiyon', 'Büyük Beden', '2024-12-16 22:53:06', 'admin'),
(69, '7', 'Beden', 'L', '2024-12-16 22:53:06', 'admin'),
(70, '7', 'Astar', '%100 Polyester', '2024-12-16 22:53:06', 'admin'),
(71, '7', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(72, '7', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(73, '7', 'Ürün Tipi', 'Kaşe Kaban', '2024-12-28 22:35:18', NULL),
(74, '7', 'Cinsiyet', 'Erkek', '2024-12-28 22:35:53', 'admin'),
(75, '7', 'Kalıp', 'Standart & Regular', '2024-12-28 22:36:41', 'admin'),
(76, '7', 'Kumaş', 'Kaşe', '2024-12-28 22:37:04', 'admin'),
(77, '7', 'Desen', 'Düz', '2024-12-28 22:37:25', 'admin'),
(78, '7', 'Yaka', 'Ceket Yaka', '2024-12-28 22:37:46', 'admin'),
(79, '7', 'Kapüşon Detay', 'Kapüşonsuz', '2024-12-29 00:15:30', NULL),
(80, '7', 'Kalınlık', 'Orta Kalınlık', '2024-12-28 22:38:19', 'admin'),
(81, '7', 'Kol Boyu', 'Uzun Kollu', '2024-12-28 22:38:19', 'admin'),
(82, '7', 'Astar Detay', 'Teffeta Astar', '2024-12-28 22:38:44', 'admin'),
(83, '7', 'Koleksiyon', 'Büyük Beden', '2024-12-28 23:04:22', 'admin'),
(84, '8', 'Beden', 'L', '2024-12-16 22:53:06', 'admin'),
(85, '8', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(86, '8', 'Ürün Tipi', 'Pijama Takımı', '2024-12-28 22:35:18', 'admin'),
(87, '8', 'Cinsiyet', 'Erkek', '2024-12-28 22:35:53', 'admin'),
(88, '8', 'Kalıp', 'Standart & Regular', '2024-12-28 22:36:41', NULL),
(89, '8', 'Kumaş', 'Flanel', '2024-12-28 22:37:04', 'admin'),
(90, '8', 'Desen', 'Ekose', '2024-12-28 22:37:25', 'admin'),
(91, '8', 'Yaka', 'Bisiklet Yaka', '2024-12-28 22:37:46', 'admin'),
(92, '8', 'Kalınlık', 'Orta Kalınlık', '2024-12-28 23:18:56', 'admin'),
(93, '8', 'Kol Boyu', 'Uzun Kollu', '2024-12-28 22:38:19', 'admin'),
(94, '8', 'Malzeme', '%100 Pamuk', '2024-12-29 00:25:53', NULL),
(98, '9', 'Beden', 'L', '2024-12-29 00:35:28', NULL),
(97, '9', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(99, '9', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(100, '9', 'Ürün Tipi', 'Kargo Pantolon', '2024-12-28 22:35:18', 'admin'),
(101, '9', 'Cinsiyet', 'Erkek', '2024-12-28 22:35:53', 'admin'),
(102, '9', 'Kalıp', 'Standart & Regular', '2024-12-28 22:36:41', 'admin'),
(103, '9', 'Kumaş', 'Gabardin', '2024-12-28 22:37:04', 'admin'),
(104, '9', 'Bel Fiti', 'Normal Bel', '2024-12-28 22:37:04', 'admin'),
(105, '9', 'Desen', 'Düz', '2024-12-28 22:37:25', 'admin'),
(106, '9', 'Paça Fiti', 'Lastikli Paça', '2024-12-28 22:37:04', 'admin'),
(107, '9', 'Kalınlık', 'Orta Kalınlık', '2024-12-28 23:18:56', 'admin'),
(108, '9', 'Malzeme', 'Yüksek Pamuk İçerir', '2024-12-28 23:18:56', 'admin'),
(109, '9', 'Siluet', 'Kargo', '2024-12-28 23:18:56', 'admin'),
(110, '9', 'Koleksiyon', 'Büyük Beden', '2024-12-28 23:18:56', 'admin'),
(111, '10', 'Beden', '45', '2024-12-29 00:35:28', 'admin'),
(112, '10', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(113, '10', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(114, '10', 'Ürün Tipi', 'Bot', '2024-12-28 22:35:18', 'admin'),
(115, '10', 'Cinsiyet', 'Erkek', '2024-12-28 22:35:53', 'admin'),
(116, '10', 'Kumaş', 'Suni Deri', '2024-12-28 22:37:04', 'admin'),
(117, '10', 'Desen', 'Düz', '2024-12-28 22:37:25', 'admin'),
(118, '10', 'Burun Şekli', 'Yuvarlak Burun', '2024-12-28 23:42:27', 'admin'),
(119, '10', 'Ayakkabı Kapanma Şekli', 'Bağcık ve Fermuar', '2024-12-28 23:29:41', 'admin'),
(120, '11', 'Beden', '45', '2024-12-29 00:35:28', 'admin'),
(121, '11', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(122, '11', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(123, '11', 'Ürün Tipi', 'Ev Ayakkabısı', '2024-12-28 22:35:18', 'admin'),
(124, '11', 'Cinsiyet', 'Erkek', '2024-12-28 22:35:53', 'admin'),
(125, '11', 'Kumaş', 'Süet', '2024-12-28 22:37:04', 'admin'),
(126, '11', 'Burun Şekli', 'Yuvarlak Burun', '2024-12-28 23:42:27', 'admin'),
(127, '11', 'Desen', 'Düz', '2024-12-28 22:37:25', 'admin'),
(128, '12', 'Beden', 'L', '2024-12-29 00:35:28', 'admin'),
(129, '12', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(130, '12', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(131, '12', 'Ürün Tipi', 'Tişört', '2024-12-28 22:35:53', 'admin'),
(132, '12', 'Cinsiyet', 'Erkek', '2024-12-28 22:35:53', 'admin'),
(133, '12', 'Kalıp', 'Rahat & Relax', '2024-12-28 22:36:41', 'admin'),
(134, '12', 'Yaka', 'Bisiklet Yaka', '2024-12-28 22:37:46', 'admin'),
(135, '12', 'Desen', 'Baskılı', '2024-12-28 22:37:25', 'admin'),
(136, '12', 'Kumaş', 'Penye', '2024-12-28 22:37:04', 'admin'),
(137, '12', 'Kalınlık', 'İnce', '2024-12-28 23:18:56', 'admin'),
(138, '12', 'Kol Boyu', 'Kısa Kollu', '2024-12-28 22:38:19', 'admin'),
(139, '12', 'Malzeme', '%100 Pamuk', '2024-12-29 00:25:53', 'admin'),
(140, '13', 'Beden', '7-8 Yaş', '2024-12-16 22:53:06', 'admin'),
(141, '13', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(142, '13', 'Ürün Tipi', 'Kaban', '2024-12-28 22:35:18', 'admin'),
(143, '13', 'Cinsiyet', 'Erkek Çocuk', '2024-12-28 22:35:53', 'admin'),
(144, '13', 'Kalıp', 'Standart & Regular', '2024-12-28 22:36:41', 'admin'),
(145, '13', 'Desen', 'Baskılı', '2024-12-28 22:37:25', 'admin'),
(146, '13', 'Yaka', 'Kapüşonlu', '2024-12-28 22:37:46', 'admin'),
(147, '13', 'Kalınlık', 'Kalın', '2024-12-28 23:18:56', 'admin'),
(148, '13', 'Kol Boyu', 'Uzun Kollu', '2024-12-28 22:38:19', 'admin'),
(149, '13', 'Astar Detay', 'Polar', '2024-12-28 22:38:44', 'admin'),
(150, '14', 'Beden', '9-10 Yaş', '2024-12-29 00:35:28', 'admin'),
(151, '14', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(152, '14', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(153, '14', 'Ürün Tipi', 'Pijama Takımı', '2024-12-28 22:35:18', 'admin'),
(154, '14', 'Cinsiyet', 'Erkek Çocuk', '2024-12-28 22:35:53', 'admin'),
(155, '14', 'Kalıp', 'Standart & Regular', '2024-12-28 22:36:41', 'admin'),
(156, '14', 'Desen', 'Baskılı', '2024-12-28 22:37:25', 'admin'),
(157, '14', 'Yaka', 'Bisiklet Yaka', '2024-12-28 22:37:46', 'admin'),
(158, '14', 'Kalınlık', 'Orta Kalınlık', '2024-12-28 23:18:56', 'admin'),
(159, '14', 'Kol Boyu', 'Uzun Kollu', '2024-12-28 22:38:19', 'admin'),
(160, '14', 'Malzeme', '%100 Pamuk', '2024-12-29 00:25:53', 'admin'),
(161, '14', 'Parça Sayısı', '2 Parça', '2024-12-28 23:04:39', 'admin'),
(162, '15', 'Beden', '5-6 Yaş', '2024-12-29 00:35:28', 'admin'),
(163, '15', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(164, '15', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(165, '15', 'Ürün Tipi', 'Pantolon', '2024-12-28 22:35:18', 'admin'),
(166, '15', 'Cinsiyet', 'Erkek Çocuk', '2024-12-28 22:35:53', 'admin'),
(167, '15', 'Kalıp', 'Standart & Regular', '2024-12-28 22:36:41', 'admin'),
(168, '15', 'Kumaş', 'Kadife', '2024-12-28 22:37:04', 'admin'),
(169, '15', 'Desen', 'Düz', '2024-12-28 22:37:25', 'admin'),
(170, '15', 'Kalınlık', 'Kalın', '2024-12-28 23:18:56', 'admin'),
(171, '15', 'Malzeme', '%100 Pamuk', '2024-12-29 00:25:53', 'admin'),
(172, '16', 'Beden', '32', '2024-12-29 00:25:53', 'admin'),
(173, '16', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(174, '16', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(175, '16', 'Ürün Tipi', 'Bot', '2024-12-28 22:35:18', 'admin'),
(176, '16', 'Cinsiyet', 'Erkek Çocuk', '2024-12-28 22:35:53', 'admin'),
(177, '16', 'Burun Şekli', 'Yuvarlak Burun', '2024-12-28 23:42:27', 'admin'),
(178, '16', 'Ayakkabı Kapanma Şekli', 'Bağcık ve Fermuar', '2024-12-28 23:29:41', 'admin'),
(215, '18', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(216, '18', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(217, '18', 'Ürün Tipi', 'Pijama Takımı', '2024-12-28 22:35:18', 'admin'),
(213, '17', 'Astar Detay', 'Teffeta Astar', '2024-12-28 22:38:44', 'admin'),
(212, '17', 'Kol Boyu', 'Uzun Kollu', '2024-12-28 22:38:19', NULL),
(200, '17', 'Beden', 'L', '2024-12-29 00:25:53', 'admin'),
(201, '17', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(202, '17', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(203, '17', 'Ana Kumaş', '%100 Polyester', '2024-12-29 14:12:03', NULL),
(204, '17', 'Astar', '%100 Polyester', '2024-12-16 22:53:06', 'admin'),
(205, '17', 'Dolgu', '%100 Polyester', '2024-12-29 14:13:28', NULL),
(206, '17', 'Ürün Tipi', 'Mont', '2024-12-28 22:35:18', 'admin'),
(207, '17', 'Cinsiyet', 'Kız Çocuk', '2024-12-28 22:35:53', NULL),
(208, '17', 'Kalıp', 'Loose & Bol', '2024-12-28 22:36:41', NULL),
(209, '17', 'Desen', 'Düz', '2024-12-28 22:37:25', 'admin'),
(210, '17', 'Yaka', 'Kapüşonlu', '2024-12-28 22:37:46', NULL),
(211, '17', 'Kalınlık', 'Orta Kalınlık', '2024-12-28 22:38:19', 'admin'),
(218, '18', 'Cinsiyet', 'Kız Çocuk', '2024-12-28 22:35:53', NULL),
(219, '19', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(220, '19', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(221, '19', 'Ürün Tipi', 'Kazak', '2024-12-28 22:35:18', NULL),
(222, '19', 'Cinsiyet', 'Kız Çocuk', '2024-12-28 22:35:53', NULL),
(223, '19', 'Kalıp', 'Standart & Regular', '2024-12-28 22:36:41', NULL),
(224, '19', 'Kumaş', 'Triko', '2024-12-28 22:37:04', 'admin'),
(225, '19', 'Desen', 'Desenli', '2024-12-28 22:37:25', NULL),
(226, '19', 'Yaka', 'Bisiklet Yaka', '2024-12-28 22:37:46', NULL),
(227, '19', 'Kalınlık', 'İnce', '2024-12-28 23:18:56', NULL),
(228, '19', 'Kol Boyu', 'Uzun Kollu', '2024-12-28 22:38:19', NULL),
(229, '19', 'Koleksiyon', 'Yılbaşı', '2024-12-28 23:04:22', NULL),
(230, '20', 'Beden', '30', '2024-12-29 00:25:53', 'admin'),
(231, '20', 'Satıcı', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(232, '20', 'Marka', 'NexusEmporio', '2024-12-16 22:53:06', 'admin'),
(233, '20', 'Ürün Tipi', 'Bot', '2024-12-28 22:35:18', 'admin'),
(234, '20', 'Cinsiyet', 'Kız Çocuk', '2024-12-28 22:35:53', 'admin'),
(235, '20', 'Burun Şekli', 'Yuvarlak Burun', '2024-12-28 23:42:27', 'admin'),
(236, '20', 'Ayakkabı Kapanma Şekli', 'Bağcık ve Fermuar', '2024-12-28 23:29:41', 'admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunresimler`
--

CREATE TABLE `urunresimler` (
  `resid` int(11) NOT NULL,
  `resurun` varchar(300) DEFAULT NULL,
  `resdosya` varchar(300) DEFAULT NULL,
  `restarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `resekleyen` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `urunresimler`
--

INSERT INTO `urunresimler` (`resid`, `resurun`, `resdosya`, `restarih`, `resekleyen`) VALUES
(1, '123', '1.png', '2024-12-16 23:19:51', 'admin'),
(2, '123', '1.png', '2024-12-16 23:20:09', 'admin'),
(3, '123', '1.png', '2024-12-16 23:20:21', 'admin'),
(4, '1', 'kadin_kaban1.jpg', '2024-12-16 23:20:09', 'admin'),
(5, '1', 'kadin_kaban2.jpg', '2024-12-16 23:20:09', 'admin'),
(6, '1', 'kadin_kaban3.jpg', '2024-12-16 23:20:09', 'admin'),
(7, '2', 'kadin_gecelik1.jpg', '2024-12-16 23:20:09', 'admin'),
(8, '2', 'kadin_gecelik2.jpg', '2024-12-16 23:20:09', 'admin'),
(9, '2', 'kadin_gecelik3.jpg', '2024-12-16 23:20:09', 'admin'),
(10, '3', 'kadin_pantolon1.jpg', '2024-12-16 23:20:09', 'admin'),
(11, '3', 'kadin_pantolon2.jpg', '2024-12-16 23:20:09', 'admin'),
(12, '3', 'kadin_pantolon3.jpg', '2024-12-16 23:20:09', 'admin'),
(13, '4', 'kadin_topuklu1.jpg', '2024-12-16 23:20:09', 'admin'),
(14, '4', 'kadin_topuklu2.jpg', '2024-12-16 23:20:09', 'admin'),
(15, '4', 'kadin_topuklu3.jpg', '2024-12-16 23:20:09', 'admin'),
(16, '5', 'kadin_terlik1.jpg', '2024-12-16 23:20:09', 'admin'),
(17, '5', 'kadin_terlik2.jpg', '2024-12-16 23:20:09', 'admin'),
(18, '5', 'kadin_terlik3.jpg', '2024-12-16 23:20:09', 'admin'),
(19, '6', 'kadin_tisort1.jpg', '2024-12-16 23:20:09', 'admin'),
(20, '6', 'kadin_tisort2.jpg', '2024-12-16 23:20:09', 'admin'),
(21, '6', 'kadin_tisort3.jpg', '2024-12-16 23:20:09', 'admin'),
(22, '7', 'erkek_kaban1.jpg', '2024-12-16 23:20:09', 'admin'),
(23, '7', 'erkek_kaban2.jpg', '2024-12-16 23:20:09', 'admin'),
(24, '8', 'erkek_gecelik1.jpg', '2024-12-16 23:20:09', 'admin'),
(25, '8', 'erkek_gecelik2.jpg', '2024-12-16 23:20:09', 'admin'),
(26, '8', 'erkek_gecelik3.jpg', '2024-12-16 23:20:09', 'admin'),
(27, '9', 'erkek_pantolon1.jpg', '2024-12-16 23:20:09', 'admin'),
(28, '9', 'erkek_pantolon2.jpg', '2024-12-16 23:20:09', 'admin'),
(29, '9', 'erkek_pantolon3.jpg', '2024-12-16 23:20:09', 'admin'),
(30, '10', 'erkek_bot1.jpg', '2024-12-16 23:20:09', 'admin'),
(31, '10', 'erkek_bot2.jpg', '2024-12-16 23:20:09', 'admin'),
(32, '10', 'erkek_bot3.jpg', '2024-12-16 23:20:09', 'admin'),
(33, '11', 'erkek_terlik1.jpg', '2024-12-16 23:20:09', 'admin'),
(34, '11', 'erkek_terlik2.jpg', '2024-12-16 23:20:09', 'admin'),
(35, '11', 'erkek_terlik3.jpg', '2024-12-16 23:20:09', 'admin'),
(36, '12', 'erkek_tisort1.jpg', '2024-12-16 23:20:09', 'admin'),
(37, '12', 'erkek_tisort2.jpg', '2024-12-16 23:20:09', 'admin'),
(38, '12', 'erkek_tisort3.jpg', '2024-12-16 23:20:09', 'admin'),
(39, '13', 'ecocu_mont1.png', '2024-12-16 23:20:09', 'admin'),
(40, '13', 'ecocu_mont2.png', '2024-12-16 23:20:09', 'admin'),
(41, '13', 'ecocu_mont3.png', '2024-12-16 23:20:09', 'admin'),
(42, '14', 'ecocu_gecelik1.png', '2024-12-16 23:20:09', 'admin'),
(43, '14', 'ecocu_gecelik3.png', '2024-12-16 23:20:09', 'admin'),
(44, '14', 'ecocu_gecelik2.png', '2024-12-16 23:20:09', 'admin'),
(45, '15', 'ecocu_pantolon1.png', '2024-12-16 23:20:09', 'admin'),
(46, '15', 'ecocu_pantolon2.png', '2024-12-16 23:20:09', 'admin'),
(47, '15', 'ecocu_pantolon3.png', '2024-12-16 23:20:09', 'admin'),
(48, '16', 'ecocu_bot1.jpg', '2024-12-16 23:20:09', 'admin'),
(49, '16', 'ecocu_bot2.jpg', '2024-12-16 23:20:09', 'admin'),
(50, '16', 'ecocu_bot3.jpg', '2024-12-16 23:20:09', 'admin'),
(57, '17', 'kizmont1.jpg', '2024-12-16 23:20:09', 'admin'),
(58, '17', 'kizmont2.jpg', '2024-12-16 23:20:09', 'admin'),
(59, '17', 'kizmont3.jpg', '2024-12-16 23:20:09', 'admin'),
(60, '17', 'kizmont4.gif', '2024-12-16 23:20:09', 'admin'),
(61, '18', 'kizpijama1.jpg', '2024-12-16 23:20:09', 'admin'),
(62, '18', 'kizpijama2.jpg', '2024-12-16 23:20:09', 'admin'),
(63, '18', 'kizpijama3.jpg', '2024-12-16 23:20:09', 'admin'),
(64, '19', 'kiztriko1.jpg', '2024-12-16 23:20:09', 'admin'),
(68, '20', 'kizayakkabi1.jpg', '2024-12-16 23:20:09', 'admin'),
(66, '19', 'kiztriko3.jpg', '2024-12-16 23:20:09', 'admin'),
(67, '19', 'kiztriko2.jpg', '2024-12-16 23:20:09', 'admin'),
(69, '20', 'kizayakkabi2.jpg', '2024-12-16 23:20:09', 'admin'),
(70, '20', 'kizayakkabi3.jpg', '2024-12-16 23:20:09', 'admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

CREATE TABLE `uyeler` (
  `uye_id` int(11) NOT NULL,
  `uye_kodu` varchar(300) DEFAULT NULL,
  `uye_adi` varchar(300) DEFAULT NULL,
  `uye_soyadi` varchar(300) DEFAULT NULL,
  `uye_tel` varchar(300) DEFAULT NULL,
  `uye_mail` varchar(300) DEFAULT NULL,
  `uye_sifre` varchar(300) DEFAULT NULL,
  `uye_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `uye_durum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 aktif 0 pasif',
  `uye_aktivasyon` varchar(300) DEFAULT NULL,
  `uye_sifirlama` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`uye_id`, `uye_kodu`, `uye_adi`, `uye_soyadi`, `uye_tel`, `uye_mail`, `uye_sifre`, `uye_tarih`, `uye_durum`, `uye_aktivasyon`, `uye_sifirlama`) VALUES
(4, '6771835c9457f', 'users', '1', '05387381935', 'user@gmail.com', 'adcd7048512e64b48da55b027577886ee5a36350', '2024-12-29 17:14:04', 1, '6771835c94649', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorumlar`
--

CREATE TABLE `yorumlar` (
  `yorumid` int(11) NOT NULL,
  `yorumuye` varchar(300) DEFAULT NULL,
  `yorumisim` varchar(300) DEFAULT NULL,
  `yorumurun` varchar(300) DEFAULT NULL,
  `yorumtarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `yorumdurum` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 onaylı 2 pasif',
  `yorumvitrin` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 müşteri onayı 2 müşteri onaysız',
  `yorumicerik` text DEFAULT NULL,
  `yorumip` varchar(500) DEFAULT NULL,
  `yorumpuan` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `yorumlar`
--

INSERT INTO `yorumlar` (`yorumid`, `yorumuye`, `yorumisim`, `yorumurun`, `yorumtarih`, `yorumdurum`, `yorumvitrin`, `yorumicerik`, `yorumip`, `yorumpuan`) VALUES
(1, 'admin', 'alikaplan', '123', '2024-12-16 13:25:53', 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '1', 1),
(2, 'admin', 'enesmalik', '123', '2024-12-16 13:25:53', 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '1', 1),
(3, 'admin', 'emreaksoy', '123', '2024-12-16 13:25:53', 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '1', 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Tablo için indeksler `ayarlar`
--
ALTER TABLE `ayarlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `bankalar`
--
ALTER TABLE `bankalar`
  ADD PRIMARY KEY (`bankaid`);

--
-- Tablo için indeksler `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blogid`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`katid`);

--
-- Tablo için indeksler `loglar`
--
ALTER TABLE `loglar`
  ADD PRIMARY KEY (`lodid`);

--
-- Tablo için indeksler `mesajlar`
--
ALTER TABLE `mesajlar`
  ADD PRIMARY KEY (`mesajid`);

--
-- Tablo için indeksler `posfirmalari`
--
ALTER TABLE `posfirmalari`
  ADD PRIMARY KEY (`posid`);

--
-- Tablo için indeksler `sayfalar`
--
ALTER TABLE `sayfalar`
  ADD PRIMARY KEY (`sayfaid`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`sipid`);

--
-- Tablo için indeksler `smsfirmalari`
--
ALTER TABLE `smsfirmalari`
  ADD PRIMARY KEY (`smsid`);

--
-- Tablo için indeksler `smtpbilgileri`
--
ALTER TABLE `smtpbilgileri`
  ADD PRIMARY KEY (`smtp_id`);

--
-- Tablo için indeksler `sosyalmedyalar`
--
ALTER TABLE `sosyalmedyalar`
  ADD PRIMARY KEY (`sosid`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`urun_id`);

--
-- Tablo için indeksler `urunozellikler`
--
ALTER TABLE `urunozellikler`
  ADD PRIMARY KEY (`ozid`);

--
-- Tablo için indeksler `urunresimler`
--
ALTER TABLE `urunresimler`
  ADD PRIMARY KEY (`resid`);

--
-- Tablo için indeksler `uyeler`
--
ALTER TABLE `uyeler`
  ADD PRIMARY KEY (`uye_id`);

--
-- Tablo için indeksler `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD PRIMARY KEY (`yorumid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `ayarlar`
--
ALTER TABLE `ayarlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `bankalar`
--
ALTER TABLE `bankalar`
  MODIFY `bankaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `blog`
--
ALTER TABLE `blog`
  MODIFY `blogid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `katid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `loglar`
--
ALTER TABLE `loglar`
  MODIFY `lodid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Tablo için AUTO_INCREMENT değeri `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `mesajid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `posfirmalari`
--
ALTER TABLE `posfirmalari`
  MODIFY `posid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `sayfalar`
--
ALTER TABLE `sayfalar`
  MODIFY `sayfaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `sipid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `smsfirmalari`
--
ALTER TABLE `smsfirmalari`
  MODIFY `smsid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `smtpbilgileri`
--
ALTER TABLE `smtpbilgileri`
  MODIFY `smtp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `sosyalmedyalar`
--
ALTER TABLE `sosyalmedyalar`
  MODIFY `sosid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `urun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `urunozellikler`
--
ALTER TABLE `urunozellikler`
  MODIFY `ozid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- Tablo için AUTO_INCREMENT değeri `urunresimler`
--
ALTER TABLE `urunresimler`
  MODIFY `resid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Tablo için AUTO_INCREMENT değeri `uyeler`
--
ALTER TABLE `uyeler`
  MODIFY `uye_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `yorumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
