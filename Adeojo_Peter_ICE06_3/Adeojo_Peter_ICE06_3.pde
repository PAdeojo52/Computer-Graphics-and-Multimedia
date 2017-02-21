/**
* Inverses the image 180 degrees
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




     float r = red(myColor);
     
     
     
      float g = green(myColor);
      
      
      
      
      float b = blue(myColor);
      
      
      //image(img, 200,200);
      
     // int grey = (int)(red+green+blue)/3;
      //color c =color(r,g,b);
      set(width -x, height - y, myColor);
    }
  }
}