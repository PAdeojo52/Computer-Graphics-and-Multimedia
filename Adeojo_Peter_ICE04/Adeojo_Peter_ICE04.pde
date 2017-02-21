/**
 * Draws a ball bouncing around the screen
 * with a given velocity and acceleration.
 * The ball bounces off the edges of a canvas
 * and a wall in the middle of the canvas.
 *
 * @author Joshua Cuneo
 * @version 1.0 1/30/2017
 */

/**
 * The ball instance that we're drawing to the screen.
 */
Ball myBall;

/**
 * The canvas's background color.
 */
color backgroundColor = color(200);

/**
 * The radius of our ball instance.
 */
int ballRadius = 20;

/**
 * The ball's color. 
 * Set to 0 for random or color(R,G,B) for one specific color i.e. color(255,0,0).
 */
color ballColor = 0; 

void setup(){
    size(400, 300);
    myBall = new Ball(ballRadius, ballColor);
}

void draw(){
  
    background(backgroundColor); 
    stroke(0);
    line(175, 150, 225, 150);
      
    //Move ball
    myBall.update();
    myBall.checkEdges();
    myBall.display();
}