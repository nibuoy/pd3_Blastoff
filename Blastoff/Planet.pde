import processing.core.PVector;

class Planet{
 PVector pos;
 float mass,diameter;
 
 Planet(){
  pos = new PVector(1000,1000);
  mass = 100;
  diameter = 500;
 }
 
 PVector accel(PVector r){
   PVector temp = PVector.sub(r,pos);
   //println(temp.x + "," + temp.y);
   PVector norm = new PVector();
   temp.normalize(norm);
   float c = mass * (-1) / (temp.magSq());
   return PVector.mult(norm,c);
 }
 
  float pe(PVector r){
   PVector temp = PVector.sub(r,pos);
   return mass * (-1) / (temp.mag());
 }
 
 void display(){
  fill(0,100,0);
  ellipse(pos.x/4,pos.y/4,diameter/4,diameter/4);
  fill(255);
  textSize(16);
  text("Earth",230,257);
 }
}
