public class Health{
  
  float x;
  float y;
  
  float hp;
  float max;
  
  float vert = 4;
  
  float small = 2;
  
  float size;
  
  float timer;
  float InvulnTimer = 120;
  
  public Health(float x,float y, float max, float size)
  {
    this.x = x;
    this.y = y;
    
    this.max = max;
    
    hp = max;
    
    this.size = size;
  }
  
  void Update()
  {
    handleInvuln();
    render();
  }
  
  void render()
  { 
    
    float xSize = max*size;
    float ySize = vert*size;
    
    stroke(255);
    fill(0);
    rect(x,y,xSize,ySize);
    
    stroke(255,0,0);
    fill(255,0,0);
    
    if(hp > 1)
      rect(x+small,y+small, xSize*(hp/max) - small*2,ySize - small*2);
  }
  
  void subHP(float hp)
  {
    if(timer >= InvulnTimer)
    {
      this.hp -= hp;
      timer = 0;
    }
  }
  
  void handleInvuln()
  {
    if(timer < InvulnTimer)
    {
      timer++;
    }
  }
  
}
