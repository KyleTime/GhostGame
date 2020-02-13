class Room{

  ArrayList<BoxEnt> boxes;
  ArrayList<Bootman> boots;
  ArrayList<Tile> tiles;
  
  float tileSize = 32;
  
  public Room(){
    boxes = new ArrayList<BoxEnt>();
    boots = new ArrayList<Bootman>();
    tiles = new ArrayList<Tile>();
  }
  
  void UpdateObjs()
  {
    for(BoxEnt be:boxes)
    {
      be.Update();
    }
    
    for(Bootman bm:boots)
    {
      bm.Update();
    }
    
    for(Tile t:tiles)
    {
      t.Update();
    }
  }
  
  void Generate()
  {
    for(int x = 0; x < width/tileSize; x++)
    {
      for(int y = 0; y < height/tileSize; y++)
      {
        if(y != 0 && y != height/tileSize - 1 && x != 0 && x != width/tileSize - 1)
        {
          tiles.add(new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,2, false, false));
        }
        else if(y != 0 && y != height/tileSize - 1)
        {
          if(x == 0)
          {
            tiles.add(new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,1, true, false));
          }
          else
          {
            tiles.add(new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,1, false, false));
          }
        }
        else
        {
          if(y == 0)
          {
            tiles.add(new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,0, false,false));
          }
          else
          {
            tiles.add(new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,0, false,true));
          }
        }
      }
    }
  }
}
