class Room{

  int xI;
  int yI;
  ArrayList<BoxEnt> boxes;
  ArrayList<Bootman> boots;
  Tile[][] tiles;
  
  boolean up = false;
  boolean down = false;
  boolean right = false;
  boolean left = false;
  
  float tileSize = 32;
  
  float timer;
  
  int xSize = (int)(width/tileSize);
  int ySize = (int)(height/tileSize);
  
  public Room(int x, int y){
    
    this.xI = x;
    this.yI = y;
    
    boxes = new ArrayList<BoxEnt>();
    boots = new ArrayList<Bootman>();
    tiles = new Tile[(int)(width/tileSize)][(int)(height/tileSize)];
  }
  
  void UpdateObjs()
  {
    for(int x = 0; x < width/tileSize; x++)
      for(int y = 0; y < height/tileSize; y++)
      {
        if(tiles[x][y] != null)
          tiles[x][y].Update();
      }
    
    for(BoxEnt be:boxes)
    {
      be.Update();
    }
    
    for(Bootman bm:boots)
    {
      bm.Update();
    }
    
    if(xI == mapSize - 1 && yI == mapSize - 1)
    {
      timer++;
      
      if(timer > 120)
      {
        numFloors++;
        setup();
      }
    }
  }
  
  void Generate()
  {
    for(int x = 0; x < width/tileSize; x++)
    {
      for(int y = 0; y < height/tileSize; y++)
      {
        //FLOOR TILES
        if(y != 0 && y != height/tileSize - 1 && x != 0 && x != width/tileSize - 1)
        {
          tiles[x][y] = new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,2, false, false);
          
          if(xI != 0 || yI != 0)
          {
            if(x > 2 && y > 2 && x < width/tileSize - 2 && y < height/tileSize - 2)
            {
              float spawnChance = random(1);
              
              if(spawnChance < 0.05)
              {
                boxes.add(new BoxEnt(x*tileSize + tileSize/2,y*tileSize + tileSize/2, false));
              }
            }
          }
        }
        //WALL TILES
        else if(y != 0 && y != height/tileSize - 1)
        {
          if(x == 0)
          {
            tiles[x][y] = (new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,1, true, false));
          }
          else
          {
            tiles[x][y] = (new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,1, false, false));
          }
        }
        else
        {
          if(y == 0)
          {
            tiles[x][y] = (new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,0, false,false));
          }
          else
          {
            tiles[x][y] = (new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,0, false,true));
          }
        }
      }
    }
  }
  
  void GenEnd()
  {
    for(int x = 0; x < width/tileSize; x++)
    {
      for(int y = 0; y < height/tileSize; y++)
      {
        if(y != 0 && y != height/tileSize - 1 && x != 0 && x != width/tileSize - 1)
        {
          tiles[x][y] = new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,3, false, false);
        }
        else if(y != 0 && y != height/tileSize - 1)
        {
          if(x == 0)
          {
            tiles[x][y] = (new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,1, true, false));
          }
          else
          {
            tiles[x][y] = (new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,1, false, false));
          }
        }
        else
        {
          if(y == 0)
          {
            tiles[x][y] = (new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,0, false,false));
          }
          else
          {
            tiles[x][y] = (new Tile(x*tileSize + tileSize/2,y*tileSize + tileSize/2,0, false,true));
          }
        }
      }
    }
  }
  
  void BreakUp()
  {
    tiles[13][0].type = 2;
    tiles[12][0].type = 2;
    tiles[11][0].type = 2;
    
    up = true;
  }
  
  void BreakDown()
  {
    tiles[13][24].type = 2;
    tiles[12][24].type = 2;
    tiles[11][24].type = 2;
    
    down = true;
  }
  
  void BreakRight()
  {
    tiles[24][13].type = 2;
    tiles[24][12].type = 2;
    tiles[24][11].type = 2;
    
    right = true;
  }
  
  void BreakLeft()
  {
    tiles[0][13].type = 2;
    tiles[0][12].type = 2;
    tiles[0][11].type = 2;
    
    left = true;
  }
}
