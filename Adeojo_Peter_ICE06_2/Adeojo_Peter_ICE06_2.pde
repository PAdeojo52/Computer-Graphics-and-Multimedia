/**
* Reverses the color on the picture
*
* @author Peter Adeojo
* @version 1.0 2/14/2017
*/




PImage img;




void setup()
{
  size(768, 480);
  img = loadImage("bird.jpg");  
}

void draw()
{
  for(int x = 0; x < img.width; x++)
  {
    for(int y = 0; y < img.height; y++)
    {
     color myColor = img.get(x,y);




     float r = red(255-myColor);
     
     
     
      float g = green(255-myColor)-1;
      
      
      
      
      float b = blue(255-myColor)-1;
      
      
      
      
     // int grey = (int)(red+green+blue)/3;
      color c =color(r,g,b);
      set(x, y, c);
    }
  }
}