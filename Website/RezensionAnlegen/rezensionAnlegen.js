document.getElementById('submit').addEventListener('click', function(event) {

    // Werte der Eingabefelder holen
    const sterne = document.getElementById('sterne').value;
    const titel = document.getElementById('titel').value;
    const kommentar = document.getElementById('kommentar').value;
    const kundeID = localStorage.getItem('kundeID');

    rezensionErstellen(kundeID, sterne, titel, kommentar);
});

async function rezensionErstellen(kundeID, sterne, titel, kommentar) {

    const response = await fetch(`http://localhost:3000/rezensionen/erstellen?kundeID=${kundeID}&anzahlSterne=${sterne}&titel=${titel}&inhalt=${kommentar}`);
    const rezension = await response.json();
    console.log(rezension);
}