// Event-Listener, der ausgelöst wird, wenn das DOM vollständig geladen ist
document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM vollständig geladen und analysiert");

    // Abrufen der Rechnungen vom Server
    fetch('http://localhost:3000/rechnungen')
    .then(response => {
        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }
        return response.json();
    })
    .then(data => {
        // Durchlaufen der erhaltenen Rechnungsdaten und Hinzufügen jeder Rechnung
        data.forEach(rechnung => {
            addRechnung(
                `Rechnung ${rechnung.RechnungID}`,
                new Date(rechnung.Erstelldatum).toLocaleDateString('de-DE'),
                `${rechnung.Gesamtpreis.toFixed(2).replace('.', ',')} €`,
                rechnung.Zimmerart,
                rechnung.Aufenthaltstage,
                new Date(rechnung.Anreise).toLocaleDateString('de-DE'),
                new Date(rechnung.Abreise).toLocaleDateString('de-DE'),
                rechnung.Kategorie, 
                rechnung.Vorname,
                rechnung.Nachname
            );
        });
    })
    .catch(error => console.error('Fehler beim Abrufen der Rechnungen:', error));
});

// Funktion zum Hinzufügen einer Rechnung zum DOM
function addRechnung(titel, datum, betrag, zimmerart, aufenthaltstage, anreise, abreise, kategorie, vorname, nachname) {

    // Container für Rechnungen abrufen
    const rechnungContainer = document.getElementById("rechnung-container");

    // Fehlerbehandlung, falls der Container nicht gefunden wird
    if (!rechnungContainer) {
        console.error("rechnung-container nicht gefunden");
        return;
    }

    // Erstellen eines neuen Div-Elements für die Rechnung
    const rechnungDiv = document.createElement("div");
    rechnungDiv.className = "rechnung"; // Verwenden von className anstelle von id, um mehrere Rechnungen zu ermöglichen

    // Hinzufügen des Rechnungstitels
    const rechnungTitel = document.createElement("h2");
    rechnungTitel.textContent = titel;
    rechnungDiv.appendChild(rechnungTitel);

    // Hinzufügen des Rechnungsdatums
    const rechnungDatum = document.createElement("p");
    rechnungDatum.textContent = `Datum: ${datum}`;
    rechnungDiv.appendChild(rechnungDatum);

    // Hinzufügen des Namens
    const rechnungName = document.createElement("p");
    rechnungName.textContent = `Name: ${vorname} ${nachname}`;
    rechnungDiv.appendChild(rechnungName);

    // Hinzufügen der Aufenthaltstage
    const rechnungAufenthaltstage = document.createElement("p");
    rechnungAufenthaltstage.textContent = `Aufenthaltstage: ${aufenthaltstage}`;
    rechnungDiv.appendChild(rechnungAufenthaltstage);

    // Hinzufügen der Anreise
    const rechnungAnreise = document.createElement("p");
    rechnungAnreise.textContent = `Anreise: ${anreise}`;
    rechnungDiv.appendChild(rechnungAnreise);

    // Hinzufügen der Abreise
    const rechnungAbreise = document.createElement("p");
    rechnungAbreise.textContent = `Abreise: ${abreise}`;
    rechnungDiv.appendChild(rechnungAbreise);

    // Hinzufügen der Zimmerart
    const rechnungZimmerart = document.createElement("p");
    rechnungZimmerart.textContent = `Zimmerart: ${zimmerart}`;
    rechnungDiv.appendChild(rechnungZimmerart);

    // Hinzufügen der Kategorie
    const rechnungKategorie = document.createElement("p");
    rechnungKategorie.textContent = `Kategorie: ${kategorie}`;
    rechnungDiv.appendChild(rechnungKategorie);

    // Hinzufügen des Betrags
    const rechnungBetrag = document.createElement("p");
    rechnungBetrag.textContent = `Betrag: ${betrag}`;
    rechnungDiv.appendChild(rechnungBetrag);

    // Hinzufügen eines Druck-Buttons
    const rechnungDrucken = document.createElement("button");
    rechnungDrucken.textContent = "Rechnung drucken";
    rechnungDrucken.addEventListener("click", function() {
        window.print();
    });
    rechnungDiv.appendChild(rechnungDrucken);

    // Hinzufügen der Rechnung zum Container
    rechnungContainer.appendChild(rechnungDiv);
    console.log("Rechnung erfolgreich hinzugefügt");
}