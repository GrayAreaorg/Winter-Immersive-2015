import gifAnimation.*;
import deadpixel.keystone.*;

Keystone ks;
CornerPinSurface surface; //this is keystoned surface

PGraphics texture; //this is the screen that is mapped onto "surface"

Gif animation;

void setup(){
  size(800, 600, P3D);
  
  ks = new Keystone(this); //pass the context to the keystone library so it can interact with your sketch
  
  //set up the graphic surface
  surface = ks.createCornerPinSurface(400, 300, 20); //create a surface that is 400 x 300 and 20 x 20 tile resolution
  texture = createGraphics(400, 300, P3D);
  texture.smooth();
  
  animation = new Gif(this, "hurr.gif");
  animation.loop();
}

void draw(){
  // Convert the mouse coordinate into surface coordinates
  // this will allow you to use mouse events inside the 
  // surface from your screen. 
  PVector surfaceMouse = surface.getTransformedMouse();
  
  //let's draw some things into our "texture" PGraphics
  texture.beginDraw();
  texture.background(255);
  texture.image(animation, 0, 0, texture.width, texture.height);
  texture.endDraw();
  
  background(0);
  //draw the graphic surface
  surface.render(texture);
}

void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;
  }
}


