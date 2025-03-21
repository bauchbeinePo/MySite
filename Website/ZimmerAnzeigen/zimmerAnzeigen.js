
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

document.getElementById('vonTag').value = formatDateToGerman(von);
document.getElementById('bisTag').value = formatDateToGerman(bis);
document.getElementById('kategorie').value = kategorie;
document.getElementById('zimmerArt').value = zimmerArt;

async function getZimmerPreis() {
const response = await fetch(`http://localhost:3000/zimmerpreis?anreise=${von}&abreise=${bis}&kategorie=${kategorie}&zimmerart=${zimmerArt}`);
const zimmerPreis = await response.json();

document.getElementById('gesamtpreis').innerText = `Gesamtpreis: ${zimmerPreis[0].Gesamtpreis} €`;
document.getElementById('preis').innerText = `Preis pro Nacht: ${zimmerPreis[0].Preis} €`;
}

getZimmerPreis();

document.getElementById('submit').addEventListener('click', function() {
    localStorage.setItem('buchungErfolgreich', 'true'); // Indikator setzen
    zimmerBuchen();
});

async function zimmerBuchen() {
    const kundeID = localStorage.getItem('kundeID');
    const zimmerID = localStorage.getItem('zimmerID');

    const url = `http://localhost:3000/buchung?anreise=${von}&abreise=${bis}&kundeID=${kundeID}&zimmerID=${zimmerID}`;
    const response = await fetch(url);
    const result = await response.json();

}