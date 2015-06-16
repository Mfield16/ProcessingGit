
class Car {
  float directionRadians = 0;
  float pixelsPerSecond = 1.5;
  float x = -324;
  float y = 120;
  float carLength = 10;
  float carWidth = 5;
  float servoSensitivity = 15;

  void draw() {
    fill(200, 200, 255);
    noStroke();
    rectMode(CENTER);
    translate(x, y);
    rotate(directionRadians);
    rect(0, 0, carLength, carWidth);
    x += pixelsPerSecond * cos(directionRadians);
    y += pixelsPerSecond * sin(directionRadians);
    //direct front right and left
    if (offTrack(carLength * .7, carWidth/2)) {
      directionRadians -= angleCorrection();
    } else if (offTrack(carLength * .7, -carWidth/2)) {
      directionRadians += angleCorrection();
    }
    //forward left and right
    if (offTrack(carLength, carWidth * 1.2)) {
      directionRadians -= angleCorrection() * .8;
    } else if (offTrack(carLength, -carWidth * 1.2)) {
      directionRadians += angleCorrection() * .8;
    }
    //left and right close
    if (offTrack(carLength * .3, carWidth * 1.4)) {
      directionRadians -= angleCorrection() * .2;
    } else if (offTrack(carLength * .3, -carWidth * 1.4)) {
      directionRadians += angleCorrection() * .2;
    }
    //left and right medium
    if (offTrack(carLength * .45, carWidth * 1.6)) {
      directionRadians -= angleCorrection() * .3;
    } else if (offTrack(carLength * .45, -carWidth * 1.8)) {
      directionRadians += angleCorrection() * .3;
    }
    //left and right far
    if (offTrack(carLength * .4, carWidth * 1.6)) {
      directionRadians -= angleCorrection() * .1;
    } else if (offTrack(carLength * .4, -carWidth * 1.8)) {
      directionRadians += angleCorrection() * .1;
    }
    //center close
    if (offTrack(carLength * .8, 0)) {
      pixelsPerSecond *= .8;
    }
    //speed up
    if (pixelsPerSecond < 3) {
      pixelsPerSecond *= 1.01;
    }
    //don't stop
    if (pixelsPerSecond <= 0.4) {
      pixelsPerSecond += .04;
    }
    //slow down while turning
    
  }

  float angleCorrection() {
    return 0.01 * servoSensitivity * pixelsPerSecond;
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
    println(mouseX, mouseY);
    return greyLevel > 100;
    //    return get(xIndex, yIndex) != TRACK_COLOR;
  }
}

