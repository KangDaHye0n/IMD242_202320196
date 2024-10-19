int[] fruitAmts;
String[] fruitNames = {"mango",
  "strawberry",
  "kiwi",
  "plum",
  "blueberry"};

void setup() {
  size(1280, 720);
  fruitAmts = new int[fruitNames.length];
  for (int n = 0; n < fruitAmts.length; n++) {
    fruitAmts[n] = int(random(5, 145));
    //if (n==0) {
    //  fruitAmts[n] = 145;
    //} else {
    //  fruitAmts[n] = int(random(5, 145));
    //}
  }
}

float barGap = 200;
float barWidth = 48;

void draw() {
  background(0);

  for (int n = 0; n < fruitNames.length; n++) {
    strokeWeight(2);
    stroke(255);
    strokeCap(SQUARE);
    textAlign(CENTER);
    rectMode(CENTER);
    noFill();
    rect(width * 0.2 + barGap * n, height * 0.3999,
      barWidth, height * 0.4);
    //전체 틀

    strokeWeight(barWidth);
    stroke(255);
    line(width * 0.2 + barGap * n, height * 0.6,
      width * 0.2 + barGap * n, height * 0.6 - 2 * fruitAmts[n]);

    fill(255);
    textSize(32);
    text(fruitNames[n],
      width * 0.2 + barGap * n, height * 0.6 + 40);
    text("qty:",
      width * 0.2 + barGap * n - 20, height * 0.6 + 70);
    text(fruitAmts[n],
      width * 0.2 + barGap * n + 30, height * 0.6 + 73);
    fill(0, 255, 0);
    text("Total Fruit Inventory: ",
      width * 0.5, height * 0.85 - 20);
    text(fruitAmts[0] + fruitAmts[1] + fruitAmts[2] 
    + fruitAmts[3] + fruitAmts[4] + fruitAmts[4],
      width * 0.5, height * 0.85 + 20);
  }
}
