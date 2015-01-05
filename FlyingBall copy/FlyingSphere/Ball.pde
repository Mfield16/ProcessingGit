class Ball {
  float diameter = 20;
  float strokeWidth = 3;
  float x, y;
  float vx, vy;
  float ay;

  Ball() {
    x = 0;
    y = 0;
    vx = 2;
    vy = 0; 
    ay = .016;
  }
  void draw() {
    //    stroke(strokeWidth);
    //    noStroke();
    pushMatrix();

    fill(random(255), random(255), random(255));
    translate(x, y);
    sphere(diameter);
    popMatrix();
    x+=vx;
    y+=vy;
    vy+=ay;
  }
}

