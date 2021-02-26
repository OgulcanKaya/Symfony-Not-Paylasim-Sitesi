-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 15 Oca 2020, 16:36:38
-- Sunucu sürümü: 10.4.8-MariaDB
-- PHP Sürümü: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `notsitem1`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`id`, `parentid`, `title`, `keywords`, `description`, `image`, `detail`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Mühendislik', 'Mühendislik Fakültesi', 'Mühendislik Fakültesi Notlar', NULL, NULL, 'True', NULL, NULL),
(2, 0, 'Teknoloji Fakültesi', 'Teknoloji Fakültesi Notlar', 'Teknoloji Fakültesi Notlar', NULL, NULL, 'True', NULL, NULL),
(3, 0, 'İktisadi Bilimler', 'İktisadi Bilimler Fakültesi', 'İktisadi Bilimler Fakültesi', NULL, NULL, 'True', NULL, NULL),
(4, 1, 'Bilgisayar Mühendisliği', 'Bilgisayar Mühendisliği Noları', 'Bilgisayar Mühendisliği Noları', NULL, NULL, 'True', NULL, NULL),
(5, 1, 'Elektrik Elektronik Mühendisliği', 'Elektrik Elektronik Mühendisliği', 'Elektrik Elektronik Mühendisliği', NULL, NULL, 'True', NULL, NULL),
(6, 2, 'Endüstriyel Tasarım Mühendisliği', 'Endüstriyel Tasarım Mühendisliği Notları', 'Endüstriyel Tasarım Mühendisliği Notları', NULL, NULL, 'True', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `hotelid` int(11) DEFAULT NULL,
  `noteid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `comment`
--

INSERT INTO `comment` (`id`, `subject`, `comment`, `status`, `ip`, `userid`, `created_at`, `updated_at`, `rate`, `hotelid`, `noteid`) VALUES
(1, 'test', 'Bu bir test mesajıdır', 'True', '127.0.0.1', 8, NULL, NULL, 4, 4, 1),
(2, 'yeni notlar çook iyi', 'Bu notlar kimin notları', 'True', '127.0.0.1', 3, NULL, NULL, 3, NULL, 4),
(3, 'Notlar hakında', 'Bunlar Burhan hocanın Notlarıysa mükemel!!', 'True', '127.0.0.1', 4, NULL, NULL, 5, NULL, 5),
(5, 'Mükemmel Notlar', 'BU notlar geçen seneki sınavların çok benzeri Teşekkürler', 'True', '127.0.0.1', 6, NULL, NULL, 2, NULL, 10),
(6, 'Mükemmel Notlar', 'Notları Tamamını Paylaşmanız çok sevindim çok teşekkürler..', 'True', '127.0.0.1', 5, NULL, NULL, 5, NULL, 9),
(7, 'Notlar hakında', 'Bu notların Finalin notlarını da bulabilir misiniz??', 'True', '127.0.0.1', 2, NULL, NULL, 2, NULL, 6),
(8, 'Sınav', 'SINAVA YÖNELİK DERS NOTLARINI NASIL BULABİLİRİM!!! BUNLAR SADEVE DERSTE ALINAN NOTLAR', 'True', '127.0.0.1', 1, NULL, NULL, 3, NULL, 2),
(9, 'Hocanın Notları', 'Hocanın Notlarını da Bulabilir misiniz??', 'True', '127.0.0.1', 2, NULL, NULL, 4, NULL, 3),
(10, 'Geçen sene', 'Geçen seneki Notlardan Baya farklı bu notlar. BU notları kim tutmuş??', 'True', '127.0.0.1', 7, NULL, NULL, 4, NULL, 8);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `notes_id` int(11) DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `image`
--

INSERT INTO `image` (`id`, `notes_id`, `title`, `image`) VALUES
(1, 4, 'Algoritamalar Tahta', '5d53b0b1adea75e7b341d613002e5c9e.jpeg'),
(3, 4, 'Algoritamalar Tahta', '9675de9e1d7fa409dd2ee76bbd667be1.jpeg'),
(4, 4, 'Algoritamalar Sınav', '4d256f2f163a35840838526f40c1509a.jpeg'),
(5, 4, 'Algoritamalar Sınav2', '392032eab0f15e5217bbc57766c829a7.jpeg'),
(7, 1, NULL, '60277ffa0b5998bde5d7513980d99b29.jpeg'),
(8, 1, NULL, '5a4b47eb2d6eebb33211ce1f75a40a9c.jpeg'),
(9, 1, NULL, '42819011f1c8a796f551d75554af6e23.jpeg'),
(10, 1, NULL, '66981e1959ac77002abd8fcf17e5841f.jpeg'),
(11, 1, NULL, 'f0f2866d1b197242bd8906359bba89eb.jpeg'),
(12, 3, NULL, '3d99f6ba8f2668063eb793bfbfb874e9.png'),
(14, 3, NULL, '91d6bd30fc8fc1ef0fc990c12b4bf336.png'),
(15, 3, NULL, '67642fca299bdf9d844f26e212b5589d.jpeg'),
(16, 3, NULL, 'd6fe209e0fdfc5344b7b59c6d1e299df.jpeg'),
(17, 3, NULL, 'd20cbe96905a121c6895c4b4cd99c2f9.jpeg'),
(18, 5, NULL, '44d4c1b60d08b6b4641082f7551a1fc2.png'),
(19, 5, NULL, '263c18d957284c07db146d4b1b034d2d.png'),
(20, 5, NULL, 'f86a34974d19b615409b35bf182a4a1f.png'),
(21, 5, NULL, 'c08b7de30fc7c06ed2de380355686662.jpeg'),
(22, 5, NULL, '52313f7a87e46e0f68024f77c00463a5.jpeg'),
(23, 6, NULL, '44e398126a68cb685c484a8893d8282a.jpeg'),
(24, 6, NULL, '600f1542162f08795772a2390e121d02.jpeg'),
(25, 6, NULL, '95792ff5e296c5ea96b42f91ea673194.jpeg'),
(26, 6, NULL, '753b25a29406605fab8ab78afe9ff58d.jpeg'),
(27, 6, NULL, '6c0cacdc83a61d80dec36e64895ad53e.jpeg'),
(28, 7, NULL, '9d231df5e283cebf996beb8ff7cdb6e2.png'),
(29, 7, NULL, 'bdc5be84dd7f8102ba37ba3195a387fb.png'),
(30, 7, NULL, '97391a866d381889a403b312b9735e41.png'),
(31, 7, NULL, '7bb3b0b152919b73bdadb1b16474ef5b.png'),
(32, 7, NULL, 'bc6ae8502fa81026d5dd340bfe32bee0.png'),
(33, 8, NULL, '785a48a009be71753b237fa4086d93b0.jpeg'),
(34, 8, NULL, 'b1e32aed4d19e1f00f13de88c17df12d.jpeg'),
(35, 8, NULL, '2ae98a89a9d7add20e3212bce576617c.jpeg'),
(36, 8, NULL, '71d26aa32bd895be4cbcdc3f7f67de14.jpeg'),
(37, 8, NULL, 'b2689f37556818a5036b5b92a3d1510f.jpeg'),
(38, 8, NULL, '7544e0cb09999d5d7bc60b1d30f94622.jpeg'),
(39, 8, NULL, '389e483e287b27ccea63ea97b7ee583b.jpeg'),
(40, 8, NULL, 'e514291c4ecec108cb22661eb729b415.jpeg'),
(41, 9, NULL, '75ec6e89559a8c1f798d83d511964d13.jpeg'),
(42, 9, NULL, 'c069760cfb35d3b4099ce5b3c1a4b883.jpeg'),
(43, 9, NULL, 'f6270b93a9c67026746e2ee23df8a9e6.jpeg'),
(44, 9, NULL, '0b3bbab2a8d1d3281d6497eab21b4284.jpeg'),
(45, 9, NULL, '480684ee5c1f29a40e3b500b4ea527bf.jpeg'),
(46, 9, NULL, '5a48eaae141ca681c89b87e190e7c810.jpeg'),
(47, 9, NULL, '4efa7747d0a88e6163b20ffb9a3241a3.jpeg'),
(48, 9, NULL, 'b2b0b4b51b3a85d277c8981ec813a921.jpeg'),
(49, 9, NULL, '77284e879afc40a935ea7f83b854eff0.jpeg'),
(50, 9, NULL, 'ee2ea74272b7d8fdc0d31ff536046c0a.jpeg'),
(51, 11, NULL, '4a43b42a8060af2bff32cfe8dbf404ad.jpeg'),
(52, 11, NULL, '993da37824791b41d15510e6e83a8303.jpeg'),
(53, 11, NULL, 'abe94ee81af13dcc96ea799579e543ee.jpeg'),
(54, 11, NULL, '6d72f4fdd894ba926cfd9236114ecabb.jpeg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messages` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `messages`, `status`, `created_at`, `updated_at`, `note`, `p`) VALUES
(1, 'Ogulcan', 'ogulcan@gmail.com', 'Yeni notlar', 'yeni notlar ne zaman gelir??', 'Read', NULL, NULL, NULL, NULL),
(2, 'Ogulcan', 'ogulcan@gmail.com', 'Yeni notlar', 'yeni notlar ne zaman gelir??', 'Read', NULL, NULL, NULL, NULL),
(3, 'mert', 'mert@gmail.com', 'Devre Notları', 'Salim Hocanın notları Var mı?', 'New', NULL, NULL, NULL, '127.0.0.1'),
(4, 'Ogulcan', 'ogulcan@gmail.com', 'Yeni notlar', 'Yeni Notların Gelmesi Ne kadarı bulur??', 'New', NULL, NULL, NULL, '127.0.0.1'),
(5, 'mert', 'mert@gmail.com', 'Mantık Devreleri', 'Hocanın geçen seneki final notları ne zamana gelir acaba?', 'New', NULL, NULL, NULL, '127.0.0.1'),
(6, 'Ogulcan', 'ogulcan@gmail.com', 'Yeni notlar', 'Merhaba mesajımı aldınız mı??', 'New', NULL, NULL, NULL, '127.0.0.1'),
(7, 'Ogulcan', 'ogulcan@gmail.com', 'Yeni notlar', 'Merhaba mesajımı aldınız mı??', 'New', NULL, NULL, NULL, '127.0.0.1'),
(8, 'Ogulcan', 'ogulcan@gmail.com', 'Yeni notlar', 'Merhaba mesajımı aldınız mı??', 'New', NULL, NULL, NULL, '127.0.0.1'),
(9, 'Ogulcan', 'ogulcan@gmail.com', 'Yeni notlar', 'merhaba', 'Read', NULL, NULL, NULL, '127.0.0.1'),
(10, 'Ogulcan', 'ogulcan.rok1@gmail.com', 'dersler', 'merhaba nasılsınız', 'New', NULL, NULL, NULL, '127.0.0.1'),
(11, 'emir', 'ogulcan.rok1@gmail.com', 'merhaba', 'merhabalar nasılsınız', 'New', NULL, NULL, NULL, '127.0.0.1'),
(12, 'Ogulcan', 'ogulcan.rok1@gmail.com', 'Devre Notları', 'Devre Analizi NOtlarını Nerden Bulabilirm??', 'New', NULL, NULL, NULL, '127.0.0.1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191214045759', '2019-12-14 04:58:12'),
('20191214154537', '2019-12-14 15:45:53'),
('20191214161344', '2019-12-14 16:13:49'),
('20191215183401', '2019-12-15 18:34:19'),
('20191215185650', '2019-12-15 18:56:59'),
('20191215191028', '2019-12-15 19:10:34'),
('20200109192833', '2020-01-09 19:28:51'),
('20200109203359', '2020-01-09 20:34:11');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `season_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `pdf` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `notes`
--

INSERT INTO `notes` (`id`, `category_id`, `title`, `keywords`, `description`, `image`, `status`, `season_at`, `created_at`, `updated_at`, `detail`, `userid`, `pdf`, `university_id`) VALUES
(1, 4, 'Mantık Devreleri Notları', 'Mantık Devreleri Notları', 'Geçen sen Vizeler', '92964551e2a360d965693ca266245628.jpeg', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2015-2016</strong></em> yılı vize ve final Notlarını i&ccedil;erir. Herkese Kolay Gelsin!!</p>', 8, 'b2b9416e028749ddf631e630510e3602.pdf', 3),
(2, 2, 'Devre Analizi', 'Devere Analizi', 'Geçen sen Vize Final Notları', '8556983ce664da283af95253c091e425.jpeg', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2014-2015</strong></em>&nbsp;yılı vize ve final Notlarını i&ccedil;erir. İyi &Ccedil;alışmalar herkese</p>', 3, '3c7fe3fff313287bd35883d106c1a9ea.pdf', 1),
(3, 4, 'Database Management', 'Database Management Notları', 'Database Management Notlar', '593b5f3efe42bc8fac7e57ab67136f12.png', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2017-2018</strong></em>&nbsp;yılı vize ve final Notlarını i&ccedil;erir. Herkese Kolay Gelsin!!</p>', 1, 'f446d69ae91a4d63d209b1903ab4a738.pdf', 4),
(4, 1, 'Algoritmalar', 'Algoritma dersi notlar', 'Algoritma dersi notlar', 'f31e575a69c593cb2a11f8b08b1e8452.jpeg', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2015-2016</strong></em> yılı vize ve final Notlarını i&ccedil;erir. İyi &Ccedil;alışmalarr :))</p>', 5, '9bd66ba948ce7c373285765a8349d856.pdf', 4),
(5, 2, 'Mikroişlemciler', 'Mikroişlemciler ders Notları, emu8086', 'Mikroişlemciler ders Notları, emu8086', '891f5a23d3d9afede19d3c79cb590546.jpeg', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2015-2016</strong></em> yılı vize ve final Notlarını i&ccedil;erir. Herkese Kolay Gelsin!!</p>', 2, 'e5db4d2e49f4b5a71be55880f89822bc.pdf', 3),
(6, 1, 'Bilgisayar Mimarisi', 'Bilgisayar Mimarisi Notları', 'Bilgisayar Mimarisi Notları final Vize', 'e4a1955b17391dc7720a9c551b357665.jpeg', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2015-2016</strong></em> yılı vize ve final Notlarını i&ccedil;erir. Herkese Kolay Gelsin!!</p>', 4, '661186d55b8afb75ff5e426d11add017.pdf', 2),
(7, 4, 'Data Structers', 'Data Structers Konular', 'Data Structers Konular Vize Final', 'c90f42d807cb13063269a52b4f4d2437.png', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2018-2019</strong></em>&nbsp;yılı g&uuml;z d&ouml;nemi vize ve final Notlarını i&ccedil;erir. Herkese Kolay Gelsin!!</p>', 3, '9bc124c434d354a51e8585434503b97a.pdf', 3),
(8, 4, 'Görüntü İşleme', 'Görüntü İşleme Ders Notları', 'Görüntü İşleme Ders Notları Final ve vize', 'cedca3d92d258acf6ce1e421c97a209e.jpeg', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2017-2018</strong></em>&nbsp;yılı&nbsp; bahar d&ouml;nemi vize ve final Notlarını i&ccedil;erir. Herkese Kolay Gelsin!!</p>', 2, '7f4f65daf75315ee0dc8f03d85826f52.pdf', 1),
(9, 4, 'Matematik I', 'Matematik I Notları', 'Matematik I Notları Fİnal ve Vize', '204d50872e7e2f16e01998c1c959be47.jpeg', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2015-2016</strong></em> yılı vize ve final Notlarını i&ccedil;erir. Herkese Kolay Gelsin!! İyi &ccedil;alışmalar!</p>', 6, '1913fd48ceb1b9870db6c229cc51c02e.pdf', 6),
(10, 1, 'Operating System', 'Operating System Notları', 'Operating System Notları Final ve Vize', 'b36d5a3b8e74b9e3bd4d96c1862d5e82.jpeg', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2013-2014</strong></em>&nbsp;yılı vize ve final Notlarını i&ccedil;erir. Herkese Kolay Gelsin!!</p>', 7, '2ded6ba0f486a194c4e6666c2def131a.pdf', 4),
(11, 1, 'Yapay Zeka', 'Yapay Zeka', 'Yapay Zeka', '8e88cf16edcb20afeef8134b05b19c2b.jpeg', 'True', NULL, NULL, NULL, '<p>Bu not <em><strong>2015-2016</strong></em> yılı vize ve final Notlarını i&ccedil;erir. Herkese Kolay Gelsin!! İyi &ccedil;alışmalar dilerim. Sınavda başarılar :)</p>', 1, '7855fbd6f0572d2adf9d503356bd4a27.pdf', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpserver` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpemail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtppassword` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpport` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aboutus` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `setting`
--

INSERT INTO `setting` (`id`, `title`, `keywords`, `description`, `address`, `email`, `smtpserver`, `smtpemail`, `smtppassword`, `smtpport`, `facebook`, `instagram`, `twitter`, `aboutus`, `contact`, `reference`, `status`) VALUES
(1, 'Türkiye\'nin En İyi Not Paylaşım Sitesi!', 'Notes, Notlar, Vize', 'Notes, Notlar, Vize', 'Kastamonu Yolu Demir Çelik Kampüsü, 78050 Kılavuzlar/Karabük Merkez/Karabük', 'notunupaylas@gmail.com', 'gmail', 'notunupaylas25@gmail.com', 'Marabalar2019*', '578', 'https://www.facebook.com/krbkuni', 'https://www.instagram.com/karabukuniv/', 'https://twitter.com/krbkuni', '<p>Our Story<br />\r\nWebsite.com began in 2005. After years in the web hosting industry, we realized that it was near impossible for the average Jane or Joe to create their own website. Traditional web hosting services were simply too complicated, time consuming, and expensive to manage.</p>\r\n\r\n<p>We created the Website.com Site Builder with the user&#39;s perspective in mind. We wanted to offer a platform that would require no coding skills or design experience. We keep it simple, so users can focus on creating an amazing website that reflects their brand. Best of all - it&#39;s free. You can get online, showcase your brand, or start selling products right away.</p>\r\n\r\n<p>After seeing an increased need for ecommerce solutions, we developed one of the only fully-featured, free and commission-free online store builders, allowing business owners to launch their online business.</p>\r\n\r\n<p>Today, we&#39;re proud to empower individuals and small business owners around the world. Everyone deserves a website, and we&#39;re excited to see what you create.</p>', '<ul>\r\n	<li><strong>Karab&uuml;k &Uuml;niversitesi</strong><br />\r\n	Kastamonu yolu Karab&uuml;k &Uuml;niversitesi Demir &Ccedil;elik Kamp&uuml;s&uuml;, 78050 Kılavuzlar K&ouml;y&uuml; &Ouml;te Karşı &Uuml;niversite Kamp&uuml;s&uuml; Merkez Karab&uuml;k</li>\r\n	<li><strong>Telefon:</strong><br />\r\n	444 04 78</li>\r\n	<li><strong>Trade Register Number:</strong><br />\r\n	304844</li>\r\n	<li><strong>Web:</strong>&nbsp;<br />\r\n	www.karabuk.edu.tr</li>\r\n	<li><strong>Email:</strong><br />\r\n	iletisim@karabuk.edu.tr</li>\r\n</ul>', '<p>AUDIT | FINANCIAL REQUIREMENTS<br />\r\nSTATUTORY AUDITOR OF THE CARREFOUR GROUP<br />\r\nWith a global presence in 33 countries, 60% of Carrefour&rsquo;s revenue comes from abroad. The group is the second largest retailer worldwide. The multinational retailer appointed Mazars as its statutory auditor in 2011 to strengthen its external audit procedure. Before this appointment, Mazars conducted assessments of key control procedures for several countries including Argentina, China, Spain, France and Greece.</p>\r\n\r\n<p>ALIGNING ORGANIZATIONS WITH NEW MARKET OPPORTUNITIES<br />\r\nSECURING THE CASINO GROUP&rsquo;S ACQUISITION PROCESS<br />\r\nThe Casino Group operates a wide range of hypermarkets, supermarkets, and convenience stores in France, Asia and South America, with close to 4,000 stores. Commercial partnerships and acquisitions are an important lever of development for the Casino Group to contribute to its growth and new markets strategy. Mazars&rsquo; team assisted the group with several acquisition projects, mainly related to franchisee networks, by performing financial and tax due diligence.</p>\r\n\r\n<p>SECURING OPERATIONS | IMPROVING RISK MANAGEMENT<br />\r\nESTABLISHING CASH REGISTER CONTROL PROCEDURES FOR A LARGE CLOTHING AND ACCESSORIES RETAILER<br />\r\nWith more than 500 stores and 800 cash registers, one of our clients was looking for a trusted partner that could secure cash flows and shorten delays. For this assignment, Mazars was asked to establish cash control procedures, review reported revenue, design dashboards, perform bank reconciliations and handle non-cash methods of payment.</p>\r\n\r\n<p>DESIGNING NEW INTERNAL CONTROL STANDARDS FOR LOGISTICS AND SUPPLY CHAIN ACTIVITIES<br />\r\nMazars was selected to design new internal control standards and optimize supply chain management for a client with approximately 70 points of sale in five countries, including France, the United Arab Emirates and China. This assignment has allowed our client to improve the performance control of physical flows and financial information.</p>\r\n\r\n<p>REVIEWING THE MANUAL ACCOUNTING ENTRIES OF AN INTERNATIONAL ENTERTAINMENT RETAIL CHAIN WITH SCAN-D&trade;<br />\r\nMazars was asked to set up flow accounting on behalf of an international entertainment retail chain. Our team analyzed the manual accounting entries by operation type, store, department, function and user with Scan-D&trade;, our exclusive data analysis tool. A proposal to reduce the volume of manual accounting operations and to limit the number of operations that needed to be registered manually was also presented.</p>\r\n\r\n<p>IMPROVING PERFORMANCE<br />\r\nASSISTANCE FOR A HIGH-STAKES IT PROJECT<br />\r\nOne of our clients, a group composed of approximately 1,000 legal entities, undertook a project to reorganize its Finance Department using a reliable and effective consolidation tool. The group asked Mazars, which was already advising them with tax matters (fiscal integration, tax documentation, deferred tax reliability), to provide assistance with the migration of their IT system.&nbsp;</p>', 'True');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `university`
--

CREATE TABLE `university` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `university`
--

INSERT INTO `university` (`id`, `name`, `city`, `country`, `created_at`, `updated_at`) VALUES
(1, 'Karabük Üniversitesi', 'Karabük', 'Türkiye', NULL, NULL),
(2, 'İstanbul Teknik Üniversitesi', 'İstanbul', 'Türkiye', NULL, NULL),
(3, 'Karadeniz Teknik Üniversitesi', 'Trabzon', 'Türkiye', NULL, NULL),
(4, 'Bülent Ecevit Üniversitesi', 'Zonguldak', 'Türkiye', NULL, NULL),
(5, 'Ege Üniversitesi', 'İzmir', 'Türkiye', NULL, NULL),
(6, 'ODTÜ', 'Ankara', 'Türkiye', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `surname`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ogulcan@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$VTRxN0hVQkFGTm9qOFhjQw$0Vgxgkgq1mQ7ETlCgHok1j3GhuKSEbyHT/BmuZJLas8', 'Oğulcan', 'Kaya', '41806ac09e8b1c6278d078b950a96805.jpeg', 'True', NULL, NULL),
(2, 'emir@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$OEJWb1RoQzhuWDY2WDBRaQ$7MAzu19hwVRBDbdQ0+cepqJZI3i5zWHGnIK4jUpjuI8', 'Emir', 'Kaya', 'e07b55a4cf0e14a029dfffe4bc1e43c0.jpeg', 'True', NULL, NULL),
(3, 'serhat@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$SXZJcGxqeVZGaHgyQTFyaw$fTIrJ2ao+fUTLhnX1y2l6SdncKFg3wrhqW20NKz8Iic', 'Serhat', 'Yücesan', '8000b0e34607437d517de5d3953d01ea.jpeg', 'True', NULL, NULL),
(4, 'yasar@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$YWp6bWFlQlo2d0Y4Q05kNQ$RS+Nic7t4RT3go7+75ZM0rlk0/zxhdDUkwMFRSqc+0Q', 'Yaşar', 'Kaya', '5965e27e901596de71034f91337f7506.jpeg', 'True', NULL, NULL),
(5, 'baran@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$UzFlZUhCWFYxbUw1Y0tFSw$77tSQ+8b8MV3JLSM6tiewZwoRNzr9pD9hCiJR/VnlIA', 'Baran', 'Ege', '5f650a8ac252e7333b46ac5925f68b01.jpeg', 'True', NULL, NULL),
(6, 'emreavci@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$WktnN0ZyNjVvU2c1WVkwbQ$exPKqqQoV9MjeIBVMIXRzSVz7iYu2Sn72u2OKprCKpc', 'Emre', 'Avcı', '038dc1f18cb5802577a70accd7f25b00.jpeg', 'True', NULL, NULL),
(7, 'türkan@hotmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$NzAvQ1FqQWdUUXlHQlA0eg$Sm3NdHf//8HFILssuRnprm1roptOwmDa5+z0LbPxH0k', 'Türkan', 'Kaya', '57603ebf39c6dbf587f7cc0db38b8fd8.jpeg', 'True', NULL, NULL),
(8, 'seda@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dnVyQjIuamJDOER4Z3JGWg$7p47dF/4c/4M+aEovgFrX9bPSseTVUwzXtIa1ZzuLmM', 'Seda', 'Durmaz', 'f237aa52dfe9f06c3e398c16c0c9d259.jpeg', 'True', NULL, NULL);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C53D045FFC56F556` (`notes_id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Tablo için indeksler `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_11BA68C12469DE2` (`category_id`),
  ADD KEY `IDX_11BA68C309D1878` (`university_id`);

--
-- Tablo için indeksler `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `university`
--
ALTER TABLE `university`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045FFC56F556` FOREIGN KEY (`notes_id`) REFERENCES `notes` (`id`);

--
-- Tablo kısıtlamaları `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `FK_11BA68C12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_11BA68C309D1878` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
