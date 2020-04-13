class Particle {
  PVector pos; //PVector xpos ypos
  PVector vel;
  PVector acc;
  float life;
  float r;
  
  Particle(PVector p) {
    acc = new PVector(0, 0.05);
    vel = new PVector(random(-1, 1), random(-2, 0));
    pos = p.copy();
    life = 255.0;
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    life -= 1.0;
  }
  
  void display() {
    stroke(0, 0, 153, life); //life indicates transparency towards bottom
    fill(0, 0, 153, life);
    ellipse(pos.x, pos.y, 8, 8);
  }
  
  boolean isDead() {
    if (life < 0.0) {
      return true;
    }
    else {
      return false;
    }
  }
}
