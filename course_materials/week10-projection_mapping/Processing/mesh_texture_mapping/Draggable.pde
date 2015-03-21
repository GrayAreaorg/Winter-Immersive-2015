class Draggable{
  
  float x;
  float originalX;
  float y;
  float originalY;
  boolean dragging = false;
  boolean hovered = false;
  int radius = 25;
  
  Draggable(float myX, float myY){
    x = myX;
    originalX = x;
    y = myY;
    originalY = y;
  }
  
  Draggable(float myX, float myY, float myOriginalX, float myOriginalY){
    x = myX;
    originalX = myOriginalX;
    y = myY;
    originalY = myOriginalY;
  }
  
  void drawDraggable(){
    mouseInside();
    ellipseMode(CENTER);
    stroke(calibrationColor);
    if(hovered){
      fill(calibrationColor);  
    }
    else{
      noFill();
      
    }
    ellipse(x, y, radius,radius);
    
    if(dragging){
      x = mouseX;
      y = mouseY;  
    }
  }
  
  void mouseInside(){
    if(mouseX < x + radius/2 && mouseX > x - radius/2 && mouseY > y - radius/2 && mouseY < y + radius/2){
      hovered = true;
    } 
    else{
      hovered = false; 
    }
  }
}
