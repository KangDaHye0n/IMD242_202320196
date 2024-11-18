let gradientText = ' .:-=+*#%@';

let cavasSize = [640, 480];
let scale = 0.1;
let captureSize = [cavasSize[0] * scale, cavasSize[1] * scale];
let tileWidth = cavasSize[0] / captureSize[0];

let capture;

function setup() {
  createCanvas(cavasSize[0], cavasSize[1]);
  capture = createCapture(VIDEO, { flipped: true });
  capture.size(captureSize[0], captureSize[1]);
  capture.hide();
}

function draw() {
  background(0);
  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  // text(gradientText.charAt(3), 20, 20);
  capture.loadPixels(); // 새로워진 픽셀 데이터가 갱신이 안됨
  for (let idx = 0; idx < capture.pixels.length / 4; idx++) {
    let r = capture.pixels[4 * idx + 0];
    let g = capture.pixels[4 * idx + 1];
    let b = capture.pixels[4 * idx + 2];
    let a = capture.pixels[4 * idx + 3];

    let bright = brightness([r, g, b]);
    let gradientIdx = map(bright, 0, 255, 0, gradientText.length - 1); // charAt에 들어가는 숫자의 마지막은 20개가 아닌 19개이기 때문
    gradientIdx = floor(gradientIdx);

    let asciiText = gradientText.charAt(gradientIdx); //텍스트에 어떤 글자가 들어가야하는지
    let column = idx % captureSize[0];
    let row = floor(idx / captureSize[0]);
    let x = column * tileWidth + tileWidth * 0.5;
    let y = row * tileWidth + tileWidth * 0.5;

    text(asciiText, x, y); // 실제로 그리는 부분
  }
}
