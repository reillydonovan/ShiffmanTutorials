float a = 100;
float b = 100;
float n = 2;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  // float r = 100;

  n--;
  stroke(255);
  noFill();
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += 0.1) {

    // float x = r * cos(a);
    // float y = r * sin(a);

    float na = 2 / n;
    float x = pow(abs(cos(angle)), na) * a * sgn(cos(angle));
    float y = pow(abs(sin(angle)), na) * a * sgn(sin(angle));
    vertex(x, y);
  }
  endShape(CLOSE);
}

float sgn(float val) {
  if (val >0) {
    return 1;
  } else if (val<0) {
    return -1;
  } else {
    return 0;
  }
}