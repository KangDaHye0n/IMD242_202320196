void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  float centerX = width/2;
  float centerY = height/2;

  noStroke();
  fill(255);
  circle(centerX, centerY, 600);

  for (float r1 = 0; r1 < 361; r1 += 30) {
    pushMatrix();
    translate(centerX, centerY);
    rotate(radians(r1));
    stroke(0);
    strokeWeight(5);
    line(0, centerY * -0.65, 0, centerY * -0.75);
    popMatrix();
  }
  
  for (float r2 = 0; r2 < 361; r2 += 6) {
    pushMatrix();
    translate(centerX, centerY);
    rotate(radians(r2));
    stroke(0);
    strokeWeight(3);
    line(0, centerY * -0.7, 0, centerY * -0.75);
    popMatrix();
  }

  pushMatrix();
  translate(centerX, centerY);
  rotate(radians(s * 6));
  stroke(255, 0, 0);
  strokeWeight(3);
  line(0, 0, 0, centerY * -0.55);
  popMatrix();

  pushMatrix();
  translate(centerX, centerY);
  rotate(radians(m * 6));
  stroke(0);
  strokeWeight(6);
  line(0, 0, 0, centerY * -0.45);
  popMatrix();

  pushMatrix();
  translate(centerX, centerY);
  rotate(radians(h * 30));
  stroke(0);
  strokeWeight(6);
  line(0, 0, 0, centerY * -0.3);
  popMatrix();

  noStroke();
  fill(255, 0, 0);
  circle(centerX, centerY, 20);
}
