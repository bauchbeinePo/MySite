document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM vollständig geladen und analysiert");

    // Beispielrechnungen hinzufügen
    addRechnung("Rechnung 1", "01.01.2025", "100,00 €");
    addRechnung("Rechnung 2", "02.01.2025", "200,00 €");
    addRechnung("Rechnung 3", "03.01.2025", "300,00 €");
    addRechnung("Rechnung 4", "04.01.2025", "400,00 €");
    addRechnung("Rechnung 5", "05.01.2025", "500,00 €");
    addRechnung("Rechnung 6", "06.01.2025", "600,00 €");
    addRechnung("Rechnung 7", "07.01.2025", "700,00 €");
    addRechnung("Rechnung 8", "08.01.2025", "800,00 €");
    addRechnung("Rechnung 9", "09.01.2025", "900,00 €");
    addRechnung("Rechnung 10", "10.01.2025", "1000,00 €");
});

function addRechnung(titel, datum, betrag) {
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

    const rechnungBetrag = document.createElement("p");
    rechnungBetrag.textContent = `Betrag: ${betrag}`;
    rechnungDiv.appendChild(rechnungBetrag);

    rechnungContainer.appendChild(rechnungDiv);
    console.log("Rechnung erfolgreich hinzugefügt");
}