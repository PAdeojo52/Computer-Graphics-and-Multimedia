
/*
creates bycentric patterns
 *@author Peter Adeojo 
 *@version 1.0 1/24/2017


*/
PVector v1, v2, v3;
Bary bary;

public void setup()
{
  noLoop();
  size(500, 500);
  
  v1 = new PVector(500, 200);
  v2 = new PVector(300, 500);
  v3 = new PVector(70, 30);
   
  bary = new Bary(v1, v2, v3);
  background(255, 204, 0);
}


public void draw()
{
  //Code here.
  /*
   Read over the contents of the Bary class. Make sure you understand it thoroughly. You do not need to make any modifications to this class for this assignment.

3. Modify the code in the main tab to use the Bary class to draw a triangle with the three given PVectors as the endpoints. All pixels inside the triangle should be a color of your choice (other than black), and all pixels outside the triangle should be black.

4. Please place a comment header at the top of your assignment. No other comments are needed.

5. Rename your main file and your project folder to LastnameFirstname_ICE03. Place your Processing project folder into a .zip file also named LastnameFirstname_ICE03 and submit it on D2L.
  
  */
  //float x1 = 500;
  //loat y1 = 200;
  
  color black = color (54);
  set (34,50,black);
  set (23,250,black);
  //set (300, 400, black);
  //int x = 500;
  //int k = 200;
  
 
   //float[] get0= bary.getBaryCoord(500,200);
   
   //float[] get1= bary.getBaryCoord(300,500);
  // float[] get2= bary.getBaryCoord(70,30);
    
    
    
 //print(get0[2]);
  
 
 boolean checker = false;
 for(int xcoord = 0; xcoord<500;xcoord++)
 {
   
  
   for(int ycoord = 0; ycoord< 500;ycoord++)
   {
   float[] get0= bary.getBaryCoord(xcoord,ycoord);
   
   checker = bary.isInTriangle( get0[0],  get0[1],  get0[2]);
   
   if(checker == true)
   {
    //print(true); 
     point(xcoord,ycoord);
   }
   else
   {
    //print(false); 
   }
     
     
   }
   
 }
 

  
  // if (isInTriangle(bary.getBaryCoord(500,200),bary.getBaryCoord(300,500),bary.getBaryCoord(70,30)))
    
  
  
  
  
  //bar
  //bary.setVector(5,4,5);
}