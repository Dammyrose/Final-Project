import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Global Variables
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter;
float menuX, menuY, menuWidth, menuHeight;
Boolean draw=false;
//
void setup() 
{
  //Display Checker
  //Display Orientation Checker
  //Display and CANVAS Checker
  size(800, 900); //Landscape (Portrait or Square)
  //
  //Population
  //
  drawingSurfaceX = width*0;
  drawingSurfaceY = height*1/6;
  drawingSurfaceWidth = width*3/4;
  drawingSurfaceHeight= height*4/5;
  drawingDiameter = width*1/100;
  //
  menuX= width; 
  menuY= height*0;
  menuWidth = width;
  menuHeight = height*1/10;
  //
  rect(menuX, menuY, menuWidth, menuHeight);
  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight ); 
  //
}//End setup
//
void draw() 
{
  if (draw==true && mouseX > drawingSurfaceX && mouseX < drawingSurfaceX+drawingSurfaceWidth && mouseY > drawingSurfaceY && mouseY< drawingSurfaceY+drawingSurfaceHeight) line(mouseX, mouseY, pmouseX, pmouseY);//Example Circle Drawing Tool
  //
  rect(menuX, menuY, menuWidth, menuHeight);
};//End draw
//
void keyPressed() {
}//End keyPressed
//
void mousePressed() 
{
  if (mouseX > drawingSurfaceX && mouseX < drawingSurfaceX+drawingSurfaceWidth && mouseY > drawingSurfaceY && mouseY< drawingSurfaceY+drawingSurfaceHeight);{
    if(draw == true) {
      draw=false;
    } else {
      draw = true;
    } 
  } //End drawing tools 
}//End mousePressed
//
//End MAIN Program 
