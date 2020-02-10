class Character{
  float x, y, xv, yv, moveSpeed;
  PImage sprite;
  
  //Kyle Animation Code
  Animation idle;
  Animation walk;
  Animator anim;
  //End of Kyle Animation Code
  
  public Character(float x, float y){
    this.x = x;
    this.y = y;
    
    moveSpeed = 0.3;
    
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
    
    RenderAnimation();
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

    image(sprite, x,y);
  }
  
  void show(){
    pushMatrix();
    fill(255);
    square(x,y,10);
    popMatrix();
  }
}
