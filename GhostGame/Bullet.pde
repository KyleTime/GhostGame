class Bullet{
  float x,y,dir,bSpeed;
  public Bullet(float x, float y, float dir){
    this.x=x;
    this.y=y;
    this.dir=dir;
    bSpeed=10;
  }
  
  void update(){
    x+=cos(dir)*bSpeed;
    y+=sin(dir)*bSpeed;
  }
  
  void show(){
    stroke(255, 225, 65);
    line(x,y,x-cos(dir)*bSpeed,y-sin(dir)*bSpeed);
  }
}
