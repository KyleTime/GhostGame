public class Animator{
  
  ArrayList<Animation> animations;
  
  float speed;
  
  public Animator(ArrayList<Animation> animations)
  {
    this.animations = animations;
  }
  
  public void addAnimation(Animation anim)
  {
    animations.add(anim);
  }
  
  public Animation playAnimation(String name)
  {
    Animation a = new Animation(new ArrayList<PImage>(), "", 1);
    
    for(Animation anim:animations)
    {
      if(anim.name == name)
      {
        a = anim;
        break;
      }
    }
    
    return a;
  }
}

public class Animation{
   ArrayList<PImage> frames;
   String name;
   float speed;
   
   public Animation(ArrayList<PImage> anim, String name, float speed)
   {
     frames = anim;
     this.name = name;
     this.speed = speed;
   }
}
