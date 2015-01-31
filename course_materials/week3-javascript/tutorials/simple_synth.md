# Simple Synthesizer

Go look at the "simple_synth" example code and see if you can figure out what's going on.

When thinking about audio with the web audio API, which we are using here, it's helpful to think of things in a graph. Sound flows through the graph along the arrows, and it gets changed as it goes, until it comes out the speakers, which is called `context.destination`

for example this graph
<pre><code>
buffer -> context.destination
</code></pre>
is done with this code
<pre><code>
buffer.connect(context.destination);
</code></pre>

another example:
<pre><code>
oscillator -> context.destination
</code></pre>
is done with this code
<pre><code>
oscillator.connect(context.destination);
</code></pre>

Our example doesn't do this but you can have other "nodes" on the graph that transform the sound as it goes through, like a gain node to adjust the volume:
<pre><code>
oscillator -> gain -> context.destination
</code></pre>
would use code:
<pre><code>
oscillator.connect(gain);
gain.connect(context.destination);
</code></pre>


### Next Steps

Add volume control with a gain node:
<a href="https://developer.mozilla.org/en-US/docs/Web/API/GainNode">GainNode Reference</a>

One interesting thing to do next could be to use a range input like `<input type="range">` and make that the pitch of the waves you create.

Another cool thing could be to add visualizations of the waves that are playing by drawing a representation of the sound in p5js. For example, you could draw different wavy shapes depending on the frequency of the sine wave playing. Or, this would probably look really chaotic, but you could play with the raw channel data (which is getting logged to the console) for the audio samples and draw something based on that.