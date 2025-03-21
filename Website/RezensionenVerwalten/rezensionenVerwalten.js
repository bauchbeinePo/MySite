let rezensionenID = null;

document.addEventListener('DOMContentLoaded', function() {
    loadNichtGenehmigteRezensionen();

    document.getElementById('genehmigen').addEventListener('click', function() {
        if (rezensionenID != null) {
            const mitarbeiterID = 1; //localStorage.getItem('kundeID');
            genehmigeRezension(rezensionenID, mitarbeiterID);
        }
    });

    document.getElementById('ablehnen').addEventListener('click', function() {
        if (rezensionenID != null) {
            const mitarbeiterID = localStorage.getItem('kundeID'); // Hole die mitarbeiterID aus dem localStorage
            if (mitarbeiterID) {
                loescheRezension(rezensionenID, mitarbeiterID);
            } else {
                alert('MitarbeiterID nicht gefunden. Bitte melden Sie sich an.');
            }
        }
    });
});

async function loadNichtGenehmigteRezensionen() {
    fetch('http://localhost:3000/rezensionen/nicht_genehmigt')
        .then(response => response.json())
        .then(data => {
            if (data.length > 0) {
                const rezension = data[0]; // Nimm die erste Rezension aus der Liste
                document.getElementById('autor').value = rezension.KundeID; // Hier kannst du den Kundennamen statt der ID setzen, wenn verfügbar
                document.getElementById('sterne').value = '⭐'.repeat(rezension.Anzahl_Sterne);
                document.getElementById('titel').value = rezension.Titel;
                document.getElementById('kommentar').value = rezension.Inhalt;
            }
        })
        .catch(error => console.error('Fehler beim Laden der Rezensionen:', error));
}

function loadNichtGenehmigteRezensionen() {
    fetch('http://localhost:3000/rezensionen/nicht_genehmigt')
        .then(response => response.json())
        .then(data => {
            if (data.length > 0) {
                const rezension = data[0]; // Nimm die erste Rezension aus der Liste
                rezensionenID = rezension.RezensionenID;
                console.log(rezensionenID);
                document.getElementById('autor').value = rezension.KundeID; // Hier kannst du den Kundennamen statt der ID setzen, wenn verfügbar
                document.getElementById('sterne').value = '⭐'.repeat(rezension.Anzahl_Sterne);
                document.getElementById('titel').value = rezension.Titel;
                document.getElementById('kommentar').value = rezension.Inhalt;
            }
        })
        .catch(error => console.error('Fehler beim Laden der Rezensionen:', error));
}

function genehmigeRezension(rezensionenID, mitarbeiterID) {
    fetch(`http://localhost:3000/rezensionen/genehmigen?rezensionenID=${rezensionenID}&mitarbeiterID=${mitarbeiterID}`)
        .then(response => response.json())
        .then(data => {
            loadNichtGenehmigteRezensionen(); // Lade die nächste Rezension
        })
        .catch(error => console.error('Fehler beim Genehmigen der Rezension:', error));
}

function loescheRezension(rezensionenID, mitarbeiterID) {
    fetch(`http://localhost:3000/rezensionen/loeschen?rezensionenID=${rezensionenID}`)
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            loadNichtGenehmigteRezensionen(); // Lade die nächste Rezension
        })
        .catch(error => console.error('Fehler beim Löschen der Rezension:', error));
}