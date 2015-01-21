PGraphics mask;
int numRows = 10, numCols = 10;
int WHITE = color(255);
int BLACK = color(200, 0, 0);

void setup() {
  size(640, 360);

  drawDemoMask();
}

void draw() {
  background(255, 255, 100);
  noStroke();
  fill(#66DD22);
  float diameter = height * 0.4;
  ellipse(mouseX, mouseY, diameter, diameter);
  maskPixels();
}

void drawDemoMask() {
  mask = createGraphics(width, height);
  mask.beginDraw();


  //  
  //  mask.background(0);
  //  mask.fill(255);
  //  mask.noSmooth();
  //  mask.noStroke();
  //  String msg = "This Statement Is False";
  //  float txtSize = 1;
  //  mask.textSize(txtSize);
  //  //scale text to fill width
  //  txtSize *= width / mask.textWidth(msg);
  //  mask.textSize(txtSize-2);
  //  mask.text(msg, (width - mask.textWidth(msg))*0.5, (height + txtSize)/2);

  mask.fill(50, 200, 100);
  mask.ellipse(mouseX, mouseY, 50, 50);
  mask.pushMatrix();
  mask.fill(255);
  //  ellipse(width/2, height/2, 100, 100);
  float colSeperation = width/(numCols+1.0);
  float rowSeperation = height/(numRows+1.0);
  for (int row =0; row <numRows; row++) {
    mask.translate(0, rowSeperation);
    mask.pushMatrix();
    for (int col =0; col <numCols; col++) {
      mask.translate(colSeperation, 0);
      mask.ellipse(0, 0, 20, 20);
    }
    mask.popMatrix();
  }
  mask.endDraw();
  mask.loadPixels();
}

void maskPixels() {
  loadPixels();
  int[] pxls = mask.pixels;
  for (int i = 0; i < pxls.length; ++i) {
    int maskPixel = pxls[i];
    if (maskPixel != WHITE) {
      pixels[i] = BLACK;
    }
  }
  updatePixels();
}

