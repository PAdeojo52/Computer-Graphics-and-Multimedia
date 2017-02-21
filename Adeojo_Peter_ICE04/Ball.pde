/**
 * Represents a ball-shaped object that moves around the screen.
 *
 * @author Joshua Cuneo
 * @version 1.0 1/30/2017
 */
 
class Ball {
  
  /**
   * The ball's location, velocity, and acceleration.
   */  
  PVector location, velocity, acceleration;
  
  /**
   * The ball's radius.
   */
  int ballRadius;
  
  /**
   * The ball's color.
   */
  color fillColor;

  /**
   * Constructor. Defines the ball's appearance and applies 
   * the ball's velocity and acceleration.
   *
   * @param radius The radius of the ball.
   * @param ballColor The color of the ball. A value of 0 tells the class to choose a random color.
   */
  Ball(int radius, color ballColor) {
    location = new PVector(width/2, height/4);
    velocity = new PVector(1, 4);
    acceleration = new PVector(0, 0);
    ballRadius = radius;

    if (ballColor != 0 )
      fillColor = ballColor;
    else
      fillColor = color(random(255), random(255), random(255));
  }

  /**
   * Draws the ball to the screen.
   */
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(fillColor);
    ellipse(location.x, location.y, ballRadius, ballRadius);
  }

  /**
   * Updates the ball's position based on its
   * velocity and acceleration.
   */
  void update() {
    //FIX ME
    
    velocity.set(velocity.x + acceleration.x, velocity.y + acceleration.y);
  location.set(location.x + velocity.x, location.y + velocity.y);
  }

  /**
   * Checks to see if the ball has collided with an edge
   * and then adjusts its direction of motion accordingly.
   */
   
   ///LEft & Right
  void checkEdges() {
    //FIX ME
    
      if(location.x> width - ballRadius/2)
    {
      velocity.x = velocity.x * -1;
      location.x = width - ballRadius/2;

    }
    else if (location.x < ballRadius/2)
    {
      velocity.x = velocity.x * -1;
      
      location.x = ballRadius/2;
      
      
    
    }
    
    
    
    
    //UP and DOWn
    if (location.y > height - ballRadius/2 )
    {
      velocity.y = velocity.y * -1;
      location.y = height - ballRadius/2;
    
      
    }
    else if(location.y < ballRadius/2)
    {
       velocity.y = velocity.y * -1;
      location.y = ballRadius/2;
      
      
    } 
     
    
    
    
    
   // if (location.y > height - ballRadius/2 ) 
     // location.y = 100;
      
    if ((location.y > 150 - ballRadius/2) && location.y < 150 + ballRadius/2)
    {
      //velocity.y = velocity.y * -1;
      
    if ((location.x > 175 - ballRadius/2) && location.x < 225 + ballRadius/2)
    {
      velocity.y = velocity.y * -1;
    }
    
    }
    
   
    

    if (location.y > height - ballRadius/2 ) 
      location.y = 100;
  }
}