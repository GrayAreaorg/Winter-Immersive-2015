// Originally sourced from:
// https://github.com/rwaldron/johnny-five/blob/master/docs/button.md
// You can find a matching breadboard illustration on that page.

var johnny = require('johnny-five')
var board = new johnny.Board()

var PIN_BUTTON = 8

// Connecting to the Arduino happens asynchronously
// in the background, so you can't start sending it
// commands immediately. `board` is also an EventEmitter,
// and fires the `ready` event when it's ready for
// you to start firing commands.
board.on('ready', function() {
  var button = new johnny.Button(PIN_BUTTON)

  button.on('hit', function() {
    console.log('button hit')
  })

  button.on('release', function() {
    console.log('button released')
  })

  button.on('hold', function() {
    console.log('button is being held down')
  })
})
