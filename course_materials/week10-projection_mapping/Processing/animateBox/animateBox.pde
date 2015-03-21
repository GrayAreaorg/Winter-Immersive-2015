float displayAnimationValue = 0; //this is what you use as your variable
float desiredAnimationValue; //set this value to animato TO

void setup(){
  size(600,480);
  desiredAnimationValue = height;
  fill(255,0,255);
  rectMode(CORNERS);
}

void draw(){
  background(0);
  
  displayAnimationValue = smoothValue(displayAnimationValue, desiredAnimationValue, 20);
  
  rect(0, 0, width, displayAnimationValue);
  
  if(displayAnimationValue >= height - 1){
    desiredAnimationValue = 0;  
  }
  else if(displayAnimationValue <= 1){
    desiredAnimationValue = height;  
  }
}

float smoothValue(float original, float desired, float interval){
  float diff = abs(original - desired) / interval;
  return original >= desired ? original - diff : original + diff;
}
