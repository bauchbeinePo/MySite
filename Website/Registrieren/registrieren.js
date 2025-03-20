const submitButton = document.getElementById('submit');

submitButton.onclick = async function hashString(event) {
    event.preventDefault();

    const encoder = new TextEncoder();
    const data = encoder.encode(document.getElementById('password').value);
    const hashBuffer = await crypto.subtle.digest('SHA-256', data);

    // Buffer in Hex-String umwandeln
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');

    // Daten an den Server senden
    await registrieren(hashHex);
}

async function registrieren(hashHex) {
    const vorname = document.getElementById('vorname').value;
    const nachname = document.getElementById('name').value;
    const geschlecht = document.getElementById('geschlecht').value;
    const geburtsdatum = document.getElementById('geburtsdatum').value;
    const ort = document.getElementById('stadt').value;
    const straße = document.getElementById('straße').value;
    const plz = document.getElementById('plz').value;
    const hausnummer = document.getElementById('hausnummer').value;
    const email = document.getElementById('email').value;
    const anrede = document.getElementById('anrede').value;

    const url = `http://localhost:3000/kunde?vorname=${vorname}&nachname=${nachname}&geschlecht=${geschlecht}&geburtsdatum=${geburtsdatum}&ort=${ort}&straße=${straße}&plz=${plz}&hausnummer=${hausnummer}&email=${email}&passwort=${hashHex}&gast=${0}&anrede=${anrede}`;
    console.log(url);
    const response = await fetch(url);
    const result = await response.json();
}