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

int numFloors = 0;

int x, y;

void setup(){
  
  size(800,800);
  
  background(100);
  
  imageMode(CENTER);
  textAlign(CENTER);
  
  rectMode(CENTER);
  stroke(230);
  fill(150);
  rect(width/2,height/2, 200, 50);
  
  for(Room[] r:map){
    for(Room r1:r){
      r1 = null;
    }
  }
  

  
  map = new Room[mapSize][mapSize];
  BoxAnim.clear();
  GunAnim.clear();
  GunSprites.clear();


  
  LoadTileImages();
  
  x = 0;
  y = 0;

    
  if(y < mapSize && x < mapSize)
  {
    Advance();
  }
  
  if(y < mapSize && x < mapSize)
  {
    Advance();
  }
  
  if(y < mapSize && x < mapSize)
  {
    Advance();
  }
  
  if(y < mapSize && x < mapSize)
  {
    Advance();
  }
  
  if(y < mapSize && x < mapSize)
  {
    Advance();
  }
  
  
  //GENERATE ROOMS
  
  player = new Character(width/2,height/2);
  SetGunAnim();

  gun = new Weapon(player,GunAnimation);
  player.gun = gun;
  
  bar = new Health(10,10, 20, 5);
  
  rectMode(CORNER);
    frameRate(120);
}

void Advance()
{
  LoadRoom(x,y);
  
  x++;
  LoadRoom(x,y);
  
  x++;
  LoadRoom(x,y);
  
  x++;
  LoadRoom(x,y);  
  x++;
  LoadRoom(x,y);
  
  x = 0;
  y++;
}


void LoadRoom(int x, int y)
{
    map[x][y] = new Room(x,y);
    
    println(x + " " + y);
    
    if(x == 4 && y == 4)
    {
      map[x][y].GenEnd();
    }
    else
    {
      map[x][y].Generate();
    }
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
  
  bar.Update();
  
  textUpdate();
}

void textUpdate()
{
  fill(54,125,125);
  stroke(0);
  rect(width - 170, height - 50, 150, 40);
  
  textSize(25);
  fill(3,50,0);
  stroke(0);
  text("FLOORS: " + numFloors,width - 100, height - 20);
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

public float Distance(float x1, float y1, float x2, float y2)
{
  return sqrt(pow(x1 - x2,2) + pow(y1 - y2,2));
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
