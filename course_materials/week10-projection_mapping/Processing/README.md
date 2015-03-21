What's in this folder?
--------------------------------------------

Explanation to come

SimpleOpenNI library for Kinect 1473 (the one inside Processing only works for Kinect 1414)
http://medienlabor.hs-osnabrueck.de/download/SimpleOpenNI_1.96_osx_kinect_1473.zip

Processing code snippets
--------------------------------------------

**Timer function**

```
long currMillis = 0;
long prevMillis = 0;
int interval = 1000; //count by 1 second

int counter; //this is our counter

void setup(){
  
}

void draw(){
  currMillis = millis();

  if(currMills - prevMills > interval){
    prevMillis = currMillis;
    counter++;
    
    //if we want something to happen ever 5 seconds
    if(counter % 5 == 0){ //if counter/5 remainder == 0
      //do something
    }
  }  
}
```
