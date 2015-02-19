var johnny = require('johnny-five')
var board = new johnny.Board

var PIN_LED = 13

// Connecting to the Arduino happens asynchronously
// in the background, so you can't start sending it
// commands immediately. `board` is also an EventEmitter,
// and fires the `ready` event when it's ready for
// you to start firing commands.
board.on('ready', function() {

  // Johnny Five provides a bunch of helper
  // classes for making interfacing with an Arduino
  // much simpler. johnny.Led is used for digital LED lights.
  // We're using pin 13 because if a light isn't attached to
  // it, the board's built-in orange LED will light up instead.
  var led = new johnny.Led(PIN_LED)

  // The time in milliseconds between
  // each toggle of the LED.
  var speed = 1000

  // Tells the Arduino to start strobing/blinking
  // the LED periodically at a given rate.
  led.strobe(speed)

})
