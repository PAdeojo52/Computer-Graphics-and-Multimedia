/**
* places a sephia toner on my picture
*
* @author Peter Adeojo
* @version 1.0 2/14/2017
*/




PImage img;




void setup()
{
  size(500, 500);
  img = loadImage("FMAB.jpg");  
}

void draw()
{
  for(int x = 0; x < img.width; x++)
  {
    for(int y = 0; y < img.height; y++)
    {
     color myColor = img.get(x,y);




     float red = red(myColor);
     
     
     
      float green = green(myColor);
      
      
      
      
      float blue = blue(myColor);
      
      
      
      
      int grey = (int)(red+green+blue)/3;
      color c =color(grey,grey,grey);
      set(x, y, c);
    }
  }
}