// Event-Listener für den Klick auf den Submit-Button
document.getElementById('submit').addEventListener('click', async function(event) {
        
    // Werte der Eingabefelder holen
    const personen = document.getElementById('personen').value;
    const tag = document.getElementById('tag').value;
    const zeit = document.getElementById('zeit').value;
    const kundeID = localStorage.getItem('kundeID');

    // Buchungsdatum erstellen
    const buchungsdatum = `${tag} ${zeit}`;
    
    try {
        // Anfrage an den Server senden
        const response = await fetch(`http://localhost:3000/tischbuchung?anzahlPlaetze=${personen}&buchungsdatum=${buchungsdatum}&kundeID=${kundeID}`);
        
        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }

        // Antwort in JSON umwandeln
        const result = await response.json();
    } catch (error) {
        // Fehlerbehandlung für den Buchungsprozess
        console.error('Fehler bei der Tischbuchung:', error);
    }
});