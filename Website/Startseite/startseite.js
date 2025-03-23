// Event-Listener, der ausgelöst wird, wenn das DOM vollständig geladen ist
document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM vollständig geladen und analysiert");

    // Überprüfen, ob eine Buchung erfolgreich war
    const buchungErfolgreich = localStorage.getItem('buchungErfolgreich');
    if (buchungErfolgreich === 'true') {
        // Anzeige einer Erfolgsmeldung
        document.getElementById('meldung').style.visibility = 'visible';
        localStorage.removeItem('buchungErfolgreich'); // Indikator entfernen
    }

    // Rezensionen von der API abrufen und anzeigen
    fetch('http://localhost:3000/rezensionen/genehmigt')
    .then(response => {
        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }
        return response.json();
    })
    .then(data => {
        // Durchlaufen der erhaltenen Rezensionen und Hinzufügen jeder Rezension
        data.forEach(rezension => {
            addRezension(rezension.Vorname + ' ' + rezension.Nachname, rezension.Anzahl_Sterne, rezension.Titel, rezension.Inhalt);
        });
    })
    .catch(error => {
        // Fehlerbehandlung für den Abrufprozess
        console.error('Fehler beim Abrufen der Rezensionen:', error);
    });
});

// Funktion zum Hinzufügen einer Rezension zum DOM
function addRezension(name, sterne, titel, text) {
    // Container für Rezensionen abrufen
    const rezensionContainer = document.getElementById("rezension-container");

    // Fehlerbehandlung, falls der Container nicht gefunden wird
    if (!rezensionContainer) {
        console.error("rezension-container nicht gefunden");
        return;
    }

    // Erstellen eines neuen Div-Elements für die Rezension
    const rezensionDiv = document.createElement("div");
    rezensionDiv.className = "rezension"; // Verwenden von className anstelle von id, um mehrere Rezensionen zu ermöglichen

    // Hinzufügen des Namens und der Sterne
    const rezensionName = document.createElement("h2");
    rezensionName.textContent = `${name} ${'⭐'.repeat(sterne)}`;
    rezensionDiv.appendChild(rezensionName);

    // Hinzufügen des Titels
    const rezensionTitel = document.createElement("h3");
    rezensionTitel.textContent = titel;
    rezensionDiv.appendChild(rezensionTitel);

    // Hinzufügen des Textes
    const rezensionText = document.createElement("p");
    rezensionText.textContent = text;
    rezensionDiv.appendChild(rezensionText);

    // Hinzufügen der Rezension zum Container
    rezensionContainer.appendChild(rezensionDiv);
    console.log("Rezension erfolgreich hinzugefügt");
}