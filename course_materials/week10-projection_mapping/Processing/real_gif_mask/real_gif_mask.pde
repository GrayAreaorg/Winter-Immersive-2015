/*
  Press 's' on your keyboard to switch between masking images
  Use this to change between a "filling" and "void"-ing methods for mapping
*/

import gifAnimation.*;

Gif animation;
PImage mask;
PImage inverseMask;
PGraphics renderer;

boolean imageSwitch = true;

void setup(){
  size(800, 600, P3D);
  
  renderer = createGraphics(800, 600);
  
  animation = new Gif(this, "hurr.gif");
  animation.loop();
  
  mask = loadImage("mask_png.png");
  inverseMask = loadImage("inverse_mask_png.png");
  textureMode(NORMAL);
}

void draw(){
  background(0);
  
  renderer.beginDraw();
  renderer.background(0);
  renderer.image(animation, 0, 0, width, height);
  renderer.endDraw();
  
  if(imageSwitch){
    manualMask(renderer, mask);
  }
  else{
    manualMask(renderer, inverseMask);  
  }
  
  image(renderer,0,0,width,height);
}

void manualMask(PGraphics display, PImage mask) {
  mask.loadPixels();
  display.beginDraw();
  display.loadPixels();
  for (int i = 0; i < display.pixels.length; i++) {
 
    int d = display.pixels[i];
 
    // mask alpha
    int m_a = mask.pixels[i] & 0xFF;
    // display alpha
    int d_a = (d >> 24) & 0xFF;
    // output alpha (do not change alpha if already transparent)
    int o_a = (d_a == 0) ? d_a : m_a;
 
    display.pixels[i] = (o_a << 24) | (0x00FFFFFF & d);
  }
  display.updatePixels();
  display.endDraw();
}

void keyPressed(){
  if(key == 's'){
    imageSwitch = !imageSwitch;
  }  
}
