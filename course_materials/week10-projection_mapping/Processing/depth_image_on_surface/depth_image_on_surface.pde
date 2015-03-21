import deadpixel.keystone.*;
import SimpleOpenNI.*;

SimpleOpenNI  context;

Keystone ks;
CornerPinSurface surface;

int scale = 1;

PGraphics mapping;

void setup(){
  size(800,600,P3D);
 
  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(400, 300, 20);
  mapping = createGraphics(400,300, P3D);
  
  context = new SimpleOpenNI(this);
  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // mirror is by default enabled
  context.setMirror(false);
  
  // enable depthMap generation 
  context.enableDepth();
}

void draw(){

  
  context.update();
  
  background(0);
  
  mapping.beginDraw();
  mapping.background(0);
  mapping.scale(scale);
  mapping.image(context.depthImage(), 0, 0, mapping.width, mapping.height);
  mapping.endDraw();
  
  surface.render(mapping);
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
    
  case 'i':
    scale++;
    break;
  
  case 'o':
    scale--;
    break;
  }
}

