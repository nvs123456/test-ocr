const express = require('express');
const cors = require('cors');

const app = express();

app.use(cors());

app.get('/health', (req, res) => {
    res.send('OK');
})

module.exports = app;

