// Event-Listener für das Formular, der beim Absenden des Formulars ausgelöst wird
document.getElementById('screen').addEventListener('submit', function(event) {	
    // Werte aus den Eingabefeldern holen
    var inputPassword = document.getElementById('password').value;
    var inputEmail = document.getElementById('email').value;

    // Funktion aufrufen, um das Passwort aus der Datenbank zu holen
    getPasswordFromDb(inputEmail, inputPassword, event);
});

// Asynchrone Funktion, um das Passwort aus der Datenbank zu holen
async function getPasswordFromDb(inputEmail, inputPassword, event) {
    // Standardverhalten des Formulars verhindern
    event.preventDefault();

    try {
        // Anfrage an den Server senden, um Benutzerdaten zu holen
        const response = await fetch(`http://localhost:3000/userData?email=${inputEmail}`);
        
        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }

        // Antwort in JSON umwandeln
        const userData = await response.json();

        // Überprüfen, ob Benutzerdaten vorhanden sind
        if (userData.length === 0) {
            throw new Error('Keine Benutzerdaten gefunden');
        }

        // Passwort und Admin-Status aus den Benutzerdaten extrahieren
        const passwordDb = userData[0].Passwort;
        const adminStatus = userData[0].adminStatus;

        // Benutzer-ID im lokalen Speicher speichern
        localStorage.setItem('kundeID', userData[0].ID);

        // Eingabepasswort mit dem Passwort aus der Datenbank vergleichen
        if (vergleicheEingaben(inputPassword, passwordDb)) {
            // Wenn der Benutzer ein Admin ist, zur Admin-Ansicht weiterleiten
            if (adminStatus === 1) {
                window.location.href = '../AdminView/adminView.html';
            } else {
                // Andernfalls zur Startseite weiterleiten
                window.location.href = '../Startseite/startseite.html';
            }
        } else {
            // Fehlermeldung anzeigen, wenn das Passwort nicht übereinstimmt
        }
    } catch (error) {
        // Fehlerbehandlung für Netzwerk- oder Datenbankfehler
        console.error('Fehler:', error);
    }
}

async function vergleicheEingaben(inputPassword, passwordDb) {
    const encoder = new TextEncoder();
    const data = encoder.encode(inputPassword);

    // Erstellen des SHA-256-Hashs
    const hashBuffer = await crypto.subtle.digest('SHA-256', data);

    // Buffer in Hex-String umwandeln
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
    // Eingabewerte mit den vorgegebenen Zeichenketten vergleichen
    return hashHex === passwordDb;
}