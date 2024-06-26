-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 26 2024 г., 10:10
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_korneychuk7930_library`
--

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'Корнейчук', 'Никита', 'kornejchuknikita_ns@edu.surgu.ru', 'password'),
(2, 'Иванов', 'Иван', 'ivanov_ii@edu.surgu.ru', 'password1'),
(3, 'Гатиятов', 'Данил', 'gatiyatov_dd@edu.surgu.ru', 'password2');

-- --------------------------------------------------------

--
-- Структура таблицы `Выдача`
--

CREATE TABLE `Выдача` (
  `ID` int(11) NOT NULL,
  `id_экземпляра` int(11) NOT NULL,
  `id_читателя` int(11) NOT NULL,
  `дата` date NOT NULL,
  `дата_возврата_план` date NOT NULL,
  `дата_возврата_факт` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Выдача`
--

INSERT INTO `Выдача` (`ID`, `id_экземпляра`, `id_читателя`, `дата`, `дата_возврата_план`, `дата_возврата_факт`) VALUES
(200, 1000, 102, '2024-02-20', '2024-04-20', '2024-03-20'),
(201, 1001, 103, '2024-02-15', '2024-02-29', '2024-02-16'),
(202, 1003, 100, '2014-02-07', '2014-02-28', '2014-03-01'),
(203, 1002, 104, '1910-02-16', '1910-04-16', '1991-03-25'),
(204, 1004, 101, '2024-02-15', '2024-04-15', '2024-04-15'),
(205, 1005, 101, '2024-04-30', '2024-05-29', '2024-05-29'),
(206, 1006, 100, '2024-05-30', '2024-06-29', '2024-06-25'),
(207, 1007, 102, '2024-05-30', '2024-06-29', '2024-06-25'),
(208, 1008, 103, '2024-05-29', '2024-06-29', '2024-06-29'),
(209, 1009, 104, '2024-05-28', '2024-06-28', '2024-06-29'),
(210, 1010, 103, '2024-05-27', '2024-06-27', NULL),
(211, 1003, 100, '2024-05-27', '2024-06-20', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Издание`
--

CREATE TABLE `Издание` (
  `ID` int(25) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Author` varchar(20) CHARACTER SET utf8 NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Издание`
--

INSERT INTO `Издание` (`ID`, `name`, `Author`, `image`, `id_user`) VALUES
(1, 'Лолита', 'Владимир Набоков', 'https://cdn.azbooka.ru/cv/w1100/bf30631f-9d33-4dea-8324-1a96cbd66436.jpg', 1),
(2, 'Диалоги', 'Алексей Карманный', 'https://meduza.io/image/attachments/images/000/015/634/large/HMrgbqVH3oYXVvEc37hTEQ.jpg', 2),
(3, 'Война и Мир', 'Лев Толстой', 'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/ecbb3822-ee34-42f6-8480-e0920b41a050/600x900', 3),
(4, 'Капитал', 'Карл Маркс', 'https://img3.labirint.ru/rc/0d6f999146aa2ea7fd8390c9f2a87e4e/363x561q80/books69/684097/cover.jpg?1686677874', 1),
(5, 'Мастер и Маргарита', 'Михаил Булгаков', 'https://img3.labirint.ru/rc/1927058a57537edd854803f93079075d/363x561q80/books67/668307/cover.jpg?1618673120', 2),
(6, 'Собачье сердце', 'Михаил Булгаков', 'https://ir.ozone.ru/s3/multimedia-2/c1000/6443697230.jpg', 3),
(7, 'Рукописи не горят', 'Михаил Булгаков', 'https://ir.ozone.ru/multimedia/c1000/1008452999.jpg', 1),
(8, 'Белая гвардия', 'Михаил Булгаков', 'https://img3.labirint.ru/rc/a17ad865b3f633beae79abb10b8aa1da/363x561q80/books49/486539/cover.jpg?1612679202', 2),
(9, 'Приглашение на казнь', 'Владимир Набоков', 'https://img3.labirint.ru/rc/3a91c30055b5021bcfa7c343118d6f5d/363x561q80/books21/209437/cover.jpg?1373012715', 3),
(10, 'Отчаяние', 'Владимир Набоков', 'https://cdn.azbooka.ru/cv/w1100/b2eacacf-afce-468c-9496-272e18358faa.jpg', 1),
(11, 'Нищета философии', 'Карл Маркс', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBF2nfQUNuEYSBUn3VTRhCXG7XvpHjTMZ3kA&s', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Читатель`
--

CREATE TABLE `Читатель` (
  `ID` int(11) NOT NULL,
  `ФИО` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Читатель`
--

INSERT INTO `Читатель` (`ID`, `ФИО`) VALUES
(100, 'Айфонский Петрович'),
(101, 'Данил Гатиятов'),
(102, 'Владислав Яворский'),
(103, 'Ольга Хохлова'),
(104, 'Денис Лысенко');

-- --------------------------------------------------------

--
-- Структура таблицы `Экземпляр`
--

CREATE TABLE `Экземпляр` (
  `ID` int(11) NOT NULL,
  `ID_издания` int(11) NOT NULL,
  `Коэффициент_износа` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Экземпляр`
--

INSERT INTO `Экземпляр` (`ID`, `ID_издания`, `Коэффициент_износа`) VALUES
(1000, 3, 0.8),
(1001, 2, 0.68),
(1002, 4, 0.76),
(1003, 1, 1),
(1004, 5, 0.91),
(1005, 6, 0.9),
(1006, 7, 0.67),
(1007, 8, 0.95),
(1008, 9, 0.59),
(1009, 10, 0.78),
(1010, 11, 0.81),
(1011, 11, 1),
(1012, 7, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `Выдача`
--
ALTER TABLE `Выдача`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_читателя` (`id_читателя`),
  ADD KEY `id_экземпляра` (`id_экземпляра`) USING BTREE;

--
-- Индексы таблицы `Издание`
--
ALTER TABLE `Издание`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `Читатель`
--
ALTER TABLE `Читатель`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Экземпляр`
--
ALTER TABLE `Экземпляр`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_издания` (`ID_издания`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Выдача`
--
ALTER TABLE `Выдача`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT для таблицы `Издание`
--
ALTER TABLE `Издание`
  MODIFY `ID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Читатель`
--
ALTER TABLE `Читатель`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT для таблицы `Экземпляр`
--
ALTER TABLE `Экземпляр`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1013;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Выдача`
--
ALTER TABLE `Выдача`
  ADD CONSTRAINT `Выдача_ibfk_2` FOREIGN KEY (`id_читателя`) REFERENCES `Читатель` (`ID`),
  ADD CONSTRAINT `Выдача_ibfk_3` FOREIGN KEY (`id_экземпляра`) REFERENCES `Экземпляр` (`ID`);

--
-- Ограничения внешнего ключа таблицы `Издание`
--
ALTER TABLE `Издание`
  ADD CONSTRAINT `издание_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `Экземпляр`
--
ALTER TABLE `Экземпляр`
  ADD CONSTRAINT `экземпляр_ibfk_1` FOREIGN KEY (`ID_издания`) REFERENCES `Издание` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
