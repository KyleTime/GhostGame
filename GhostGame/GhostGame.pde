Character player;
Boolean moveUP = false,moveDOWN = false,moveRIGHT = false,moveLEFT = false;
int mapSize = 5;
Room[][] map = new Room[mapSize + 1][mapSize + 1];

ArrayList<Animation> BoxAnim = new ArrayList();
ArrayList<Animation> GunAnim = new ArrayList();

Animation GunAnimation;

ArrayList<PImage> GunSprites = new ArrayList();

Weapon gun;

Health bar;

PImage vertTile;
PImage sideTile;
PImage groundTile;

int[] nextFocus;

void setup(){
  size(800,800);
  imageMode(CENTER);
  textAlign(CENTER);
  frameRate(120);
  
  LoadTileImages();
  
  for(int y = 0; y <= mapSize; y++)
  {
    for(int x = 0; x <= mapSize; x++)
    {
      map[x][y] = new Room(x,y);
      map[x][y].Generate();
    }
  }
  
  player = new Character(width/2,height/2);
  SetGunAnim();

  gun = new Weapon(player,GunAnimation);
  player.gun = gun;
  
  bar = new Health(10,10, 20, 5);
}

void draw(){
  
  background(0);
  
  //--------- player update
  player.Update();
  player.show();
  //--------- weapon update
  player.gun.radian=atan2(mouseY-player.y,mouseX-player.x);
  player.gun.render();
  //--------- other stuff
  text(player.roomIndex,width-10,height-5);
  
  bar.Update();
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

void LoadTileImages()
{
  vertTile = loadImage("/sprites/WallTile.png");
  sideTile = loadImage("/sprites/WallTileSide.png");
  groundTile = loadImage("/sprites/Ground Tile.png");
}

public int RoomX(int roomIndex)
{
  return roomIndex%mapSize;
}

public int RoomY(int roomIndex)
{
  return (roomIndex - (roomIndex%mapSize))/mapSize;
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
void mousePressed(){
  if(mouseButton==LEFT)player.gun.using = true;
}
void mouseReleased(){
  if(mouseButton==LEFT)player.gun.using = false;
}
