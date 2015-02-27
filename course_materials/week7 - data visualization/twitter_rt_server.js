var Twit = require('twit');
var express = require('express');
var socketio = require('socket.io');

var express_app = express();
express_app.use(express.static(__dirname + '/public'));
var express_server = express_app.listen(8000);
var io = socketio.listen(express_server);

var T = new Twit({
  // fill with your own keys
});
stream = T.stream('statuses/filter', { track: 'javascript' });

var nodes = {};
stream.on('tweet', function(json) {
    console.log('data', json);
    io.emit('data', json);
});

io.on('error', function(err) {
    console.log('io error', err);
});
io.on('connection', function(conn) {
    console.log('connection');
});