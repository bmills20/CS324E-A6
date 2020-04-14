//flock class with arraylist to contain bird objects

class Flock {
  ArrayList<Bird> birds;

  Flock() {
    birds = new ArrayList<Bird>();
  }

  void run() {
    for (Bird b : birds) {
      b.run(birds);
    }
  }

  void addBird(Bird b) {
    birds.add(b);
  }

}
