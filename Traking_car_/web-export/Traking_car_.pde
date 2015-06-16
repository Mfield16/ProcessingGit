//Car car = new Car();
ArrayList<Car> cars = new ArrayList<Car>();
int numCars = 1000;
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
class Car {
  float directionRadians = 0;
  float pixelsPerSecond = 2;
  float x = 0;
  float y = 0;
  float carLength = 15;
  float carWidth = 5;
  float servoSensitivity = 10;
  int carColor;
  boolean turnsLeftWhenOffTrack = random(1)<.5; 

  boolean offTrack;
  Car() {
    carColor = color(random(255), random(255), random(255));
  }
  float angleCorrection() {
    return 0.01 * servoSensitivity * pixelsPerSecond;
  }

  void draw() {
    pushMatrix();
    strokeWeight(1);
    fill(carColor);
    stroke(90);
    rectMode(CENTER);
    translate(x, y);
    //    if (y>0) {
    //      directionRadians = -directionRadians;
    //    }
    rotate(directionRadians);
    rect(0, 0, carLength, carWidth);
    x += pixelsPerSecond * cos(directionRadians);
    y += pixelsPerSecond * sin(directionRadians);
    boolean offRightSide = offTrack(carLength * .5, carWidth/2);
    boolean offLeftSide = offTrack(carLength * .5, -carWidth/2);
    if (offRightSide && offLeftSide) {
      if (turnsLeftWhenOffTrack) {
        directionRadians += angleCorrection();
      } else
        directionRadians -= angleCorrection();
    } else
      //Right Sensor
    if (offRightSide) {
      directionRadians -= angleCorrection();
    } else 
      //Left Sensor 
    if (offLeftSide) {
      directionRadians += angleCorrection();
    }

    popMatrix();
  }
  boolean offTrack(float dx, float dy) {
    float cosAngle = cos(directionRadians);
    float sinAngle = sin(directionRadians);
    float dxRotated = dx * cosAngle - dy * sinAngle;
    float dyRotated = dx * sinAngle + dy * cosAngle;
    int xIndex = round(width/2 + x + dxRotated);
    int yIndex = round(height/2 - y - dyRotated);
    color trackPixel =get(xIndex, yIndex);// pixels[xIndex + yIndex * width]; //
    float greyLevel =  (red(trackPixel) + green(trackPixel) + blue(trackPixel)) / 3;
    //    println(""+ xIndex + "," + yIndex +"=" + blue(trackPixel));
    //    println(mouseX, mouseY);
    return greyLevel > 100;
    //    return get(xIndex, yIndex) != TRACK_COLOR;
  }
}
class Track {
  void draw() {
    stroke(0);
    strokeWeight(15);

    rectMode(CENTER);
    noFill();
    ellipse(0, 0, 400, 400);
    rect(0, 0, 400, 400);
    rect(0, 0, 10, 400);
    rect(0, 0, 400, 10);
  }
}

