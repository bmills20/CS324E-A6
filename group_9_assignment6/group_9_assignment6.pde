PImage bg, basketball, soccer, baseball;
Flock flock1;
ParticleSystem spring1;
Ball b1, b2, b3, b4, b5, b6, b7, b8, b9;

void setup() {
  bg = loadImage("park.png");
  basketball = loadImage("basketball.png");
  soccer = loadImage("soccer.png");
  baseball = loadImage("baseball.png");
  //(Edited) cartoon in the public domain: https://www.publicdomainpictures.net/en/view-image.php?image=291556&picture=reading-in-park
  spring1 = new ParticleSystem(new PVector(300, 570));
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
  spring1.addParticle();
  spring1.run();
  b1.update(basketball);
  b2.update(basketball);
  b3.update(basketball);
  b4.update(soccer);
  b5.update(soccer);
  b6.update(soccer);
  b7.update(baseball);
  b8.update(baseball);
  b9.update(baseball);
  flock1.run();
}

//Add a new bird with a mouse click
void mousePressed() {
  flock1.addBird(new Bird(mouseX,mouseY));
}
