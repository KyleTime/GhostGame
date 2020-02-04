class Character{
  float x, y, xv, yv, moveSpeed;
  PImage sprite;
  
  
  public Character(float x, float y){
    this.x = x;
    this.y = y;
    this.sprite = sprite;
    
    moveSpeed = 0.3;
  }
  
  
  void update(){
    //---------------passive slowdown
    xv*=0.95;
    yv*=0.95;
    //--------------- movement update
    if(moveUP&&yv<5)yv-=moveSpeed;
    if(moveDOWN&&yv>-5)yv+=moveSpeed;
    if(moveLEFT)xv-=moveSpeed;
    if(moveRIGHT)xv+=moveSpeed;
    //--------------- wall bounds
    if(x+xv>width){
      xv=width-x;
    }else if(x+xv<0){
      xv=x;
    }
    if(y+yv>height){
      yv=height-y;
    }else if(y+yv<0){
      yv=y;
    }
    //-------------- position update
    x+=xv;
    y+=yv;
  }
  
  void show(){
    pushMatrix();
    fill(255);
    square(x,y,10);
    popMatrix();
  }
}
