/*
*
*@name Peter Adeojo

*@date 2/7/17
* @version 2.0
*/

// An array to keep track of how often random numbers are picked
float[] randomCounts;

color[] colorArray;

int[] redArray = {200,201,202,203,204,205,206,207,208,209,
                     210,211,212,213,214,215,216,217,218,219,
                   220,221,222,223,224,225,226,227,228,229,
                 230,231,232,233,234,235,236,237,238,239,
               240,241,242,243,244,245,246,247,248,249,
             250,251,252,253,254,255};
  
  
  int[] blueArray= {200,201,202,203,204,205,206,207,208,209,
                     210,211,212,213,214,215,216,217,218,219,
                   220,221,222,223,224,225,226,227,228,229,
                 230,231,232,233,234,235,236,237,238,239,
               240,241,242,243,244,245,246,247,248,249,
             250,251,252,253,254,255};
             
  int[] greenArray= {200,201,202,203,204,205,206,207,208,209,
                     210,211,212,213,214,215,216,217,218,219,
                   220,221,222,223,224,225,226,227,228,229,
                 230,231,232,233,234,235,236,237,238,239,
               240,241,242,243,244,245,246,247,248,249,
             250,251,252,253,254,255};

void setup() {
  size(640,360);
  randomCounts = new float[20];
  background(255);
  colorArray = new color[20];
  fill(redGen(redArray),greenGen(greenArray),blueGen(blueArray));
  
  for(int x = 0; x < colorArray.length; x++)
  {
    
    colorArray[x]= color(random(200,255), random(200,255),random(200,255));
    
  }
  
  
  
}

void draw() {
  
   background(255);
   
   float xloc = randomGaussian();
   int sd = 3;
   int mean = width/60;
   print(sd/20);
   


  // Pick a random number and increase the count
  //random(randomCounts.length)
  xloc = (xloc * sd)+ mean;
  int index = int(xloc);
  println(index);
  if(index>0 && index<20)
  {
  randomCounts[index]++;
  }
  // Draw a rectangle to graph results
  stroke(0);
  strokeWeight(2);

  //fill(redGen(redArray),greenGen(greenArray),blueGen(blueArray));
  int w = width/randomCounts.length;
  
   
  for (int x = 0; x < randomCounts.length; x++)
    {
    rect(x*w,height-randomCounts[x],w-1,randomCounts[x]);
    fill(colorArray[x]);
    //fill(redGen(redArray),greenGen(greenArray),blueGen(blueArray));
    int colorCounter = 0;
    println(colorCounter);
    
    
    } 
    
  
  
  } 
  
  
  
  




  int redGen(int[] red)
  {
    
    int index = int(random(red.length));
    
    
    return red[index];
    
    
  }
  int greenGen(int[] green)
  {
     int index = int(random(green.length));
    
    
    return green[index];
    
    
  }
  int blueGen(int[] blue)
  {
    int index = int(random(blue.length));
    
    
    return blue[index];
    
    
  }
  