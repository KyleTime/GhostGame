class Weapon{
  Character owner;
  
  float radian, cool;
  Animator anim;
  Animation frames;
  Boolean using;
  ArrayList<Bullet> bList = new ArrayList();
  
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
    if(cool>0){
      cool-=0.008;
    }
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
      image(anim.AdvanceAnimation(),0,0);
      if(cool<=0){
        bList.add(new Bullet(owner.x+cos(radian),owner.y+sin(radian),radian));
        cool=0.1;
      }
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
    for(int i=0;i<bList.size();i++){
      Bullet b = bList.get(i);
      b.update();
      if(b.x>width||b.x<0||b.y>height||b.y<0){
        bList.remove(b);
      }
      b.show();
    }
  }
}
