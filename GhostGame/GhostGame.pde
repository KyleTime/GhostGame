Character player;
Boolean moveUP = false,moveDOWN = false,moveRIGHT = false,moveLEFT = false;
int mapSize = 5;
Room[][] map = new Room[mapSize][mapSize];

ArrayList<Animation> BoxAnim = new ArrayList();
ArrayList<Animation> GunAnim = new ArrayList();

Animation GunAnimation;

ArrayList<PImage> GunSprites = new ArrayList();

Weapon gun;

void setup(){
  size(800,800);
  imageMode(CENTER);
  textAlign(CENTER);
  frameRate(120);
  
  for(int i=0;i<mapSize;i++){
    for(int j=0;j<mapSize;j++){
      map[i][j] = new Room(i+j);
    }
  }
  
  player = new Character(width/2,height/2);
  
  SetBoxAnim();
  SetGunAnim();
  
  gun = new Weapon(player,GunAnimation);
  player.gun = gun;
}

void draw(){
  background(0);
  
  //--------- player update
  player.update();
  player.show();
  //--------- weapon update
  player.gun.radian=atan2(mouseY-player.y,mouseX-player.x);
  player.gun.render();
  //--------- other stuff
  text(player.roomIndex,width-10,height-5);
}

void SetBoxAnim()
{
  
}

void SetGunAnim(){
  for(int i=0;i<11;i++){
    if(i<10){
      PImage image = loadImage("/sprites/gun/GUN_0"+i+".png");
      GunSprites.add(image);
    }else{
      PImage image = loadImage("/sprites/gun/GUN_"+i+".png");
      GunSprites.add(image);
    }
  }
  GunAnimation = new Animation(GunSprites, "GunAnimation", 1, true);
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
