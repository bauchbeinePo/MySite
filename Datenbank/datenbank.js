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
        console.log(" Mit MySQL verbunden!");
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

// Funktion zum Abrufen des Passworts aus der Datenbank
function getPasswordFromDb(email, callback) {
    const sql = 'CALL get_Passwort(?)';
    executeQuery(sql, [email], (err, results) => {
        if (err) {
            return callback(err, null);
        }
        callback(null, results[0][0]?.Passwort || null);
    });
}

// API-Endpunkt zum Abrufen der Bestellungen eines Kunden innerhalb eines Datumsbereichs
app.get('/Kunde/:kundenID', (req, res) => {
  const kundenID = req.params.kundenID;
  const sql = 'CALL BestellungenAbrufen(?)';

  executeQuery(sql, [kundenID], (err, results) => {
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

module.exports = { getPasswordFromDb };