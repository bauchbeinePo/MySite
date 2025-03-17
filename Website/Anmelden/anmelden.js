const { getPasswordFromDb } = require('../Datenbank/datenbank.js');

document.getElementById('submit').addEventListener('click', function(event) {
    event.preventDefault(); // Verhindert das Absenden des Formulars	

    // Werte aus den Eingabefeldern holen
    var inputEmail = document.getElementById('email').value;
    var inputPassword = document.getElementById('password').value;

    // Datenbankabfrage, um das Passwort zu holen
    getPasswordFromDb(inputEmail, function(err, passwordDb) {
        if (err) {
            console.error('Fehler beim Abrufen des Passworts: ', err);
            return;
        }

        // Vergleichsmethode aufrufen
        if (vergleicheEingaben(inputPassword, passwordDb)) {
            // Wenn die Eingaben stimmen, das Formular absenden
            //document.getElementById('screen').submit();
        } else {
            // Wenn die Eingaben nicht stimmen, eine Fehlermeldung anzeigen
            alert('Die Eingabewerte stimmen nicht mit den vorgegebenen Zeichenketten überein.');
        }
    });
});

function vergleicheEingaben(inputPassword, passwordDb) {
    // Eingabewerte mit den vorgegebenen Zeichenketten vergleichen
    return inputPassword === passwordDb;
}