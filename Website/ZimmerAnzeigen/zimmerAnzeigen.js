
const vonDate = localStorage.getItem('vonDate');
const bisDate = localStorage.getItem('bisDate');
const zimmerTyp = localStorage.getItem('zimmerTyp');
const zimmerArt = localStorage.getItem('zimmerArt');

document.getElementById('vonTag').value = vonDate;
document.getElementById('bisTag').value = bisDate;
document.getElementById('zimmerTyp').value = "Geld";
document.getElementById('zimmerArt').value = zimmerArt;