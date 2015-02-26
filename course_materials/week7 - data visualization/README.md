###Week 7 - Data Visualization
[Shirley Wu](http://www.twitter.com/shirleyxywu)

-

###Day 1
####What is “data visualization”?
“80% data cleaning 20% visualization” - [bdon](https://twitter.com/bdon)  
“you left out the 90% just **getting** data” - [superGSP](https://twitter.com/superSGP)


####Inspirations
[Aaron Koblin: Visualizing ourselves ... with crowd-sourced data](http://www.ted.com/talks/aaron_koblin)  
[David McCandless: The beauty of data visualization](http://www.ted.com/talks/david_mccandless_the_beauty_of_data_visualization)  
[TED playlist: Adventures in Mapping](http://www.ted.com/playlists/138/adventures_in_mapping)  

[Kindred Britain](http://kindred.stanford.edu/)  
[Mike Bostock: Visualizing Algorithms](http://bost.ocks.org/mike/algorithms/)  
[Setosa (Victor Powell): Conditional probability](http://setosa.io/conditional/)  
[Accurat: My reign for a (solved) paradox](http://media-cache-ak0.pinimg.com/originals/42/90/10/4290100c6aa2702308d8e823c904f3a3.jpg)  
[Jerome Cukier: Events in the Game of Thrones](http://www.jeromecukier.net/projects/agot/events.html)  


####Intro to D3.js
[An Interactive Introduction to D3.js](http://sxywu.github.io/d3intro/)

**More resources:**  
[D3.js front page](http://d3js.org/)  
[Three Little Circles](http://bost.ocks.org/mike/circles/)  
[Let's Make a Bar Chart](http://bost.ocks.org/mike/bar/)  
[D3.js list of tutorials](https://github.com/mbostock/d3/wiki/Tutorials)  
Further reading: [How Selections Work](http://bost.ocks.org/mike/selection/)  

**Examples:**  
[D3 Show Reel](http://bl.ocks.org/mbostock/1256572) 
[Simple Bar Chart](http://bl.ocks.org/mbostock/3885304)  
[Radial Reingold–Tilford Tree](http://bl.ocks.org/mbostock/4063550)  
[Force layout](http://bl.ocks.org/mbostock/4062045)  


####Exercise
`git clone` this directory if you haven't already done so, and `git pull` the latest changes.  
Run `npm install` to get all third-party dependencies.  
Run `node server.js` to start server and navigate to `localhost:8000`.

**Average BART Salary by Position**: [code on github](https://github.com/GrayAreaorg/Winter-Immersive-2015/blob/master/course_materials/week7%20-%20data%20visualization/public/day_1/average_bart.html)  
To view locally, navigate to `http://localhost:8000/day_1/average_bart.html`.  
**Twitter Force Graph**: [code on github](https://github.com/GrayAreaorg/Winter-Immersive-2015/blob/master/course_materials/week7%20-%20data%20visualization/public/day_1/twitter_force.html)  
To view locally, nagivate to `http://localhost:8000/day_1/twitter_force.html`


-

###Day 2

####Where to get the data
**Application Programming Interface (API)** defines the inputs, outputs, and functionality for a set of programs.

[Data.gov API](http://catalog.data.gov/dataset?q=-aapi+api+OR++res_format%3Aapi#topic=developers_navigation): data from many government agencies (seems quite robust, but hard to navigate through from personal experience)  
[Whitehouse API](http://www.whitehouse.gov/developers): most interesting repo I've found is the [2016 budget data on Github](https://github.com/WhiteHouse/2016-budget-data)  
[Open Journalism](https://github.com/showcases/open-journalism): a Github collection of different news agencies' repositories, many with data sets that they've explored and used  

[Twitter REST API](https://dev.twitter.com/rest/public)    
[Twitter Streaming API](https://dev.twitter.com/streaming/overview)  
[Facebook Graph API](https://developers.facebook.com/docs/graph-api/reference/)  
[Instagram API](https://instagram.com/developer/)  
[Youtube API](https://developers.google.com/youtube/v3/)  
[Flickr API](https://developer.yahoo.com/flickr/)  
[Yelp API](https://www.yelp.com/developers)

###How to clean the data
[Underscore.js](http://underscorejs.org/): "a whole mess of useful functional programming helpers"  

**Some particularly helpful functions**:  
[_.each](http://underscorejs.org/#each): loops through each element in the array  
[_.map](http://underscorejs.org/#map): loops through each element in the array, and creates a new array based on what you `return` at each iteration   
[_.filter](http://underscorejs.org/#filter): loops through each element in the array, and creates a new array with only the objects you `return`ed true at each iteration
[_.sortBy](http://underscorejs.org/#sortBy): loops through each element, and creates a new array sorted by your `return` value at each iteration
[_.groupBy](http://underscorejs.org/#groupBy): loops through each element, and creates a new object, where the `key` is the `return` value you've specified at each iteration, and `value` is an array of all the elements that fall in that group
[_.countBy](http://underscorejs.org/#countBy): loops through each element, and creates a new object, where the `key` is the `return` value you've specified at each iteration, and `value` is the number of elements that fall in that category


####Exercises

-

###Day 3
