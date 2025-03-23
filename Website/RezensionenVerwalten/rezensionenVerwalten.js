let rezensionenID = null;

// Event-Listener, der ausgelöst wird, wenn das DOM vollständig geladen ist
document.addEventListener('DOMContentLoaded', function() {
    loadNichtGenehmigteRezensionen();

    // Event-Listener für den Klick auf den Genehmigen-Button
    document.getElementById('genehmigen').addEventListener('click', function() {
        if (rezensionenID != null) {
            const mitarbeiterID = localStorage.getItem('kundeID');
            genehmigeRezension(rezensionenID, mitarbeiterID);
        }
    });

    // Event-Listener für den Klick auf den Ablehnen-Button
    document.getElementById('ablehnen').addEventListener('click', function() {
        if (rezensionenID != null) {
            const mitarbeiterID = localStorage.getItem('kundeID'); // Hole die mitarbeiterID aus dem localStorage
            if (mitarbeiterID) {
                loescheRezension(rezensionenID, mitarbeiterID);
            } 
        }
    });
});

// Asynchrone Funktion zum Laden der nicht genehmigten Rezensionen
async function loadNichtGenehmigteRezensionen() {
    try {
        const response = await fetch('http://localhost:3000/rezensionen/nicht_genehmigt');
        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }
        const data = await response.json();
        if (data.length > 0) {
            const rezension = data[0]; // Nimm die erste Rezension aus der Liste
            rezensionenID = rezension.RezensionenID;
            console.log(rezensionenID);
            document.getElementById('autor').value = rezension.KundeID; // Hier kannst du den Kundennamen statt der ID setzen, wenn verfügbar
            document.getElementById('sterne').value = '⭐'.repeat(rezension.Anzahl_Sterne);
            document.getElementById('titel').value = rezension.Titel;
            document.getElementById('kommentar').value = rezension.Inhalt;
        }
    } catch (error) {
        // Fehlerbehandlung für den Ladeprozess
        console.error('Fehler beim Laden der Rezensionen:', error);
    }
}

// Funktion zum Genehmigen einer Rezension
function genehmigeRezension(rezensionenID, mitarbeiterID) {
    fetch(`http://localhost:3000/rezensionen/genehmigen?rezensionenID=${rezensionenID}&mitarbeiterID=${mitarbeiterID}`)
        .then(response => {
            // Überprüfen, ob die Antwort erfolgreich war
            if (!response.ok) {
                throw new Error('Netzwerkantwort war nicht ok');
            }
            return response.json();
        })
        .then(data => {
            loadNichtGenehmigteRezensionen(); // Lade die nächste Rezension
        })
        .catch(error => {
            // Fehlerbehandlung für den Genehmigungsprozess
            console.error('Fehler beim Genehmigen der Rezension:', error);
        });
}

// Funktion zum Löschen einer Rezension
function loescheRezension(rezensionenID, mitarbeiterID) {
    fetch(`http://localhost:3000/rezensionen/loeschen?rezensionenID=${rezensionenID}`)
        .then(response => {
            // Überprüfen, ob die Antwort erfolgreich war
            if (!response.ok) {
                throw new Error('Netzwerkantwort war nicht ok');
            }
            return response.json();
        })
        .then(data => {
            loadNichtGenehmigteRezensionen(); // Lade die nächste Rezension
        })
        .catch(error => {
            // Fehlerbehandlung für den Löschprozess
            console.error('Fehler beim Löschen der Rezension:', error);
        });
}