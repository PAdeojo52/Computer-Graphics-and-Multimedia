/**
  *Sets the walker for the programs
  *
  *
  *
 * @author Peter Adeojo
 * @version 1.0 2/13/2017
 */



class Walker {
  float x,y;
 
  //PVector mouse;
  //float easing = 0.005;
 // 
 //float distance =  dist(x,y,mouseX,mouseY);
//int x,y;
  PVector mouse;
  float xHolder;
  float yHolder;

 /**
   * Constructor. Defines the walker 
   * 
   *
   * 
   */
  Walker() {
    x = width/2;
    y = height/2;
    //mouse = new PVector(mouseX, mouseY);
     //mouseMover.x = 0;
     //mouseMover.y = 0;
    xHolder = mouseX;
    yHolder = mouseY;
     
     
  }
/**
    
   * 
   *
   * 
   *@returns Renders the walker point
   */
  void render() {
    stroke(0);
    point(x,y);
    
    
  }
/**
   *  
   * 
   *
   * @param xmouse - is the xvalue of the mouse pointer
   * @param ymouse - is the yvalue of the mouse pointer
   * @returns the postion of the walker per update
   */
  // Randomly move up, down, left, right, or stay in one place
  void step(float xmouse, float ymouse) {
    
    float distance;
    float distanceX;
    float distanceY;
    float index = 0;
 distance = dist(x,y,xmouse,ymouse);
 distanceX = dist(x,0,xmouse,0);
 distanceY = dist(0,y,0,ymouse);
 
    //rintln("distance  "  + distance);
    //println("distance x "  + distanceX);
    //println("distance y "  + distanceY);
    
    //println("distance x "  + distanceX);
    //println("distance y "  + distanceY);
    
   // println("mouse pointx: "+ mouseX);
   // println("mouse pointy: " + mouseY);
    
    //println("point x "  + x);
    //println("point y "  + y);
    
    //int choice = int(random(1));
    float choice = random(1);
    float perModifierX = 0;
    //float perModifierY = 0;
    //float disntanceSecond=;
  
  if( distance <=  70)
  {
    
    perModifierX = -.5;
    
  }
   else if( distance <=  60)
  {
    
    perModifierX = -.10;
    
  }
   else if( distance <=  50)
  {
    
    perModifierX = -.15;
    
  }
   else if( distance <=  40)
  {
    
    perModifierX = -.20;
    
  }
   else if( distance <=  30)
  {
    
    perModifierX = -.20;
    
  }
   
   
   if( distance >  50)
  {
    
    perModifierX = 0;
    
  }
   
    if (choice <  (0.20 +perModifierX) ) {
      x++;
    } 
    else if (choice < (0.40+perModifierX)) {
      x--;
    }
    else if (choice < (0.60+perModifierX)) {
      y++;
    } 
    else if (choice < (0.75+perModifierX)) {
       y--;
    } 
    else 
    {
     if(xmouse> x && ymouse> y)
     {
       x++;
       y++;
     }
     else if(xmouse< x && ymouse < y)
     {
       x--;
       y--;
     }
     else if(xmouse> x && ymouse < y)
     {
       x++;
       y--;
     }
     else if(xmouse< x && ymouse>  y)
     {
       x--;
       y++;
     }
      //x=+ xmouse;
      //y=+ ymouse;
    // println("30 percent");
    }
 
  
  
  
    

    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
/*
 if(distance <= 50)
  {
    int choice = int(random(2));
     
   println("distance1 "  + distance);
  }
  else
  {
  }
*/
}