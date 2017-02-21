/**
 * Manager for vectors that define a triangle on the graphics plane.
 *
 * @author Joshua Cuneo
 * @version 1.0 1/23/2017
 */

class Bary
{
  
  private PVector v1, v2, v3;

  /**
   * Constructor. Stores the PVectors as the three endpoints of the triangle.
   *
   * @param v1 PVector of first endpoint.
   * @param v2 PVector of second endpoint.
   * @param v3 PVector of third endpoint.
   */
  Bary(PVector v1, PVector v2, PVector v3)
  {
    this.v1 = v1;
    this.v2 = v2;
    this.v3 = v3;
  }

  /**
   * Uses the lambda values of a set of coordinates to determine if that
   * coordinate is within the triangle.
   *
   * @param lambda1 First lambda value of coordinates.
   * @param lambda2 Second lambda value of coordinates.
   * @param lambda3 Third lambda value of coordinates.
   * @return True if the coordinates are within the triangle, false otherwise.
   */  
  public boolean isInTriangle(float lambda1, float lambda2, float lambda3)
  {
    //Because of the way the getBaryCoord() function is
    //written, we already know that at least one lambda value is <= 1
    //and the sum of all three is 1, so we just need to check to see
    //if all three are greater than 0.
    if( (lambda1 >= 0) && (lambda2 >= 0) && (lambda3 >= 0))
    {
      return true;
    }
    
    return false;
  }
  
  /**
   * Compute the lambda values of a given set of pixel coordinates.
   *
   * @param x x-value of the pixel coordinates.
   * @param y y-value of the pixel coordinates.
   * @return An array of size 3 with the three lambda values, or NULL if the lambda values are invalid.
   */  
  public float[] getBaryCoord (int x, int y)
  {
    float denom = (this.v2.y - this.v3.y)*(this.v1.x - this.v3.x) + (this.v3.x - this.v2.x)*(this.v1.y - this.v3.y);
    
    //We don't want to divide by 0, although if we've reached
    //this condition, we probably don't have a true triangle.
    if(denom == 0)
    {
      return null;
    }
    
    float l1num = (this.v2.y - this.v3.y)*(x - this.v3.x) + (this.v3.x - this.v2.x)*(y - this.v3.y);
    float l2num = (this.v3.y - this.v1.y)*(x - this.v3.x) + (this.v1.x - this.v3.x)*(y - this.v3.y);
    
    float[] lambdas = new float[3];
    lambdas[0] = l1num/denom;
    lambdas[1] = l2num/denom;
    lambdas[2] = 1 - lambdas[0] - lambdas[1];
    
    return lambdas;    
  }

  /**
   * Sets the specified triangle endpoint to the given pixel coordinates.
   * Note that nothing happens if the vector number is invalid.
   *
   * @param vecNum Indicate whether we want to change the first, second, or third endpoint.
   * @param x The new x value to assign to our endpoint.
   * @param y The new y value to assign to our endpoint.
   */
  public void setVector(int vecNum, float x, float y)
  {
    switch(vecNum)
    {
      case 1:
        this.v1 = new PVector(x, y);
        break;
      case 2:
        this.v2 = new PVector(x, y);
        break;
      case 3:
        this.v3 = new PVector(x, y);
        break;
      default:
        break;
    }
  }

  /**
   * Retrieves the specified triangle endpoint.
   *
   * @param vecNum Indicate whether we want to get the first, second, or third endpoint.
   * @return The specified endpoint, or null if an invalid vector number is specified.
   */
  public PVector getVector(int vecNum)
  {
    switch(vecNum)
    {
      case 1:
        return this.v1;
      case 2:
        return this.v2;
      case 3:
        return this.v3;
      default:
        return null;
    }
  }
  
}