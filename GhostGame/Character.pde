class Character{
  float x, y, xv, yv, moveSpeed;
  Boolean faceRight;
  PImage sprite;
  
  
  public Character(float x, float y, PImage sprite){
    this.x = x;
    this.y = y;
    this.sprite = sprite;
    faceRight=true;
    
    moveSpeed = 0.3;
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
      xv=x-width;
    }else if(x+xv<0){
      xv=x;
    }
    if(y+yv>height){
      yv=y-height;
    }else if(y+yv<0){
      yv=y;
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
