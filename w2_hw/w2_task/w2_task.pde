void setup() {
  size(640, 480); 
}

void draw() {
  background(255);
  noStroke();
  fill(204, 127, 50);
  ellipse(180, 140, 120, 120);
  //왼쪽귀
  fill(204, 127, 50);
  ellipse(460, 140, 120, 120);
  //오른쪽귀
  ellipseMode(CENTER);
  fill(255, 171, 171);
  ellipse(180, 140, 70, 70);
  //왼쪽귀안쪽
  ellipseMode(CENTER);
  fill(255, 171, 171);
  ellipse(460, 140, 70, 70);
  //오른쪽귀안쪽
  ellipseMode(CENTER);
  fill(204, 127, 50);
  ellipse(320, 240, 360, 280);
  //얼굴
  ellipseMode(CENTER);
  fill(255);
  ellipse(280, 220, 60, 60);
  //왼쪽흰자
  ellipseMode(CENTER);
  fill(255);
  ellipse(360, 220, 60, 60);
  //오른쪽흰자
  ellipseMode(CENTER);
  fill(255);
  ellipse(320, 285, 140, 100);
  //주둥이
  ellipseMode(CENTER);
  fill(40);
  ellipse(320, 260, 40, 30);
  //코
  ellipseMode(CENTER);
  fill(255, 150, 112);
  ellipse(220, 260, 50, 40);
  ellipseMode(CENTER);
  fill(255, 150, 112);
  ellipse(420, 260, 50, 40);
  //연지곤지
  var x = constrain(mouseX, 305, 335);
  var y = constrain(mouseY, 210, 230);
  ellipseMode(CENTER);
  fill(0);
  ellipse(x - 40, y, 30, 30);
  //왼쪽눈
  ellipseMode(CENTER);
  fill(0);
  ellipse(x + 40, y, 30, 30);
  //오른쪽눈
}
