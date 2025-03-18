const { getPasswort } = require('../../Datenbank/datenbank.js'); // Import der Funktion

// Beispiel: Passwort für eine bestimmte E-Mail abrufen
const email = "test@example.com";

getPasswort(email, (err, result) => {
    if (err) {
        console.error("Fehler beim Abrufen des Passworts:", err);
    } else {
        console.log("Passwort-Daten:", result);
    }
});
