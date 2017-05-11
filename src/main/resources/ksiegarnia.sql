-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 11 Maj 2017, 10:22
-- Wersja serwera: 10.1.19-MariaDB
-- Wersja PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ksiegarnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `idklienta` bigint(20) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `rola` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`idklienta`, `adres`, `email`, `enabled`, `haslo`, `imie`, `nazwisko`, `rola`) VALUES
(1, 'Bialystok', 'uzytkownik@gmail.com', b'1', '$2a$12$vRT/I2JY/lLCzPq.DOkfnOhFURCVz5YcgP2G7EsdERaIN6CLytjY6', 'uzytkownik', 'uzytkownik', 'ROLE_USER'),
(2, 'Bialystok', 'uzytkownik2@gmail.com', b'1', '$2a$12$1qwweIlFuNUKVSJPK.gws.8DZSfYaZqo/lSO0gZvPY1J9zTSFixoC', 'uzytkownik2', 'uzytkownik2', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `idksiazki` int(11) NOT NULL,
  `cena` float NOT NULL,
  `ilosc` int(11) NOT NULL,
  `imieautora` varchar(255) DEFAULT NULL,
  `nazwiskoautora` varchar(255) DEFAULT NULL,
  `tytul` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`idksiazki`, `cena`, `ilosc`, `imieautora`, `nazwiskoautora`, `tytul`) VALUES
(1, 47.29, 44, 'Jan', 'Michalak', 'Zaawansowane programowanie w PHP'),
(2, 49.99, 23, 'Andrzej', 'Krawczyk', 'Windows 8 PL. Zaawansowana administracja systemem'),
(3, 53.65, 12, 'Pawe?', 'Jakubowski', 'HTML5. Tworzenie witryn'),
(4, 34.15, 13, 'Tomasz', 'Kowalski', 'Urz?dzenia techniki komputerowej'),
(5, 29.99, 22, '?ukasz', 'Pasternak', 'PHP. Tworzenie nowoczesnych stron WWW');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orderitem`
--

CREATE TABLE `orderitem` (
  `id` bigint(20) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `zamowienie_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `orderitem`
--

INSERT INTO `orderitem` (`id`, `ilosc`, `book_id`, `zamowienie_id`) VALUES
(1, 3, 3, 1),
(2, 5, 4, 1),
(3, 2, 5, 1),
(4, 5, 1, 2),
(5, 4, 5, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` bigint(20) NOT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `cena` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `uwagi` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `adres`, `cena`, `status`, `uwagi`, `user_id`) VALUES
(1, 'Bialystok', 391.6800117492676, 'oczekujace', 'brak', 1),
(2, 'Bialystok', 356.4100112915039, 'oczekujace', 'brak', 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`idklienta`);

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`idksiazki`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_90ex5rur8xrrm5so68o0be8lt` (`book_id`),
  ADD KEY `FK_5qpbj1thxq1djgbyacvh413gg` (`zamowienie_id`);

--
-- Indexes for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_7yvhkgjvxh7fadvuowxcu7pjs` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `idklienta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `idksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `FK_5qpbj1thxq1djgbyacvh413gg` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienia` (`id`),
  ADD CONSTRAINT `FK_90ex5rur8xrrm5so68o0be8lt` FOREIGN KEY (`book_id`) REFERENCES `ksiazki` (`idksiazki`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `FK_7yvhkgjvxh7fadvuowxcu7pjs` FOREIGN KEY (`user_id`) REFERENCES `klienci` (`idklienta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
