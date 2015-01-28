var image_names = ["daisies.jpeg", "lotus.jpeg", "rose.jpeg", "tulip.jpeg"];
var images = [];
var canvas_w = 300;
var canvas_h = 300;

function setup() {
  createCanvas(canvas_w, canvas_h); // same as size
  for (var i = 0; i < image_names.length; i++) {
    images.push(loadImage("img/" + image_names[i]));
  }
}

function draw() {
  var band_thickness = 10;
  for (var i = 0; i < image_names.length; i++) {
    if (Math.random() < 0.5) { // draw vertical band
      var x = my_random(0, canvas_w);
      image(images[i], x, 0, band_thickness, canvas_h);
    } else {                   // draw horizontal band
      var y = my_random(0, canvas_h);
      image(images[i], 0, y, canvas_w, band_thickness);
    }
  } 
}

function my_random(min_val, max_val) {
  return min_val + Math.floor(Math.random() * (max_val - min_val));
}



