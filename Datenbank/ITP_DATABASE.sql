-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server-Version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server-Betriebssystem:        Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank-Struktur für funrest
CREATE DATABASE IF NOT EXISTS `funrest` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `funrest`;

-- Exportiere Struktur von Tabelle funrest.buchungen_tisch
CREATE TABLE IF NOT EXISTS `buchungen_tisch` (
  `Buchungen_TischID` int(11) NOT NULL AUTO_INCREMENT,
  `TischID` int(11) DEFAULT NULL,
  `KundeID` int(11) DEFAULT NULL,
  `MitarbeiterID` int(11) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  `Stoniert` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Buchungen_TischID`),
  KEY `TischID` (`TischID`),
  KEY `KundeID` (`KundeID`),
  KEY `MitarbeiterID` (`MitarbeiterID`),
  CONSTRAINT `buchungen_tisch_ibfk_1` FOREIGN KEY (`TischID`) REFERENCES `restaurant_tische` (`TischID`),
  CONSTRAINT `buchungen_tisch_ibfk_2` FOREIGN KEY (`KundeID`) REFERENCES `kunde` (`KundeID`),
  CONSTRAINT `buchungen_tisch_ibfk_3` FOREIGN KEY (`MitarbeiterID`) REFERENCES `mitarbeiter` (`MitarbeiterID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.buchungen_tisch: ~14 rows (ungefähr)
INSERT INTO `buchungen_tisch` (`Buchungen_TischID`, `TischID`, `KundeID`, `MitarbeiterID`, `Zeitpunkt`, `Stoniert`) VALUES
	(1, 3, 4, 5, '2025-12-12 00:00:00', 0),
	(2, 13, 4, 5, '2025-12-12 00:00:00', 0),
	(3, 23, 4, 5, '2025-12-12 00:00:00', 0),
	(4, 33, 4, 5, '2025-12-12 00:00:00', 0),
	(5, 2, 4, 5, '2025-12-12 00:00:00', 0),
	(6, 7, 4, 5, '2025-12-12 00:00:00', 0),
	(7, 9, 4, 5, '2025-12-12 00:00:00', 0),
	(8, 12, 4, 5, '2025-12-12 00:00:00', 0),
	(9, 17, 4, 5, '2025-12-12 00:00:00', 0),
	(10, 19, 4, 5, '2025-12-12 00:00:00', 0),
	(11, 22, 4, 5, '2025-12-12 00:00:00', 0),
	(12, 27, 4, 5, '2025-12-12 00:00:00', 0),
	(13, 32, 4, 5, '2025-12-12 00:00:00', 0),
	(14, 37, 4, 5, '2025-12-12 00:00:00', 0);

-- Exportiere Struktur von Tabelle funrest.buchungen_zimmer
CREATE TABLE IF NOT EXISTS `buchungen_zimmer` (
  `Buchungen_ZimmerID` int(11) NOT NULL AUTO_INCREMENT,
  `ZimmerID` int(11) DEFAULT NULL,
  `KundeID` int(11) DEFAULT NULL,
  `MitarbeiterID` int(11) DEFAULT NULL,
  `RechnungID` int(11) DEFAULT NULL,
  `Anreise` datetime DEFAULT NULL,
  `Abreise` datetime DEFAULT NULL,
  `Storniert` tinyint(1) DEFAULT NULL,
  `Gezahlt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Buchungen_ZimmerID`),
  KEY `ZimmerID` (`ZimmerID`),
  KEY `KundeID` (`KundeID`),
  KEY `MitarbeiterID` (`MitarbeiterID`),
  KEY `RechnungID` (`RechnungID`),
  CONSTRAINT `buchungen_zimmer_ibfk_1` FOREIGN KEY (`ZimmerID`) REFERENCES `zimmer` (`ZimmerID`),
  CONSTRAINT `buchungen_zimmer_ibfk_2` FOREIGN KEY (`KundeID`) REFERENCES `kunde` (`KundeID`),
  CONSTRAINT `buchungen_zimmer_ibfk_3` FOREIGN KEY (`MitarbeiterID`) REFERENCES `mitarbeiter` (`MitarbeiterID`),
  CONSTRAINT `buchungen_zimmer_ibfk_4` FOREIGN KEY (`RechnungID`) REFERENCES `rechnungen` (`RechnungID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.buchungen_zimmer: ~1 rows (ungefähr)
INSERT INTO `buchungen_zimmer` (`Buchungen_ZimmerID`, `ZimmerID`, `KundeID`, `MitarbeiterID`, `RechnungID`, `Anreise`, `Abreise`, `Storniert`, `Gezahlt`) VALUES
	(1, 2, 2, 11, 1, '2025-03-20 00:00:00', '2025-03-25 00:00:00', 0, 0);

-- Exportiere Struktur von Tabelle funrest.kunde
CREATE TABLE IF NOT EXISTS `kunde` (
  `KundeID` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(50) DEFAULT NULL,
  `Nachname` varchar(50) DEFAULT NULL,
  `Geschlecht` varchar(50) DEFAULT NULL,
  `Geburtsdatum` date DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `Straße` varchar(50) DEFAULT NULL,
  `PLZ` varchar(50) DEFAULT NULL,
  `Hausnummer` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Stammgast` tinyint(1) DEFAULT NULL,
  `Passwort` varchar(100) DEFAULT NULL,
  `Gast` tinyint(1) DEFAULT NULL,
  `Anrede` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`KundeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.kunde: ~10 rows (ungefähr)
INSERT INTO `kunde` (`KundeID`, `Vorname`, `Nachname`, `Geschlecht`, `Geburtsdatum`, `Ort`, `Straße`, `PLZ`, `Hausnummer`, `Email`, `Stammgast`, `Passwort`, `Gast`, `Anrede`) VALUES
	(1, 'Max', 'Mustermann', 'Männlich', '1985-05-10', 'Berlin', 'Musterstraße', '10115', '1', 'max.mustermann@example.com', 1, 'passwort123', 0, 'Herr'),
	(2, 'Erika', 'Mustermann', 'Weiblich', '1990-07-15', 'Hamburg', 'Beispielweg', '20095', '2', 'erika.mustermann@example.com', 1, 'passwort456', 0, 'Herr'),
	(3, 'Hans', 'Müller', 'Männlich', '1980-03-22', 'München', 'Hauptstraße', '80331', '3', 'hans.mueller@example.com', 0, 'passwort789', 1, 'Herr'),
	(4, 'Anna', 'Schmidt', 'Weiblich', '1995-09-30', 'Köln', 'Nebenstraße', '50667', '4', 'anna.schmidt@example.com', 1, 'passwort101', 1, 'Keine Angabe'),
	(5, 'Peter', 'Fischer', 'Männlich', '1975-01-05', 'Frankfurt', 'Bachweg', '60311', '5', 'peter.fischer@example.com', 0, 'passwort202', 0, 'Herr'),
	(6, 'Laura', 'Weber', 'Weiblich', '1988-11-20', 'Stuttgart', 'Waldstraße', '70173', '6', 'laura.weber@example.com', 1, 'passwort303', 1, 'Frau'),
	(7, 'Klaus', 'Becker', 'Männlich', '1992-02-14', 'Düsseldorf', 'Blumenweg', '40213', '7', 'klaus.becker@example.com', 0, 'passwort404', 1, 'Herr'),
	(8, 'Marie', 'Hofmann', 'Weiblich', '1983-06-25', 'Leipzig', 'Parkstraße', '04109', '8', 'marie.hofmann@example.com', 1, 'passwort505', 0, 'Herr'),
	(9, 'Stefan', 'Schwarz', 'Männlich', '1998-12-10', 'Dortmund', 'Schulweg', '44135', '9', 'stefan.schwarz@example.com', 1, 'passwort606', 1, 'Herr'),
	(10, 'Julia', 'Richter', 'Weiblich', '1986-04-18', 'Hannover', 'Ringstraße', '30159', '10', 'julia.richter@example.com', 0, 'passwort707', 0, 'Frau');

-- Exportiere Struktur von Tabelle funrest.mitarbeiter
CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `MitarbeiterID` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(50) DEFAULT NULL,
  `Nachname` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Passwort` varchar(100) DEFAULT NULL,
  `IstAdmin` tinyint(1) DEFAULT NULL,
  `Restaurant_Dienst` int(11) DEFAULT NULL,
  `Buchungen_Dienst` int(11) DEFAULT NULL,
  PRIMARY KEY (`MitarbeiterID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.mitarbeiter: ~14 rows (ungefähr)
INSERT INTO `mitarbeiter` (`MitarbeiterID`, `Vorname`, `Nachname`, `Email`, `Passwort`, `IstAdmin`, `Restaurant_Dienst`, `Buchungen_Dienst`) VALUES
	(1, 'Alice', 'Schneider', 'alice.schneider@example.com', 'passwort123', 1, 2, 0),
	(2, 'Bob', 'Meier', 'bob.meier@example.com', 'passwort456', 0, 3, 0),
	(3, 'Clara', 'Huber', 'clara.huber@example.com', 'passwort789', 1, 4, 0),
	(4, 'David', 'Bauer', 'david.bauer@example.com', 'passwort101', 0, 5, 0),
	(5, 'Eva', 'Wagner', 'eva.wagner@example.com', 'passwort202', 1, 6, 0),
	(6, 'Felix', 'Schulz', 'felix.schulz@example.com', 'passwort303', 0, 7, 0),
	(7, 'Gabi', 'Fischer', 'gabi.fischer@example.com', 'passwort404', 1, 1, 0),
	(8, 'Hans', 'Müller', 'hans.mueller@example.com', 'passwort123', 1, 0, 2),
	(9, 'Julia', 'Klein', 'julia.klein@example.com', 'passwort456', 0, 0, 3),
	(10, 'Tom', 'Weber', 'tom.weber@example.com', 'passwort789', 1, 0, 4),
	(11, 'Laura', 'Schmidt', 'laura.schmidt@example.com', 'passwort101', 0, 0, 5),
	(12, 'Markus', 'Lange', 'markus.lange@example.com', 'passwort202', 1, 0, 6),
	(13, 'Nina', 'Krause', 'nina.krause@example.com', 'passwort303', 0, 0, 7),
	(14, 'Lukas', 'Hofmann', 'lukas.hofmann@example.com', 'passwort404', 1, 0, 1);

-- Exportiere Struktur von Tabelle funrest.rechnungen
CREATE TABLE IF NOT EXISTS `rechnungen` (
  `RechnungID` int(11) NOT NULL AUTO_INCREMENT,
  `KundeID` int(11) DEFAULT NULL,
  `MitarbeiterID` int(11) DEFAULT NULL,
  `Erstelldatum` date DEFAULT NULL,
  PRIMARY KEY (`RechnungID`),
  KEY `KundeID` (`KundeID`),
  KEY `MitarbeiterID` (`MitarbeiterID`),
  CONSTRAINT `rechnungen_ibfk_1` FOREIGN KEY (`KundeID`) REFERENCES `kunde` (`KundeID`),
  CONSTRAINT `rechnungen_ibfk_2` FOREIGN KEY (`MitarbeiterID`) REFERENCES `mitarbeiter` (`MitarbeiterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.rechnungen: ~2 rows (ungefähr)
INSERT INTO `rechnungen` (`RechnungID`, `KundeID`, `MitarbeiterID`, `Erstelldatum`) VALUES
	(1, 2, 11, '2025-03-18'),
	(2, 4, 5, '2025-03-18');

-- Exportiere Struktur von Tabelle funrest.restaurant_tische
CREATE TABLE IF NOT EXISTS `restaurant_tische` (
  `TischID` int(11) NOT NULL AUTO_INCREMENT,
  `Anzahl_Plätze` int(11) DEFAULT NULL,
  PRIMARY KEY (`TischID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.restaurant_tische: ~40 rows (ungefähr)
INSERT INTO `restaurant_tische` (`TischID`, `Anzahl_Plätze`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 2),
	(8, 4),
	(9, 2),
	(10, 6),
	(11, 1),
	(12, 2),
	(13, 3),
	(14, 4),
	(15, 5),
	(16, 6),
	(17, 2),
	(18, 4),
	(19, 2),
	(20, 6),
	(21, 1),
	(22, 2),
	(23, 3),
	(24, 4),
	(25, 5),
	(26, 6),
	(27, 2),
	(28, 4),
	(29, 4),
	(30, 6),
	(31, 1),
	(32, 2),
	(33, 3),
	(34, 4),
	(35, 5),
	(36, 6),
	(37, 2),
	(38, 4),
	(39, 4),
	(40, 6);

-- Exportiere Struktur von Tabelle funrest.rezensionen
CREATE TABLE IF NOT EXISTS `rezensionen` (
  `RezensionenID` int(11) NOT NULL AUTO_INCREMENT,
  `KundeID` int(11) DEFAULT NULL,
  `MitarbeiterID` int(11) DEFAULT NULL,
  `Erstelldatum` date DEFAULT NULL,
  `Anzahl_Sterne` int(11) DEFAULT NULL,
  `Titel` varchar(100) DEFAULT NULL,
  `Inhalt` varchar(60000) DEFAULT NULL,
  `Genehmigt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RezensionenID`),
  KEY `KundeID` (`KundeID`),
  KEY `MitarbeiterID` (`MitarbeiterID`),
  CONSTRAINT `rezensionen_ibfk_1` FOREIGN KEY (`KundeID`) REFERENCES `kunde` (`KundeID`),
  CONSTRAINT `rezensionen_ibfk_2` FOREIGN KEY (`MitarbeiterID`) REFERENCES `mitarbeiter` (`MitarbeiterID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.rezensionen: ~9 rows (ungefähr)
INSERT INTO `rezensionen` (`RezensionenID`, `KundeID`, `MitarbeiterID`, `Erstelldatum`, `Anzahl_Sterne`, `Titel`, `Inhalt`, `Genehmigt`) VALUES
	(2, 2, 2, '2025-02-05', 3, 'Gut, aber mit Mängeln', 'Der Aufenthalt war insgesamt gut, jedoch war das Badezimmer nicht ganz sauber und die Wartezeit beim Check-in war lang.', 1),
	(3, 3, 1, '2025-03-10', 4, 'Sehr guter Service', 'Das Personal war überaus hilfsbereit, und das Frühstück war köstlich. Kleine Probleme mit dem WLAN.', 1),
	(4, 4, NULL, '2025-01-25', 2, 'Enttäuscht vom Aufenthalt', 'Leider entsprach der Aufenthalt nicht meinen Erwartungen. Das Zimmer war kalt, und die Heizung funktionierte nicht.', 0),
	(5, 5, 1, '2025-03-15', 5, 'Absolut fantastisch!', 'Alles war perfekt! Das Personal ging auf alle unsere Wünsche ein, und das Essen war unglaublich.', 1),
	(6, 6, NULL, '2025-02-28', 1, 'Sehr schlechter Aufenthalt', 'Unfreundliches Personal, schmutzige Zimmer und laute Nachbarn. Definitiv nicht zu empfehlen.', 0),
	(7, 7, 1, '2025-01-30', 4, 'Guter Aufenthalt', 'Ich habe meinen Aufenthalt genossen. Der Poolbereich war fantastisch, aber das Essen könnte besser sein.', 1),
	(8, 8, NULL, '2025-02-18', 3, 'In Ordnung, mit Verbesserungspotenzial', 'Das Zimmer war sauber, aber der Service könnte aufmerksamer sein. Das Frühstück war mittelmäßig.', 0),
	(9, 9, 1, '2025-03-05', 5, 'Einfach großartig!', 'Alles verlief reibungslos. Vom Check-in bis zum Check-out ein wunderbares Erlebnis. Gerne wieder!', 1),
	(10, 10, NULL, '2025-01-18', 2, 'Nicht zufriedenstellend', 'Die Sauberkeit ließ zu wünschen übrig, und das Personal war unaufmerksam. Verbesserungen sind dringend nötig.', 0);

-- Exportiere Struktur von Tabelle funrest.zimmer
CREATE TABLE IF NOT EXISTS `zimmer` (
  `ZimmerID` int(11) NOT NULL AUTO_INCREMENT,
  `Kategorie` varchar(50) DEFAULT NULL,
  `Zimmerart` varchar(50) DEFAULT NULL,
  `Preiskategorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZimmerID`),
  KEY `Preiskategorie` (`Preiskategorie`),
  CONSTRAINT `zimmer_ibfk_1` FOREIGN KEY (`Preiskategorie`) REFERENCES `zimmer_preis` (`PreisID`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.zimmer: ~288 rows (ungefähr)
INSERT INTO `zimmer` (`ZimmerID`, `Kategorie`, `Zimmerart`, `Preiskategorie`) VALUES
	(1, 'Standard', 'Einzelzimmer', 1),
	(2, 'Premium', 'Einzelzimmer', 2),
	(3, 'Luxus', 'Einzelzimmer', 3),
	(4, 'Standard', 'Doppelzimmer', 4),
	(5, 'Premium', 'Doppelzimmer', 5),
	(6, 'Luxus', 'Doppelzimmer', 6),
	(7, 'Standard', 'Einzelzimmer', 1),
	(8, 'Premium', 'Einzelzimmer', 2),
	(9, 'Luxus', 'Einzelzimmer', 3),
	(10, 'Standard', 'Doppelzimmer', 4),
	(11, 'Premium', 'Doppelzimmer', 5),
	(12, 'Luxus', 'Doppelzimmer', 6),
	(13, 'Standard', 'Einzelzimmer', 1),
	(14, 'Premium', 'Einzelzimmer', 2),
	(15, 'Luxus', 'Einzelzimmer', 3),
	(16, 'Standard', 'Doppelzimmer', 4),
	(17, 'Premium', 'Doppelzimmer', 5),
	(18, 'Luxus', 'Doppelzimmer', 6),
	(19, 'Standard', 'Einzelzimmer', 1),
	(20, 'Premium', 'Einzelzimmer', 2),
	(21, 'Luxus', 'Einzelzimmer', 3),
	(22, 'Standard', 'Doppelzimmer', 4),
	(23, 'Premium', 'Doppelzimmer', 5),
	(24, 'Luxus', 'Doppelzimmer', 6),
	(25, 'Standard', 'Einzelzimmer', 1),
	(26, 'Premium', 'Einzelzimmer', 2),
	(27, 'Luxus', 'Einzelzimmer', 3),
	(28, 'Standard', 'Doppelzimmer', 4),
	(29, 'Premium', 'Doppelzimmer', 5),
	(30, 'Luxus', 'Doppelzimmer', 6),
	(31, 'Standard', 'Einzelzimmer', 1),
	(32, 'Premium', 'Einzelzimmer', 2),
	(33, 'Luxus', 'Einzelzimmer', 3),
	(34, 'Standard', 'Doppelzimmer', 4),
	(35, 'Premium', 'Doppelzimmer', 5),
	(36, 'Luxus', 'Doppelzimmer', 6),
	(37, 'Standard', 'Einzelzimmer', 1),
	(38, 'Premium', 'Einzelzimmer', 2),
	(39, 'Luxus', 'Einzelzimmer', 3),
	(40, 'Standard', 'Doppelzimmer', 4),
	(41, 'Premium', 'Doppelzimmer', 5),
	(42, 'Luxus', 'Doppelzimmer', 6),
	(43, 'Standard', 'Einzelzimmer', 1),
	(44, 'Premium', 'Einzelzimmer', 2),
	(45, 'Luxus', 'Einzelzimmer', 3),
	(46, 'Standard', 'Doppelzimmer', 4),
	(47, 'Premium', 'Doppelzimmer', 5),
	(48, 'Luxus', 'Doppelzimmer', 6),
	(49, 'Standard', 'Einzelzimmer', 1),
	(50, 'Premium', 'Einzelzimmer', 2),
	(51, 'Luxus', 'Einzelzimmer', 3),
	(52, 'Standard', 'Doppelzimmer', 4),
	(53, 'Premium', 'Doppelzimmer', 5),
	(54, 'Luxus', 'Doppelzimmer', 6),
	(55, 'Standard', 'Einzelzimmer', 1),
	(56, 'Premium', 'Einzelzimmer', 2),
	(57, 'Luxus', 'Einzelzimmer', 3),
	(58, 'Standard', 'Doppelzimmer', 4),
	(59, 'Premium', 'Doppelzimmer', 5),
	(60, 'Luxus', 'Doppelzimmer', 6),
	(61, 'Standard', 'Einzelzimmer', 1),
	(62, 'Premium', 'Einzelzimmer', 2),
	(63, 'Luxus', 'Einzelzimmer', 3),
	(64, 'Standard', 'Doppelzimmer', 4),
	(65, 'Premium', 'Doppelzimmer', 5),
	(66, 'Luxus', 'Doppelzimmer', 6),
	(67, 'Standard', 'Einzelzimmer', 1),
	(68, 'Premium', 'Einzelzimmer', 2),
	(69, 'Luxus', 'Einzelzimmer', 3),
	(70, 'Standard', 'Doppelzimmer', 4),
	(71, 'Premium', 'Doppelzimmer', 5),
	(72, 'Luxus', 'Doppelzimmer', 6),
	(73, 'Standard', 'Einzelzimmer', 1),
	(74, 'Premium', 'Einzelzimmer', 2),
	(75, 'Luxus', 'Einzelzimmer', 3),
	(76, 'Standard', 'Doppelzimmer', 4),
	(77, 'Premium', 'Doppelzimmer', 5),
	(78, 'Luxus', 'Doppelzimmer', 6),
	(79, 'Standard', 'Einzelzimmer', 1),
	(80, 'Premium', 'Einzelzimmer', 2),
	(81, 'Luxus', 'Einzelzimmer', 3),
	(82, 'Standard', 'Doppelzimmer', 4),
	(83, 'Premium', 'Doppelzimmer', 5),
	(84, 'Luxus', 'Doppelzimmer', 6),
	(85, 'Standard', 'Einzelzimmer', 1),
	(86, 'Premium', 'Einzelzimmer', 2),
	(87, 'Luxus', 'Einzelzimmer', 3),
	(88, 'Standard', 'Doppelzimmer', 4),
	(89, 'Premium', 'Doppelzimmer', 5),
	(90, 'Luxus', 'Doppelzimmer', 6),
	(91, 'Standard', 'Einzelzimmer', 1),
	(92, 'Premium', 'Einzelzimmer', 2),
	(93, 'Luxus', 'Einzelzimmer', 3),
	(94, 'Standard', 'Doppelzimmer', 4),
	(95, 'Premium', 'Doppelzimmer', 5),
	(96, 'Luxus', 'Doppelzimmer', 6),
	(97, 'Standard', 'Einzelzimmer', 1),
	(98, 'Premium', 'Einzelzimmer', 2),
	(99, 'Luxus', 'Einzelzimmer', 3),
	(100, 'Standard', 'Doppelzimmer', 4),
	(101, 'Premium', 'Doppelzimmer', 5),
	(102, 'Luxus', 'Doppelzimmer', 6),
	(103, 'Standard', 'Einzelzimmer', 1),
	(104, 'Premium', 'Einzelzimmer', 2),
	(105, 'Luxus', 'Einzelzimmer', 3),
	(106, 'Standard', 'Doppelzimmer', 4),
	(107, 'Premium', 'Doppelzimmer', 5),
	(108, 'Luxus', 'Doppelzimmer', 6),
	(109, 'Standard', 'Einzelzimmer', 1),
	(110, 'Premium', 'Einzelzimmer', 2),
	(111, 'Luxus', 'Einzelzimmer', 3),
	(112, 'Standard', 'Doppelzimmer', 4),
	(113, 'Premium', 'Doppelzimmer', 5),
	(114, 'Luxus', 'Doppelzimmer', 6),
	(115, 'Standard', 'Einzelzimmer', 1),
	(116, 'Premium', 'Einzelzimmer', 2),
	(117, 'Luxus', 'Einzelzimmer', 3),
	(118, 'Standard', 'Doppelzimmer', 4),
	(119, 'Premium', 'Doppelzimmer', 5),
	(120, 'Luxus', 'Doppelzimmer', 6),
	(121, 'Standard', 'Einzelzimmer', 1),
	(122, 'Premium', 'Einzelzimmer', 2),
	(123, 'Luxus', 'Einzelzimmer', 3),
	(124, 'Standard', 'Doppelzimmer', 4),
	(125, 'Premium', 'Doppelzimmer', 5),
	(126, 'Luxus', 'Doppelzimmer', 6),
	(127, 'Standard', 'Einzelzimmer', 1),
	(128, 'Premium', 'Einzelzimmer', 2),
	(129, 'Luxus', 'Einzelzimmer', 3),
	(130, 'Standard', 'Doppelzimmer', 4),
	(131, 'Premium', 'Doppelzimmer', 5),
	(132, 'Luxus', 'Doppelzimmer', 6),
	(133, 'Standard', 'Einzelzimmer', 1),
	(134, 'Premium', 'Einzelzimmer', 2),
	(135, 'Luxus', 'Einzelzimmer', 3),
	(136, 'Standard', 'Doppelzimmer', 4),
	(137, 'Premium', 'Doppelzimmer', 5),
	(138, 'Luxus', 'Doppelzimmer', 6),
	(139, 'Standard', 'Einzelzimmer', 1),
	(140, 'Premium', 'Einzelzimmer', 2),
	(141, 'Luxus', 'Einzelzimmer', 3),
	(142, 'Standard', 'Doppelzimmer', 4),
	(143, 'Premium', 'Doppelzimmer', 5),
	(144, 'Luxus', 'Doppelzimmer', 6),
	(145, 'Standard', 'Einzelzimmer', 1),
	(146, 'Premium', 'Einzelzimmer', 2),
	(147, 'Luxus', 'Einzelzimmer', 3),
	(148, 'Standard', 'Doppelzimmer', 4),
	(149, 'Premium', 'Doppelzimmer', 5),
	(150, 'Luxus', 'Doppelzimmer', 6),
	(151, 'Standard', 'Einzelzimmer', 1),
	(152, 'Premium', 'Einzelzimmer', 2),
	(153, 'Luxus', 'Einzelzimmer', 3),
	(154, 'Standard', 'Doppelzimmer', 4),
	(155, 'Premium', 'Doppelzimmer', 5),
	(156, 'Luxus', 'Doppelzimmer', 6),
	(157, 'Standard', 'Einzelzimmer', 1),
	(158, 'Premium', 'Einzelzimmer', 2),
	(159, 'Luxus', 'Einzelzimmer', 3),
	(160, 'Standard', 'Doppelzimmer', 4),
	(161, 'Premium', 'Doppelzimmer', 5),
	(162, 'Luxus', 'Doppelzimmer', 6),
	(163, 'Standard', 'Einzelzimmer', 1),
	(164, 'Premium', 'Einzelzimmer', 2),
	(165, 'Luxus', 'Einzelzimmer', 3),
	(166, 'Standard', 'Doppelzimmer', 4),
	(167, 'Premium', 'Doppelzimmer', 5),
	(168, 'Luxus', 'Doppelzimmer', 6),
	(169, 'Standard', 'Einzelzimmer', 1),
	(170, 'Premium', 'Einzelzimmer', 2),
	(171, 'Luxus', 'Einzelzimmer', 3),
	(172, 'Standard', 'Doppelzimmer', 4),
	(173, 'Premium', 'Doppelzimmer', 5),
	(174, 'Luxus', 'Doppelzimmer', 6),
	(175, 'Standard', 'Einzelzimmer', 1),
	(176, 'Premium', 'Einzelzimmer', 2),
	(177, 'Luxus', 'Einzelzimmer', 3),
	(178, 'Standard', 'Doppelzimmer', 4),
	(179, 'Premium', 'Doppelzimmer', 5),
	(180, 'Luxus', 'Doppelzimmer', 6),
	(181, 'Standard', 'Einzelzimmer', 1),
	(182, 'Premium', 'Einzelzimmer', 2),
	(183, 'Luxus', 'Einzelzimmer', 3),
	(184, 'Standard', 'Doppelzimmer', 4),
	(185, 'Premium', 'Doppelzimmer', 5),
	(186, 'Luxus', 'Doppelzimmer', 6),
	(187, 'Standard', 'Einzelzimmer', 1),
	(188, 'Premium', 'Einzelzimmer', 2),
	(189, 'Luxus', 'Einzelzimmer', 3),
	(190, 'Standard', 'Doppelzimmer', 4),
	(191, 'Premium', 'Doppelzimmer', 5),
	(192, 'Luxus', 'Doppelzimmer', 6),
	(193, 'Standard', 'Einzelzimmer', 1),
	(194, 'Premium', 'Einzelzimmer', 2),
	(195, 'Luxus', 'Einzelzimmer', 3),
	(196, 'Standard', 'Doppelzimmer', 4),
	(197, 'Premium', 'Doppelzimmer', 5),
	(198, 'Luxus', 'Doppelzimmer', 6),
	(199, 'Standard', 'Einzelzimmer', 1),
	(200, 'Premium', 'Einzelzimmer', 2),
	(201, 'Luxus', 'Einzelzimmer', 3),
	(202, 'Standard', 'Doppelzimmer', 4),
	(203, 'Premium', 'Doppelzimmer', 5),
	(204, 'Luxus', 'Doppelzimmer', 6),
	(205, 'Standard', 'Einzelzimmer', 1),
	(206, 'Premium', 'Einzelzimmer', 2),
	(207, 'Luxus', 'Einzelzimmer', 3),
	(208, 'Standard', 'Doppelzimmer', 4),
	(209, 'Premium', 'Doppelzimmer', 5),
	(210, 'Luxus', 'Doppelzimmer', 6),
	(211, 'Standard', 'Einzelzimmer', 1),
	(212, 'Premium', 'Einzelzimmer', 2),
	(213, 'Luxus', 'Einzelzimmer', 3),
	(214, 'Standard', 'Doppelzimmer', 4),
	(215, 'Premium', 'Doppelzimmer', 5),
	(216, 'Luxus', 'Doppelzimmer', 6),
	(217, 'Standard', 'Einzelzimmer', 1),
	(218, 'Premium', 'Einzelzimmer', 2),
	(219, 'Luxus', 'Einzelzimmer', 3),
	(220, 'Standard', 'Doppelzimmer', 4),
	(221, 'Premium', 'Doppelzimmer', 5),
	(222, 'Luxus', 'Doppelzimmer', 6),
	(223, 'Standard', 'Einzelzimmer', 1),
	(224, 'Premium', 'Einzelzimmer', 2),
	(225, 'Luxus', 'Einzelzimmer', 3),
	(226, 'Standard', 'Doppelzimmer', 4),
	(227, 'Premium', 'Doppelzimmer', 5),
	(228, 'Luxus', 'Doppelzimmer', 6),
	(229, 'Standard', 'Einzelzimmer', 1),
	(230, 'Premium', 'Einzelzimmer', 2),
	(231, 'Luxus', 'Einzelzimmer', 3),
	(232, 'Standard', 'Doppelzimmer', 4),
	(233, 'Premium', 'Doppelzimmer', 5),
	(234, 'Luxus', 'Doppelzimmer', 6),
	(235, 'Standard', 'Einzelzimmer', 1),
	(236, 'Premium', 'Einzelzimmer', 2),
	(237, 'Luxus', 'Einzelzimmer', 3),
	(238, 'Standard', 'Doppelzimmer', 4),
	(239, 'Premium', 'Doppelzimmer', 5),
	(240, 'Luxus', 'Doppelzimmer', 6),
	(241, 'Standard', 'Einzelzimmer', 1),
	(242, 'Premium', 'Einzelzimmer', 2),
	(243, 'Luxus', 'Einzelzimmer', 3),
	(244, 'Standard', 'Doppelzimmer', 4),
	(245, 'Premium', 'Doppelzimmer', 5),
	(246, 'Luxus', 'Doppelzimmer', 6),
	(247, 'Standard', 'Einzelzimmer', 1),
	(248, 'Premium', 'Einzelzimmer', 2),
	(249, 'Luxus', 'Einzelzimmer', 3),
	(250, 'Standard', 'Doppelzimmer', 4),
	(251, 'Premium', 'Doppelzimmer', 5),
	(252, 'Luxus', 'Doppelzimmer', 6),
	(253, 'Standard', 'Einzelzimmer', 1),
	(254, 'Premium', 'Einzelzimmer', 2),
	(255, 'Luxus', 'Einzelzimmer', 3),
	(256, 'Standard', 'Doppelzimmer', 4),
	(257, 'Premium', 'Doppelzimmer', 5),
	(258, 'Luxus', 'Doppelzimmer', 6),
	(259, 'Standard', 'Einzelzimmer', 1),
	(260, 'Premium', 'Einzelzimmer', 2),
	(261, 'Luxus', 'Einzelzimmer', 3),
	(262, 'Standard', 'Doppelzimmer', 4),
	(263, 'Premium', 'Doppelzimmer', 5),
	(264, 'Luxus', 'Doppelzimmer', 6),
	(265, 'Standard', 'Einzelzimmer', 1),
	(266, 'Premium', 'Einzelzimmer', 2),
	(267, 'Luxus', 'Einzelzimmer', 3),
	(268, 'Standard', 'Doppelzimmer', 4),
	(269, 'Premium', 'Doppelzimmer', 5),
	(270, 'Luxus', 'Doppelzimmer', 6),
	(271, 'Standard', 'Einzelzimmer', 1),
	(272, 'Premium', 'Einzelzimmer', 2),
	(273, 'Luxus', 'Einzelzimmer', 3),
	(274, 'Standard', 'Doppelzimmer', 4),
	(275, 'Premium', 'Doppelzimmer', 5),
	(276, 'Luxus', 'Doppelzimmer', 6),
	(277, 'Standard', 'Einzelzimmer', 1),
	(278, 'Premium', 'Einzelzimmer', 2),
	(279, 'Luxus', 'Einzelzimmer', 3),
	(280, 'Standard', 'Doppelzimmer', 4),
	(281, 'Premium', 'Doppelzimmer', 5),
	(282, 'Luxus', 'Doppelzimmer', 6),
	(283, 'Standard', 'Einzelzimmer', 1),
	(284, 'Premium', 'Einzelzimmer', 2),
	(285, 'Luxus', 'Einzelzimmer', 3),
	(286, 'Standard', 'Doppelzimmer', 4),
	(287, 'Premium', 'Doppelzimmer', 5),
	(288, 'Luxus', 'Doppelzimmer', 6);

-- Exportiere Struktur von Tabelle funrest.zimmer_preis
CREATE TABLE IF NOT EXISTS `zimmer_preis` (
  `PreisID` int(11) NOT NULL AUTO_INCREMENT,
  `Preis` double DEFAULT NULL,
  PRIMARY KEY (`PreisID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.zimmer_preis: ~6 rows (ungefähr)
INSERT INTO `zimmer_preis` (`PreisID`, `Preis`) VALUES
	(1, 70),
	(2, 90),
	(3, 120),
	(4, 100),
	(5, 130),
	(6, 150);

-- Exportiere Struktur von Prozedur funrest.create_All
DELIMITER //
CREATE PROCEDURE `create_All`()
    COMMENT 'Prozdeure welche alle create Tabellen Prozeduren ausführt'
BEGIN
CALL create_Kunde();
CALL create_Mitarbeiter();
CALL create_Rechnungen();
CALL create_Rezensionen();
CALL create_Restaurant_Tische();
CALL create_Buchungen_Tisch();
CALL create_Zimmer_Preis();
CALL create_Zimmer();
CALL create_Buchungen_Zimmer();

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Buchungen_Tisch
DELIMITER //
CREATE PROCEDURE `create_Buchungen_Tisch`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Buchungen_Tisch'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Buchungen_Tisch (
    Buchungen_TischID INT AUTO_INCREMENT PRIMARY KEY,
    TischID INT,
    KundeID INT,
    MitarbeiterID INT,
    FOREIGN KEY (TischID) REFERENCES Restaurant_Tische(TischID),
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
    FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID),
    Zeitpunkt DATETIME,
    Stoniert BOOL
    
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Buchungen_Tisch
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Buchungen_Zimmer
DELIMITER //
CREATE PROCEDURE `create_Buchungen_Zimmer`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Buchungen_Zimmer'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Buchungen_Zimmer (
    Buchungen_ZimmerID INT AUTO_INCREMENT PRIMARY KEY,
    ZimmerID INT,
    KundeID INT,
    MitarbeiterID INT,
    RechnungID INT,
    FOREIGN KEY (ZimmerID) REFERENCES Zimmer(ZimmerID),
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
    FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID),
    FOREIGN KEY (RechnungID) REFERENCES Rechnungen(RechnungID),

    Anreise DATETIME,
    Abreise DATETIME,
	 Storniert BOOL,
	 Gezahlt BOOL 
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Buchungen_Zimmer

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Kunde
DELIMITER //
CREATE PROCEDURE `create_Kunde`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Kunde'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Kunde (
    KundeID INT AUTO_INCREMENT PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    Geschlecht VARCHAR(50),
    Geburtsdatum DATE,
    Ort VARCHAR(50),
    Straße VARCHAR(50),
    PLZ VARCHAR(50),
    Hausnummer VARCHAR(50),
    Email VARCHAR(100),
    Stammgast BOOL,
    Passwort VARCHAR(100),
    Gast BOOL,
    Anrede VARCHAR(50)
    
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Kunde

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Mitarbeiter
DELIMITER //
CREATE PROCEDURE `create_Mitarbeiter`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Mitarbeiter'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Mitarbeiter (
    MitarbeiterID INT AUTO_INCREMENT PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    Email VARCHAR(100),
    Passwort VARCHAR(100),
    IstAdmin BOOL,
    Restaurant_Dienst INT,
    Buchungen_Dienst INT
    
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Mitarbeiter
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Rechnungen
DELIMITER //
CREATE PROCEDURE `create_Rechnungen`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Rechnungen'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Rechnungen (
    RechnungID INT AUTO_INCREMENT PRIMARY KEY,
    KundeID INT,
    MitarbeiterID INT,
    Erstelldatum DATE,
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
    FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID)
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Rechnungen
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Restaurant_Tische
DELIMITER //
CREATE PROCEDURE `create_Restaurant_Tische`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Restaurant_Tische'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Restaurant_Tische (
    TischID INT AUTO_INCREMENT PRIMARY KEY,
    Anzahl_Plätze INT   
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Restaurant_Tische
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Rezensionen
DELIMITER //
CREATE PROCEDURE `create_Rezensionen`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Rezensionen'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Rezensionen (
    RezensionenID INT AUTO_INCREMENT PRIMARY KEY,
    KundeID INT,
    MitarbeiterID INT,
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
    FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID),
    Erstelldatum DATE,
    Anzahl_Sterne INT,
    Titel VARCHAR(100),
    Inhalt VARCHAR(60000),
    Genehmigt BOOL
    
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Rezensionen
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Zimmer
DELIMITER //
CREATE PROCEDURE `create_Zimmer`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Zimmer'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Zimmer (
    ZimmerID INT AUTO_INCREMENT PRIMARY KEY,
    Kategorie VARCHAR(50),
	 Zimmerart VARCHAR(50),
	 Preiskategorie INT,
	 FOREIGN KEY (Preiskategorie) REFERENCES zimmer_preis(PreisID)
	 );


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Zimmer


END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Zimmer_Preis
DELIMITER //
CREATE PROCEDURE `create_Zimmer_Preis`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Zimmer_Preis'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS zimmer_preis(
    PreisID INT AUTO_INCREMENT PRIMARY KEY,
    Preis DOUBLE
);

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.data_All
DELIMITER //
CREATE PROCEDURE `data_All`()
    COMMENT 'Prozdeure welche alle data Tabellen Prozeduren ausführt'
BEGIN

CALL data_Kunde();
CALL data_Mitarbeiter();
CALL data_Zimmer_Preis();
CALL data_Restaurant_Tische();
CALL data_Zimmer();
CALL data_Rezensionen();

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.data_Kunde
DELIMITER //
CREATE PROCEDURE `data_Kunde`()
    COMMENT 'Testdaten für die Kunden Tabelle'
BEGIN
INSERT INTO Kunde (Vorname, Nachname, Geschlecht, Geburtsdatum, Ort, Straße, PLZ, Hausnummer, Email, Stammgast, Passwort, Gast, Anrede)
VALUES
('Max', 'Mustermann', 'Männlich', '1985-05-10', 'Berlin', 'Musterstraße', '10115', '1', 'max.mustermann@example.com', TRUE, 'passwort123', FALSE, 'Herr'),
('Erika', 'Mustermann', 'Weiblich', '1990-07-15', 'Hamburg', 'Beispielweg', '20095', '2', 'erika.mustermann@example.com', TRUE, 'passwort456', FALSE, 'Herr'),
('Hans', 'Müller', 'Männlich', '1980-03-22', 'München', 'Hauptstraße', '80331', '3', 'hans.mueller@example.com', FALSE, 'passwort789', TRUE, 'Herr'),
('Anna', 'Schmidt', 'Weiblich', '1995-09-30', 'Köln', 'Nebenstraße', '50667', '4', 'anna.schmidt@example.com', TRUE, 'passwort101', TRUE, 'Keine Angabe'),
('Peter', 'Fischer', 'Männlich', '1975-01-05', 'Frankfurt', 'Bachweg', '60311', '5', 'peter.fischer@example.com', FALSE, 'passwort202', FALSE, 'Herr'),
('Laura', 'Weber', 'Weiblich', '1988-11-20', 'Stuttgart', 'Waldstraße', '70173', '6', 'laura.weber@example.com', TRUE, 'passwort303', TRUE, 'Frau'),
('Klaus', 'Becker', 'Männlich', '1992-02-14', 'Düsseldorf', 'Blumenweg', '40213', '7', 'klaus.becker@example.com', FALSE, 'passwort404', TRUE, 'Herr'),
('Marie', 'Hofmann', 'Weiblich', '1983-06-25', 'Leipzig', 'Parkstraße', '04109', '8', 'marie.hofmann@example.com', TRUE, 'passwort505', FALSE, 'Herr'),
('Stefan', 'Schwarz', 'Männlich', '1998-12-10', 'Dortmund', 'Schulweg', '44135', '9', 'stefan.schwarz@example.com', TRUE, 'passwort606', TRUE, 'Herr'),
('Julia', 'Richter', 'Weiblich', '1986-04-18', 'Hannover', 'Ringstraße', '30159', '10', 'julia.richter@example.com', FALSE, 'passwort707', FALSE, 'Frau');

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.data_Mitarbeiter
DELIMITER //
CREATE PROCEDURE `data_Mitarbeiter`()
    COMMENT 'Testdaten für die Mitarbeiter Tabelle'
BEGIN
INSERT INTO Mitarbeiter (Vorname, Nachname, Email, Passwort, IstAdmin, Restaurant_Dienst,Buchungen_Dienst)
VALUES
('Alice', 'Schneider', 'alice.schneider@example.com', 'passwort123', TRUE, 2, 0), -- Montag
('Bob', 'Meier', 'bob.meier@example.com', 'passwort456', FALSE, 3, 0), -- Dienstag
('Clara', 'Huber', 'clara.huber@example.com', 'passwort789', TRUE, 4, 0), -- Mittwoch
('David', 'Bauer', 'david.bauer@example.com', 'passwort101', FALSE, 5, 0), -- Donnerstag
('Eva', 'Wagner', 'eva.wagner@example.com', 'passwort202', TRUE, 6, 0), -- Freitag
('Felix', 'Schulz', 'felix.schulz@example.com', 'passwort303', FALSE, 7, 0), -- Samstag
('Gabi', 'Fischer', 'gabi.fischer@example.com', 'passwort404', TRUE, 1, 0), -- Sonntag
('Hans', 'Müller', 'hans.mueller@example.com', 'passwort123', TRUE, 0, 2), -- Montag
('Julia', 'Klein', 'julia.klein@example.com', 'passwort456', FALSE, 0, 3), -- Dienstag
('Tom', 'Weber', 'tom.weber@example.com', 'passwort789', TRUE, 0, 4), -- Mittwoch
('Laura', 'Schmidt', 'laura.schmidt@example.com', 'passwort101', FALSE, 0, 5), -- Donnerstag
('Markus', 'Lange', 'markus.lange@example.com', 'passwort202', TRUE, 0, 6), -- Freitag
('Nina', 'Krause', 'nina.krause@example.com', 'passwort303', FALSE, 0, 7), -- Samstag
('Lukas', 'Hofmann', 'lukas.hofmann@example.com', 'passwort404', TRUE, 0, 1); -- Sonntag


END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.data_Restaurant_Tische
DELIMITER //
CREATE PROCEDURE `data_Restaurant_Tische`()
    COMMENT 'Testdaten für die Restaurant_Tische Tabelle'
BEGIN
INSERT INTO Restaurant_Tische (Anzahl_Plätze) VALUES
(1), (2), (3), (4), (5), (6), (2), (4), (2), (6),
(1), (2), (3), (4), (5), (6), (2), (4), (2), (6),
(1), (2), (3), (4), (5), (6), (2), (4), (4), (6),
(1), (2), (3), (4), (5), (6), (2), (4), (4), (6);

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.data_Rezensionen
DELIMITER //
CREATE PROCEDURE `data_Rezensionen`()
BEGIN
INSERT INTO rezensionen (KundeID, MitarbeiterID, Erstelldatum, Anzahl_Sterne, Titel, Inhalt, Genehmigt) VALUES
(1, 1, '2025-01-12', 5, 'Exzellenter Aufenthalt', 'Ich war äußerst zufrieden mit dem Service. Das Personal war freundlich und zuvorkommend. Die Zimmer waren sauber und komfortabel.', TRUE),
(2, null, '2025-02-05', 3, 'Gut, aber mit Mängeln', 'Der Aufenthalt war insgesamt gut, jedoch war das Badezimmer nicht ganz sauber und die Wartezeit beim Check-in war lang.', FALSE),
(3, 1, '2025-03-10', 4, 'Sehr guter Service', 'Das Personal war überaus hilfsbereit, und das Frühstück war köstlich. Kleine Probleme mit dem WLAN.', TRUE),
(4, null, '2025-01-25', 2, 'Enttäuscht vom Aufenthalt', 'Leider entsprach der Aufenthalt nicht meinen Erwartungen. Das Zimmer war kalt, und die Heizung funktionierte nicht.', FALSE),
(5, 1, '2025-03-15', 5, 'Absolut fantastisch!', 'Alles war perfekt! Das Personal ging auf alle unsere Wünsche ein, und das Essen war unglaublich.', TRUE),
(6, null, '2025-02-28', 1, 'Sehr schlechter Aufenthalt', 'Unfreundliches Personal, schmutzige Zimmer und laute Nachbarn. Definitiv nicht zu empfehlen.', FALSE),
(7, 1, '2025-01-30', 4, 'Guter Aufenthalt', 'Ich habe meinen Aufenthalt genossen. Der Poolbereich war fantastisch, aber das Essen könnte besser sein.', TRUE),
(8, null, '2025-02-18', 3, 'In Ordnung, mit Verbesserungspotenzial', 'Das Zimmer war sauber, aber der Service könnte aufmerksamer sein. Das Frühstück war mittelmäßig.', FALSE),
(9, 1, '2025-03-05', 5, 'Einfach großartig!', 'Alles verlief reibungslos. Vom Check-in bis zum Check-out ein wunderbares Erlebnis. Gerne wieder!', TRUE),
(10, null, '2025-01-18', 2, 'Nicht zufriedenstellend', 'Die Sauberkeit ließ zu wünschen übrig, und das Personal war unaufmerksam. Verbesserungen sind dringend nötig.', FALSE);

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.data_Zimmer
DELIMITER //
CREATE PROCEDURE `data_Zimmer`()
BEGIN

INSERT INTO Zimmer (Kategorie, Zimmerart, Preiskategorie) VALUES
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6),
('Standard', 'Einzelzimmer', 1),
('Premium', 'Einzelzimmer', 2),
('Luxus', 'Einzelzimmer', 3),
('Standard', 'Doppelzimmer', 4),
('Premium', 'Doppelzimmer', 5),
('Luxus', 'Doppelzimmer', 6);



END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.data_Zimmer_Preis
DELIMITER //
CREATE PROCEDURE `data_Zimmer_Preis`()
    COMMENT 'Testdaten für die data_Zimmer_PreisTabelle'
BEGIN
INSERT INTO zimmer_preis (Preis) VALUES
(70),
(90),
(120),
(100),
(130),
(150);

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.del_Rezensionen
DELIMITER //
CREATE PROCEDURE `del_Rezensionen`(
	IN `pRezensionenID` INT
)
BEGIN
DELETE FROM Rezensionen
WHERE RezensionenID = pRezensionenID;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.get_free_Zimmer
DELIMITER //
CREATE PROCEDURE `get_free_Zimmer`(
	IN `p_Anreise` DATE,
	IN `p_Abreise` DATE,
	IN `p_Kategorie` VARCHAR(50),
	IN `p_Zimmerart` VARCHAR(50)
)
BEGIN
	
	

    DECLARE Freies_Zimmer_ID INT;




	SELECT z.ZimmerID INTO Freies_Zimmer_ID
	FROM zimmer AS z
	WHERE z.Kategorie = p_Kategorie
	AND z.Zimmerart = p_Zimmerart
	AND z.ZimmerID NOT IN (   
    SELECT bz.ZimmerID
    FROM zimmer AS z
    inner JOIN Buchungen_Zimmer AS bz ON bz.ZimmerID = z.ZimmerID
    WHERE p_Anreise <= bz.Abreise AND p_Abreise >= bz.Anreise
    AND z.Zimmerart = p_Zimmerart
    AND z.Kategorie = p_Kategorie)
	 LIMIT 1;
	
	

   IF Freies_Zimmer_ID IS NOT null THEN
   	 
	SELECT Freies_Zimmer_ID AS p_ZimmerID,p_Anreise AS p_Anreise, p_Abreise AS p_Abreise;
	
	 
    ELSE
   	SELECT FALSE AS Buchung;
    END IF;

        

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.get_Passwort
DELIMITER //
CREATE PROCEDURE `get_Passwort`(
	IN `p_Email` VARCHAR(100)
)
    COMMENT 'Bekommt die email des Kunden und gibt das Passwort zurück '
BEGIN

    DECLARE selection VARCHAR(50);
    DECLARE adminStatus BOOL;


    SELECT Passwort INTO selection
    FROM Kunde
    WHERE Email = p_Email;


    IF selection IS NULL THEN
        SELECT Passwort, IstAdmin INTO selection, adminStatus
        FROM Mitarbeiter
        WHERE Email = p_Email;
    END IF;


    SELECT selection, adminStatus;
	 
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.get_Rechnungen
DELIMITER //
CREATE PROCEDURE `get_Rechnungen`()
BEGIN

SELECT r.RechnungID,r.Erstelldatum, bz.Anreise, bz.Abreise, bz.Gezahlt, k.Vorname, k.Nachname, k.Anrede, k.Ort, k.Straße, k.PLZ, k.Hausnummer, k.Email,
			DATEDIFF(bz.Abreise, bz.Anreise) AS Aufenthaltstage, -- Berechnung der Aufenthaltsdauer
    	   zp.Preis * DATEDIFF(bz.Abreise, bz.Anreise) AS Gesamtpreis -- Gesamtpreisberechnung
FROM rechnungen AS r
INNER JOIN buchungen_zimmer AS bz ON bz.RechnungID = r.RechnungID
INNER JOIN kunde AS k ON k.KundeID = r.KundeID
INNER JOIN zimmer AS z ON z.ZimmerID = bz.ZimmerID
INNER JOIN zimmer_preis zp ON zp.PreisID = z.Preiskategorie

WHERE bz.Storniert = FALSE;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.get_Rezensionen_Genehmigt
DELIMITER //
CREATE PROCEDURE `get_Rezensionen_Genehmigt`()
BEGIN
    SELECT *
    FROM rezensionen AS r
    WHERE r.Genehmigt = TRUE 
    ORDER BY Erstelldatum DESC;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.get_Rezensionen_Nicht_Genehmigt
DELIMITER //
CREATE PROCEDURE `get_Rezensionen_Nicht_Genehmigt`()
BEGIN

   SELECT *
    FROM rezensionen AS r
    WHERE r.Genehmigt = FALSE 
    ORDER BY Erstelldatum DESC
	 LIMIT 1;
    
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.new_Buchungen_Tisch
DELIMITER //
CREATE PROCEDURE `new_Buchungen_Tisch`(
	IN `p_TischID` INT,
	IN `p_KundeID` INT,
	IN `p_MitarbeiterID` INT,
	IN `p_Zeitpunkt` DATETIME,
	IN `p_Stoniert` BOOL
)
    COMMENT 'Erstellet eine neue Buchungen_Tisch anhand der Übergabeparameter'
BEGIN
    INSERT INTO Buchungen_Tisch (
        TischID,
        KundeID,
        MitarbeiterID,
        Zeitpunkt,
        Stoniert
    ) VALUES (
        p_TischID,
        p_KundeID,
        p_MitarbeiterID,
        p_Zeitpunkt,
        p_Stoniert
    );
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.new_Buchungen_Zimmer
DELIMITER //
CREATE PROCEDURE `new_Buchungen_Zimmer`(
	IN `p_ZimmerID` INT,
	IN `p_KundeID` INT,
	IN `p_MitarbeiterID` INT,
	IN `p_RechnungID` INT,
	IN `p_Anreise` DATETIME,
	IN `p_Abreise` DATETIME,
	IN `p_Storniert` BOOL,
	IN `p_Gezahlt` BOOL
)
    COMMENT 'Erstellet eine neue Buchungen_Zimmeranhand der Übergabeparameter'
BEGIN
    INSERT INTO Buchungen_Zimmer (
        ZimmerID,
        KundeID,
        MitarbeiterID,
        RechnungID,
        Anreise,
        Abreise,
        Storniert,
        Gezahlt
    ) VALUES (
        p_ZimmerID,
        p_KundeID,
        p_MitarbeiterID,
        p_RechnungID,
        p_Anreise,
        p_Abreise,
        p_Storniert,
        p_Gezahlt
    );
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.new_Kunde
DELIMITER //
CREATE PROCEDURE `new_Kunde`(
	IN `p_Vorname` VARCHAR(50),
	IN `p_Nachname` VARCHAR(50),
	IN `p_Geschlecht` VARCHAR(50),
	IN `p_Geburtsdatum` DATE,
	IN `p_Ort` VARCHAR(50),
	IN `p_Straße` VARCHAR(50),
	IN `p_PLZ` VARCHAR(50),
	IN `p_Hausnummer` VARCHAR(50),
	IN `p_Email` VARCHAR(100),
	IN `p_Passwort` VARCHAR(100),
	IN `p_Gast` BOOL,
	IN `p_Anrede` INT
)
    COMMENT 'Erstellet einen Kunden anhand der Übergabeparameter'
BEGIN
    INSERT INTO Kunde (
        Vorname,
        Nachname,
        Geschlecht,
        Geburtsdatum,
        Ort,
        Straße,
        PLZ,
        Hausnummer,
        Email,
        Stammgast,
        Passwort,
        Gast,
        Anrede
    ) VALUES (
        p_Vorname,
        p_Nachname,
        p_Geschlecht,
        p_Geburtsdatum,
        p_Ort,
        p_Straße,
        p_PLZ,
        p_Hausnummer,
        p_Email,
        false,
        p_Passwort,
        p_Gast,
        p_Anrede
    );
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.new_Rechnungen
DELIMITER //
CREATE PROCEDURE `new_Rechnungen`(
	IN `p_KundeID` INT,
	IN `p_MitarbeiterID` INT,
	OUT `p_LastID` INT
)
    COMMENT 'Erstellet eine Rechnung anhand der Übergabeparameter'
BEGIN
		DECLARE gleiche_Rechnung INT;
     
      SELECT RechnungID INTO gleiche_Rechnung
      FROM Rechnungen
      WHERE KundeID = p_KundeID
      AND MitarbeiterID = p_MitarbeiterID
      AND Erstelldatum = CURRENT_DATE;
     
        	


   	IF gleiche_Rechnung IS NOT null THEN
   	
   	SET p_LastID = gleiche_Rechnung;
   	else
   	
   	 INSERT INTO Rechnungen (
        KundeID,
        MitarbeiterID,
        Erstelldatum
  		 ) 
		 VALUES (
        p_KundeID,
        p_MitarbeiterID,
        current_date
   	 );
    
     SET p_LastID = LAST_INSERT_ID();
     END IF;
   	
   	
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.new_Rezension
DELIMITER //
CREATE PROCEDURE `new_Rezension`(
	IN `p_KundeID` INT,
	IN `p_Anzahl_Sterne` INT,
	IN `p_Titel` VARCHAR(100),
	IN `p_Inhalt` VARCHAR(60000)
)
BEGIN
    INSERT INTO Rezensionen (
        KundeID,
        MitarbeiterID,
        Erstelldatum,
        Anzahl_Sterne,
        Titel,
        Inhalt,
        Genehmigt
    ) VALUES (
        p_KundeID,
        null,
        current_Date,
        p_Anzahl_Sterne,
        p_Titel,
        p_Inhalt,
        FALSE
    );
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.set_Buchung_Zimmer
DELIMITER //
CREATE PROCEDURE `set_Buchung_Zimmer`(
	IN `p_Anreise` DATE,
	IN `p_Abreise` DATE,
	IN `p_KundeID` INT,
	IN `p_ZimmerID` INT
)
BEGIN
   DECLARE LastID INT;
 	DECLARE Mitarbeiter_Tag INT;
 	
    SELECT MitarbeiterID INTO Mitarbeiter_Tag
	 FROM mitarbeiter AS m
	 WHERE m.Buchungen_Dienst = DAYOFWEEK(p_Anreise);  -- prüft welcher Mitarbeiter an diesem Tag schicht hat und weißt ihm das Recht zu

    
CALL new_Rechnungen(p_KundeID, Mitarbeiter_Tag, LastID);
   
CALL new_Buchungen_Zimmer(p_ZimmerID, p_KundeID, Mitarbeiter_Tag, LastID, p_Anreise, p_Abreise, FALSE, FALSE);
	 
	
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.set_free_Tisch
DELIMITER //
CREATE PROCEDURE `set_free_Tisch`(
	IN `p_Anzahl_Plätze` INT,
	IN `p_Buchungsdatum` DATETIME,
	IN `p_KundeID` INT
)
    COMMENT 'Anhand der Übergabeparameter wird ein Tisch der Frei ist gesucht'
BEGIN	

    DECLARE Mitarbeiter_Tag INT;
    DECLARE Freier_TischID INT;
    DECLARE LastID INT;

    
    SELECT MitarbeiterID INTO Mitarbeiter_Tag
	 FROM mitarbeiter AS m
	 WHERE m.Restaurant_Dienst = DAYOFWEEK(p_Buchungsdatum);  -- prüft welcher Mitarbeiter an diesem Tag schicht hat und weißt ihm das Recht zu


	SELECT rt.TischID INTO Freier_TischID
	FROM restaurant_tische AS rt
	WHERE rt.Anzahl_Plätze = p_Anzahl_Plätze
	AND rt.TischID NOT IN (   
    SELECT bt.TischID
    FROM restaurant_tische AS rt
    inner JOIN buchungen_tisch AS bt ON rt.TischID = bt.TischID
    WHERE DAY(bt.Zeitpunkt) = DAY(p_Buchungsdatum)
    and rt.Anzahl_Plätze = p_Anzahl_Plätze
    AND ABS(TIMESTAMPDIFF(HOUR, bt.Zeitpunkt, p_Buchungsdatum)) <= 2)
	 LIMIT 1;
	


   IF Freier_TischID IS NOT null THEN
   	SELECT TRUE AS Buchung; 
   	
		CALL new_Rechnungen(p_KundeID, Mitarbeiter_Tag, LastID);
   	
   	CALL new_Buchungen_Tisch(Freier_TischID, p_KundeID, Mitarbeiter_Tag, p_Buchungsdatum, FALSE);

    ELSE
   	SELECT FALSE AS Buchung;
    END IF;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.set_Rezensionen_Genehmigt
DELIMITER //
CREATE PROCEDURE `set_Rezensionen_Genehmigt`(
	IN `p_RezensionenID` INT,
	IN `p_MitarbeiterID` INT
)
BEGIN
    UPDATE Rezensionen
    SET Genehmigt = TRUE, MitarbeiterID = p_MitarbeiterID
    WHERE RezensionenID = p_RezensionenID;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
