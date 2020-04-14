class Particle {
  PVector pos; //PVector xpos ypos
  PVector vel;
  PVector acc;
  float life;
  float r;
  
  
  //p gives position while the String allows me to modify acc/vel per fountain
  Particle(String loc, PVector p) {
    String mid = "mid";
    String side = "side";
    noStroke();
    
    if (loc.equals(mid)){
      acc = new PVector(0, 0.50); //acc in x acc in y
      vel = new PVector(random(-2, 2), random(-20, -15));
    }
    else if (loc.equals(side)){
      acc = new PVector (0, 0.50);
      vel = new PVector(random(-3,3), random(-10, -5));
    }
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
    //process to get the water to 'dissapear' into the lake
    if (pos.y >= 590) {
      life = -1;
    }
    else if (pos.y >= random(580, 600) && vel.y > 0.0) {
      life -= 100.0;
    }
    else if (pos.y >= random(560, 580) && vel.y > 0.0) {
      life -= 80.0;
    }
    //else if (vel.y > 0.0) {
    //  life -= 3;
    //}
     else {
       life -= 1.0;
    }
  }
  
  void display() {
    //stroke(0, 0, 153, 0); //life indicates transparency towards bottom
    fill(0, 0, 153, life);
    ellipse(pos.x, pos.y, 10, 15);
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
