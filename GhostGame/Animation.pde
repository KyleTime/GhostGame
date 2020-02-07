public class Animator{
  
  ArrayList<Animation> animations;
  
  float timer;
  int frame;
  
  Animation current;
  
  public Animator()
  {
    this.animations = new ArrayList<Animation>();
  }
  
  public void AddAnimation(Animation anim)
  {
    animations.add(anim);
  }
  
  public Animation GrabAnimation(String name)
  {
    Animation a;
    
    for(Animation anim:animations)
    {
      if(anim.name == name)
      {
        a = anim;
        return a;
      }
    }
    
    return null;
  }
  
  public void SetCurrent(Animation anim)
  {
    timer = 0;
    frame = 0;
    current = anim;
    //println("set to " + anim.name);
  }
  
  public PImage AdvanceAnimation()
  {
    //println("TIME: " + timer + " FRAME: " + frame);
    
    if(timer >= current.speed)
    {
      timer = 0;
      frame++;
    }
    else
    {
      timer += second();
    }
    
    if(frame > current.frames.size() - 1 && current.loop)
    {
      frame = 0;
      //println("reset to zero");
    }
    else if(frame >= current.frames.size() - 1 && !current.loop)
    {
      frame = current.frames.size();
    }
    
    return current.frames.get(frame);
  }
  
  public PImage PlayAnimation(Animation anim)
  {
    if(current != anim)
    {
      SetCurrent(anim);
    }
    
    return AdvanceAnimation();
  }
}



public class Animation{
   ArrayList<PImage> frames;
   String name;
   float speed;
   boolean loop;
   
   public Animation(ArrayList<PImage> anim, String name, float speed, boolean loop)
   {
     frames = anim;
     this.name = name;
     this.speed = speed;
     this.loop = loop;
   }
}
