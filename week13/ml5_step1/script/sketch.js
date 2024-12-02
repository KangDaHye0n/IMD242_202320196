/*
 * 👋 Hello! This is an ml5.js example made and shared with ❤️.
 * Learn more about the ml5.js project: https://ml5js.org/
 * ml5.js license and Code of Conduct: https://github.com/ml5js/ml5-next-gen/blob/main/LICENSE.md
 *
 * This example demonstrates face tracking on live video through ml5.faceMesh.
 */

let faceMesh;
let video;
let faces = []; //얼굴을 여러 개 인식하는 것이 가능
let options = { maxFaces: 1, refineLandmarks: false, flipHorizontal: false };

function preload() {
  //내가 로딩하고자 하는 것을 다 로딩할 때까지 기다려줌
  // Load the faceMesh model
  faceMesh = ml5.faceMesh(options);
}

function setup() {
  createCanvas(640, 480);
  // Create the webcam video and hide it
  video = createCapture(VIDEO);
  video.size(640, 480);
  video.hide();
  // Start detecting faces from the webcam video
  faceMesh.detectStart(video, gotFaces);
  //callback = 함수(여기에서는 gotFaces자리), 만약에 코드가 끝나면 함수를 실행하게 해줌
}

function draw() {
  // Draw the webcam video
  image(video, 0, 0, width, height);

  // Draw all the tracked face points
  for (let i = 0; i < faces.length; i++) {
    let face = faces[i];
    // for (let j = 0; j < face.keypoints.length; j++) {
    //   let keypoint = face.keypoints[j];
    //   fill(0, 255, 0);
    //   noStroke();
    //   circle(keypoint.x, keypoint.y, 5);
    // }
    let leftEye = face.leftEye;
    for (let n = 0; n < leftEye.keypoints.length; n++) {
      let keypoint = leftEye.keypoints[n];
      circle(keypoint.x, keypoint.y, 5);
    }
  }
}

// Callback function for when faceMesh outputs data
function gotFaces(results) {
  // Save the output to the faces variable
  faces = results;
}

function keyPressed() {
  if (key === 'o' || key === 'O') {
    console.log(faces);
  }
}
