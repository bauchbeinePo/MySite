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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
