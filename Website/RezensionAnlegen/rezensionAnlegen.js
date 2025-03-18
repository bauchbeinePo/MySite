document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('rezensionForm');
    
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Verhindert das Standard-Formular-Absenden

        // Werte der Eingabefelder holen
        const titel = document.getElementById('titel').value;
        const inhalt = document.getElementById('inhalt').value;
        const bewertung = document.getElementById('bewertung').value;

        // Werte in der Konsole ausgeben
        console.log('Titel:', titel);
        console.log('Inhalt:', inhalt);
        console.log('Bewertung:', bewertung);
    });
});