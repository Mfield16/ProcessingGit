float noiseScale = .4;
void setup() {
  size(500, 500);
  background(90);
}

void draw() {
  float lineX, lineY;
//  if frameCount/2
  lineX = (noise(40*noiseScale*frameCount)-0.5)*width;
  lineY = (noise(20*noiseScale*frameCount)-0.5)*height;
  translate(width/2, height/2);
  stroke(#FF00CC);
  line(0, 0, lineX, lineY);
  //  if (frameCount == 20)
  //    println(lineX, lineY);
}
// 66FFCC

