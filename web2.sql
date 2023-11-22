-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 08. 18:11
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `web2`
--

CREATE DATABASE IF NOT EXISTS `web2` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `web2`;
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
                                `id` int(10) UNSIGNED NOT NULL,
                                `csaladi_nev` varchar(45) NOT NULL DEFAULT '',
                                `utonev` varchar(45) NOT NULL DEFAULT '',
                                `bejelentkezes` varchar(12) NOT NULL DEFAULT '',
                                `jelszo` varchar(40) NOT NULL DEFAULT '',
                                `jogosultsag` varchar(3) NOT NULL DEFAULT '_1_'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `csaladi_nev`, `utonev`, `bejelentkezes`, `jelszo`, `jogosultsag`) VALUES
                                                                                                         (1, 'Rendszer', 'Admin', 'Admin', sha1('admin'), '__1'),
                                                                                                         (2, 'VTeszt', 'UTeszt', 'teszt', sha1('teszt1'), '_1_');



-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hir`
--

CREATE TABLE `hir` (
                       `id` int(11) NOT NULL,
                       `cim` varchar(100) NOT NULL,
                       `bevezeto` varchar(2000) NOT NULL,
                       `torzs` mediumtext NOT NULL,
                       `ido` timestamp NOT NULL DEFAULT current_timestamp(),
                       `felhasznalo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `hir`
--

INSERT INTO `hir` (`id`, `cim`, `bevezeto`, `torzs`, `ido`, `felhasznalo_id`) VALUES
                                                                                  (1, 'Lehetőség', 'Befektetőket keresünk', 'LEHETŐSÉG  ! Ha esetleg szeretnél részese lenni egy olyan cégnek, amely tesz is a jövőért, akkor ez a te lehetőséged! \r\Befektetőket keresünk vidéki terjeszkedéshez. ', '2023-11-22 18:55:38', 1),
                                                                                  (2, 'Elégedettség', 'Elégedettség a hulladékudvarainkról', 'Azért nyitottam ezt a topicot, hogy mindenki elmondhassa a véleményét a különböző udvarainkról.  \r\Esetleg meg tudjátok osztani, hogy mennyire kedvesek alkalmazottaink! ', '2023-11-19 18:58:20', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu`
--

CREATE TABLE `menu` (
                        `url` varchar(30) NOT NULL,
                        `nev` varchar(30) NOT NULL,
                        `szulo` varchar(30) NOT NULL,
                        `jogosultsag` varchar(3) NOT NULL,
                        `sorrend` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `menu`
--

INSERT INTO `menu` (`url`, `nev`, `szulo`, `jogosultsag`, `sorrend`) VALUES
                                                                         ('admin', 'Admin', '', '001', 80),
                                                                         ('belepes', 'Belépés', '', '100', 60),
                                                                         ('udvarok', 'Udvarok', '', '011', 20),
                                                                         ('mnb', 'MNB árfolyam', '', '111', 20),
                                                                         ('kilepes', 'Kilépés', '', '011', 70),
                                                                         ('hirek', 'Hírek', '', '011', 20),
                                                                         ('nyitolap', 'Kezdőoldal', '', '111', 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hely`
--

CREATE TABLE `hely` (
                          `id` int(255) NOT NULL,
                          `kerulet` varchar(255) NOT NULL,
                          `cim` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `hely`
--

INSERT INTO `hely` (`id`, `kerulet`, `cim`) VALUES
                                                  ('1',	'III.',	'Testvérhegyi út 10/a'),
                                                  ('2',	'IV.',	'Ugró Gyula sor 1-3.'),
                                                  ('3',	'IV.',	'Zichy Mihály utca - Istvántelki út sarok'),
                                                  ('4',	'VIII.',	'Sárkány utca 5.'),
                                                  ('5',	'IX.',	'Ecseri út 9.'),
                                                  ('6',	'X.',	'Fehér köz 2.'),
                                                  ('7',	'XI.',	'Bánk bán utca 8-10.'),
                                                  ('8',	'XIII.',	'Tatai út 96.'),
                                                  ('9',	'XIV.',	'Füredi út 74.'),
                                                  ('10',	'XV.',	'Károlyi Sándor út 166.'),
                                                  ('11',	'XV.',	'Zsókavár utca 65. szám után'),
                                                  ('12',	'XVI.',	'Csömöri út 2-4.'),
                                                  ('13',	'XVII.',	'Gyökér köz 4.'),
                                                  ('14',	'XVIII.',	'Jegenye fasor 15. mellett'),
                                                  ('15',	'XVIII.',	'Besence utca 1/a.'),
                                                  ('16',	'XXI.',	'Mansfeld Péter utca 86.'),
                                                  ('17',	'XXII.',	'Nagytétényi út 341-343.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fajta`
--

CREATE TABLE `fajta` (
                                   `id` int(11) NOT NULL,
                                   `nev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `fajta`
--

INSERT INTO `fajta` (`id`, `nev`) VALUES
                                      ('1',	'műanyag és fém'),
                                      ('2',	'papír'),
                                      ('3',	'italoskarton'),
                                      ('4',	'színes üveg'),
                                      ('5',	'fehér üveg'),
                                      ('6',	'hungarocell'),
                                      ('7',	'elem'),
                                      ('8',	'akkumulátor'),
                                      ('9',	'elektronikai hulladék'),
                                      ('10',	'elektromos hulladék'),
                                      ('11',	'fénycső, világítótest'),
                                      ('12',	'fáradtolaj'),
                                      ('13',	'étolaj'),
                                      ('14',	'használtruha'),
                                      ('15',	'zöldhulladék'),
                                      ('16',	'építési, bontási törmelék'),
                                      ('17',	'festék'),
                                      ('18',	'gumiabroncs'),
                                      ('19',	'lom');
;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyujt`
--

CREATE TABLE `gyujt` (
                            `helyid` int(11) NOT NULL,
                            `fajtaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `gyujt`
--

INSERT INTO `gyujt` (`helyid`, `fajtaid`) VALUES
                                              ('1',	'1'),
                                              ('1',	'2'),
                                              ('1',	'3'),
                                              ('1',	'4'),
                                              ('1',	'5'),
                                              ('1',	'6'),
                                              ('1',	'7'),
                                              ('1',	'8'),
                                              ('1',	'9'),
                                              ('1',	'10'),
                                              ('1',	'11'),
                                              ('1',	'12'),
                                              ('1',	'13'),
                                              ('1',	'14'),
                                              ('2',	'1'),
                                              ('2',	'2'),
                                              ('2',	'3'),
                                              ('2',	'4'),
                                              ('2',	'5'),
                                              ('2',	'6'),
                                              ('2',	'7'),
                                              ('2',	'8'),
                                              ('2',	'9'),
                                              ('2',	'10'),
                                              ('2',	'11'),
                                              ('2',	'12'),
                                              ('2',	'13'),
                                              ('2',	'14'),
                                              ('3',	'1'),
                                              ('3',	'2'),
                                              ('3',	'3'),
                                              ('3',	'4'),
                                              ('3',	'5'),
                                              ('3',	'6'),
                                              ('3',	'7'),
                                              ('3',	'8'),
                                              ('3',	'9'),
                                              ('3',	'10'),
                                              ('3',	'11'),
                                              ('3',	'12'),
                                              ('3',	'13'),
                                              ('3',	'14'),
                                              ('4',	'1'),
                                              ('4',	'2'),
                                              ('4',	'3'),
                                              ('4',	'4'),
                                              ('4',	'5'),
                                              ('4',	'6'),
                                              ('4',	'7'),
                                              ('4',	'8'),
                                              ('4',	'9'),
                                              ('4',	'10'),
                                              ('4',	'11'),
                                              ('4',	'12'),
                                              ('4',	'13'),
                                              ('4',	'14'),
                                              ('5',	'1'),
                                              ('5',	'2'),
                                              ('5',	'3'),
                                              ('5',	'4'),
                                              ('5',	'5'),
                                              ('5',	'6'),
                                              ('5',	'7'),
                                              ('5',	'8'),
                                              ('5',	'9'),
                                              ('5',	'10'),
                                              ('5',	'11'),
                                              ('5',	'12'),
                                              ('5',	'13'),
                                              ('5',	'14'),
                                              ('6',	'1'),
                                              ('6',	'2'),
                                              ('6',	'3'),
                                              ('6',	'4'),
                                              ('6',	'5'),
                                              ('6',	'6'),
                                              ('6',	'7'),
                                              ('6',	'8'),
                                              ('6',	'9'),
                                              ('6',	'10'),
                                              ('6',	'11'),
                                              ('6',	'12'),
                                              ('6',	'13'),
                                              ('6',	'14'),
                                              ('7',	'1'),
                                              ('7',	'2'),
                                              ('7',	'3'),
                                              ('7',	'4'),
                                              ('7',	'5'),
                                              ('7',	'6'),
                                              ('7',	'7'),
                                              ('7',	'8'),
                                              ('7',	'9'),
                                              ('7',	'10'),
                                              ('7',	'11'),
                                              ('7',	'12'),
                                              ('7',	'13'),
                                              ('7',	'14'),
                                              ('8',	'1'),
                                              ('8',	'2'),
                                              ('8',	'3'),
                                              ('8',	'4'),
                                              ('8',	'5'),
                                              ('8',	'6'),
                                              ('8',	'7'),
                                              ('8',	'8'),
                                              ('8',	'9'),
                                              ('8',	'10'),
                                              ('8',	'11'),
                                              ('8',	'12'),
                                              ('8',	'13'),
                                              ('8',	'14'),
                                              ('9',	'1'),
                                              ('9',	'2'),
                                              ('9',	'3'),
                                              ('9',	'4'),
                                              ('9',	'5'),
                                              ('9',	'6'),
                                              ('9',	'7'),
                                              ('9',	'8'),
                                              ('9',	'9'),
                                              ('9',	'10'),
                                              ('9',	'11'),
                                              ('9',	'12'),
                                              ('9',	'13'),
                                              ('9',	'14'),
                                              ('10',	'1'),
                                              ('10',	'2'),
                                              ('10',	'3'),
                                              ('10',	'4'),
                                              ('10',	'5'),
                                              ('10',	'6'),
                                              ('10',	'7'),
                                              ('10',	'8'),
                                              ('10',	'9'),
                                              ('10',	'10'),
                                              ('10',	'11'),
                                              ('10',	'12'),
                                              ('10',	'13'),
                                              ('10',	'14'),
                                              ('10',	'15'),
                                              ('10',	'16'),
                                              ('10',	'17'),
                                              ('10',	'18'),
                                              ('10',	'19'),
                                              ('11',	'1'),
                                              ('11',	'2'),
                                              ('11',	'3'),
                                              ('11',	'4'),
                                              ('11',	'5'),
                                              ('11',	'6'),
                                              ('11',	'7'),
                                              ('11',	'8'),
                                              ('11',	'9'),
                                              ('11',	'10'),
                                              ('11',	'11'),
                                              ('11',	'12'),
                                              ('11',	'13'),
                                              ('11',	'14'),
                                              ('12',	'1'),
                                              ('12',	'2'),
                                              ('12',	'3'),
                                              ('12',	'4'),
                                              ('12',	'5'),
                                              ('12',	'6'),
                                              ('12',	'7'),
                                              ('12',	'8'),
                                              ('12',	'9'),
                                              ('12',	'10'),
                                              ('12',	'11'),
                                              ('12',	'12'),
                                              ('12',	'13'),
                                              ('12',	'14'),
                                              ('13',	'1'),
                                              ('13',	'2'),
                                              ('13',	'3'),
                                              ('13',	'4'),
                                              ('13',	'5'),
                                              ('13',	'6'),
                                              ('13',	'7'),
                                              ('13',	'8'),
                                              ('13',	'9'),
                                              ('13',	'10'),
                                              ('13',	'11'),
                                              ('13',	'12'),
                                              ('13',	'13'),
                                              ('13',	'14'),
                                              ('14',	'1'),
                                              ('14',	'2'),
                                              ('14',	'3'),
                                              ('14',	'4'),
                                              ('14',	'5'),
                                              ('14',	'6'),
                                              ('14',	'7'),
                                              ('14',	'8'),
                                              ('14',	'9'),
                                              ('14',	'10'),
                                              ('14',	'11'),
                                              ('14',	'12'),
                                              ('14',	'13'),
                                              ('14',	'14'),
                                              ('14',	'15'),
                                              ('14',	'16'),
                                              ('15',	'1'),
                                              ('15',	'2'),
                                              ('15',	'3'),
                                              ('15',	'4'),
                                              ('15',	'5'),
                                              ('15',	'6'),
                                              ('15',	'7'),
                                              ('15',	'8'),
                                              ('15',	'9'),
                                              ('15',	'10'),
                                              ('15',	'11'),
                                              ('15',	'12'),
                                              ('15',	'13'),
                                              ('15',	'14'),
                                              ('15',	'19'),
                                              ('16',	'1'),
                                              ('16',	'2'),
                                              ('16',	'3'),
                                              ('16',	'4'),
                                              ('16',	'5'),
                                              ('16',	'6'),
                                              ('16',	'7'),
                                              ('16',	'8'),
                                              ('16',	'9'),
                                              ('16',	'10'),
                                              ('16',	'11'),
                                              ('16',	'12'),
                                              ('16',	'13'),
                                              ('16',	'14'),
                                              ('17',	'1'),
                                              ('17',	'2'),
                                              ('17',	'3'),
                                              ('17',	'4'),
                                              ('17',	'5'),
                                              ('17',	'6'),
                                              ('17',	'7'),
                                              ('17',	'8'),
                                              ('17',	'9'),
                                              ('17',	'10'),
                                              ('17',	'11'),
                                              ('17',	'12'),
                                              ('17',	'13'),
                                              ('17',	'14'),
                                              ('17',	'15'),
                                              ('17',	'16'),
                                              ('17',	'17'),
                                              ('17',	'18'),
                                              ('17',	'19');


--
-- Tábla szerkezet ehhez a táblához `velemeny`
--

CREATE TABLE `velemeny` (
                            `id` int(11) NOT NULL,
                            `torzs` mediumtext NOT NULL,
                            `ido` timestamp NOT NULL DEFAULT current_timestamp(),
                            `hir_id` int(11) NOT NULL,
                            `felhasznalo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `velemeny`
--

INSERT INTO `velemeny` (`id`, `torzs`, `ido`, `hir_id`, `felhasznalo_id`) VALUES
                                                                              (1, 'Engem érdekelne, van egy telkem Kecskemét közelében!', '2023-11-26 20:44:01', 1, 2);





-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
    ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `hir`
--
ALTER TABLE `hir`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ido` (`ido`);

--
-- A tábla indexei `menu`
--
ALTER TABLE `menu`
    ADD PRIMARY KEY (`url`);

--
-- A tábla indexei `hely`
--
ALTER TABLE `hely`
    ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `fajta`
--
ALTER TABLE `fajta`
    ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `velemeny`
--

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `hir`
--
ALTER TABLE `hir`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT a táblához `velemeny`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
