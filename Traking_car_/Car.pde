class Car {
  float directionRadians = 0;
  float pixelsPerSecond = 2;
  float x = 0;
  float y = 0;
  float carLength = 15;
  float carWidth = 5;
  float servoSensitivity = 10;
  int carColor;
  boolean turnsLeftWhenOffTrack = random(1)<1; 

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
