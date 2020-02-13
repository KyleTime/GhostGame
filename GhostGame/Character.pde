class Character{
  float x, y, xv, yv, moveSpeed;
  PImage sprite;
  int roomIndex;
  Boolean faceRight;
  Animation idle;
  Animation walk;
  Animator anim;
  Weapon gun;
  
  public Character(float x, float y){
    this.x = x;
    this.y = y;
    
    faceRight=true;
    moveSpeed = 0.2;
    roomIndex = 0;
    
    PImage g1 = loadImage("/sprites/Ghost/ghost_0.png");
    PImage g2 = loadImage("/sprites/Ghost/ghost_1.png");
    PImage g3 = loadImage("/sprites/Ghost/ghost_2.png");
    PImage g4 = loadImage("/sprites/Ghost/ghost_3.png");
    
    ArrayList<PImage> idleFrames = new ArrayList<PImage>();
    idleFrames.add(g1);
    idleFrames.add(g2);
    
    idle = new Animation(idleFrames, "idle", 10, true);
    
    ArrayList<PImage> moveFrames = new ArrayList<PImage>();
    moveFrames.add(g1);
    moveFrames.add(g2);
    moveFrames.add(g3);
    moveFrames.add(g4);
    
    walk = new Animation(moveFrames, "run", 5, true);
    
    anim = new Animator();
    anim.AddAnimation(idle);
  }
  
  
  void update(){
    //---------------passive slowdown
    xv*=0.95;
    yv*=0.95;
    //--------------- movement update
    if(moveUP&&yv<5)yv-=moveSpeed;
    if(moveDOWN&&yv>-5)yv+=moveSpeed;
    if(moveLEFT){xv-=moveSpeed;faceRight=false;}
    if(moveRIGHT){xv+=moveSpeed;faceRight=true;}
    //--------------- room bounds
    if(x+xv>width){
      if(roomIndex%mapSize<mapSize-1&&roomIndex%mapSize>=0){
        roomIndex+=1;
        x=0-xv;
      }else{
        xv=x-width;
      }
    }else if(x+xv<0){
      if(roomIndex%mapSize>0){
        roomIndex-=1;
        x=width-xv;
      }
      else{
        xv=x;
      }
    }
    if(y+yv>height){
      if(roomIndex<mapSize*mapSize-mapSize&&roomIndex%mapSize>=0){
        roomIndex+=mapSize;
        y=0-yv;
      }
      else{
        yv=y-height;
      }
    }else if(y+yv<0){
      if(roomIndex>=mapSize){
        roomIndex-=mapSize;
        y=height-yv;
      }
      else{
        yv=y;
      }
    }
    //-------------- position update
    x+=xv;
    y+=yv;
  }
  
  
  void RenderAnimation()
  {
    if(abs(xv) > 0.5 || abs(yv) > 0.5)
    {
      if(anim.current != walk)
      {
        anim.SetCurrent(walk);
      }
    }
    else if(abs(xv) <= 0.4 || abs(yv) <= 0.4)
    {
      if(anim.current != idle)
      {
        anim.SetCurrent(idle);
      }
    }
    
    sprite = anim.AdvanceAnimation();
    
    pushMatrix();
    translate(x,y);
    if(!faceRight)scale(-1,1);
    image(sprite, 0,0);
    popMatrix();
  }
  
  void show(){
    RenderAnimation();
  }
  
  Room getRoom(){
    return map[(roomIndex-(roomIndex%mapSize))/mapSize][roomIndex%mapSize];
  }
}
