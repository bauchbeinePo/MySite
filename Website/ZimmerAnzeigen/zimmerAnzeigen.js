// Abrufen der Werte aus dem localStorage
const von = localStorage.getItem('vonTag');
const bis = localStorage.getItem('bisTag');
const kategorie = localStorage.getItem('kategorie');
const zimmerArt = localStorage.getItem('zimmerArt');

// Funktion zum Umwandeln des Datums in die deutsche Schreibweise
function formatDateToGerman(dateString) {
    const date = new Date(dateString);
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    return `${day}.${month}.${year}`;
}

// Setzen der Werte in die entsprechenden Eingabefelder
document.getElementById('vonTag').value = formatDateToGerman(von);
document.getElementById('bisTag').value = formatDateToGerman(bis);
document.getElementById('kategorie').value = kategorie;
document.getElementById('zimmerArt').value = zimmerArt;

// Asynchrone Funktion zum Abrufen des Zimmerpreises
async function getZimmerPreis() {
    try {
        // Anfrage an den Server senden
        const response = await fetch(`http://localhost:3000/zimmerpreis?anreise=${von}&abreise=${bis}&kategorie=${kategorie}&zimmerart=${zimmerArt}`);
        
        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }

        // Antwort in JSON umwandeln
        const zimmerPreis = await response.json();

        // Setzen der Preise in die entsprechenden Elemente
        document.getElementById('gesamtpreis').innerText = `Gesamtpreis: ${zimmerPreis[0].Gesamtpreis} €`;
        document.getElementById('preis').innerText = `Preis pro Nacht: ${zimmerPreis[0].Preis} €`;
    } catch (error) {
        // Fehlerbehandlung für den Abrufprozess
        console.error('Fehler beim Abrufen des Zimmerpreises:', error);
    }
}

// Aufrufen der Funktion zum Abrufen des Zimmerpreises
getZimmerPreis();

// Event-Listener für den Klick auf den Submit-Button
document.getElementById('submit').addEventListener('click', function() {
    localStorage.setItem('buchungErfolgreich', 'true'); // Indikator setzen
    zimmerBuchen();
});

// Asynchrone Funktion zum Buchen des Zimmers
async function zimmerBuchen() {
    try {
        // Abrufen der Werte aus dem localStorage
        const kundeID = localStorage.getItem('kundeID');
        const zimmerID = localStorage.getItem('zimmerID');

        // URL für die Anfrage an den Server
        const url = `http://localhost:3000/buchung?anreise=${von}&abreise=${bis}&kundeID=${kundeID}&zimmerID=${zimmerID}`;
        
        // Anfrage an den Server senden
        const response = await fetch(url);
        
        // Überprüfen, ob die Antwort erfolgreich war
        if (!response.ok) {
            throw new Error('Netzwerkantwort war nicht ok');
        }

        // Antwort in JSON umwandeln
        const result = await response.json();
    } catch (error) {
        // Fehlerbehandlung für den Buchungsprozess
        console.error('Fehler bei der Zimmerbuchung:', error);
    }
}