const submitButton = document.getElementById('submit');
const von = document.getElementById('vonTag');
const bis = document.getElementById('bisTag');
const zimmerTyp = document.querySelector('select[name="zimmerTyp"]');
const zimmerArt = document.querySelector('select[name="zimmerArt"]');

submitButton.onclick = function getFormData() {
    const vonDate = new Date(von.value);	
    const bisDate = new Date(bis.value);
    const zimmerTypValue = zimmerTyp.value;
    const zimmerArtValue = zimmerArt.value;

    if(vonDate < bisDate) {
        alert("Von-Datum muss vor Bis-Datum liegen!");
        return;
    } else {
        alert("Von-Datum liegt nach Bis-Datum!");
        localStorage.setItem('vonDate', von.value);
        localStorage.setItem('bisDate', bis.value);
        localStorage.setItem('zimmerTyp', zimmerTypValue);
        localStorage.setItem('zimmerArt', zimmerArtValue);
        window.location.href = 'zimmerAnzeigen.html';
    }
}