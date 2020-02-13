public void setup()
{
	size(1000, 1000);
	background(0);
	fill(255);
	noStroke();
	//triangle(500 - 400 / 2, 500 + 400 / 2, 500, 500 - (float) (400 * Math.sqrt(3) / 2) + 400 / 2, 500 + 400 / 2, 500 + 400 / 2);
	fractal(500,500,400);
}
public void draw()
{

}
public void mouseDragged()//optional
{

}
public void fractal(float x, float y, float len) 
{
	if (len > 1){  
		float p1x = x - len / 2;
		float p1y = y + len / 2;
		float p2x = x;
		float p2y = y - (float) (len * Math.sqrt(3) / 2) + len / 2;
		float p3x = x + len / 2; 
		float p3y = y + len / 2;

		float cx = (p1x + p2x + p3x) / 3;
		float cy = (p1y + p2y + p3y) / 3;

		//triangle(p1x, p1y, p2x, p2y, p3x, p3y);
		float deg = PI/5;
		stroke(0);
		ellipse(rotatePointX(p1x, p1y, cx, cy, deg), rotatePointY(p1x, p1y, cx, cy, deg), 5, 5);
		ellipse(rotatePointX(p2x, p2y, cx, cy, deg), rotatePointY(p2x, p2y, cx, cy, deg), 5, 5);
		ellipse(rotatePointX(p3x, p3y, cx, cy, deg), rotatePointY(p3x, p3y, cx, cy, deg), 5, 5);
		
		ellipse(cx, cy, 5, 5);

		fill(255);
		noStroke();
		triangle(rotatePointX(p1x, p1y, cx, cy, deg), rotatePointY(p1x, p1y, cx, cy, deg), rotatePointX(p2x, p2y, cx, cy, deg), rotatePointY(p2x, p2y, cx, cy, deg), rotatePointX(p2x, p2y, cx, cy, deg), rotatePointY(p2x, p2y, cx, cy, deg));
	}
}

public float rotatePointX(float x, float y, float x1, float y1, float rads){
	return (float)(Math.sqrt((x - x1)*(x - x1) + (y - y1)*(y - y1))) * (float)Math.cos( atan((x - x1)*(x - x1)/(y - y1)*(y - y1))) + x1;
}

public float rotatePointY(float x, float y, float x1, float y1, float rads){
	return (float)(Math.sqrt((x - x1)*(x - x1) + (y - y1)*(y - y1))) * (float)Math.sin( atan((x - x1)*(x - x1)/(y - y1)*(y - y1))) + y1;
}
