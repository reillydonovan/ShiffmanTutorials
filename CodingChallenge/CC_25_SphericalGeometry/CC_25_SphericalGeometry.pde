import peasy.*;

PeasyCam cam;

PVector[][] globe;
int total = 20;

void setup() {
  size(600, 600, P3D);
  globe = new PVector[total+1][total+1];
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
noFill();
lights();
stroke(255);
  float r = 200;
  for (int i = 0; i < total + 1; i++) {
    float lat = map(i, 0, total, 0, PI);
    for (int j = 0; j < total + 1; j++) {
      float lon = map(j, 0, total, 0, TWO_PI);
      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin(lon);
      float z = r * cos(lat);
      globe[i][j] = new PVector(x, y, z);
    }
  }
  for (int i =0; i < total; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total + 1; j++) {
      PVector v1 = globe[i][j];
      stroke(255);
      strokeWeight(4);
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}