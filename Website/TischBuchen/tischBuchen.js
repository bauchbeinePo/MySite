document.getElementById('submit').addEventListener('click', async function(event) {
    event.preventDefault();
        
    const personen = document.getElementById('personen').value;
    const tag = document.getElementById('tag').value;
    const zeit = document.getElementById('zeit').value;
    const kundeID = 1;

    const buchungsdatum = `${tag} ${zeit}`;
    console.log(buchungsdatum);
    
    const response = await fetch(`http://localhost:3000/tischbuchung?anzahlPlaetze=${personen}&buchungsdatum=${buchungsdatum}&kundeID=${kundeID}`);
    const result = await response.json();
    console.log(result);
});