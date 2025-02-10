const submitButton = document.getElementById('submit');

submitButton.onclick = async function hashString() {
    const encoder = new TextEncoder();
    const data = encoder.encode(document.getElementById('password').value);
    const hashBuffer = await crypto.subtle.digest('SHA-256', data);

    // Buffer in Hex-String umwandeln
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
    alert(hashHex);
}