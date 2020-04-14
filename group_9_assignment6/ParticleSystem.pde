class ParticleSystem {
  ArrayList<Particle> pSyst = new ArrayList<Particle>();
  PVector origin;
  String loc;
  
  //getting position in x,y and relative to the other fountains
  ParticleSystem(String location, PVector pos) {
    origin = pos.copy();
    loc = location;
  }
  
  void addParticle() {
    pSyst.add(new Particle(loc,origin));
  }
  
  void run() {
    for (int i = pSyst.size()-1; i >= 0; i--) {
      Particle active = pSyst.get(i);
      active.run();
      if (active.isDead()) {
        pSyst.remove(i);
      }
    }
  }
}
