# For Loop Color Fade

In this exampe we will use a for loop to draw a pretty gradient. The complete example code is available in the `code` folder for this week.

Set up a basic HTML page like so

<pre><code>
&lt;html&gt;
    &lt;head&gt;
    &lt;/head&gt;
    &lt;body&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>

We are going to use p5js so we need to include the P5js file and our `sketch.js` file, so include those like so:

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

Let's get a basic `sketch.js` file going too:
<code><pre>
function setup() {
    createCanvas(300, 300);
}
function draw() {
    background(0); // make the background black for now so we can see it
}
</pre></code>

Our goal is to draw a gradient from black on the left side of canvas to white on the right side. One way to do this is to draw a lot of vertical lines in different shades of gray. Towards the left, the lines will be darker gray, and towards the right, they will be a lighter gray.

Recall that this is how you draw a line:

<code>
line(0, 0, 0, height);
</code>

* the first number you give it is the starting x position
* the second number you give it is the starting y position
* the third number is the ending x position
* the fourth number is the ending y position

One way to draw a lot of vertical lines of different shades of gray would be to put this inside our `draw()` function:
<code><pre>
stroke(0); // black
line(0, 0, 0, height);
stroke(1); // slightly lighter color
line(1, 0, 1, height);
stroke(2); // slightly lighter color
line(2, 0, 2, height);
</pre></code>
and then repeat that ad nauseum. Our canvas right now is 300 pixels wide, so we would have to do that 300 times. This sucks. I don't even want to type that more than a few times.

This is what for loops are good for! How about this instead, inside our `draw()` function:
<code><pre>
var brightness = 0; // 0 brightness means black
for (var x = 0; x < width; x++) {
    stroke(brightness);
    line(x, 0, x, height);
    brightness = brightness + 255/width;
}
</pre></code>

This will do the whole canvas, no matter how big!

OK so let's break down how this works:

`for (var x = 0; x < width; x++) {`

whatever is inside the `{ }` of a for loop will get run repeatedly, once for each value of x.


Here is what our for loop is doing:

x is 0

set the stroke to be the brightness, which is also 0 at this time

draw a vertical line at x position 0

increase the brightness by a small amount


then the `x++` part happens and makes x increase by 1, so now x is 1

then the computer checks to make sure `x < width` is still true

(1 is less than 300 so we will run the loop again)


x is 1

set the stroke to the brightness, which is now slightly bigger than 0

draw a vertical line at x position 1

increase the brightness by a small amount


then the `x++` part happens and makes x increase by 1, so now x is 2

then the computer checks to make sure that `x < width`, which is still true, so we run the loop again


x is 2

set the stroke to the brightness, which is now slightly brighter than it was before

draw a vertical line at x position 2

increase the brightness by a small amount


.... repeat ....

until eventually the `x++` makes x be 300, and it is NOT TRUE that `x < 300` anymore, so the loop stops

