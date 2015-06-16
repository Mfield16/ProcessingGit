//Car car = new Car();
ArrayList<Car> cars = new ArrayList<Car>();
int numCars = 4000;
int trackColor = color(random(255));
Track track = new Track();
void setup() {
  size(500, 500);
  for (int i = 0; i < numCars; ++i) {
    cars.add(new Car());
  }
}
void draw() {
  background(255);
  translate(width/2, height/2);
  scale(1, -1);
  track.draw();
  for (Car car : cars) {
    car.draw();
  }
}
void mousePressed( ) {
  for (Car car : cars) {
    car.x = mouseX-width/2 + random(1);
    car.y = height/2-mouseY + random(1);
  }
}
