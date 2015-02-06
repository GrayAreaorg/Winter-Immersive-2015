# Find That File

To include a JavaScript file in our HTML page, we have to tell the computer where to find the JavaScript file. We have to tell it really precisely where it is because computers are stupid.

So for example to include a JavaScript file on an HTML page...

<pre><code>
&lt;html&gt;
    &lt;head&gt;
        &lt;script type="text/javascript" src="index.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>

(the `src="index.js"` part of this is what we will keep coming back to)

The above will work only if the `index.js` file is in the same folder as `index.html`, for example if our files were organized like so...

<pre><code>
htdocs
    my_example
        index.html
        index.js
</code></pre>

If instead what you have is 

<pre><code>
htdocs
    my_example
        index.html
        js &lt;--- folder to store all our JavaScript files
            index.js
</code></pre>

then you need to do `src="js/index.js"`. This tells the computer to, starting from the location of `index.html`, go into the `js` folder and look for the `index.js` file there.

As another example, if your files are organized like this

<pre><code>
htdocs
    index.js
    my_example
        index.html
</code></pre>

then you need to do `src="../index.js"`. This tells the computer to to, starting from the location of `index.html`, go up a level and look for `index.js` there.

You can combine the `/` and `..` pieces for whatever folder organization scheme you have going. For example if you had

<pre><code>
htdocs
    static
        js
            index.js
    my_work
        my_example
            index.html
</code></pre>

then you would do `src="../../static/js/index.js"`
To break that down:
1. the first `..` tells the computer to go up a level, so now it is in the `my_work` folder
2. the second `..` tells the computer to go up another level, so now it is in the `htdocs` folder
3. the first `/` tells the computer to go down into the `static` folder
4. the second `/` tells the computer to go down into the `js` folder
