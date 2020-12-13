const express = require('express');
const morgan = require('morgan');

// Inicializar
const app = express();

// Configuración
app.set('port', process.env.PORT || 4000);

// Middlewares
app.use(morgan('dev'));

// Variables Globales
