var brightness = 0;

var t = 0;

function setup() {
    createCanvas(300, 300);
}

function draw() {
	background(brightness);
	brightness = 255/2 * sin(t) + 255/2;
	t = t + 0.01;
}