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

-- Exportiere Struktur von Prozedur funrest.get_free_Tisch
DELIMITER //
CREATE PROCEDURE `get_free_Tisch`(
	IN `p_Anzahl_Plätze` INT,
	IN `p_Buchungsdatum` DATETIME,
	IN `p_KundeID` INT
)
    COMMENT 'Anhand der Übergabeparameter wird ein Tisch der Frei ist gesucht'
BEGIN
	

    DECLARE Mitarbeiter_Tag INT;
    DECLARE Freier_TischID INT;

    
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
   	
   	CALL new_Rechungen(p_KundeID, Mitarbeiter_Tag );
   	
   	CALL NEW_Buchungen_Tisch(Freier_TischID, p_KundeID, Mitarbeiter_Tag, p_Buchungsdatum, FALSE);

    ELSE
   	SELECT FALSE AS Buchung;
    END IF;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.get_free_Zimmer
DELIMITER //
CREATE PROCEDURE `get_free_Zimmer`(
	IN `p_Anreise` DATE,
	IN `p_Abreise` DATE,
	IN `p_KundeID` INT,
	IN `p_Kategorie` VARCHAR(50),
	IN `p_Zimmerart` VARCHAR(50)
)
BEGIN
	
	
    DECLARE Mitarbeiter_Tag INT;
    DECLARE Freies_Zimmer_ID INT;


    
    SELECT MitarbeiterID INTO Mitarbeiter_Tag
	 FROM mitarbeiter AS m
	 WHERE m.Buchungen_Dienst = DAYOFWEEK(p_Anreise);  -- prüft welcher Mitarbeiter an diesem Tag schicht hat und weißt ihm das Recht zu


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
   	 
	SELECT Freies_Zimmer_ID AS p_ZimmerID, p_KundeID AS p_KundeID,  Mitarbeiter_Tag AS p_MitarbeiterID, p_Anreise AS p_Anreise, p_Abreise AS p_Abreise;
	
	 
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

SELECT r.RechnungID, r.KundeID, r.MitarbeiterID, r.Erstelldatum, bz.ZimmerID, bz.Anreise, bz.Abreise, bz.Gezahlt
FROM rechnungen AS r
INNER JOIN buchungen_zimmer AS bz ON bz.RechnungID = r.RechnungID
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
	IN `p_MitarbeiterID` INT,
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
        p_MitarbeiterID,
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
	IN `p_ZimmerID` INT,
	IN `p_MitarbeiterID` INT
)
BEGIN
   DECLARE LastID INT;
    
CALL new_Rechnungen(p_KundeID, p_MitarbeiterID, LastID);
   
CALL new_Buchungen_Zimmer(p_ZimmerID, p_KundeID, p_MitarbeiterID, LastID, p_Anreise, p_Abreise, FALSE, FALSE);
	 
	
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.set_Rezensionen_Genehmigt
DELIMITER //
CREATE PROCEDURE `set_Rezensionen_Genehmigt`(
    IN p_RezensionenID INT
)
BEGIN
    UPDATE Rezensionen
    SET Genehmigt = TRUE
    WHERE RezensionenID = p_RezensionenID;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
