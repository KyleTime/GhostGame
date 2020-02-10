Character player;
Boolean moveUP = false,moveDOWN = false,moveRIGHT = false,moveLEFT = false;

public ArrayList<Animation> BoxAnim;

BoxEnt box;

void setup(){
  size(800,800);
  player = new Character(width/2,height/2);
  
  SetBoxAnim();
  
  box = new BoxEnt(width/2 + 60, height/2, false);
}

void draw(){
  background(0);
  
  //--------- player update
  player.update();
  player.show();
  
  box.Update();
}

void SetBoxAnim()
{
  
}


//------------- PLAYER MOVEMENT
void keyPressed(){
  if(key=='w')moveUP=true;
  if(key=='s')moveDOWN=true;
  if(key=='a')moveLEFT=true;
  if(key=='d')moveRIGHT=true;
}
void keyReleased(){
  if(key=='w')moveUP=false;
  if(key=='s')moveDOWN=false;
  if(key=='a')moveLEFT=false;
  if(key=='d')moveRIGHT=false;
}
