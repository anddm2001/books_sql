-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.3.13-MariaDB-log - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица books.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Название книги',
  `cover_id` int(10) unsigned DEFAULT NULL COMMENT 'Тип обложки',
  `circulation` int(10) unsigned NOT NULL COMMENT 'Тираж',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cover` (`cover_id`),
  CONSTRAINT `FK_cover` FOREIGN KEY (`cover_id`) REFERENCES `covers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Книги';

-- Дамп данных таблицы books.books: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `name`, `cover_id`, `circulation`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Мастер и Маргарита', 1, 10500, '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL),
	(2, 'Война и мир', 2, 5300, '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL),
	(3, 'Детство, отрочество, юность', 2, 7800, '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL),
	(4, 'Как закалялась сталь', 1, 2300, '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL),
	(5, 'Как закалялась сталь 2-е издание', 2, 8700, '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL),
	(6, 'Искусство программирования', 2, 8900, '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL),
	(7, 'Искусство программирования 2-е издание', 1, 3400, '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL),
	(8, 'Javascript за 1 неделю', 1, 9800, '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL),
	(9, 'PHP самоучитель', 2, 12000, '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL),
	(10, 'Тестовая книга', 2, 5600, '2020-06-09 02:03:00', '2020-06-09 02:03:00', NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- Дамп структуры для представление books.books_select
-- Создание временной таблицы для обработки ошибок зависимостей представлений
CREATE TABLE `books_select` (
	`id` BIGINT(20) UNSIGNED NULL,
	`books` VARCHAR(255) NOT NULL COMMENT 'Название книги' COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Дамп структуры для представление books.books_select_two
-- Создание временной таблицы для обработки ошибок зависимостей представлений
CREATE TABLE `books_select_two` (
	`book_id` BIGINT(20) UNSIGNED NOT NULL,
	`book` VARCHAR(255) NOT NULL COMMENT 'Название книги' COLLATE 'utf8_general_ci',
	`count_category` BIGINT(21) NOT NULL,
	`category` VARCHAR(100) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Дамп структуры для таблица books.book_category
CREATE TABLE IF NOT EXISTS `book_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_book` (`book_id`),
  KEY `FK_category` (`category_id`),
  CONSTRAINT `FK_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Реализация связи Многие ко многим';

-- Дамп данных таблицы books.book_category: ~70 rows (приблизительно)
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` (`id`, `book_id`, `category_id`) VALUES
	(1, 1, 1),
	(2, 1, 4),
	(3, 1, 6),
	(4, 2, 1),
	(5, 2, 6),
	(6, 2, 7),
	(7, 2, 8),
	(8, 2, 10),
	(9, 3, 1),
	(10, 3, 6),
	(11, 3, 7),
	(12, 3, 8),
	(13, 3, 9),
	(14, 4, 1),
	(15, 4, 6),
	(16, 4, 7),
	(17, 4, 8),
	(18, 4, 9),
	(19, 5, 1),
	(20, 5, 2),
	(21, 5, 3),
	(22, 5, 4),
	(23, 5, 5),
	(24, 5, 6),
	(25, 5, 7),
	(26, 5, 8),
	(27, 5, 9),
	(28, 5, 10),
	(29, 6, 1),
	(30, 6, 2),
	(31, 6, 3),
	(32, 6, 4),
	(33, 6, 5),
	(34, 6, 6),
	(35, 6, 7),
	(36, 6, 8),
	(37, 6, 9),
	(38, 6, 10),
	(39, 7, 1),
	(40, 7, 2),
	(41, 7, 3),
	(42, 7, 4),
	(43, 7, 5),
	(44, 7, 6),
	(45, 7, 7),
	(46, 7, 8),
	(47, 7, 9),
	(48, 7, 10),
	(49, 8, 1),
	(50, 8, 2),
	(51, 8, 3),
	(52, 8, 4),
	(53, 8, 5),
	(54, 8, 6),
	(55, 8, 7),
	(56, 8, 8),
	(57, 8, 9),
	(58, 8, 10),
	(59, 9, 1),
	(60, 9, 2),
	(61, 9, 3),
	(62, 9, 4),
	(63, 9, 5),
	(64, 9, 6),
	(65, 9, 7),
	(66, 9, 8),
	(67, 9, 9),
	(68, 9, 10),
	(69, 10, 1),
	(70, 10, 2);
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;

-- Дамп структуры для таблица books.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Категории книг';

-- Дамп данных таблицы books.categories: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Классика', '2020-06-08 22:25:46', '2020-06-08 22:25:46', NULL),
	(2, 'Кулинария', '2020-06-08 22:25:46', '2020-06-08 22:25:46', NULL),
	(3, 'Техническая литература', '2020-06-08 22:25:46', '2020-06-08 22:25:46', NULL),
	(4, 'Фантастика', '2020-06-08 22:25:46', '2020-06-08 22:25:46', NULL),
	(5, 'Сказки', '2020-06-08 22:25:46', '2020-06-08 22:25:46', NULL),
	(6, 'Романы', '2020-06-08 22:25:46', '2020-06-08 22:25:46', NULL),
	(7, 'Историческая литература', '2020-06-08 22:25:46', '2020-06-08 22:25:46', NULL),
	(8, 'Художественная литература', '2020-06-08 22:25:46', '2020-06-08 22:25:46', NULL),
	(9, 'Научная литература', '2020-06-08 22:25:46', '2020-06-08 22:25:46', NULL),
	(10, 'Творчество', '2020-06-08 22:25:47', '2020-06-08 22:25:47', NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Дамп структуры для таблица books.covers
CREATE TABLE IF NOT EXISTS `covers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Типы обложек';

-- Дамп данных таблицы books.covers: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `covers` DISABLE KEYS */;
INSERT INTO `covers` (`id`, `name`) VALUES
	(1, 'Мягкая'),
	(2, 'Твердая');
/*!40000 ALTER TABLE `covers` ENABLE KEYS */;

-- Дамп структуры для таблица books.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы books.migrations: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(11, '2014_10_12_000000_create_users_table', 1),
	(12, '2014_10_12_100000_create_password_resets_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Дамп структуры для таблица books.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы books.password_resets: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Дамп структуры для таблица books.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы books.users: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Дамп структуры для представление books.books_select
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `books_select`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `books_select` AS select `t2`.`book_id` AS `id`,`t1`.`name` AS `books` from (`books` `t1` left join `book_category` `t2` on(`t1`.`id` = `t2`.`book_id`)) where `t1`.`cover_id` = 2 and `t1`.`circulation` >= 5000 group by `t2`.`book_id` having count(`t2`.`category_id`) >= 3 order by `t2`.`book_id`,`t1`.`name`;

-- Дамп структуры для представление books.books_select_two
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `books_select_two`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `books_select_two` AS select `t1`.`id` AS `book_id`,`t1`.`name` AS `book`,count(`t2`.`category_id`) AS `count_category`,`t3`.`name` AS `category` from ((`books` `t1` left join `book_category` `t2` on(`t1`.`id` = `t2`.`book_id`)) left join `categories` `t3` on(`t3`.`id` = `t2`.`category_id`)) group by `t2`.`book_id` having count(`t2`.`category_id`) >= 10 and `t2`.`book_id` in (select distinct `c1`.`book_id` from `book_category` `c1` group by `c1`.`book_id` having count(`c1`.`category_id`) >= 3) order by `t1`.`id`,`t1`.`name`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
