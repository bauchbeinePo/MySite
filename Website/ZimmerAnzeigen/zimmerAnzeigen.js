
const von = localStorage.getItem('vonTag');
const bis = localStorage.getItem('bisTag');
const kategorie = localStorage.getItem('kategorie');
const zimmerArt = localStorage.getItem('zimmerArt');

document.getElementById('vonTag').value = von;
document.getElementById('bisTag').value = bis;
document.getElementById('kategorie').value = kategorie;
document.getElementById('zimmerArt').value = zimmerArt;

async function getZimmerPreis() {
const response = await fetch(`http://localhost:3000/zimmerpreis?anreise=${von}&abreise=${bis}&kategorie=${kategorie}&zimmerart=${zimmerArt}`);
const zimmerPreis = await response.json();

document.getElementById('gesamtpreis').innerText = zimmerPreis[0].Gesamtpreis;
document.getElementById('preis').innerText = zimmerPreis[0].Preis;
}

getZimmerPreis();