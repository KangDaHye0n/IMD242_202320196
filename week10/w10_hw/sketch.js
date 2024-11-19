let confetties = [];

let colours = ['#257180', '#F2E5BF', '#FD8B51', '#CB6040'];

let gravity = [0, 0.1];
let friction = 0.99;
let cnt = 0;
let mouse = [0, 0];

// Confetties confetties;

function setup() {
  createCanvas(800, 800);
  confetties = new Confetties();
}

function mousePressed() {
  cnt = 0;
  mouse[0] = mouseX;
  mouse[1] = mouseY;
}

function mouseReleased() {
  console.log('gen: ' + cnt);
  confetties.gen(mouse[0], mouse[1], cnt);
}

function keyPressed() {
  if (key == 'p' || key == 'P')
    console.log('confetties: ' + confetties.getLength());
}

function draw() {
  if (mousePressed) {
    cnt++;
  }
  background(255);
  confetties.update(gravity, friction);
  confetties.display();
}

class Confetti {
  // float[] pos;
  // float[] vel;
  // float[] size;
  // int colour;
  // float ang;
  // float angVel;

  Confetti(x, y, w, h, colour, force, angForce) {
    pos = new float[2]();
    vel = new float[2]();
    size = new float[2]();
    init(x, y, w, h, colour, force, angForce);
  }

  init(x, y, w, h, colour, force, angForce) {
    pos[0] = x;
    pos[1] = y;

    size[0] = w;
    size[1] = h;

    this.colour = colour;

    let randomDir = radians(random(360));
    vel[0] = force * cos(randomDir);
    vel[1] = force * sin(randomDir);

    ang = radians(random(360));
    angVel = radians(angForce);
  }

  update(force, friction) {
    for (let idx = 0; idx < 2; idx++) {
      vel[idx] += force[idx];
      pos[idx] += vel[idx];
      vel[idx] *= friction;
    }

    ang += angVel;
    angVel *= friction;
  }

  display() {
    push();
    rectMode(CENTER);
    translate(pos[0], pos[1]);
    rotate(ang);
    noStroke();
    fill(colour);
    rect(0, 0, size[0], size[1]);
    pop();
  }

  getDiagonal() {
    let sumSquare = pow(size[0] * 0.5, 2) + pow(size[1] * 0.5, 2);
    return sqrt(sumSquare);
  }

  isOutOfScreen() {
    return (
      pos[0] < -getDiagonal() ||
      pos[0] > width + getDiagonal() ||
      pos[1] < -getDiagonal() ||
      pos[1] > height + getDiagonal()
    );
  }
}

class Confetties {
  // ArrayList<Confetti> confetties;

  Confetties() {
    confetties = new confetties();
  }

  gen(x, y, n) {
    for (let idx = 0; idx < n; idx++) {
      let randomW = random(4, 20);
      let randomH = random(4, 20);
      let randomForce = random(1, 10);
      let randomAngForce = random(-30, 30);
      let newConfetti = new Confetti(
        x,
        y,
        randomW,
        randomH,
        colours[int(random(colours.length))],
        randomForce,
        randomAngForce
      );
      confetties.push(newConfetti);
    }
  }

  update(force, friction) {
    for (let idx = confetties.length - 1; idx >= 0; idx--) {
      let aConfetti = confetties.get(idx);
      aConfetti.update(force, friction);
      if (aConfetti.isOutOfScreen()) {
        confetties.remove(idx);
      }
    }
  }

  display() {
    for (let idx = 0; idx < confetties.length; idx++)
      confetties.get(idx).display();
  }

  getLength() {
    return confetties.size();
  }
}
