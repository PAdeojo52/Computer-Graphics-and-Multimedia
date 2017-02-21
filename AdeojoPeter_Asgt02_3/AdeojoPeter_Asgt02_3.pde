BMPImage img;


/**  * This program creates a german flag  *  
* @author Peter Adeojo  
* @version 1.2  */  


void setup() {

  size(600,360);
  
  
   //<>//
}

void draw()
{

  //Code for the top
  //Black
  for(int i = 0; i<height/3;i++)
{
  stroke(0,0,0);
  line(0,i,width,i);
  
}
//Code for the center
//Red
for(int i = 120; i<(height*3)/3;i++)
{
  stroke(255,0,0);
  line(0,i,width,i);
  
}
 
//Code for Bottom 
//Yellow
  for(int i = 255; i<(height*3)/3;i++)
{
  stroke(255,255,0);
  line(0,i,width,i);
  
}
}