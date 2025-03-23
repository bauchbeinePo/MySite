// Event-Listener für den Klick auf den Submit-Button
document.getElementById('submit').addEventListener('click', function(event) {

    // Werte der Eingabefelder holen
    const sterne = document.getElementById('sterne').value;
    const titel = document.getElementById('titel').value;
    const kommentar = document.getElementById('kommentar').value;
    const kundeID = localStorage.getItem('kundeID');

    // Rezension erstellen
    rezensionErstellen(kundeID, sterne, titel, kommentar);
});

// Asynchrone Funktion zum Erstellen einer Rezension
async function rezensionErstellen(kundeID, sterne, titel, kommentar) {
    try {
        // Anfrage an den Server senden
        const response = await fetch(`http://localhost:3000/rezensionen/erstellen?kundeID=${kundeID}&anzahlSterne=${sterne}&titel=${titel}&inhalt=${kommentar}`);

        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }

        // Antwort in JSON umwandeln
        const rezension = await response.json();
        console.log(rezension);
    } catch (error) {
        // Fehlerbehandlung für den Erstellungsprozess
        console.error('Fehler beim Erstellen der Rezension:', error);
    }
}