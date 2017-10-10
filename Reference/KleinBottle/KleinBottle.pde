import peasy.*;

PeasyCam cam;
int N = 50;
float umin = -1 * PI;
float umax = PI;
float vmin = -1 * PI;
float vmax = PI;

float a = 1;
float u;
float v;
float r = 10;

PVector[][] globe;
int total = 50;

void setup() {
  size(600, 600, P3D);
  globe = new PVector[total+1][total+1];
  cam = new PeasyCam(this, 100);
}

void draw() {
  background(0);
noFill();
lights();
stroke(255);
  float r = 200;
  for (int i = 0; i < total + 1; i++) {
    for (int j = 0; j < total + 1; j++) {
      u = umin + i * (umax - umin) / N;
      v = vmin + j * (vmax - vmin) / N;
      
      float x = r * cos(u) * (a + sin(v) * cos(u/2) - sin(2 * v) * sin(u/2)/2);
      float y = r * sin(u) * (a + sin(v) * cos(u/2) - sin(2 * v) * sin(u/2)/2);
      float z = r * sin(u/2) * sin(v) + cos(u/2) * sin(2 * v)/2;
      globe[i][j] = new PVector(x, y, z);
    }
  }
  for (int i =0; i < total; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total + 1; j++) {
      PVector v1 = globe[i][j];
      stroke(255);
      strokeWeight(1);
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}