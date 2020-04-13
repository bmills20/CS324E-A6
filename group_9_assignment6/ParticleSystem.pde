class ParticleSystem {
  ArrayList<Particle> p_syst;
  PVector origin;
  
  ParticleSystem(PVector pos) {
    origin = pos.copy();
    p_syst = new ArrayList<Particle>();
  }
  
  void addParticle() {
    p_syst.add(new Particle(origin));
  }
  
  void run() {
    for (int i = p_syst.size()-1; i >= 0; i--) {
      Particle active = p_syst.get(i);
      active.run();
      if (active.isDead()) {
        p_syst.remove(i);
      }
    }
  }
}
