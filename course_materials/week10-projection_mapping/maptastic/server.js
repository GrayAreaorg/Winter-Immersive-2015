var express = require('express');
var app = express();

//set up headers for the server (not sure if this is really needed)
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  next();
});

app.use(express.static(__dirname + '/public')); //serve the index.html page

app.listen(8888);
console.log('express running at http://localhost:%d', 8888);