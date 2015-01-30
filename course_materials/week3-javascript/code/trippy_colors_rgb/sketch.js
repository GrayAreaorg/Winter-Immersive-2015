var red = 0;
var green = 0;
var blue = 0;

var t_red = 0;
var t_green = 0;
var t_blue = 0;

function setup() {
    createCanvas(300, 300);
}

function draw() {
	background(red, green, blue);
	red = 255/2 * sin(t_red) + 255/2;
	green = 255/2 * sin(t_green) + 255/2;
	blue = 255/2 * sin(t_blue) + 255/2;

	t_red = t_red + 0.01;
	t_green = t_green + 0.05;
	t_blue = t_blue + 0.09;
}