/**
 * Holds and manages the data for a BMP image.
 *
 * @author Joshua Cuneo
 * @version 2.0 1/18/2017
 */

class BMPImage
{
  int pWidth;                   //Image width
  int pHeight;                  //Image height
  int[] pxls;                   //Pixel data
  int pxlsBytes;                //Size of pixel data (in bytes)
  int HEADER_SIZE = 54;         //Standard size (in bytes) of BMP header
  int NUM_CHANNELS = 3;         //Number of color channels (either 3 or 4 depending on whether alpha is included)
  boolean ALPHAMODE = false;    //Are we including an alpha channel?
  
  BMPImage(int w, int h, int[] px)
  {
    this(w, h, px, false);
  }
  
  BMPImage(int w, int h, int[] px, boolean includeAlpha)
  {
    this.pWidth = w;
    this.pHeight = h;
    this.pxls = px;
    
    if(includeAlpha)
    {
      ALPHAMODE = true;
      NUM_CHANNELS = 4;    //Number of color channels with alpha value
      HEADER_SIZE = 138;   //Size of header when we include an alpha channel
    }

    this.pxlsBytes = this.pxls.length * NUM_CHANNELS;
    
    //Resize the drawing canvas. This is necessary if we later want
    //to call displayBMP().
    surface.setSize(this.pWidth, this.pHeight);        
  }
  
  byte[] splitIntoBytes(int value)
  {
      byte[] bytes = new byte[4];
      
      bytes[0] = byte(value & 255); //<>// //<>//
      bytes[1] = byte((value >> 8) & 255);
      bytes[2] = byte((value >> 16) & 255);
      bytes[3] = byte((value >> 24) & 255);
      
      return bytes;
  }
  
  byte[] splitColorsIntoBytes(int clr)
  {
      byte[] bytes = new byte[NUM_CHANNELS];
      
      //This will give us or colors backward (with blue in bytes[0]), 
      //but that's okay since the colors must be put into the BMP
      //file backwards.
      for(int i = 0; i < bytes.length; i++)
      {      
        bytes[i] = byte((clr >> (8*i)) & 255);
      }
      
      return bytes;
  }
  
  
  byte[] createHeader()
  {    //<>// //<>//
      //RGB uses compression type 0, and RGBA uses type 3
      byte comp = 0;
      if(ALPHAMODE) comp = 3;
    
      byte[] wBytes = this.splitIntoBytes(this.pWidth);
      byte[] hBytes = this.splitIntoBytes(this.pHeight);
      byte[] pxBytes = this.splitIntoBytes(this.pxlsBytes);
      byte[] fileBytes = this.splitIntoBytes(this.pxlsBytes + HEADER_SIZE);
      byte[] headerBytes = this.splitIntoBytes(HEADER_SIZE);
      byte[] bmpInfoBytes = this.splitIntoBytes(HEADER_SIZE - 14);
      byte[] bitDepthBytes = this.splitIntoBytes(NUM_CHANNELS * 8);

      //BMP header. For a bytewise breakdown, see
      //http://blog.paphus.com/blog/2012/08/14/write-your-own-bitmaps/
      byte[] rgbHeader = {
        66, 77, 
        fileBytes[0], fileBytes[1], fileBytes[2], fileBytes[3],               //Size of entire image file
        0, 0, 0, 0, 
        headerBytes[0], headerBytes[1], headerBytes[2], headerBytes[3],       //Size of header
        bmpInfoBytes[0], bmpInfoBytes[1], bmpInfoBytes[2], bmpInfoBytes[3],   //Size of the bitmap info part of the header
        wBytes[0], wBytes[1], wBytes[2], wBytes[3],                           //Image width
        hBytes[0], hBytes[1], hBytes[2], hBytes[3],                           //Image height
        1, 0, 
        bitDepthBytes[0], bitDepthBytes[1],                                   //Image bit depth
        comp, 0, 0, 0,                                                        //Compression type
        pxBytes[0], pxBytes[1], pxBytes[2], pxBytes[3],                       //Size of pixel data
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0
      };
      
      //Additional header information if we have an alpha channel. For a breakdown, see
      //ttps://msdn.microsoft.com/en-us/library/windows/desktop/dd183381(v=vs.85).aspx
      byte[] rgbaHeader = {
        0, 0, 0, -1,                                                          //Red mask
        0, 0, -1, 0,                                                          //Green mask
        0, -1, 0, 0,                                                          //Blue mask   
        -1, 0, 0, 0,                                                          //Alpha mask
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0,
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0,
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0,
        0, 0, 0, 0,
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0, 
        0, 0, 0, 0
    };
        
    if(ALPHAMODE)
    {
      return concat(rgbHeader, rgbaHeader);
    }
    else
    {
      return rgbHeader;
    }
  }
  
  void displayBMP()
  {    
    outerLoop:
    for(int x = 0; x < this.pWidth; x++)
    {
      for(int y = 0; y < this.pHeight; y++)
      {
        try
        {
          if(ALPHAMODE)
          {
            set(x, y, this.pxls[y*this.pWidth + x]);
          }
          else
          {
            //set() expects four-channel color, so we assume
            //an alpha channel set at 100%.
              set(x, y, (255 << 24) | this.pxls[y*this.pWidth + x]);
          }
        }
        catch(Exception e)
        {
          println("Display Error!");
          break outerLoop;
        }
      }
    }

  }
  
  void writeBMPtoFile(String filename)
  {
      byte[] data = this.createHeader();
      data = expand(data, HEADER_SIZE + this.pxlsBytes);
    
      for (int i = 0; i < this.pxls.length; i++)
      {
          byte[] colors = this.splitColorsIntoBytes(pxls[i]);
          
          for(int j = 0; j < colors.length; j++)
          {
            //For BMP, our pixels must be put into the file backward.
            data[HEADER_SIZE + (this.pxls.length - i - 1)*NUM_CHANNELS + j] = colors[j];
          }
      }
      
      saveBytes(filename, data);
      println(filename + " created!");
  }
  
}