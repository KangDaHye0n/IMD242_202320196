let cp;
let canvasW, canvasH;
let scale; // 얼마나 더 작을 것인지
let cpW, cpH;

function setup() {
  canvasW = 640;
  canvasH = 480;
  createCanvas(canvasW, canvasH);

  scale = 0.1;
  cpW = canvasW * scale;
  cpH = canvasH * scale;

  cp = createCapture(VIDEO);
  cp.size(cpW, cpH);
  cp.hide(); // 화면 숨김
}
function draw() {
  background('cornflowerblue');
  cp.loadPixels();
  // for(let idx = 0; idx < cp.pixels.length; idx++) { // processing의 경우
  for (let idx = 0; idx < cp.pixels.length / 4; idx++) {
    // let colour = cp.pixels[idx]; // processing의 경우
    let r = cp.pixels[4 * idx];
    let g = cp.pixels[4 * idx + 1];
    let b = cp.pixels[4 * idx + 2];
    let a = cp.pixels[4 * idx + 3];
    let br = brightness([r, g, b]); // array형태로 값을 넣어줘야함
    let dia = map(br, 0, 255, 0, 20);
    let x = idx % cpW;
    let y = floor(idx / cpW); //floor는 내림 처리 함수
    noStroke();
    fill(255);
    circle(10 * x + 5, 10 * y + 5, dia);
    //너비를 알 때 = x,y 구하는 방법
    //어레이가 4배라는 점
  }
}
