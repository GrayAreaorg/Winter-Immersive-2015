var rad;
var diameter;
var angle = 0;
var flip = true;

function setup() {
	createCanvas(300,300);
	diameter = height - 200;
	noStroke();
}

function draw() {
	background(220);
	fill(255, 0, 0);
	rad = 50 + (sin(angle) * diameter/2) + diameter/2;
	angle += 0.02;
	ellipse(width/2, height/2, rad, rad);
}

function mousePressed() {
	// TODO change the text when the user clicks on the circle
}