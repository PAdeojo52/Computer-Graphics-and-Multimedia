/**
* Short summary of what the program does
*
* @author Your name, first and last (preferred names are okay)
* @version Assign a version number (usually 1.0) and the date
*/


void setup()
{
  size(500,500);
  
}

void draw()
{
  
translate(100,50);

beginShape();
vertex(300, 20);
vertex(30, 20);
//vertex(150,150);
vertex(30, 300);
vertex(300, 300);
vertex(150,150);
//endHape initiated render
endShape(CLOSE);
fill(0, 255, 0, 255);
//scale(300);



  
}