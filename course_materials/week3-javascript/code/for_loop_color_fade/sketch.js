function setup() {
    createCanvas(300, 300);
}

function draw() {
    var brightness = 0;
    for (var x = 0; x < width; x++) {
    	stroke(brightness);
    	line(x, 0, x, height);
    	brightness = brightness + 255/width;
    }
}