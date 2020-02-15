public void setup()
{
	size(1000,1000);
	frameRate(60);
	colorMode(HSB);
}
float ang = -PI/2;
public void draw()
{
	background(0);   
	if (c >= 255)  c=0;  else  c+= 0.1;
	stroke(c, 255, 255);
	noFill();
	ellipse(500, 500, 200, 200);
	fractal(500, 500, 200, ang, c);
	ang += 0.01;
}
public void mouseDragged()//optional
{

}
float c = 0;
float colorchange = 5;
float shrinkage = 2;
public void fractal(float x, float y, float rad, float ang, float mycolor) 
{
	if (rad > 1){  
		if (mycolor >= 255)  mycolor=0;  else  mycolor += colorchange;
			stroke(mycolor, 255, 255);
		ellipse((float) (x + Math.cos(ang) * (rad - rad / (shrinkage*shrinkage))), (float) (y + Math.sin(ang) * (rad - rad / (shrinkage*shrinkage))), rad / shrinkage, rad / shrinkage);
		
		line(
			(float) (x + Math.cos(ang) * (rad - rad / (shrinkage*shrinkage))), 
			(float) (y + Math.sin(ang) * (rad - rad / (shrinkage*shrinkage))), 
			(float) (x + Math.cos(ang) * (rad - rad / (shrinkage*shrinkage)) + Math.cos(ang * shrinkage) * (rad) / (shrinkage*shrinkage)), 
			(float) (y + Math.sin(ang) * (rad - rad / (shrinkage*shrinkage)) + Math.sin(ang * shrinkage) * (rad) / (shrinkage*shrinkage))
			);
	}
}

public float rotatePointX(float x, float y, float x1, float y1, float rads){
	return (float)(Math.sqrt((x - x1)*(x - x1) + (y - y1)*(y - y1))) * (float)Math.cos(atan((x - x1)*(x - x1)/(y - y1)*(y - y1))) + x1;
}

public float rotatePointY(float x, float y, float x1, float y1, float rads){
	return (float)(Math.sqrt((x - x1)*(x - x1) + (y - y1)*(y - y1))) * (float)Math.sin( atan((x - x1)*(x - x1)/(y - y1)*(y - y1))) + y1;
}
