import peasy.*;

PeasyCam cam;

PVector[][] globe;
int total = 60;
float offset = 0;
float m = 0;
float mchange = 0;

void setup(){
  size(600,600, P3D);
  cam = new PeasyCam(this, 500);
  globe = new PVector[total+1][total+1];
  colorMode(HSB);
}

void draw(){
  m = map(sin(mchange), -1, 1, 0, 20);
  mchange += 0.05;
  background(0);
  fill(255);
  lights();
  
  float r = 200;
  for(int i = 0; i < total+1; i++){
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, m,10,10,10);
   for(int j = 0; j < total+1; j++){
     float lon = map(j,0,total, -PI, PI);
     float r1 = supershape(lon, m,60,100,30);
     float x = r * r1 * r2 * cos(lon) * cos(lat);
     float y = r * r1 * r2 * sin(lon) * cos(lat);
     float z = r * r2 * sin(lat);
  globe[i][j] = new PVector(x,y,z);
 // PVector v = PVector.random3D();
//  v.mult(random(0,10));
// globe[i][j].add(v);
   }
  }
  offset += 5;
  for(int i = 0; i < total; i++){
  /*  if(i % 2 == 0){
      fill(0);
    } else {
      fill(255);
    }
    */
     float hu = map(i, 0, total, 0, 255 * 6);
    beginShape(TRIANGLE_STRIP);
    for(int j = 0; j < total+1; j++){
     
      fill((hu + offset) % 255, 255, 255);
        PVector v1 = globe[i][j]; 
   //  stroke(255);
   //  fill(255);
  //   strokeWeight(1);
  noStroke();
     vertex(v1.x,v1.y,v1.z);
     PVector v2 = globe[i+1][j];
     vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
  
}

float a = 1;
float b = 1;


float supershape(float theta, float m, float n1, float n2, float n3){

  float t1 = abs((1/a) * cos(m * theta / 4));
  t1 = pow(t1, n2);
  
  float t2 = abs((1/b) * sin (m * theta / 4));
  t2 = pow(t2, n3);
  
  float t3 = t1 + t2;
  
  float r = pow(t3, -1 / n1);

  return r;
}