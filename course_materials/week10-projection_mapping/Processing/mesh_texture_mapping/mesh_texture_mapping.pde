/*
  Press 'c' to toggle calibration
  Press 's' to save calibration
  Press 'l' to load previous calibration
  
  Change "gridCellCount" to change the resolution of the mesh, similar to the Keystone library
*/

ArrayList<Draggable> vertices = new ArrayList<Draggable>();

PGraphics render;
PImage screenTexture;

boolean calibrate;

int gridCellCount = 2;
int oneDimension = gridCellCount + 1; //this is the vertex count for one line (x or y)

float redVal = 255;
float desiredRedVal = 0;

color calibrationColor = color(255,255,255);

void setup(){
  size(800, 600, P3D);
  
  render = createGraphics(width, height, P3D);
  render.fill(255,255,0);
  render.stroke(255);
  
  textureMode(NORMAL);
  
  println(width + ", " + height);
  float xSpace = width/gridCellCount;
  float ySpace = height/gridCellCount;
  for(int y=0;y<=gridCellCount;y++){
    float coordY = y * ySpace;
    for(int x=0;x<=gridCellCount;x++){
      float coordX = x * xSpace;
      vertices.add(new Draggable(coordX, coordY));
      println("coord at: " + coordX + ", " + coordY);
    }
  }
  noStroke();
}

void draw(){
  //println(frameRate);
  background(0);
  
  try{
      if(redVal <= 1){
        desiredRedVal = 255;
      }
      else if(redVal >= 254){
        desiredRedVal = 0;
      }
      
      redVal = smoothVal(redVal, desiredRedVal);
      
      //this is where you would draw your animations
      render.beginDraw();
      render.background(redVal, 0, 255);
      render.endDraw();
      //////////////////////////////////////////////
      
      
      //this is where you render your animations into a shape
      beginShape(TRIANGLES);
      texture(render); //this is the animation PGraphics
      for(int i=0;i<vertices.size();i++){
        if(i % (oneDimension) == gridCellCount){ //find the last one in the row, not the first
        
        }
        else{
          if(i < vertices.size() - oneDimension){
            drawVertex(vertices.get(i));
            drawVertex(vertices.get(i+oneDimension));
            drawVertex(vertices.get(i+(oneDimension + 1)));
            
            drawVertex(vertices.get(i));
            drawVertex(vertices.get(i+1));
            drawVertex(vertices.get(i+(oneDimension + 1)));
          }
        }
      }
      endShape(CLOSE);
      ///////////////////////////////////////////////////////
      
      //this draws all draggable points if in calibration mode
      if(calibrate){
        for(int i=0;i<vertices.size();i++){
          if(vertices.get(i) != null){
            vertices.get(i).drawDraggable();  
          }
        }
      }
    }
  //}
  catch( Exception e){
    e.printStackTrace();
  }
}

////////////////////////////////////////////////////
void drawVertex(Draggable currVertex){
  float u;
  float v;
  if(currVertex.originalX == 0){ //if on the left of the screen
    u = 0;  
  }
  else if(currVertex.originalX == width){ //if on the right of the screen
    u = 1;
  }
  else{ //somewhere in the middle
    u = map(currVertex.originalX, 0, width, 0, 1);
  }
  
  if(currVertex.originalY == 0){ //if on the top of the screen
    v = 0;  
  }
  else if(currVertex.originalY == height){ //if on the bottom of the screen
    v = 1;  
  }
  else{ //somewhere in the middle
    v = map(currVertex.originalY, 0, height, 0, 1);
  }
  vertex(currVertex.x, currVertex.y, u, v);  
}

float smoothVal(float val, float desiredVal){
  float diff = abs(val - desiredVal) / 50; //the number you divide by determines the speed of the animation
  return val >= desiredVal ? val - diff : val + diff;  
}
////////////////////////////////////////////////////

void keyPressed(){
  if(key == 'c'){ //calibrate toggle
    calibrate = !calibrate;
  }
  else if(key == 's'){ //save
    JSONObject json = new JSONObject();
    
    json.setInt("gridCellCount", gridCellCount);
    json.setInt("vertices.size", vertices.size());
    for(int i=0;i<vertices.size();i++){
      if(vertices.get(i) != null){
        Draggable vertex = vertices.get(i);
        JSONObject vertexJSON = new JSONObject();
        vertexJSON.setFloat("x", vertex.x);
        vertexJSON.setFloat("originalX", vertex.originalX);
        vertexJSON.setFloat("y", vertex.y);
        vertexJSON.setFloat("originalY", vertex.originalY);
        json.setJSONObject(i+"", vertexJSON);
      }
    }
    
    println("saving: ");
    println(json);
    
    saveJSONObject(json, "data/vertices.json");
  }
  else if(key == 'l'){ //load
    JSONObject json = loadJSONObject("data/vertices.json");
    
    gridCellCount = json.getInt("gridCellCount");
    oneDimension = gridCellCount + 1;
    
    int verticesSize = json.getInt("vertices.size");
    
    vertices.clear();
    
    for(int i=0;i<verticesSize;i++){
      JSONObject vert = json.getJSONObject(""+i);
      float x = vert.getFloat("x");
      float y = vert.getFloat("y");
      float originalX = vert.getFloat("originalX");
      float originalY = vert.getFloat("originalY");
      vertices.add(new Draggable(x, y, originalX, originalY));
    }
  }
}

void mousePressed(){
  for(int i=0;i<vertices.size();i++){
    if(vertices.get(i).hovered){
      vertices.get(i).dragging = true;
      println(i);
      break;  
    }
  }
}

void mouseReleased(){
  for(int i=0;i<vertices.size();i++){
    if(vertices.get(i).hovered){
      vertices.get(i).dragging = false;
      break;
    }
  }
}
