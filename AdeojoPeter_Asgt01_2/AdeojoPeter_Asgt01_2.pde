void setup()
{
  
    size(500,500);
    background(255);

}


void draw()
{
  //Set Ups
  noStroke();
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(32);
  ellipseMode(CENTER);
  
  //Fills and shapes
  fill(100);
  rect(250,100,200,50);
  fill(0);
  text("Submit", 250, 100);
  
  
  fill(150);
  rect(250,200,200,50);
  fill(0);
  text("Submit", 250, 200);
  
  fill(200);
  rect(250,300,200,50);
  fill(0);
  text("Submit", 250, 300);

  fill(0, 255, 0, 100);
  ellipse(250,400,50,50);

 // fill(0, 102, 153);
 
  
  
  
 // fill(text("Submit",0,0));
  
  
  
}