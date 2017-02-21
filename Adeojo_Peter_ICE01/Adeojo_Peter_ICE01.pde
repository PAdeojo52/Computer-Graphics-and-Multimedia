
void setup() 
{
  size(480, 120);
}

void draw() {
  //Seyts mouse press
  if (mousePressed) 
  {
    fill(0);
  }
  //sets normal reaction
  else 
  {
    fill(255);
  }
  //sets the lipse
  ellipse(mouseX, mouseY, 80, 80);
}