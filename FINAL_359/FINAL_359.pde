import netP5.*;
import oscP5.*;
Particle p;

ArrayList<Particle> particles;
float arrivalTime359;
float lastArrival359;
float arrivalTime361;
float lastArrival361;
float arrivalTime357;
float lastArrival357;
float time = 25;

OscP5 oscP5_C; 
OscP5 oscP5_L;
OscP5 oscP5_R;

NetAddress myRemoteLocationC;
NetAddress myRemoteLocationL;
NetAddress myRemoteLocationR;

void setup() {
  colorMode(HSB, 100);
  size(1800,1200);
  oscP5_C = new OscP5(this,12013);
  oscP5_L = new OscP5(this,12012);
  oscP5_R = new OscP5(this,12011); 
 
  myRemoteLocationC = new NetAddress("127.0.0.1",12013); 
  myRemoteLocationL = new NetAddress("10.16.110.195", 12012); 
  myRemoteLocationR = new NetAddress("10.16.124.69", 12011); 

  particles = new ArrayList<Particle>();

  oscP5_C.plug(this,"RCC359","/RCC359");
  oscP5_L.plug(this,"RCC361","/RCC361");
  oscP5_R.plug(this,"RCC357","/RCC357");
}
// Variable that can store how long since last message.. If this message arrives more than a second from the last message then dont
public void RCC359(float pitchC, float volumeC) { 
   arrivalTime359 = millis();
   if ((arrivalTime359 - lastArrival359) > time) {
    
    volumeC /= 100;
    pitchC /= 100;
    int x359 = 900;
    particles.add (new Particle(pitchC, volumeC, x359));
   }
    lastArrival359 = arrivalTime359; 
}

public void RCC361(float pitchL, float volumeL) {
   arrivalTime361 = millis();
   if ((arrivalTime361 - lastArrival361) > time) {
     
    volumeL /= 100;
    pitchL /= 100;
    int x361 = 450;
    particles.add (new Particle(pitchL, volumeL, x361));
   }
    lastArrival361 = arrivalTime361; 
}

public void RCC357(float pitchR, float volumeR) { 
   arrivalTime357 = millis();
   if ((arrivalTime357 - lastArrival357) > time) {
     
    volumeR /= 100;
    pitchR /= 100;
    int x357 = 1350;
    particles.add (new Particle(pitchR, volumeR, x357));
   }
    lastArrival357 = arrivalTime357;
}

void draw() {

  background(0);
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
  }
}