document.getElementById('screen').addEventListener('submit', function(event) {	
    // Werte aus den Eingabefeldern holen
    var inputPassword = document.getElementById('password').value;
    var inputEmail = document.getElementById('email').value;

    getPasswordFromDb(inputEmail, inputPassword, event);
});

async function getPasswordFromDb(inputEmail, inputPassword, event) {
    event.preventDefault();

    const response = await fetch(`http://localhost:3000/userData?email=${inputEmail}`);
    const userData = await response.json();
    const passwordDb = userData[0].Passwort;
    const adminStatus = userData[0].adminStatus;
    console.log(passwordDb);
    console.log(userData);

    localStorage.setItem('kundeID', userData[0].ID);
    
    if (vergleicheEingaben(inputPassword, passwordDb)) {
        if (adminStatus === 1) {
            window.location.href = '../AdminView/adminView.html';
        } else {
            window.location.href = '../Startseite/startseite.html';
        }
    }

}

function vergleicheEingaben(inputPassword, passwordDb) {
    // Eingabewerte mit den vorgegebenen Zeichenketten vergleichen
    return inputPassword === passwordDb;
}