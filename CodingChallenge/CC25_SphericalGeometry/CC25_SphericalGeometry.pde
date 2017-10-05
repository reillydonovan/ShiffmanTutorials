import peasy.*;

PeasyCam cam;

PVector[][] globe;
int total = 60;

void setup(){
  size(600,600, P3D);
  cam = new PeasyCam(this, 500);
  globe = new PVector[total+1][total+1];
  colorMode(HSB);
}

void draw(){
  
  background(0);
  fill(255);
  lights();
  
  float r = 200;
  for(int i = 0; i < total+1; i++){
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
   for(int j = 0; j < total+1; j++){
     float lon = map(j,0,total, -PI, PI);
     float x = r * sin(lon) * cos(lat);
     float y = r * sin(lon) * sin(lat);
     float z = r * cos(lon);
  globe[i][j] = new PVector(x,y,z);
  PVector v = PVector.random3D();
  v.mult(random(0,30));
  globe[i][j].add(v);
   }
  }
  for(int i = 0; i < total; i++){
  /*  if(i % 2 == 0){
      fill(0);
    } else {
      fill(255);
    }
    */
    
    beginShape(TRIANGLE_STRIP);
    for(int j = 0; j < total+1; j++){
      float hu = map(j, 0, total, 0, 255 * 6);
      fill(hu % 255, 255, 255);
        PVector v1 = globe[i][j]; 
     stroke(255);
     strokeWeight(1);
     vertex(v1.x,v1.y,v1.z);
     PVector v2 = globe[i+1][j];
     vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
  
}