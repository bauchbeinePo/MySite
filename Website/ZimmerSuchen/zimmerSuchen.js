const submitButton = document.getElementById('submit');

document.getElementById('submit').addEventListener('click', function(event) {
    getZimmerData();
});

async function getZimmerData() {
    const von = document.getElementById('vonTag').value;
    const bis = document.getElementById('bisTag').value;
    const kategorie = document.getElementById('kategorie').value;
    const zimmerArt = document.getElementById('zimmerArt').value;
    
    const response = await fetch(`http://localhost:3000/zimmer?anreise=${von}&abreise=${bis}&kategorie=${kategorie}&zimmerart=${zimmerArt}`);
    const zimmerData = await response.json();
    
    if (zimmerData.buchung !== 0 && zimmerData.buchung !== null) {
        localStorage.setItem('vonTag', von);
        localStorage.setItem('bisTag', bis);
        localStorage.setItem('kategorie', kategorie);
        localStorage.setItem('zimmerArt', zimmerArt);
        localStorage.setItem('zimmerID', zimmerData[0].p_ZimmerID);
    } else {
        console.log('Keine Buchung verfügbar');
    }

}
