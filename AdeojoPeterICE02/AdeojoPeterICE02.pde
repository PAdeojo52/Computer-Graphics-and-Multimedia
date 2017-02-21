void setup() {

  //Width and height must be multiples of 4.
  int w = 100;
  int h = 100;
    
  int[] cls = new int[w*h];
  
  for (int i = 0; i < cls.length; i++)
  {
      cls[i] = 0xFFFFFF;
  }
   
  BMPImage img = new BMPImage(400, 400,cls);
  
  img.splitIntoBytes(int(random(0,255)));
  img.splitColorsIntoBytes(int(random(0,255)));
  
  img.writeBMPtoFile("static.bmp"); //<>//

}

void draw() 
{
  
  
}