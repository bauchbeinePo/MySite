require("dotenv").config();
const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json()); // Erlaubt JSON-Daten in POST-Requests

// Verbindung zur MySQL-Datenbank
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "funrest",
});

// Verbindung zur Datenbank herstellen
db.connect((err) => {
    if (err) {
        console.error("Datenbankverbindung fehlgeschlagen: ", err);
    } else {
        console.log("Mit MySQL verbunden!");
    }
});

// Funktion zum Ausführen einer SQL-Abfrage
function executeQuery(sql, params, callback) {
    db.query(sql, params, (err, results) => {
        if (err) {
            return callback(err, null);
        }
        callback(null, results);
    });
}

// Route zum Abrufen von Benutzerdaten
app.get('/userData', (req, res) => {
    const email = req.query.email;
    const sql = 'CALL get_UserData(?)';

    executeQuery(sql, [email], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results[0]); // Ergebnisse zurückgeben
    });
});

// Route zum Abrufen genehmigter Rezensionen
app.get('/rezensionen/genehmigt', (req, res) => {
    const sql = 'CALL get_Rezensionen_Genehmigt()';
    executeQuery(sql, [], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results[0]); // Ergebnisse zurückgeben
    });
});

// Route zum Abrufen nicht genehmigter Rezensionen
app.get('/rezensionen/nicht_genehmigt', (req, res) => {
    const sql = 'CALL get_Rezensionen_nicht_Genehmigt()';
    executeQuery(sql, [], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results[0]); // Ergebnisse zurückgeben
    });
});

// Route zum Anlegen eines neuen Kunden
app.get('/kunde', (req, res) => {
    const { vorname, nachname, geschlecht, geburtsdatum, ort, straße, plz, hausnummer, email, passwort, gast, anrede } = req.query;
    const sql = 'CALL new_Kunde(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';

    executeQuery(sql, [vorname, nachname, geschlecht, geburtsdatum, ort, straße, plz, hausnummer, email, passwort, gast, anrede], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ message: 'Kunde erfolgreich angelegt', results: results[0] });
    });
});

// Route zum Abrufen freier Zimmer
app.get('/zimmer', (req, res) => {
    const { anreise, abreise, kategorie, zimmerart } = req.query;
    const sql = 'CALL get_free_Zimmer(?, ?, ?, ?)';
    
    executeQuery(sql, [anreise, abreise, kategorie, zimmerart], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results[0]); // Ergebnisse zurückgeben
    });
});

// Route zum Abrufen des Zimmerpreises
app.get('/zimmerpreis', (req, res) => {
    const { anreise, abreise, kategorie, zimmerart } = req.query;
    const sql = 'CALL get_Zimmer_preis(?, ?, ?, ?)';
    
    executeQuery(sql, [anreise, abreise, kategorie, zimmerart], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results[0]); // Ergebnisse zurückgeben
    });
});

// Route zum Buchen eines Zimmers
app.get('/buchung', (req, res) => {
    const { anreise, abreise, kundeID, zimmerID } = req.query;
    const sql = 'CALL set_Buchung_Zimmer(?, ?, ?, ?)';

    executeQuery(sql, [anreise, abreise, kundeID, zimmerID], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ message: 'Buchung erfolgreich hinzugefügt', results: results[0] });
    });
});

// Route zum Genehmigen einer Rezension
app.get('/rezensionen/genehmigen', (req, res) => {
    const { rezensionenID, mitarbeiterID } = req.query;
    const sql = 'CALL set_Rezensionen_Genehmigt(?, ?)';

    executeQuery(sql, [rezensionenID, mitarbeiterID], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ message: 'Rezension erfolgreich genehmigt', results: results[0] });
    });
});

// Route zum Erstellen einer neuen Rezension
app.get('/rezensionen/erstellen', (req, res) => {
    const { kundeID, anzahlSterne, titel, inhalt } = req.query;
    const sql = 'CALL new_Rezension(?, ?, ?, ?)';

    executeQuery(sql, [kundeID, anzahlSterne, titel, inhalt], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ message: 'Rezension erfolgreich erstellt', results: results[0] });
    });
});

// Route zum Löschen einer Rezension
app.get('/rezensionen/loeschen', (req, res) => {
    const { rezensionenID } = req.query;
    const sql = 'CALL del_Rezensionen(?)';

    executeQuery(sql, [rezensionenID], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ message: 'Rezension erfolgreich gelöscht', results: results[0] });
    });
});

// Route zum Buchen eines Tisches
app.get('/tischbuchung', (req, res) => {
    const { anzahlPlaetze, buchungsdatum, kundeID } = req.query;
    const sql = 'CALL set_free_Tisch(?, ?, ?)';

    executeQuery(sql, [anzahlPlaetze, buchungsdatum, kundeID], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results[0]); // Ergebnisse zurückgeben
    });
});

// Route zum Abrufen der Rechnungen
app.get('/rechnungen', (req, res) => {
    const sql = 'CALL get_Rechnungen()';

    executeQuery(sql, [], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results[0]); // Ergebnisse zurückgeben
    });
});

// Server starten
app.listen(3000, () => {
    console.log("🌍 Server läuft auf http://localhost:3000");
});