# Waves are Useful

## black and white
(full code available in `code/trippy_colors_grayscale`

The `sin` function is a super helpful way to make things change smoothly over time. For example, how about we make the background of our p5js canvas fade between black and white.

OK so start out with an index.html file that includes p5js and our sketch:

index.html
<pre><code>
&lt;html&gt;
    &lt;head&gt;
        &lt;script type="text/javascript" src="../p5.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript" src="index.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>

sketch.js
<code><pre>
function setup() {
    createCanvas(300, 300);
}
function draw() {
    background(0); // make the background black for now
}
</pre></code>

We are going to make the background change colors to different shades of gray, so lets create a variable called `brightness` to be the brightness of the page, and use that in our draw function like so:

<code><pre>
var brightness = 0;
function setup() {
    createCanvas(300, 300);
}
function draw() {
    background(brightness);
}
</pre></code>

We want the brightness to change over time and go back and forth between black and white. Well, brightness is a number between 0 and 255... how can we make a number oscillate back and forth within a certain range? Sine waves are a great way to do that!

If you are not familiar with sine waves, that is totally fine, go look at some pictures of them on the internet. All you really need to know is that they are a "wiggle", smoothly moving back and forth between a min and a max value over and over again. So let's do

<code><pre>
var brightness = 0;
var t = 0; // the input for sin
function setup() {
    createCanvas(300, 300);
}
function draw() {
    background(brightness);
    brightness = 255/2 * sin(t) + 255/2;
    t = t + 0.01;
}
</pre></code>


`t` is just a helper variable that we increase slowly over time (by increasing it by 0.01 every time in the draw function) so that we can move forward in the sine wiggle.


`brightness = 255/2 * sin(t) + 255/2;`
is doing some math to make sure that our brightness goes between 0 and 255. If you would like to know more about why this is the math that we need here, I would start by opening up the Grapher program (available on Mac OSX) or some other graphing program and plotting y=sin(x) and play around with the equation to see what different parts do. Questions to ask yourself: how does multiplying sin(t) by something change the wave? How does adding change the wave?

## trippy colors
(full code available in `code/trippy_colors_rgb`)

This is essentially the same as the example above, but we are setting the background color using background(red, green, blue) to make it colorful instead of grayscale. So we are controlling each of the red, green, and blue values with their own sine waves.

To make it more interesting, each of the red, green, and blue parts have their own helper variables t_red, t_green, and t_blue, and they increase by different amounts. Increasing t by a greater amount makes the sine wave move through its wiggle faster, and vice versa.
