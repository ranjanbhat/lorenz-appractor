float x=0.000001,y=0,z=0;
float a=10;
float b=28;
float c=8/3.0;
float Yangle=0;
float Xangle=0;
float Zangle=0;
float xspeed=0.01;
float yspeed=0.01;
float zspeed=0.01;

float dt=0.01;

ArrayList<PVector> points=new ArrayList<PVector>();

void setup()
{
   fullScreen(P3D);
   background(0);
   colorMode(HSB);
}

void mousePressed()
{
  exit();
}

void draw()
{
  strokeWeight(0.5);
  background(0);
  //translate(width/2,height/2);
  translate(width/2,height/2,0);
  rotateY(Yangle);
  rotateX(Xangle);
  rotateZ(Zangle);
  scale(8);
  float dx=(a*(y-x))*dt;
  float dy=(x*(b-z)-y)*dt;
  float dz=(x*y-c*z)*dt;
  x+=dx;
  y+=dy;
  z+=dz;
  points.add(new PVector(x,y,z));
  stroke(255);
  
  noFill();
  beginShape();
  float hu=0;
  for(PVector v:points)
  {
  //  PVector offset=PVector.random3D();
  //  offset.mult(0.1);
  //  v.add(offset);
  stroke(hu,255,200);
  vertex(v.x,v.y,v.z);
  hu+=0.1;
  if(hu>255)hu=0;
  }
  endShape();
  
  Xangle+=xspeed;
  Yangle+=yspeed;
  Zangle+=zspeed;
}
