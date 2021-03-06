float displayAnimationValue = 0; //this is what you use as your variable
float desiredAnimationValue; //set this value to animato TO

void setup(){
  size(600,480); //set up a size for your window
  desiredAnimationValue = height; //set a default value for your animation end state
  fill(255,0,255);
  rectMode(CORNERS);
}

void draw(){
  background(0);
  
  //the smoothValue function will return a new "smoothed" value, so store it in your display value to draw the animation
  displayAnimationValue = smoothValue(displayAnimationValue, desiredAnimationValue, 20);
  
  //draw a rectangle where the height will animate based on the above line of code
  rect(0, 0, width, displayAnimationValue);
  
  //if the height of the rectangle reaches the full height of the sketch, set your desired animation value to 0 to loop
  if(displayAnimationValue >= height - 1){
    desiredAnimationValue = 0;  
  }
  //likewise, if the rectangle height reaches 0, then set the desired animation value to the height of your window to continue looping
  else if(displayAnimationValue <= 1){
    desiredAnimationValue = height;  
  }
}

float smoothValue(float original, float desired, float interval){
  float diff = abs(original - desired) / interval;
  return original >= desired ? original - diff : original + diff;
}
