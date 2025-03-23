// Abrufen des Submit-Buttons
const submitButton = document.getElementById('submit');

// Event-Handler für den Klick auf den Submit-Button
submitButton.onclick = async function hashString() {
    try {
        // TextEncoder zum Kodieren des Passworts
        const encoder = new TextEncoder();
        const data = encoder.encode(document.getElementById('password').value);

        // Erstellen des SHA-256-Hashs
        const hashBuffer = await crypto.subtle.digest('SHA-256', data);

        // Buffer in Hex-String umwandeln
        const hashArray = Array.from(new Uint8Array(hashBuffer));
        const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');

        // Daten an den Server senden
        await registrieren(hashHex);
    } catch (error) {
        // Fehlerbehandlung für Hashing-Prozess
        console.error('Fehler beim Hashing:', error);
    }
}

// Asynchrone Funktion zum Registrieren des Benutzers
async function registrieren(hashHex) {
    try {
        // Abrufen der Eingabewerte aus dem Formular
        const vorname = document.getElementById('vorname').value;
        const nachname = document.getElementById('name').value;
        const geschlecht = document.getElementById('geschlecht').value;
        const geburtsdatum = document.getElementById('geburtsdatum').value;
        const ort = document.getElementById('stadt').value;
        const straße = document.getElementById('straße').value;
        const plz = document.getElementById('plz').value;
        const hausnummer = document.getElementById('hausnummer').value;
        const email = document.getElementById('email').value;
        const anrede = document.getElementById('anrede').value;

        // URL für die Anfrage an den Server
        const url = `http://localhost:3000/kunde?vorname=${vorname}&nachname=${nachname}&geschlecht=${geschlecht}&geburtsdatum=${geburtsdatum}&ort=${ort}&straße=${straße}&plz=${plz}&hausnummer=${hausnummer}&email=${email}&passwort=${hashHex}&gast=${0}&anrede=${anrede}`;

        // Anfrage an den Server senden
        const response = await fetch(url);

        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }

        // Antwort in JSON umwandeln
        const result = await response.json();
    } catch (error) {
        // Fehlerbehandlung für den Registrierungsprozess
        console.error('Fehler bei der Registrierung:', error);
    }
}