document.getElementById('submit').addEventListener('click', function(event) {	

    // Werte aus den Eingabefeldern holen
    var inputPassword = document.getElementById('password').value;
    var inputEmail = document.getElementById('email').value;

    getPasswordFromDb(inputEmail, inputPassword, event);
    document.getElementById('screen').submit();
});

async function getPasswordFromDb(inputEmail, inputPassword, event) {
    const response = await fetch(`http://localhost:3000/passwort?email=${inputEmail}`);
    const userData = await response.json();
    const passwordDb = userData[0].selection;
    console.log(passwordDb);
    console.log(userData);
    
    if (vergleicheEingaben(inputPassword, passwordDb, event)) {
        document.getElementById('screen').submit();
    } else {
        event.preventDefault(); // Verhindert das Absenden des Formulars
    }
}

function vergleicheEingaben(inputPassword, passwordDb) {
    // Eingabewerte mit den vorgegebenen Zeichenketten vergleichen
    return inputPassword === passwordDb;
}