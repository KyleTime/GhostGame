public class Tile{
  
  float x, y;
  PImage spr;
  int type;
  boolean flipX;
  boolean flipY;
  
  public Tile(float x, float y, int type, boolean flipX, boolean flipY)
  {
    this.x = x;
    this.y = y;
    this.type = type;
    this.flipX = flipX;
    this.flipY = flipY;
  }
  
  void Update()
  {
    CheckCol();
    Render();
  }
  
  void CheckCol()
  {
    if(abs(player.x - x) < 32 && abs(player.y - y) < 32)
    {
      
    }
  }
  
  void Render()
  {
    pushMatrix();
    translate(x,y);
    
    if(flipX)
    {
      scale(-1,1);
    }
    
    if(flipY)
    {
      scale(1,-1);
    }
    
    if(type == 0)
      image(vertTile, 0, 0);
    if(type == 1)
      image(sideTile, 0, 0);
    if(type == 2)
      image(groundTile, 0, 0);
    
    popMatrix();
  }
}
