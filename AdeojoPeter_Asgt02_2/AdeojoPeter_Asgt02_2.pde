BMPImage img;
/**  * This creates ared gradulation(?)  *  
* @author Peter Adeojo  
* @version 1.1  */  
void setup() {

  size(400,400);
  //Width must be a multiple of 4.
  


  //<>//
}

void draw()
{
 // rectMode(CENTER);
  
  //fill(x);
  //noStroke();
// translate(100,100);
// set(155,0,0);

//THe loop for the color 
  for(int i = 0; i<height;i++)
{
  stroke(225,i,i);
  line(0,i,width,i);
  
}


 
}