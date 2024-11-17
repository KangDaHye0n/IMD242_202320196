class Ball {
  float[] pos;
  float[] vel;
  float rad;
  float r = random(100, 120);
  float g = random(100, 220);
  float b = random(220, 255);
  
  Ball() {
    pos = new float[2];
    vel = new float[2];
  }
  
  void make(float x, float y, float rad) {
    pos[0] = x;
    pos[1] = y;
    this.rad = rad;
    vel[0] = 0;
    vel[1] = 0;
  }
  
  void update(float[] force, float friction) {
    for (int idx = 0; idx < 2; idx++) {
      vel[idx] += force[idx];
      pos[idx] += vel[idx];
      vel[idx] *= friction;
    }
  }
  
   void collide(Ball other, float friction) {
    float critDist = rad + other.rad;
    float dx = other.pos[0] - pos[0] ;
    float dy = other.pos[1] - pos[1];
    float dist = sqrt(dx * dx + dy * dy);
    if (dist < critDist) {
      float[] normalPos = {dx / dist, dy / dist};
      float overlap = critDist - dist;
      pos[0] -= overlap * normalPos[0];
      pos[1] -= overlap * normalPos[1];
      other.pos[0] += overlap * normalPos[0];
      other.pos[1] += overlap * normalPos[1];
      //거리조정
      float[] normalVel = {other.vel[0] - vel[0], other.vel[1] - vel[1]};
      float dotProduct = normalVel[0] * normalPos[0]
        + normalVel[1] * normalPos[1];
      vel[0] += dotProduct * normalPos[0] * friction;
      vel[1] += dotProduct * normalPos[1] * friction;
      other.vel[0] -= dotProduct * normalPos[0] * friction;
      other.vel[1] -= dotProduct * normalPos[1] * friction;
      //반사
    }
  }
  
  void boundary(float boundFriction) {
    if (pos[0] < width * 0.05 + rad) {
      pos[0] = width * 0.05 + rad;
      vel[0] *= -boundFriction;
    } else if (pos[0] > width - rad + width * -0.05) {
      pos[0] = width - rad + width * -0.05;
      vel[0] *= -boundFriction;
    }
    if (pos[1] > height - rad - height * .05) {
      pos[1] = height - rad - height * .05 ;
      vel[1] *= -boundFriction;
    }
  }
  
  void display() {
    push();
    translate(pos[0], pos[1]);
    noStroke();
    fill(r, g, b);
    circle(0, 0, rad * 2);
    pop();
  }
}
