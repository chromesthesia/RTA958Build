class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan; 
  float pitch;
  float volume;
  int xPos; // *******
  float Y;
  float Size;
  float Ring1;
  float Ring2;

 
  Particle(float _P, float _V, int _x) {
    pitch = _P;
    volume = _V;
    xPos = _x;   

    lifespan = 100; 
    Size = map(volume, 0.25, 0.80, 0, 200);
    Y = map(pitch, 0.45, 0.70, height, 0);
  }
 
  void run() { 
    update();
    display();
  }
 
  void update() { 
    lifespan -= 3.0; 
    Ring1 = Size += 3.0;
    Ring2 = Size += 6.0;
  }
 
  void display() {
     
    noStroke();
    fill(pitch*160, 100, lifespan);  
    ellipse(xPos,Y,Size,Size); 
    
    noFill();
    stroke(pitch*130, 100, lifespan);
    ellipse(xPos, Y, Ring1, Ring1);
    
    noFill();
    stroke(pitch*100, 100, lifespan);
    ellipse(xPos, Y, Ring2, Ring2);  
    
  }
 
  boolean isDead() { 
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}