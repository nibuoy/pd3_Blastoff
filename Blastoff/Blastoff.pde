Ship s;
Planet p;
int spd = 60;

void setup(){
  frameRate(spd);
  size(500,500);
  background(0);
  smooth();
  
  //frameRate(15);
  
  p = new Planet();
  s = new Ship(p);
}

void keyPressed(){
 if (key == CODED){
   if (keyCode == UP){
     s.throt(1);
   } else if (keyCode == DOWN){
     s.throt(-1);
   } else if (keyCode == LEFT){
     s.turn(-1);
   } else if (keyCode == RIGHT){
     s.turn(1);
   }
 }else{
   if (key == 'x'){
     speed(1);
   } else if (key == 'z'){
     speed(-1);
   }
 }
}

void speed(int i){
  if (i>0){
     spd = spd * 2;
   }else{
     spd = spd / 2;
   }
   if (spd > 960){
     spd = 960;
   }
   if (spd < 60){
     spd = 60;
   }
   frameRate(spd);
}


void draw(){
  background(0);
  p.display();
  s.display();
  s.move();
}


