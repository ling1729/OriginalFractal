public void setup()
{
	size(1000,1000);
	frameRate(30);
	colorMode(HSB);
}
float ang = -PI/2;

ArrayList<float[]> points = new ArrayList<float[]>();

public void draw()
{
	background(0);   
	if (c >= 255)  c=0;  else  c+= 0.3;
	stroke(c, 255, 255);
	noFill();
	ellipse(500, 500, 200, 200);
	line(500, 500, (float) (500 + 100 * Math.cos(ang)), (float) (500 + 100 * Math.sin(ang)));
	fractal(500, 500, 200, ang, c);
	ang += 0.02;
	if(toggle){
		for(float[] thing : points){
			noStroke();
			fill(thing[2], 255, 255);
			ellipse(thing[0], thing[1], 2, 2);
		}
	}
}
boolean toggle = true;

public void mouseClicked()//optional
{
	toggle = !toggle;
}
float c = 0;
float colorchange = 10;
float shrinkage = 2;

public void fractal(float x, float y, float rad, float ang, float mycolor) 
{
	if (rad > 0.5){  
		if (mycolor >= 255)  mycolor=0;  else  mycolor += colorchange;
			stroke(mycolor, 255, 255);

		ellipse(
			(float) (x + Math.cos(ang) * (rad / 2 + rad / (shrinkage * 2))), 
			(float) (y + Math.sin(ang) * (rad / 2 + rad / (shrinkage * 2))), 
			rad / shrinkage, 
			rad / shrinkage
			);
		
		line(
			(float) (x + Math.cos(ang) * (rad / 2 + rad / (shrinkage * 2))), 
			(float) (y + Math.sin(ang) * (rad / 2 + rad / (shrinkage * 2))), 
			(float) (x + Math.cos(ang) * (rad / 2 + rad / (shrinkage * 2)) + Math.cos(ang * shrinkage) * (rad) / (shrinkage * 2)), 
			(float) (y + Math.sin(ang) * (rad / 2 + rad / (shrinkage * 2)) + Math.sin(ang * shrinkage) * (rad) / (shrinkage * 2))
			);

		fractal(
			(float) (x + Math.cos(ang) * (rad / 2 + rad / (shrinkage * 2))), 
			(float) (y + Math.sin(ang) * (rad / 2 + rad / (shrinkage * 2))), 
			rad / shrinkage,
			ang * 2,
			mycolor + colorchange
			);
	} else {
		points.add(new float[]{x, y, c});
	}
}
