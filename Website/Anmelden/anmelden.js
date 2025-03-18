const { getPasswordFromDb } = require('../Datenbank/datenbank.js');

document.getElementById('submit').addEventListener('click', function(event) {
    event.preventDefault(); // Verhindert das Absenden des Formulars	

    // Werte aus den Eingabefeldern holen
    
    var inputPassword = document.getElementById('password').value;    
    getPasswordFromDb();
});

async function getPasswordFromDb() {
    var inputEmail = "max.mustermann@example.com";
    const response = await fetch('http://localhost:3000/passwort/${inputEmail}');
    const userData = await response.json();
    console.log(userData);
    return userData;
}

function vergleicheEingaben(inputPassword, passwordDb) {
    // Eingabewerte mit den vorgegebenen Zeichenketten vergleichen
    return inputPassword === passwordDb;
}