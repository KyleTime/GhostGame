public class BoxEnt{

  float x;
  float y;
  
  float xv;
  float yv;
  
  Animator anim;
  
  //states include: chasing, wandering, sleep
  String state;
  
  boolean awaken;
  
  public BoxEnt(float x, float y, boolean awake)
  {
    this.x = x;
    this.y = y;
    
    awaken = awake;
  }
  
  void AwakenMyMasters()
  {
    awaken = true;
    
    
  }
  
}
