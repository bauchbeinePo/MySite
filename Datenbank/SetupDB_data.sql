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

-- Exportiere Struktur von Prozedur funrest.Data_Rezensionen
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
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6),
('Standard', 'Einzel', 1),
('Premium', 'Einzel', 2),
('Luxus', 'Einzel', 3),
('Standard', 'Doppel', 4),
('Premium', 'Doppel', 5),
('Luxus', 'Doppel', 6);



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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
