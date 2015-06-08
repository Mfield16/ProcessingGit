Car car = new Car();
Track track = new Track();
void setup(){
 size(1000,1000);  
  
}

void draw(){
  translate(width/2, height/2);
  scale(1,-1);
// background(120); 
track.draw();
}

