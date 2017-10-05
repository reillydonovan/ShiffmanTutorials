
float n1 = .3;
float n2 = .3;
float n3 = .3;
float m = 0;
float a = 1;
float b = 1;
float osc = 0;
//float n = 1;

void setup() {
  size(400, 400);
}

void draw() {
  m = map(sin(osc), -1, 1, 0, 10);
  osc += 0.01;
  
  background(0);
  translate(width/2, height/2);

  // float r = 100;


  stroke(255);
  noFill();
  
  float radius = 100;
  float total = 500;
  float increment = TWO_PI / total;
//  m += increment;
  
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += increment) {

    // float x = r * cos(a);
    // float y = r * sin(a);
    // float na = 2 / n;
   // float x = pow(abs(cos(angle)), na) * a * sgn(cos(angle));
   
    float r = supershape(angle);
    float x = radius * r * cos(angle);
    float y = radius * r * sin(angle);
    //float y = pow(abs(sin(angle)), na) * a * sgn(sin(angle));
    vertex(x, y);
  }
  endShape(CLOSE);
}

float supershape(float theta){

 float part1 = (1/a) * cos(theta * m / 4);
 part1 = abs(part1);
 part1 = pow(part1,n2);
 
 float part2 = (1/b) * sin(theta * m / 4);
 part2 = abs(part2);
 part2 = pow(part2,n3);
 
 float part3 = pow(part1 + part2, 1/n1);
 
 if (part3 == 0){
   return 0;
 }
  return (1 / part3);
}
/*
float sgn(float val) {
 if (val >0) {
 return 1;
 } else if (val<0) {
 return -1;
 } else {
 return 0;
 }
 }
 */