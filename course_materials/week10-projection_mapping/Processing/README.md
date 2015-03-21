What's in this folder?
--------------------------------------------

Explanation to come

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
