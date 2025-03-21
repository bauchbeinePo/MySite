document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM vollständig geladen und analysiert");

    fetch('http://localhost:3000/rechnungen')
    .then(response => response.json())
    .then(data => {
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

function addRechnung(titel, datum, betrag, zimmerart, aufenthaltstage, anreise, abreise, kategorie, vorname, nachname) {
    console.log(`Füge Rechnung hinzu: ${titel}, Datum: ${datum}, Betrag: ${betrag}`);

    const rechnungContainer = document.getElementById("rechnung-container");

    if (!rechnungContainer) {
        console.error("rechnung-container nicht gefunden");
        return;
    }

    const rechnungDiv = document.createElement("div");
    rechnungDiv.className = "rechnung"; // Verwenden Sie className anstelle von id, um mehrere Rechnungen zu ermöglichen

    const rechnungTitel = document.createElement("h2");
    rechnungTitel.textContent = titel;
    rechnungDiv.appendChild(rechnungTitel);

    const rechnungDatum = document.createElement("p");
    rechnungDatum.textContent = `Datum: ${datum}`;
    rechnungDiv.appendChild(rechnungDatum);

    const rechnungName = document.createElement("p");
    rechnungName.textContent = `Name: ${vorname} ${nachname}`;
    rechnungDiv.appendChild(rechnungName);

    const rechnungAufenthaltstage = document.createElement("p");
    rechnungAufenthaltstage.textContent = `Aufenthaltstage: ${aufenthaltstage}`;
    rechnungDiv.appendChild(rechnungAufenthaltstage);

    const rechnungAnreise = document.createElement("p");
    rechnungAnreise.textContent = `Anreise: ${anreise}`;
    rechnungDiv.appendChild(rechnungAnreise);

    const rechnungAbreise = document.createElement("p");
    rechnungAbreise.textContent = `Abreise: ${abreise}`;
    rechnungDiv.appendChild(rechnungAbreise);

    const rechnungZimmerart = document.createElement("p");
    rechnungZimmerart.textContent = `Zimmerart: ${zimmerart}`;
    rechnungDiv.appendChild(rechnungZimmerart);

    const rechnungKategorie = document.createElement("p");
    rechnungKategorie.textContent = `Kategorie: ${kategorie}`;
    rechnungDiv.appendChild(rechnungKategorie);

    const rechnungBetrag = document.createElement("p");
    rechnungBetrag.textContent = `Betrag: ${betrag}`;
    rechnungDiv.appendChild(rechnungBetrag);

    const rechnungDrucken = document.createElement("button");
    rechnungDrucken.textContent = "Rechnung drucken";
    rechnungDrucken.addEventListener("click", function() {
        window.print();
    });
    rechnungDiv.appendChild(rechnungDrucken);

    rechnungContainer.appendChild(rechnungDiv);
    console.log("Rechnung erfolgreich hinzugefügt");
}