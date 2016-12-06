import controlP5.*;
import geomerative.*;
import static javax.swing.JOptionPane.*;


ControlP5 slider;
int wind;
PFont f;
RFont font;
char keydata = ' ';
String text;
RShape grp;


int ystep;
int linespace = 18;
byte firsttime = 0;
int timenow, oldtime;
byte errcount = 0;
float counter = 0;

int temperature02,temperature03,temperature04;
float temp01,temp02,temp03,temp04;

  float speed= 55;
  float strokew = speed/36*5; 
  float strokelength = speed/36*30; 
  float wiggle = speed/36*8;
  int direction = 0;
  int temperature = 12;

void setup() {
  colorMode(HSB,255,100,100,100);
//  f = createFont("AktivGrotesk_Trial_Md.ttf", 200);
  RG.init(this);
  font = new RFont("universltstd.ttf", 600,RFont.CENTER);
  text = new String();


  smooth();
  size(5800, 800);
  surface.setLocation(10, 10);
  oldtime = millis();
  ystep = 24;
  
}

void draw() {



  background(0,0,100);
  fill(0);  

  float rcp = float(direction + 180 ) % 360;


  pushMatrix();
  translate(width/2, height/8*6.5);
  
  noStroke();
  fill(0);
  grp = RG.getText("bit.ly/2g2ewaq", "universltstd.ttf", 600, CENTER);
  grp.draw();

  
  noFill();
    if(-30<temperature && temperature<10){
    temp01 = map(temperature, -30,0,0,100);
    stroke(135,temp01,100);
  }else if(10<=temperature && temperature<15){
    temp01 = map(temperature,  10,15,135,110);
    stroke(temp01,100,100);    
  }else if(15<=temperature && temperature<50){
    temp01 = map(temperature, 15,50,50,0);
    stroke(temp01,100,100);       
  }
  
  //stroke(0);
  RCommand.setSegmentLength(strokelength);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  RGroup myGroup2 = font.toGroup("bit.ly/2g2ewaq"); 
  RPoint[] myPoints2 = myGroup2.getPoints();

  for (int i=0; i<myPoints2.length; i++) {
   myPoints2[i].x += random(-wiggle,wiggle);
   myPoints2[i].y += random(-wiggle,wiggle);

   strokeCap(ROUND);
   strokeWeight(strokew);

  line(myPoints2[i].x, myPoints2[i].y, myPoints2[i].x- strokelength * cos( radians(270 - rcp)), myPoints2[i].y+ strokelength * sin( radians(270 - rcp)));
  }
  
  popMatrix();
  
  
  saveFrame("frames/######.tif");
  //strokelength++;
  //strokew++;
  //wiggle++;

}

float ftoc(float f){
f = (f-32) * 5/9;
f = int(f *10 + 0.5);
return (f/10);
}

//void keyPressed()
//{
//  keydata = key;
//  text = text + keydata;
//}