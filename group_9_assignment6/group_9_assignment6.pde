PImage bg;
ParticleSystem spring1;

void setup() {
  bg = loadImage("park.png");
  //(Edited) cartoon in the public domain: https://www.publicdomainpictures.net/en/view-image.php?image=291556&picture=reading-in-park
  spring1 = new ParticleSystem(new PVector(300, 570));
  size(1000,800,P3D);
}

void draw() {
  background(bg);
  spring1.addParticle();
  spring1.run();
}
