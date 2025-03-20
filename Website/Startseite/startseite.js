document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM vollständig geladen und analysiert");

    // Beispielrezensionen hinzufügen
    addRezension("Max Mustermann", 5, "Tolles Hotel!", "Ich hatte einen sehr angenehmen Aufenthalt im Hotel FunRest. Die Zimmer waren sauber, modern eingerichtet und boten einen hohen Komfort. Besonders hervorzuheben ist der freundliche Service – das Personal war stets hilfsbereit und zuvorkommend. Auch die Lage des Hotels war ideal, mit guter Anbindung an öffentliche Verkehrsmittel/Sehenswürdigkeiten. Das Frühstück war vielfältig und frisch, ein perfekter Start in den Tag. Ein kleiner Verbesserungspunkt wäre der Geräuschpegel, die Größe des Fitnessbereichs, etc., aber insgesamt eine klare Empfehlung für alle Reisenden. Ich komme gerne wieder!");
    addRezension("Anna Müller", 3, "Wunderbarer Aufenthalt!", "Das Hotel FunRest hat meine Erwartungen übertroffen. Die Zimmer waren geräumig und sauber, und das Personal war sehr freundlich. Die Lage war perfekt, um die Stadt zu erkunden. Das Frühstücksbuffet war reichhaltig und lecker. Ich werde definitiv wiederkommen!");
    addRezension("Peter Schmidt", 5, "Exzellenter Service!", "Ich war sehr zufrieden mit meinem Aufenthalt im Hotel FunRest. Das Personal war äußerst hilfsbereit und freundlich. Die Zimmer waren komfortabel und gut ausgestattet. Die Lage des Hotels war ebenfalls sehr praktisch. Ich kann dieses Hotel nur weiterempfehlen.");
    addRezension("Lisa Becker", 4, "Fantastisches Hotel!", "Mein Aufenthalt im Hotel FunRest war einfach fantastisch. Die Zimmer waren modern und sauber, und das Personal war sehr zuvorkommend. Die Lage des Hotels war ideal, um die Stadt zu erkunden. Das Frühstück war köstlich und bot eine große Auswahl. Ich werde definitiv wiederkommen!");
    addRezension("Michael Fischer", 3, "Perfekter Aufenthalt!", "Ich hatte einen perfekten Aufenthalt im Hotel FunRest. Die Zimmer waren komfortabel und sauber, und das Personal war sehr freundlich und hilfsbereit. Die Lage des Hotels war ideal, um die Stadt zu erkunden. Das Frühstück war reichhaltig und lecker. Ich kann dieses Hotel nur weiterempfehlen.");
    addRezension("Julia Wagner", 5, "Wunderschönes Hotel!", "Das Hotel FunRest war wunderschön und sehr gepflegt. Die Zimmer waren sauber und komfortabel, und das Personal war sehr freundlich. Die Lage des Hotels war perfekt, um die Stadt zu erkunden. Das Frühstück war köstlich und bot eine große Auswahl. Ich werde definitiv wiederkommen!");
});

function addRezension(name, sterne, titel, text) {
    console.log(`Füge Rezension hinzu: ${name}, ${sterne} Sterne, Titel: ${titel}`);

    const rezensionContainer = document.getElementById("rezension-container");

    if (!rezensionContainer) {
        console.error("rezension-container nicht gefunden");
        return;
    }

    const rezensionDiv = document.createElement("div");
    rezensionDiv.className = "rezension"; // Verwenden Sie className anstelle von id, um mehrere Rezensionen zu ermöglichen

    const rezensionName = document.createElement("h2");
    rezensionName.textContent = `${name} ${'⭐'.repeat(sterne)}`;
    rezensionDiv.appendChild(rezensionName);

    const rezensionTitel = document.createElement("h3");
    rezensionTitel.textContent = titel;
    rezensionDiv.appendChild(rezensionTitel);

    const rezensionText = document.createElement("p");
    rezensionText.textContent = text;
    rezensionDiv.appendChild(rezensionText);

    rezensionContainer.appendChild(rezensionDiv);
    console.log("Rezension erfolgreich hinzugefügt");
}

const { getPasswort } = require('../../Datenbank/datenbank.js'); // Import der Funktion

// Beispiel: Passwort für eine bestimmte E-Mail abrufen
const email = "test@example.com";

getPasswort(email, (err, result) => {
    if (err) {
        console.error("Fehler beim Abrufen des Passworts:", err);
    } else {
        console.log("Passwort-Daten:", result);
    }
});
