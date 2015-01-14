int numPixels;
int blockSidePixels = 40;
int WHITE = color(255);
int BLACK = color(0);
void setup() {
  size(400, 400);
  numPixels = (width*height);
}
void draw() {
  
  background(255);
  blockSidePixels=mouseX;
  if (blockSidePixels < 1) {
    blockSidePixels=2;
  }
  strokeWeight(width*.1);
  ellipse(width/2, height/2, width*.8, height*.8); 
  rectMode(CENTER);
  rect(width/2,height/2,width*.4,height*.4);
  alias();
}

void alias() {
  loadPixels();
  for (int yStartBlock = 0; yStartBlock < height; yStartBlock += blockSidePixels) {
    for (int xStartBlock = 0; xStartBlock < width; xStartBlock += blockSidePixels) {
      float whiteFraction = fractionOfWhite(xStartBlock, yStartBlock);
      if (whiteFraction > .5) {
        setBlockColor(xStartBlock, yStartBlock, WHITE);
      } else {
        setBlockColor(xStartBlock, yStartBlock, BLACK);
      }
    }
  }
  updatePixels();
}

float fractionOfWhite( int xStartBlock, int yStartBlock) {
  int numberOfPixels=0;
  for (int y = yStartBlock; y < yStartBlock + blockSidePixels; y++) {
    for (int x = xStartBlock; x < xStartBlock + blockSidePixels; x++) {
      int pixelIndex = x+y*width;
      if (pixelIndex < numPixels) {
        int clr = pixels[pixelIndex]; //get(x, y);   
        int grayLevel = (int) (red(clr) + green(clr) + blue(clr));
        if ( grayLevel > 127) ++numberOfPixels;
      }
    }
  }
  return ((float)numberOfPixels)/(blockSidePixels*blockSidePixels);
}
void setBlockColor( int xStartBlock, int yStartBlock, int clr) {
  for (int y = yStartBlock; y < yStartBlock + blockSidePixels; y++) {
    for (int x = xStartBlock; x < xStartBlock + blockSidePixels; x++) {
      int pixelIndex = x+y*width;
      if (pixelIndex < numPixels) {
        pixels[pixelIndex] = clr; //set(x, y, clr);
      }
    }
  }
}

