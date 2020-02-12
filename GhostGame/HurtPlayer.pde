public class Hurt
{
  float dmg;
  float rad;
  
  float x;
  float y;
  
  
  public Hurt(float damage, float radius)
  {
    dmg = damage;
    rad = radius;
  }
  
  void Update(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    checkHurt();
  }
  
  void checkHurt()
  {
    float dis = sqrt(pow(player.x - x,2) + pow(player.y - y,2));
    
    if(dis < rad)
    {
      bar.subHP(dmg);
    }
  }
  
  void drawCol()
  {
    circle(x,y,rad);
  }
}
