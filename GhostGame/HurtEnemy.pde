public class EnemyHP{
  
  float hp, rad,x,y;
  
  public EnemyHP(float hp, float rad)
  {
    this.hp = hp;
    this.rad = rad;
  }
  
  void Update()
  {
    CheckBullets();
  }
  
  void CheckBullets()
  {
    IntList remove = new IntList();
    
    for(int i = 0; i < gun.bList.size(); i++)
    {
      Bullet b = gun.bList.get(i);
      
      float dis = Distance(x,y,b.x,b.y);
      
      if(dis < rad)
      {
        hp -= 1;
        remove.append(i);
      }
    }
    
    for(int i:remove)
    {
      gun.bList.remove(i);
    }
  }
  
}
