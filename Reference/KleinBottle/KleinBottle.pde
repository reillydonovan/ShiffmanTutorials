import peasy.*;

PeasyCam cam;
float umin = -1 * PI;
float umax = PI;
float vmin = -1 * PI;
float vmax = PI;

float a = 0;
float u = 2;
float v;
float r = 50;

PVector[][] globe;
int total = 50;

void setup() {
  size(600, 600, P3D);
  globe = new PVector[total+1][total+1];
  cam = new PeasyCam(this, 300);
}

void draw() {
  background(0);
  noFill();
  lights();
  stroke(255);
  for (int i = 0; i < total + 1; i++) {
    for (int j = 0; j < total + 1; j++) {
      if (i % 5 == 0) fill (0, 255, 0);
      u = umin + i * (umax - umin) / total;
      v = vmin + j * (vmax - vmin) / total;

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