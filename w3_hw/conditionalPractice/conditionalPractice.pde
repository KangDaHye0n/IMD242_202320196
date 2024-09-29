void setup() {
  size(640, 360);
}

void draw() {
  background(0);
  stroke(255);
  fill(175);
  rectMode(CENTER);
  
  if (mouseY < 90) {
    line(270, 10, 370, 80);
  } else if (mouseY < 180) {
    square(320, 135, 80);
  } else if (mouseY > 270) {
    circle(320, 315, 80);
  } else {
    rect(320, 225, 120, 60, 20);
  }
  
  stroke(127);
  strokeWeight(4);
  line(0, 90, width, 90);
  line(0, 180, width, 180);
  line(0, 270, width, 270);
}
