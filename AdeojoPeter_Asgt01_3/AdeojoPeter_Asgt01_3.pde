void setup()
{
  size(500,500);
  background(0,255,033);
  
}

void draw()
{
  //Sets up the center rectangle
  rectMode(CENTER);
  fill(255);
  rect(250,250,100,50);
}

void mousePressed()
{
  //floats to be converted
  float xOne = 200;
  float xTwo = 300;
  float yOne = 224;
  float yTwo = 275;
  
  //Ints from floats
  
  int intXOne = int(xOne);
  int intXTwo = int(xTwo);
  int intYOne = int(yOne);
  int intYTwo = int(yTwo);
  //sets x and y values
 if(mouseX>=intXOne && mouseX<=intXTwo ) 
 {
   if(mouseY>=intYOne && mouseY <=intYTwo)
   {
     
 background(random(0,255),random(0,255),random(0,255));
   }
  
  
  }

}