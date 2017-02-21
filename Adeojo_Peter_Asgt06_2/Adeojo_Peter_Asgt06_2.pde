/**
* Pixalates the picture
*
* @author Peter Adeojo
* @version 1.0 2/14/2017
*/




PImage img;

int pixSize = 10;
void setup()
{
  img = loadImage("FMAB.jpg");
  size(500,500);
  noStroke();
  background(0);
  smooth();
}
void draw()
{
  for (int x = 0; x < img.width; x+=pixSize)
  {
    for (int y = 0; y < img.height; y+=pixSize)
    {
      
         //float b = brightness(img.pixels[loc]);
     
     //print(loc);
     
     
     // float r = red(img.pixels[400]);
     // float g = green(img.pixels[400]);
     // f//loat b = blue(img.pixels[400]);
     
    // color myColor = img.get(x,y);
     //color newColor;
     // pixels[400] =  color(r,g,b);          


  

    // if(myColor >= 1 && myColor <255)
    // {
    //   newColor = 0;
    //   
    // }
     

    // float red =
      
      color myColor = img.get(x, y);
      float bright = brightness(myColor);
      println(bright);
      fill(myColor);
      noStroke();
      
      rect(x,y,pixSize,pixSize);
    }
  }
  noLoop();
  endRecord();
}