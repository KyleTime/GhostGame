class Character{
  float x, y, xv, yv, moveSpeed;
  Boolean faceRight;
  PImage sprite;
  int roomIndex;
  
  public Character(float x, float y, PImage sprite, int i){
    this.x = x;
    this.y = y;
    this.sprite = sprite;
    faceRight=true;
    
    moveSpeed = 0.3;
    roomIndex = i;
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
    //--------------- wall bounds
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
    else if(y+yv>height){
      if(roomIndex<pow(mapSize,2)-1&&roomIndex%mapSize>=0){
        roomIndex+=mapSize;
        y=0-yv;
      }
      else{
        yv=y-height;
      }
    }else if(y+yv<0){
      if(roomIndex%mapSize>0){
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
  
  void show(){
    pushMatrix();
    translate(x,y);
    if(!faceRight){
      scale(-1,1);
    }
    fill(255);
    image(sprite,0,0);
    popMatrix();
  }
}
