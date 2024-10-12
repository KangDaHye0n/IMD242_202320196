int tileNum;
int randomSeed = 0;
float noiseMult = 0.01;

void setup() {
  size(800, 800);
}

void draw() {
  noiseSeed(randomSeed);
  //randomSeed(randomSeed);
  background(255);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  noiseMult = map(mouseY, 0, height, 0.005, 0.0005);
  //noiseMult = pow(10, map(mouseY, 0, height, -1, -5));
  float tileSize = width / float(tileNum);
  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      //float randomVal = random(1);
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult);
      
      fill(255);
      //rect(rectX, rectY, tileSize, tileSize);
     
      //fill(255 * randomVal);
      //fill(255 * noiseVal);
      //fill(255);
      circle(centerX, centerY, tileSize);
      
      pushMatrix();
      translate(centerX, centerY);
      //rotate(radians(30 * randomVal));
      rotate(radians(360 * noiseVal));
      line(0, 0, tileSize * -0.5, 0);
      fill(0);
      circle(tileSize * -0.4, 0, tileSize * 0.2);
      popMatrix();
    }
  }
}
