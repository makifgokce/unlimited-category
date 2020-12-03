-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 03 Ara 2020, 07:04:46
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `category`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`id`, `name`, `url`, `parent_id`, `sort_order`) VALUES
(1, 'Main', '#', 0, 0),
(2, 'Back-end', '#', 0, 1),
(3, 'Java', 'java', 2, 1),
(4, 'C#', 'csharp', 2, 1),
(5, 'Front-end', '#', 0, 2),
(6, 'Css', 'css', 5, 2),
(7, 'JavaScript', 'javascript', 5, 2),
(8, 'Jquery', 'jquery', 5, 2),
(9, 'Vuejs', 'vuejs', 5, 2),
(10, 'DB', '#', 0, 3),
(11, 'MYSQL', 'mysql', 10, 3),
(12, 'MSSQL', 'mssql', 10, 3),
(13, 'Development', 'development', 0, 4),
(14, 'Htaccess', 'htaccess', 0, 5),
(15, 'Başlangıç', 'baslangic', 6, 0),
(16, 'Kullanımı', 'kullanimi', 6, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
