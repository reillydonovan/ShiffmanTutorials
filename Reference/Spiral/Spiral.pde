int r = 100;
int cx;
int cy;
float a = 0.05;
 
void setup() {
    size(400, 400);
    cx = width / 2;
    cy = height / 2;
}
 
void draw() {
    for (int i = 0; i < 10000; i++) {
        float t = radians(i);
        float x = cx + a * t * r * cos(t);
        float y = cy + a * t * r * sin(t);
        point(x, y);
    }
}