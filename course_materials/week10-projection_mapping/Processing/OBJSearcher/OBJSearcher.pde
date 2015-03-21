/**
 * Load and Display an OBJ Shape. 
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object) files into a Processing sketch. This example loads an
 * OBJ file of a rocket and displays it to the screen.
 */


PShape rocket;
int selectedShape = 0;
float ry;
float rotX, rotY;

PImage tex;
  
public void setup() {
  size(800, 600, P3D);
    
  rocket = loadShape("/Users/z001cj8/Downloads/loft_3.obj");
  
  //rotX = -width / (height/2);
  //rotY = (height/width)/2;
  
  tex = loadImage("/Users/z001cj8/Downloads/KanyeWestCrazyEyes-e1333649328862.jpg");
  textureMode(NORMAL);
}

public void draw() {
  background(0);
  
  lights();
  pushMatrix();
  translate(width/2, height/2, 0);
  scale(3);
  rotateX(rotY);
  rotateY(rotX);
  
  noFill();
  //stroke(255,0,255);
  strokeWeight(0.2);
  
  PShape[] meshes = rocket.getChildren();
  
  if(selectedShape >= meshes.length){
    selectedShape = 0;  
  }
  else if(selectedShape < 0){
    selectedShape = meshes.length -1;
  }
  int shapeCount = 0;
  
  for(int i=0;i<meshes.length;i++){
    try{
      if(selectedShape == shapeCount){
        fill(color(255,0,255,255));
      }
      else{
        fill(color(255,0,255,50));
      }
      beginShape();
      if(i == selectedShape){
        texture(tex);
        PVector vert = meshes[i].getVertex(0);
        vertex(vert.x, vert.y, vert.z, 0, 0);
        vert = meshes[i].getVertex(1);
        vertex(vert.x, vert.y, vert.z, 1, 0);
        vert = meshes[i].getVertex(2);
        vertex(vert.x, vert.y, vert.z, 1, 1);
        vert = meshes[i].getVertex(3);
        vertex(vert.x, vert.y, vert.z, 0, 1);
      }
      else{
        for(int u=0;u<meshes[i].getVertexCount();u++){
          PVector vert = meshes[i].getVertex(u);
          //println(meshes[i]);
          vertex(vert.x, vert.y, vert.z/*, meshes[i].getTextureU(u), meshes[i].getTextureV(u)*/);
        }
      }
      endShape(CLOSE);
      shapeCount++;
    }
    catch(Exception e){
      //e.printStackTrace();
    }
  }
  popMatrix();
  
  fill(255);
  noStroke();
  text("face: " + selectedShape, 10, 20);
}

void keyPressed(){
  if(keyCode == UP){
    selectedShape++;
  }
  else if(keyCode == DOWN){
    selectedShape--;
  }
}

void mouseDragged()
{
    rotX += (mouseX - pmouseX) * 0.01;
    rotY -= (mouseY - pmouseY) * 0.01;
}
