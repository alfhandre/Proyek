const express = require('express');

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

const Route = require('./Routes/routes')

app.use('/', Route);

app.listen(3000, () => {
    console.log(`Server is running on http://localhost:${3000}`);
});