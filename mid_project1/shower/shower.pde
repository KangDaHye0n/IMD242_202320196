ArrayList<Ball> balls;
float[] force = {0, 0.1};
float friction = 0.99;
float boundFriction = 0.7;

float buttonX = width * 0.3; // 버튼의 x 좌표
float buttonY = height * 0.5; // 버튼의 y 좌표
float buttonR = width * 0.3; // 버튼의 크기
boolean buttonPressed = false; // 버튼 상태를 저장하는 변수
boolean drainPressed = false; // 물빠짐 버튼 상태를 저장하는 변수


void setup () {
  size(640, 420);
  //fullScreen();
  balls = new ArrayList<Ball>();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      buttonPressed = true;
    } else if (keyCode == UP) {
      buttonPressed = false;
    }
  }
  if (key == CODED) {
    if (keyCode == SHIFT) {
      drainPressed = !drainPressed;
    }
  }
}

void draw () {
  background(0);
  noStroke();
  fill(255);
  //욕조
  rect(0, height - height * 0.05, width, height * 0.05);
  rect(0, height - height * 0.3, width * 0.05, height * 0.3);
  rect(width, height - height * 0.3, width * -0.05, height * 0.3);
  //샤워기 헤드
  rect(width * 0.75, 0, width * 0.05, height * 0.1);
  quad(width * 0.75, height * 0.1, width * 0.8, height * 0.1,
    width * 0.9, height * 0.2, width * 0.65, height * 0.2);

  for (int idx = 0; idx < balls.size(); idx++) {
    Ball aBall = balls.get(idx);
    for (int oIdx = idx + 1; oIdx < balls.size(); oIdx++) {
      aBall.collide(balls.get(oIdx), 0.8);
    }

    aBall.update(force, friction);
    aBall.boundary(boundFriction);
    aBall.display();
  }

  //on 버튼 만들기
  if (!buttonPressed) {
    ellipseMode(CENTER);
    fill(50, 125, 200); // 버튼이 눌린 상태일 때 색상
    circle(buttonX * 2, buttonY * 2.8, buttonR * 2);
    fill(255);
    textAlign(CENTER);
    textSize(width * 0.03);
    text("ON", buttonX * 2, buttonY * 3);
  }

  //drain 버튼 만들기
  if (drainPressed) {
    fill(200, 0, 50); // 버튼이 눌린 상태일 때 색상
    circle(buttonX * 2, buttonY * 4.3, buttonR * 2.5);
    //챗gpt 사용,
    //버튼을 눌렀을 때, ArrayList에 있는 모든 요소를
    //삭제하기 위해서 사용할 수 있는 매소드를 물어봄
    balls.clear();
    fill(255);
    textAlign(CENTER);
    textSize(width * 0.03);
    text("DRAIN", buttonX * 2, buttonY * 4.3);
    text("ON", buttonX * 2, buttonY * 4.8);
  } else {
    fill(255); // 버튼이 눌리지 않은 상태일 때 색상
    circle(buttonX * 2, buttonY * 4.3, buttonR * 2.5);
    fill(0);
    textAlign(CENTER);
    textSize(width * 0.03);
    text("DRAIN", buttonX * 2, buttonY * 4.3);
    text("OFF", buttonX * 2, buttonY * 4.8);
  }

  //ArrayList의 개수를 표현하는 텍스트박스
  textSize(width * 0.04);
  fill(255);
  textAlign(LEFT);
  text("Number of Water Drop: " + balls.size(),
    width * 0.05,
    height * 0.1);

  //off 버튼 만들기
  if (buttonPressed) {
    fill(200, 50, 50); // 버튼이 눌리지 않은 상태일 때 색상
    circle(buttonX * 2, buttonY * 2.8, buttonR * 2);
    fill(255);
    textAlign(CENTER);
    textSize(width * 0.03);
    text("OFF", buttonX * 2, buttonY * 3);
    return;
  }
}

void mousePressed() {
  //챗gpt
  if (!buttonPressed) { // buttonPressed가 false일 때만 공 추가
    Ball newBall = new Ball();
    newBall.make(random(width * 0.7, width * 0.85),
      height * 0.3,
      random(height * 0.03, height * 0.05));
    balls.add(newBall);
  }
}
