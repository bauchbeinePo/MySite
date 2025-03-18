const submitButton = document.getElementById('submit');
const von = document.getElementById('vonTag');
const bis = document.getElementById('bisTag');
const zimmerTyp = document.getElementById('zimmerTyp');
const zimmerArt = document.getElementById('zimmerArt');

submitButton.onclick = function getFormData() {
    if(von.value  > bis.value) {
        alert("Von-Datum muss vor Bis-Datum liegen!");
    } else {
        localStorage.setItem('vonDate', von.value);
        localStorage.setItem('bisDate', bis.value);
        localStorage.setItem('zimmerTyp', zimmerTyp);
        localStorage.setItem('zimmerArt', zimmerArt);
        window.location.href = 'zimmerAnzeigen.html';
        
    }
    console.log("test");
    getZimmerData(vonDate, bisDate, zimmerTyp, zimmerArt);
}

async function getZimmerData(vonDate, bisDate, zimmerTyp, zimmerArt) {
    const response = await fetch('http://localhost:3000/zimmer?anreise=${vonDate}&abreise=${bisDate}&kategorie=${zimmerTyp}&zimmerart=${zimmerArt}');
    const zimmerData = await response.json();
    alert(zimmerData);
    return zimmerData;
}
