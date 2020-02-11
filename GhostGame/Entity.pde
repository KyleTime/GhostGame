public class BoxEnt{

  PImage Sprite;
  
  float x;
  float y;
  
  float speed = 1;
  
  Animator anim;
  float awakeTime = 10;
  float sleepTime = 60;
  float walkTime = 10;
  
  boolean awaken;
  boolean movin;
  
  float detection = 100;
  
  Hurt hurt;
  
  public BoxEnt(float x, float y, boolean awake)
  {
    this.x = x;
    this.y = y;
    
    SetUpAnim();
    
    awaken = awake;
    
    hurt = new Hurt(5,40);
  }
  
  void Update()
  {
    if(!awaken)
    {
      CheckPlayer(detection);
      PlaySleep();
    }
    else if(!movin)
    {
      AwakenMyMasters();
    }
    else  
    {
      ChasePlayer();
      PlayWalk();
    }
    
    hurt.Update(x,y);
  }
    
  //ACTIONS
  void CheckPlayer(float dis)
  {
    float distance = sqrt(pow(player.x - x,2) + pow(player.y - y, 2));
    
    if(distance < dis)
    {
      awaken = true;
    }
    
  }
  
  void AwakenMyMasters()
  {
     PlayAwake(); 
     if(anim.frame == anim.GrabAnimation("awake").frames.size() - 1)
     {
       movin = true;
     }
  }
  
  void ChasePlayer()
  {
    float theta = atan2(y-player.y,x-player.x);
    
    float addX = -cos(theta)*speed;
    float addY = -sin(theta)*speed;
    
    x += addX;
    y += addY;
    
    println(addX +" " + addY);
  }
  

  
  
  //ANIMATIONS
  void PlaySleep()
  {
    Animation sleeping = anim.GrabAnimation("sleep");
    
    if(anim.current != sleeping) anim.SetCurrent(sleeping);
    
    Sprite = anim.AdvanceAnimation();
    
    image(Sprite, x,y);
  }
  
  void PlayAwake()
  {
    Animation awake = anim.GrabAnimation("awake");
    
    if(anim.current != awake) anim.SetCurrent(awake);
    
    Sprite = anim.AdvanceAnimation();
    
    image(Sprite, x,y);
  }
  
  void PlayWalk()
  {
    Animation walk = anim.GrabAnimation("walk");
    
    if(anim.current != walk) anim.SetCurrent(walk);
    
    Sprite = anim.AdvanceAnimation();
    
    image(Sprite, x,y);
  }
  //ANIMATIONS
  
  
  
  //Setting up animation frames
  void SetUpAnim()
  {
    anim = new Animator();
    
    ArrayList<PImage> frames = new ArrayList<PImage>();
    
    for(int x = 0; x <= 7; x++)
    {
      frames.add(loadImage("/sprites/Block/Block_" + x + ".png"));
    }
    
    //AWAKEN ANIMATION
    ArrayList<PImage> awake = new ArrayList<PImage>();
    
    for(int x = 0; x < 7; x++)
    {
      awake.add(frames.get(x));
    }
    
    Animation awaken = new Animation(awake, "awake", awakeTime, false);
    
    anim.AddAnimation(awaken);
    //AWAKEN ANIMATION
    
    //SLEEPING ANIMATION
    ArrayList<PImage> sleeping = new ArrayList<PImage>();
    
    for(int x = 0; x <= 1; x++)
    {
      sleeping.add(frames.get(x));
    }
    
    Animation sleep = new Animation(sleeping, "sleep", sleepTime, true);
    
    anim.AddAnimation(sleep);
    //SLEEPING ANIMATION
    
    //WALK ANIMATION
    ArrayList<PImage> walkin = new ArrayList<PImage>();
    
    for(int x = 6; x <= 7; x++)
    {
      walkin.add(frames.get(x));
    }
    
    Animation walk = new Animation(walkin, "walk", walkTime, true);
    
    anim.AddAnimation(walk);
    //WALK ANIMATION
  }
  //set up animations
  

  
}
