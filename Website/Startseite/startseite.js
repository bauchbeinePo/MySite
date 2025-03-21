document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM vollständig geladen und analysiert");

    const buchungErfolgreich = localStorage.getItem('buchungErfolgreich');
    if (buchungErfolgreich === 'true') {
        document.getElementById('meldung').style.visibility = 'visible';
        localStorage.removeItem('buchungErfolgreich'); // Indikator entfernen
    }

     // Rezensionen von der API abrufen und anzeigen
     fetch('http://localhost:3000/rezensionen/genehmigt')
     .then(response => response.json())
     .then(data => {
         data.forEach(rezension => {
             addRezension(rezension.Vorname + ' ' + rezension.Nachname, rezension.Anzahl_Sterne, rezension.Titel, rezension.Inhalt);
         });
     })
     .catch(error => console.error('Fehler beim Abrufen der Rezensionen:', error));
});

function addRezension(name, sterne, titel, text) {
    console.log(`Füge Rezension hinzu: ${name}, ${sterne} Sterne, Titel: ${titel}`);

    const rezensionContainer = document.getElementById("rezension-container");

    if (!rezensionContainer) {
        console.error("rezension-container nicht gefunden");
        return;
    }

    const rezensionDiv = document.createElement("div");
    rezensionDiv.className = "rezension"; // Verwenden Sie className anstelle von id, um mehrere Rezensionen zu ermöglichen

    const rezensionName = document.createElement("h2");
    rezensionName.textContent = `${name} ${'⭐'.repeat(sterne)}`;
    rezensionDiv.appendChild(rezensionName);

    const rezensionTitel = document.createElement("h3");
    rezensionTitel.textContent = titel;
    rezensionDiv.appendChild(rezensionTitel);

    const rezensionText = document.createElement("p");
    rezensionText.textContent = text;
    rezensionDiv.appendChild(rezensionText);

    rezensionContainer.appendChild(rezensionDiv);
    console.log("Rezension erfolgreich hinzugefügt");
}
