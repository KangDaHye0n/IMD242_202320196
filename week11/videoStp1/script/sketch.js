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
  background(0);
  // image(cp, 0, 0, width, height); // 화면 위치 조정
  // cp.get(x, y); // x, y값 넣으면 됨, rgba의 값이 0~255 사이에서 나옴
  noStroke();
  for (let y = 0; y < cpH; y++) {
    for (let x = 0; x < cpW; x++) {
      let colour = cp.get(x, y);
      let br = brightness(colour);
      let diameter = map(br, 0, 255, 0, 30); // 밝기를 추출해서 사이즈를 다르게 넣어보기
      fill(255);
      circle(10 * x + 5, 10 * y + 5, diameter);
      // fill(colour[0], colour[1], colour[2]); // 색을 다르게 넣어보기
      // circle(10 * x + 5, 10 * y + 5, 10);
    }
  }
}
