void setup() {
  size(2400, 1200, P3D);
}

void draw() {

//  Top Side
  translate(width/2, height/2);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  background(90);
  sphere(40);
  pushMatrix();
  translate(-40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(-40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(-40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(-40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(-40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  popMatrix();
  
//  Under Side
  
  pushMatrix();
  translate(40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  popMatrix();
  
//  Left Side

pushMatrix();
  translate(-40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(-40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(-40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(-40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(-40, 40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
popMatrix();

//Right Side

pushMatrix();
  translate(40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
  translate(40, -40);
  rotateX(frameCount/2*.02);
  rotateY(frameCount/2*.02);
  sphere(40);
popMatrix();
}

