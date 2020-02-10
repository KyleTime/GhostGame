class Weapon{
  Character owner;
  float x,y,xy,xv, radian;
  Animator anim;
  Animation frames;
  Boolean using;
  
  public Weapon(Character c, Animation a){
    owner = c;
    x=c.x;
    y=c.y;
    anim = new Animator();
    frames = a;
    using = false;
    anim.SetCurrent(frames);
    radian=0;
  }
  
  void render(){
    pushMatrix();
    if(mouseX-x>=0)
      translate(owner.x+3,owner.y+5);
    else{
      translate(owner.x-5,owner.y+5);
      scale(-1,1);
      radian = PI-radian;
    }
    rotate(radian);
    if(using){
      image(anim.AdvanceAnimation(),0,0);
    }
    else{
      anim.frame=0;
      anim.timer=0;
      image(anim.AdvanceAnimation(),0,0);
    }
    popMatrix();
  }
}
