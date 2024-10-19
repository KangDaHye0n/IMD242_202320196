int randomSeed = int(random(100000000));

void setup() {
  size(800, 800);
}

void mousePressed() {
  randomSeed = int(random(100000000));
}

void draw() {
  randomSeed(randomSeed);
  background(0, 120, 255);
  
  for(int n = 0; n < 1; n++) {
  house(width * 0.5,
  height * 0.5,
  random(250, 400),
  random(300, 550),
  random(30, 50),
  random(30, 50),
  random(40, 50),
  random(60, 100),
  random(0, 255),
  random(0, 255),
  random(0, 255));
  }
}

void house(float x, float y, 
float w, float h, 
float windowW, float windowH, 
float doorW, float doorH,
float r, float g, float b) {
  rectMode(CENTER);
  fill(255, g, b);
  rect(x, y, w, h);
  fill(r, g, 255);
  rect(x - 70, y, windowW, windowH);
  rect(x + 70, y, windowW, windowH);
  rect(x - 70, y - 60, windowW, windowH);
  rect(x + 70, y - 60, windowW, windowH);
  
  rectMode(CORNER);
  fill(r, 255, b);
  rect(x - doorW * 0.5, y + h * 0.5, doorW, -doorH);
  
  ellipseMode(CORNER);
  fill(255);
  ellipse(x - doorW * 0.5 + 5, y + h * 0.5 - 20, doorW * 0.3, -doorH * 0.3);
}

//pushMatrix();
//  translate(x, height);
//  rotate(radians(random(-5, 5)));
//  line(0, 0, 0, -h);
//  pushMatrix();
//  translate(0, -h);
//  int petalNum = int(random(5, 21));
//  float petalArcA = 0.25 * 360 / float(petalNum);
//  for(int n = 0; n < petalNum; n++) {
//    pushMatrix();
//    rotate(radians(n * 360 / float(petalNum) - 90));
//    arc(0, 0, door, door, radians(-petalArcA), radians(petalArcA), PIE);
//    popMatrix();
//  }
//  circle(0, 0, window);
//  popMatrix();
//  popMatrix();

//void mousePressed() {
//  circleSize = random(100, 200);
//  ellipseSize = random(30, 50);
//  eyeSize = random(10, 20);
//  //lipSize = random(15, 30);
//  lipWidth = random(15, 30);
//  lipHeight = random(15, 30);
//}
