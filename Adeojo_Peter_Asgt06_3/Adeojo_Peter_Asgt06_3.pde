/**
* Applies a threshold of black and white to image
*
* @author Peter Adeojo
* @version 1.0 2/14/2017
*/




PImage img;
PImage destination;



void setup()
{
  img = loadImage("FMAB.jpg");
  size(500, 500);
   destination = createImage(img.width, img.height, RGB); 
}

void draw()
{
   float threshold = 162;

  //loadPixels();
  img.loadPixels();
  destination.loadPixels();
  for(int x = 0; x <img.width; x++)
  {
    for(int y = 0; y <img.height; y++)
    {
     
     int loc = x+y*img.width;
     
     
     if(brightness(img.pixels[loc] ) > threshold )
     {
        destination.pixels[loc]  = color(255);
     }
     else
     {
      
       destination.pixels[loc]  = color(0);
     }
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
     

    // float red = red(myColor);
     
     
     
   //   float green = green(myColor);
      
    //  float blue = blue(myColor);
      
      
      
      
    // float blue = blue(myColor);
      
      
      
      
      //int grey = (int)(red+green+blue)/3;
      //
     // float outputRed = (red * .393) + (green * .769) + (blue * .189);
    //  float outputGreen = (red * .349) + (green * .686) + (blue * .168);
     // float outputBlue = (red * .272) + (green * .534) + (blue * .131);
      
      //color c =color(red,green ,blue);
     // set(x, y, c);
    }
  }
  destination.updatePixels();
  image(destination,0,0);
}