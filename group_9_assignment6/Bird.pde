class Bird {
  
  PVector pos;
  PVector speed;
  PVector accel;
  float maxforce;
  float maxspeed;
  PImage pigeon;
  
  Bird(float x, float y) {
    pigeon = loadImage("bird.png");
    accel = new PVector(0,0);
    speed = PVector.random2D();
    pos = new PVector(x,y);
    maxspeed = 2.7;
    maxforce = 0.02;
  }
  
  void run(ArrayList<Bird> birds) { //referenced in Flock to be called by main program
    flock(birds);
    update();
    borders();
    render();
  }
  
  void applyForce(PVector force) { //called by flock to apply the 3 rules
    accel.add(force);
  }
  
  //initialize and apply forces
  void flock(ArrayList<Bird> birds) { //
    PVector sep = separate(birds);
    PVector ali = align(birds);
    PVector coh = cohesion(birds);
    
    //add weights to the vectors
    sep.mult(1.4); // sep value should be a bit higher than the others to avoid collisions
    ali.mult(1.0);
    coh.mult(1.0);
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }
  
  //update the position
  void update() {
    speed.add(accel);
    speed.limit(maxspeed);
    pos.add(speed);
    //set acceleration to 0
    accel.mult(0);
  }
  
  //calculates and applies steer
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,pos);
    desired.setMag(maxspeed);
    
    PVector steer = PVector.sub(desired,speed);
    steer.limit(maxforce);
    return steer;
  }
  
  //rotate the bird image toward the direction it is moving, draw the bird
  void render() {
    float theta = speed.heading() + radians(90);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    //beginShape(TRIANGLES);
    //vertex(0, -r*2);
    //vertex(-r, r*2);
    //vertex(r, r*2);
    //endShape();
    image(pigeon,0,0);
    pigeon.resize(50,50);
    popMatrix();
  }
  
  //keep the birds in the sky
  void borders() {
    if (pos.x > width) { //goes to the right
      pos.x = 0;
    }
    if (pos.x < 0) { //goes to the left
      pos.x = width;
    }
    
    if (pos.y < 0) { //goes to the top
      pos.y = 8*height/16;
    }
    
    if (pos.y > 9*height/16) {
      pos.y = 0;
    }      
  }
  
  //THREE FORCES
  
  //Separate - birds move away from one another
  PVector separate (ArrayList<Bird> birds) {
    float targetSeparation = 40;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (Bird other: birds) { //apply rule to all birds in arraylist
      float d = PVector.dist(pos, other.pos);
      if ((d > 0) && (d < targetSeparation)) {
        //calculates vector to avoid neighbor
        PVector away = PVector.sub(pos, other.pos);
        away.normalize();
        away.div(d);        
        steer.add(away);
        count++;            
      }
    }
    //Find average direction
    if (count > 0) {
      steer.div((float)count);
    }
    
    //steer = desired - velocity
    if (steer.mag() > 0) {
      steer.setMag(maxspeed);
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(speed);
      steer.limit(maxforce);
    }
    return steer;
  }
  
  //ALIGN
  //calculate average speed of all other birds
  PVector align (ArrayList<Bird> birds) {
    float neighbordist = 200;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Bird other : birds) {
      float d = PVector.dist(pos, other.pos);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.speed);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);


      // steer = desired - speed
      sum.setMag(maxspeed);
      PVector steer = PVector.sub(sum, speed);
      steer.limit(maxforce);
      return steer;
    } 
    else {
      return new PVector(0, 0);
    }
  }

  // COHESION
  //stay near other birds - steer towards average pos of other birds
  PVector cohesion (ArrayList<Bird> birds) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all poss
    int count = 0;
    for (Bird other : birds) {
      float d = PVector.dist(pos, other.pos);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.pos); 
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } 
    else {
      return new PVector(0, 0);
    }
  }
}
    
    
