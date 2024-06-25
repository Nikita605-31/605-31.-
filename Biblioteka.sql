-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Июн 25 2024 г., 10:45
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
(1004, 14, 0.91),
(1005, 15, 0.9),
(1006, 16, 0.67),
(1007, 17, 0.95),
(1008, 18, 0.59),
(1009, 19, 0.78),
(1010, 20, 0.81),
(1011, 20, 1),
(1012, 16, 1);

--
-- Индексы сохранённых таблиц
--

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
-- AUTO_INCREMENT для таблицы `Экземпляр`
--
ALTER TABLE `Экземпляр`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1013;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Экземпляр`
--
ALTER TABLE `Экземпляр`
  ADD CONSTRAINT `Экземпляр_ibfk_1` FOREIGN KEY (`ID_издания`) REFERENCES `Издание` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
