PGraphics pg;
void setup() {
  size(640, 480);
  pg=createGraphics(width, height); 
  pg.beginDraw();
  pg.background(90);
  pg.ellipse(width/2, height/2, 100, 100);
  pg.endDraw();
}
void draw() {
  image(pg, 0, 0);
}

