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

app.get('/passwort/', (req, res) => {
  const email = req.query.email;
  const sql = 'CALL get_Passwort(?)';

  executeQuery(sql, [email], (err, results) => {
    if (err) {
        return res.status(500).json({ error: err.message });
    }
    res.json(results[0]); // Ergebnisse zurückgeben
});
});
 
app.get('/rezensionen_genehmigt', (req, res) => {
  const sql = 'CALL get_Rezensionen_Genehmigt()';
  executeQuery(sql, [], (err, results) => {
    if (err) {
        return res.status(500).json({ error: err.message });
    }
    res.json(results[0]); // Ergebnisse zurückgeben
});
});

app.get('/rezensionen_nicht_genehmigt', (req, res) => {
  const sql = 'CALL get_Rezensionen_nicht_Genehmigt()';
  executeQuery(sql, [], (err, results) => {
    if (err) {
        return res.status(500).json({ error: err.message });
    }
    res.json(results[0]); // Ergebnisse zurückgeben
});
});

app.get('/kunde', (req, res) => {
  const { vorname, nachname, geschlecht, geburtsdatum, ort, straße, plz, hausnummer, email, passwort, gast, anrede } = req.query;
  const sql = 'CALL new_Kunde(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';

  executeQuery(sql, [vorname, nachname, geschlecht, geburtsdatum, ort, straße, plz, hausnummer, email, passwort, gast, anrede], (err, results) => {
    if (err) {
        return res.status(500).json({ error: err.message });
    }
    res.json(results[0]); // Ergebnisse zurückgeben
});
});

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
 
 
// Server starten
app.listen(3000, () => {
    console.log("🌍 Server läuft auf http://localhost:3000");
});
 