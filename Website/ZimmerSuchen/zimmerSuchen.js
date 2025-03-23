// Abrufen des Submit-Buttons
const submitButton = document.getElementById('submit');

// Event-Listener für den Klick auf den Submit-Button
document.getElementById('submit').addEventListener('click', function(event) {
    // Standardverhalten des Formulars verhindern
    getZimmerData();
});

// Asynchrone Funktion zum Abrufen der Zimmerdaten
async function getZimmerData() {
    // Abrufen der Werte aus den Eingabefeldern
    const von = document.getElementById('vonTag').value;
    const bis = document.getElementById('bisTag').value;
    const kategorie = document.getElementById('kategorie').value;
    const zimmerArt = document.getElementById('zimmerArt').value;
    
    try {
        // Anfrage an den Server senden
        const response = await fetch(`http://localhost:3000/zimmer?anreise=${von}&abreise=${bis}&kategorie=${kategorie}&zimmerart=${zimmerArt}`);
        
        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }

        // Antwort in JSON umwandeln
        const zimmerData = await response.json();
        
        // Überprüfen, ob Zimmerdaten verfügbar sind
        if (zimmerData.buchung !== 0 && zimmerData.buchung !== null) {
            // Speichern der Daten im localStorage
            localStorage.setItem('vonTag', von);
            localStorage.setItem('bisTag', bis);
            localStorage.setItem('kategorie', kategorie);
            localStorage.setItem('zimmerArt', zimmerArt);
            localStorage.setItem('zimmerID', zimmerData[0].p_ZimmerID);
        } else {
            console.log('Kein Zimmer verfügbar');
        }
    } catch (error) {
        // Fehlerbehandlung für den Abrufprozess
        console.error('Fehler beim Abrufen der Zimmerdaten:', error);
    }
}