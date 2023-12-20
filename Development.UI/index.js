const express = require('express')
const app = express()
const path = require('path');
const port = 3175

app.use(express.static('./src'));

app.get('/', function (req, res) {
	res.sendFile('index.html', { root: './src' });
});
app.listen(port, () => console.log(`App listening on port ${port}!`))

module.exports = app