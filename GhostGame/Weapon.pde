class Weapon{
  Character owner;
  
  float radian, cool;
  Animator anim;
  Animation frames;
  Boolean using;
  
  public Weapon(Character c, Animation a){
    owner = c;
    anim = new Animator();
    frames = a;
    using = false;
    anim.SetCurrent(frames);
    radian=0;
    cool=0;
  }
  
  void render(){
    pushMatrix();
    if(mouseX-owner.x>=0){
      translate(owner.x+3,owner.y+5);
      rotate(radian);
    }
    else{
      translate(owner.x-5,owner.y+5);
      scale(-1,1);
      rotate(PI-radian);
    }
    if(using){
      translate(random(-2,2),random(-2,2));
      image(anim.AdvanceAnimation(),0,0);
      if(cool<=0){
        player.getRoom().bList.add(new Bullet(owner.x+cos(radian),owner.y+sin(radian),radian+randomGaussian()*PI/40));
        cool=0.1;
      }
      else{
        cool-=0.008;
      }
    }
    else{
      anim.frame=0;
      anim.timer=0;
      image(anim.AdvanceAnimation(),0,0);
    }
    popMatrix();
  }
}
