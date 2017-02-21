/**
 * Represents a ball-shaped object that moves around the screen.
 *
 * @author Peter Adeojo
 * @version 1.0 2/5/2017
 */


class PaddleMaker
{
  
   /**
   * The Paddle's location, velocity, and acceleration.
   */  
  PVector location,velocity,accelration;
  
  /**
   * rectangle readius
   */  
  int rectRadius;
  
  /**
   *fills the color
   */  
  color fillColor;
  
  //Ball ballCall;
  
  /**
   * Constructor. Defines the paddle appearance and applies 
   * the paddles location.
   *
   * @param radius The radius of the paddle.
   * @param rectColor The color of the paddle. A value of 0 tells the class to choose a random color.
   */
  PaddleMaker(int radius, color rectColor)
  {
    
    location = new PVector(200, 275);
    rectRadius = radius;
    fillColor = rectColor;
    
    
    
    
    
  }
  
  /**
   * Draws the paddle to the screen.
   */
  void display()
  {
    //Sets up the display.
   
    //Sets up the 
    //stroke(0);
    //sets the color
    fill(rectColor);
    //strokeWeight(5);
    //sets initial rect
    rectMode(CENTER);
    rect(location.x,location.y,80,10,rectRadius);
    /*
    */

  }
  
   /**
   * Updates the paddles's position 
   */
  void update() 
  {
    //sets the x to move with mouse.
    //sets y to be static
    
    location.set(mouseX , location.y);
  }
  
   /**
   * Checks for collisions from the ball
   * velocity and acceleration.
   @param b is a ball object used to represent the ball object.
   */
  void collisionDetection(Ball b)
  {
    
   
    if((b.location.y > location.y - rectRadius/2) &&
    b.location.y < location.y + rectRadius/2)
    {
     
     if(b.location.x < mouseX +b.ballRadius/2  && b.location.x > mouseX - b.ballRadius/2|| 
     b.location.x < (mouseX +b.ballRadius/2) + 40  && (b.location.x > mouseX - b.ballRadius/2)
     || (b.location.x < (mouseX +b.ballRadius/2) ) && (b.location.x +40 >( mouseX - b.ballRadius/2) )
     )
     {
       
       b.velocity.y = b.velocity.y * -1;
       //b.acceleration.y = b.acceleration. y-0.0002;
       //b.acceleration.x = b.acceleration.x +0.0005;
      
     }
   
      
    }
  }


}