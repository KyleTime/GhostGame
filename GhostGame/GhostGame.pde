Character player;
Boolean moveUP = false,moveDOWN = false,moveRIGHT = false,moveLEFT = false;
int mapSize = 5;
Room[][] map = new Room[mapSize][mapSize];

ArrayList<Animation> BoxAnim;
ArrayList<Animation> GunAnim;

ArrayList<PImage> GunSprites;

void setup(){
  size(800,800);
  imageMode(CENTER);
  textAlign(CENTER);
  
  for(int i=0;i<mapSize;i++){
    for(int j=0;j<mapSize;j++){
      map[i][j] = new Room(i+j);
    }
  }
  
  player = new Character(width/2,height/2);
  
  SetBoxAnim();
  SetGunAnim();
}

void draw(){
  background(0);
  
  //--------- player update
  player.update();
  player.show();
  //--------- other stuff
  text(player.roomIndex,width-10,height-5);
}

void SetBoxAnim()
{
  
}

void SetGunAnim(){
  for(int i=0;i<11;i++){
    if(i<10){
      PImage image = loadImage("/sprites/Gun/GUN_0"+i);
      GunSprites.add(image);
    }else{
      PImage image = loadImage("/sprites/Gun/GUN_"+i);
      GunSprites.add(image);
    }
  }
  GunAmin = new Animation(
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
