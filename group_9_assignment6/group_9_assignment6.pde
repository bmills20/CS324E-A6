PImage bg, basketball, soccer, baseball;
Flock flock1;
ParticleSystem spring1, spring2, spring3, tempSpring, loopSpring;
ArrayList<ParticleSystem> allSyst;
Ball b1, b2, b3, b4, b5, b6, b7, b8, b9;

void setup() {
  allSyst = new ArrayList<ParticleSystem>();
  bg = loadImage("park.png");
  basketball = loadImage("basketball.png");
  soccer = loadImage("soccer.png");
  baseball = loadImage("baseball.png");
  //(Edited) cartoon in the public domain: https://www.publicdomainpictures.net/en/view-image.php?image=291556&picture=reading-in-park
  spring2 = new ParticleSystem("side",new PVector(315, 570, 0.0));
  spring3 = new ParticleSystem("side",new PVector(135, 570, 0.0));
  spring1 = new ParticleSystem("mid",new PVector(225, 600, 0.0));
  b1 = new Ball(30, 0.9, 0.7);
  b2 = new Ball(30, 0.9, 0.7);
  b3 = new Ball(30, 0.9, 0.7);
  b4 = new Ball(22, 0.7, 0.45);
  b5 = new Ball(22, 0.7, 0.45);
  b6 = new Ball(22, 0.7, 0.45);
  b7 = new Ball(11, 0.4, 0.15);
  b8 = new Ball(11, 0.4, 0.15);
  b9 = new Ball(11, 0.4, 0.15);
  flock1 = new Flock();
  for (int i = 0; i<25; i++){
    flock1.addBird(new Bird(5*width/6,height/6));
  }
  size(1000,800,P3D);
}

void draw() {
  background(bg);
  flock1.run();
  spring1.addParticle();
  spring1.addParticle();
  spring1.run();
  spring2.addParticle();
  spring2.run();
  spring3.addParticle();
  spring3.run();
  
  for (int z = allSyst.size()-1; z >= 0; z--) {
    loopSpring = allSyst.get(z);
    loopSpring.addParticle();
    loopSpring.run();
  }
  
  b1.update(basketball);
  b2.update(basketball);
  b3.update(basketball);
  b4.update(soccer);
  b5.update(soccer);
  b6.update(soccer);
  b7.update(baseball);
  b8.update(baseball);
  b9.update(baseball);
}

//Add a new bird with a mouse click
void mousePressed() {
  flock1.addBird(new Bird(mouseX,mouseY));
}
