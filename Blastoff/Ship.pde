import processing.core.PVector;
class Ship{
 Planet earth;
 PVector r,v,a;
 float fuel,throttle,face;
 
 Ship(Planet plnt){
  // setup original stuff 
 r = new PVector(1000,750);
 v = new PVector(0,0);
 a = new PVector(0,0);
 fuel = 100;
 throttle = 0;
 face = 0;
 earth = plnt;
 }
 
 void move(){
  r.add(v); 
  v.add(a);
  if(altitude() < 250.0001){
    a.set(0,0);
  }else{
    a.set(earth.accel(r));
  }
  if (fuel > 0){
    PVector thrust = new PVector(sin(radians(face)),-cos(radians(face)));
    float c = throttle / 50000;
    a.add(PVector.mult(thrust,c));
    fuel -= throttle/1000;
  }else{
    fuel = 0.000;
  }
 }
 
 void throt(int i){
   if (i>0){
     throttle += 10;
   }else{
     throttle -= 10;
   }
   if (throttle >100){
     throttle = 100;
   }
   if (throttle < 0){
     throttle = 0;
   }
 }
 
 void turn(int i){
   if (i>0){
     face += 15;
   }else{
     face -= 15;
   }
   if (face >360){
     face -= 360;
   }
   if (face < 0){
     face += 360;
   }
 }
 
 float altitude(){
  PVector temp = new PVector();
  PVector.sub(r,earth.pos,temp);
  return temp.mag();
 }
 
 void display(){
   fill(255);
   textSize(12);
   text("Fuel: " + str(fuel).substring(0,4) + "%",400,20);
   text("Throttle: " + str(throttle).substring(0,3) + "%",400,40);
   text("Altitude: " + str(altitude()).substring(0,3),400,60);
   
   stroke(255,0,0);
   line(r.x/4,r.y/4,r.x/4 + 100*v.x, r.y/4 + 100*v.y);
   translate(r.x/4,r.y/4);
   rotate(radians(face));
   fill (200);
   stroke(255);
   triangle(0,-5,-4,5,4,5);
   //println("r: " + r.x + "," + r.y);
   //println("v: " + v.x + "," + v.y);
   println("a: " + a.x + "," + a.y);
   //println(earth.pe(r) + v.magSq() * .5);
   //stroke (255);
   stroke(0);
   //println(throttle);
 }
 
}
