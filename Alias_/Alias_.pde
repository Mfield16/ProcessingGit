int blockSidePixels = 40;
int WHITE = color(255);
int BLACK = color(0);
void setup() {
  size(400, 400);
  background(255);


  strokeWeight(width*.1);
  ellipse(width/2, height/2, width*.8, height*.8); 
  alias();
}

void alias() {
  for (int yStartBlock = 0; yStartBlock < height; yStartBlock += blockSidePixels) {
    for (int xStartBlock = 0; xStartBlock < width; xStartBlock += blockSidePixels) {
      float whiteFraction = fractionOfWhite(yStartBlock, xStartBlock);
      if (whiteFraction > .5) {
        setBlockColor(yStartBlock, xStartBlock, WHITE);
      } else {
        setBlockColor(yStartBlock, xStartBlock, BLACK);
      }
    }
  }
}
