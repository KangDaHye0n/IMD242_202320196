float circleSize = random(100, 200);
float ellipseSize = random(20, 50);
float eyeSize = random(10, 20);
//float lipSize = random(15, 30);
float lipWidth = random(15, 30);
float lipHeight = random(15, 30);

void setup() {
  size(640, 360);
}

void mousePressed() {
  circleSize = random(100, 200);
  ellipseSize = random(30, 50);
  eyeSize = random(10, 20);
  //lipSize = random(15, 30);
  lipWidth = random(15, 30);
  lipHeight = random(15, 30);
}

void draw() {
  background(0);
  fill(255, 230, 0);
  noStroke();
  circle(320, 180, circleSize);
  //얼굴
  ellipseMode(CENTER);
  fill(255);
  noStroke();
  ellipse(290, 170, 50, ellipseSize);
  ellipse(350, 170, 50, ellipseSize);
  //흰자
  fill(0);
  noStroke();
  circle(290, 170, eyeSize);
  circle(350, 170, eyeSize);
  //검은자
  fill(250, 150, 50);
  noStroke();
  ellipseMode(CENTER);
  ellipse(320, 200, lipWidth, lipHeight);
  //입
}
