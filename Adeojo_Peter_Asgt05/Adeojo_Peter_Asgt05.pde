/**
  *Sets the main program
  *
  *
  *
 * @author Peter Adeojo
 * @version 1.0 2/13/2017
 */


Walker w;


 /**
   * 
   * 
   *
   *@returns sets the stage for displaying 
   */
void setup() {
  size(640,360);
  // Create a walker object
  w = new Walker();
  background(255);
}

/**
   * 
   * 
   *
   *@returns draws the pictures on the canvas
   */
void draw() {
  // Run the walker object
  w.step(mouseX,mouseY);
  w.render();
  //println("mouse x " + mouseX);
}