public class Bootman{
  
  boolean enabled;
  
  float x,y,sizeB;
  
  PImage man, boot;
  
  float offsetX = 1, offsetY = 1;
  
  EnemyHP health;
  float rad = 20;
  float hp = 5;
  
  public Bootman(float x, float y, float sizeB)
  {
    this.x = x;
    this.y = y;
    this.sizeB = sizeB;
    
    man = loadImage("sprites/Bootmen/man.png");
    boot = loadImage("sprites/Bootmen/Boot.png");
    
    health = new EnemyHP(hp,rad);
  }
  
  void Update()
  {
    if(health.hp > 0)
    {
      Render();
      
      health.x = x;
      health.y = y;
      health.Update();
    }
  }
  
  void Render()
  {
    float manSize = sizeB*32;
    float bootSize = sizeB*25;
    
    image(man,x,y,manSize*offsetX,manSize*offsetY);
    image(boot,x - 3*sizeB,y+12*sizeB, bootSize*offsetX, bootSize*offsetY);
  }
  
  void Split()
  {
    
  }
}
