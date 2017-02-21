/**
 * Holds and manages the data for a BMP image.
 *
 * @author Joshua Cuneo
 * @version 1.0 1/16/2017
 */

/*

Info- Sets the method and attributes of a BMPIMAGE file
*/
class BMPImage
{
  /*
  
  
  */
  int pWidth;                   //Image width
  int pHeight;                  //Image height
  int[] pxls;                   //Pixel data
  int pxlsBytes;                //Size of pixel data (in bytes)
  final int HEADER_SIZE = 54;   //Standard size (in bytes) of BMP header
  final int NUM_CHANNELS = 3;   //Number of color channels (either 3 or 4 depending on whether alpha is included)
  
  
   /*
   
    @param w -  This takes in the width of the image
    @param h - takes in the g=height of the image
    @param px[]- creates an array for pixels for the 
    Info - gets the width, height, and piexels for related BMP image 
  */
  BMPImage(int w, int h, int[] px)
  {
    this.pWidth = w;
    this.pHeight = h;
    this.pxls = px;
    this.pxlsBytes = this.pxls.length * NUM_CHANNELS;
  }
   /*
   
   
    @param value- gets the value of the bytes that split
    Info- Splits into bytes relating to ARGB
    
  */
  byte[] splitIntoBytes(int value)
  {
      byte[] bytes = new byte[4];
      
      bytes[0] = byte(value & 255); //<>//
      bytes[1] = byte((value >> 8) & 255);
      bytes[2] = byte((value >> 16) & 255);
      bytes[3] = byte((value >> 24) & 255);
      
      return bytes;
  }
   /*
   
  
    @param clr-  determines the value from 0-255 on bytes for the color
    Info - takes the colors and splits them off as bytes
  */
  byte[] splitColorsIntoBytes(int clr)
  {
      byte[] bytes = new byte[NUM_CHANNELS];
      
      for(int i = 0; i < bytes.length; i++)
      {      
        bytes[i] = byte((clr >> (8*i)) & 255);
      }
      
      return bytes;
  }
  
   /*
   
  Info - Creates header
  */
  byte[] createHeader()
  {     //<>//
      byte[] wBytes = this.splitIntoBytes(this.pWidth);
      byte[] hBytes = this.splitIntoBytes(this.pHeight);
      byte[] pxBytes = this.splitIntoBytes(this.pxlsBytes);
      byte[] fileBytes = this.splitIntoBytes(this.pxlsBytes + HEADER_SIZE);
      byte[] headerBytes = this.splitIntoBytes(HEADER_SIZE);
      byte[] bitDepthBytes = this.splitIntoBytes(NUM_CHANNELS * 8);

      //BMP header. For a bytewise breakdown, see
      //http://blog.paphus.com/blog/2012/08/14/write-your-own-bitmaps/      
      byte[] nums = {
        66, 77, 
        fileBytes[0], fileBytes[1], fileBytes[2], fileBytes[3],           //Size of entire image file
        0, 0, 0, 0, 
        headerBytes[0], headerBytes[1], headerBytes[2], headerBytes[3],   //Size of header
        40, 0, 0, 0, 
        wBytes[0], wBytes[1], wBytes[2], wBytes[3],                       //Image width
        hBytes[0], hBytes[1], hBytes[2], hBytes[3],                       //Image height
        1, 0, 
        bitDepthBytes[0], bitDepthBytes[1],                               //Image bit depth
        0, 0, 0, 0, 
        pxBytes[0], pxBytes[1], pxBytes[2], pxBytes[3],                   //Size of pixel data
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0};
        
    return nums;
  }
   /*
   
    
    @param filename - This sets the name of the file .
    Info- Sends BMP to  file

  */
  void writeBMPtoFile(String filename)
  {
      byte[] data = this.createHeader();
      data = expand(data, HEADER_SIZE + this.pxlsBytes);
    
      for (int i = 0; i < this.pxls.length; i++)
      {
          byte[] colors = this.splitColorsIntoBytes(pxls[i]);
          
          for(int j = 0; j < colors.length; j++)
          {
            data[i*colors.length + j + HEADER_SIZE] = colors[j];
          }
      }
      
      saveBytes(filename, data);
  }
  
}