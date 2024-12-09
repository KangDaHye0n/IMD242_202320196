let canvasContainer = document.querySelector('#canvas-container');
let sizeSlider = document.querySelector('.range.range-size');
let rgbSlider = document.querySelectorAll('.range.range-color');
let valueOutPlaces = document.querySelectorAll('.value');

// rgbSlider[0].addEventListener('change', (event)=>{
//   valueOutPlaces[0].textContent = rgbSlider[0].value;
// })
rgbSlider.forEach((eachRgbSliders, idx) => {
  eachRgbSliders.addEventListener('change', (event) => {
    valueOutPlaces[idx].textContent = eachRgbSliders.value;
  });
});

function setup() {
  createCanvas(400, 400).parent(canvasContainer);
}

function draw() {
  background(220);
  noStroke();
  fill(rgbSlider[0].value, rgbSlider[1].value, rgbSlider[2].value);
  circle(mouseX, mouseY, sizeSlider.value);
  fill(0);
  textSize(18);
  text(rgbSlider[0].value, 6, 18);
  text(rgbSlider[1].value, 6, 36);
  text(rgbSlider[2].value, 6, 54);
}
