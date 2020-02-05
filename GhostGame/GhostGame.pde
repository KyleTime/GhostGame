Character player;
PImage ghostSprite;
Boolean moveUP = false,moveDOWN = false,moveRIGHT = false,moveLEFT = false;
int mapSize = 5;
Room[][] map = new Room[mapSize][mapSize];

void setup(){
  size(800,800);
  imageMode(CENTER);
  textAlign(CENTER);
  
  for(int i=0;i<mapSize;i++){
    for(int j=0;j<mapSize;j++){
      map[i][j] = new Room(i+j);
    }
  }
  
  ghostSprite = loadImage("/sprites/Ghost.png");
  player = new Character(width/2,height/2,ghostSprite,0);
}

void draw(){
  background(0);
  
  //--------- player update
  player.update();
  player.show();
  //--------- other stuff
  text(player.roomIndex,width-10,height-5);
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
