import peasy.*;

PeasyCam cam;
float umin = -1 * PI;
float umax = PI * 4;
float vmin = -1 * PI;
float vmax = PI * 2;

float a = 1.5;
float u = 2;
float v;
float m = 1;
float n = 2;
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
   //   if (i % 5 == 0) fill (0, 255, 0);
      u = umin + i * (umax - umin) / total;
      v = vmin + j * (vmax - vmin) / total;

      float x = r *  (a + cos(n*u/2.0) * sin(v) - sin(n*u/2.0) * sin(2*v)) * cos(m*u/2.0);
      float y = r * (a + cos(n*u/2.0) * sin(v) - sin(n*u/2.0) * sin(2*v)) * sin(m*u/2.0);
      float z = r * sin(n*u/2.0) * sin(v) + cos(n*u/2.0) * sin(2*v);
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