-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Фев 15 2024 г., 14:44
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

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
-- Структура таблицы `Выдача`
--

CREATE TABLE `Выдача` (
  `ID` int NOT NULL,
  `id_экземпляра` int NOT NULL,
  `id_читателя` int NOT NULL,
  `дата` date NOT NULL,
  `дата_возврата (план)` date NOT NULL,
  `дата_возврата (факт)` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Выдача`
--

INSERT INTO `Выдача` (`ID`, `id_экземпляра`, `id_читателя`, `дата`, `дата_возврата (план)`, `дата_возврата (факт)`) VALUES
(200, 1000, 102, '2024-02-20', '2024-04-20', '2024-03-20'),
(201, 1001, 103, '2024-02-15', '2024-02-29', '2024-02-16'),
(202, 1003, 100, '2014-02-07', '2014-02-28', '2014-03-01'),
(203, 1002, 104, '1910-02-16', '1910-04-16', '1991-03-25'),
(204, 1004, 101, '2024-02-15', '2024-04-15', '2024-04-15');

-- --------------------------------------------------------

--
-- Структура таблицы `Издание`
--

CREATE TABLE `Издание` (
  `ID` int NOT NULL,
  `Наименование` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `Автор` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Издание`
--

INSERT INTO `Издание` (`ID`, `Наименование`, `Автор`) VALUES
(10, 'Лолита', 'Владимир Набоков'),
(11, 'Диалоги', 'Алексей карНавальный'),
(12, 'Курочка Ряба', 'Алексей Степан'),
(13, 'Капитал', 'Карл Маркс'),
(14, 'Рецепт Бижбармака', 'Башкири feat. Татары');

-- --------------------------------------------------------

--
-- Структура таблицы `Читатель`
--

CREATE TABLE `Читатель` (
  `ID` int NOT NULL,
  `ФИО` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `ID` int NOT NULL,
  `ID_издания` int NOT NULL,
  `Коэффициент_износа` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Экземпляр`
--

INSERT INTO `Экземпляр` (`ID`, `ID_издания`, `Коэффициент_износа`) VALUES
(1000, 12, 0.8),
(1001, 11, 0.68),
(1002, 13, 0.76),
(1003, 10, 1),
(1004, 14, 0.91);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Выдача`
--
ALTER TABLE `Выдача`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_экземпляра` (`id_экземпляра`),
  ADD KEY `id_читателя` (`id_читателя`);

--
-- Индексы таблицы `Издание`
--
ALTER TABLE `Издание`
  ADD PRIMARY KEY (`ID`);

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
  ADD KEY `ID_издания` (`ID_издания`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Выдача`
--
ALTER TABLE `Выдача`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT для таблицы `Издание`
--
ALTER TABLE `Издание`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Читатель`
--
ALTER TABLE `Читатель`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT для таблицы `Экземпляр`
--
ALTER TABLE `Экземпляр`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Выдача`
--
ALTER TABLE `Выдача`
  ADD CONSTRAINT `Выдача_ibfk_1` FOREIGN KEY (`id_экземпляра`) REFERENCES `Экземпляр` (`ID`),
  ADD CONSTRAINT `Выдача_ibfk_2` FOREIGN KEY (`id_читателя`) REFERENCES `Читатель` (`ID`);

--
-- Ограничения внешнего ключа таблицы `Экземпляр`
--
ALTER TABLE `Экземпляр`
  ADD CONSTRAINT `Экземпляр_ibfk_1` FOREIGN KEY (`ID_издания`) REFERENCES `Издание` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
