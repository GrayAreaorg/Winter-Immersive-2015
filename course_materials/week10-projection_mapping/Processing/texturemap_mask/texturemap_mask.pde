import deadpixel.keystone.*;

Keystone ks;
CornerPinSurface surface; //this is keystoned surface
CornerPinSurface maskSurface; //this is the masking (editable) surface

PGraphics texture; //this is the screen that is mapped onto "surface"
PGraphics maskTexture; //this is the screen that is mapped onto "maskSurface"

void setup(){
  size(800, 600, P3D);
  
  ks = new Keystone(this); //pass the context to the keystone library so it can interact with your sketch
  
  //set up the graphic surface
  surface = ks.createCornerPinSurface(400, 300, 20); //create a surface that is 400 x 300 and 20 x 20 tile resolution
  texture = createGraphics(400, 300, P3D);
  texture.smooth();
  
  //set up the mask surface
  maskSurface = ks.createCornerPinSurface(400,300,20);
  maskSurface.moveTo(width-400, height-300); //move it to the bottom right so we can see it
  maskTexture = createGraphics(400,300,P3D);
  maskTexture.beginDraw();
  maskTexture.background(0); //set the background color once since the background will always be black
  maskTexture.endDraw();
}

void draw(){
  // Convert the mouse coordinate into surface coordinates
  // this will allow you to use mouse events inside the 
  // surface from your screen. 
  PVector surfaceMouse = surface.getTransformedMouse();
  
  //load an image that will cover "texture"
  PImage img = loadImage("KanyeWestCrazyEyes-e1333649328862.jpg");
  
  //let's draw some things into our "texture" PGraphics
  texture.beginDraw();
  texture.background(255);
  texture.image(img, 0, 0, texture.width, texture.height);
  texture.endDraw();
  
  background(0);
  //draw the graphic surface
  surface.render(texture);
  
  if(!ks.isCalibrating()){
    surface.moveTo(mouseX,mouseY);
  }
  
  //draw the mask surface *after* the graphic surface
  maskSurface.render(maskTexture);
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


