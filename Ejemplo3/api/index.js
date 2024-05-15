// Importa las bibliotecas necesarias
const express = require('express');

// Crea la aplicación Express
const app = express();

// Define una ruta para la página principal
app.get('/', (req, res) => {
    // Envía el texto deseado como respuesta
    res.send('Hello Word');
});

// Inicia el servidor en el puerto 3000
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor API escuchando en el puerto ${PORT}`);
});
