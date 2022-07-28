import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Global Variables
float menuX, menuY, menuWidth, menuHeight;
float popupX, popupY, popupWidth, popupHeight;
float popX, popY, popWidth, popHeight;
color red=#CE3636, white=#FCEDED, resetButtonColour=#FFFFFF, buttonFill; //Not Night Mode Friendly Colours
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter;
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
  menuX= width*0; 
  menuY= height*0;
  menuWidth = width;
  menuHeight = height*1/10;
  //
  popupX = width*3/4; 
  popupY = height*3/4; 
  popupWidth = width*1/4;
  popupHeight = height*1/5;
  //
  popX = width*3/4 ;
  popY = height*1/2;
  popWidth = width*1/10;
  popHeight = height*1/4;
  //
  //rect(popX, popY, popWidth, popHeight);
  rect(menuX, menuY, menuWidth, menuHeight);
  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight ); 
  //
}//End setup
//
void draw() 
{
  //Hover-over
  if (mouseX > menuX && mouseX < menuX+menuWidth && mouseY > menuY && mouseY< menuY+menuHeight) {
    buttonFill = red;
  } else {
    buttonFill = white;
  }//End Hover-Over
  fill(buttonFill); //2-colours to start, remember that nightMode adds choice
  rect(menuX, menuY, menuWidth, menuHeight);
  fill(resetButtonColour);
  //
  if (draw==true && mouseX > drawingSurfaceX && mouseX < drawingSurfaceX+drawingSurfaceWidth && mouseY > drawingSurfaceY && mouseY< drawingSurfaceY+drawingSurfaceHeight) line(mouseX, mouseY, pmouseX, pmouseY);//Example Circle Drawing Tool
  //
  rect(popupX, popupY, popupWidth, popupHeight);
  //rect(popX, popY, popWidth, popHeight);
  //
    if (mouseX > popupX && mouseX < popupX+popupWidth && mouseY > popupY && mouseY< popupY+popupHeight) {
    buttonFill = white;
  } else {
    buttonFill = red;
  }//End Hover-Over
  fill(buttonFill); //2-colours to start, remember that nightMode adds choice
  rect(popupX, popupY, popupWidth, popupHeight);
  fill(resetButtonColour);
};//End draw
//
void keyPressed() {
  if (key=='q'|| key=='Q') exit();
}//End keyPressed
//
void mousePressed() 
{
  if (mouseX > drawingSurfaceX && mouseX < drawingSurfaceX+drawingSurfaceWidth && mouseY > drawingSurfaceY && mouseY< drawingSurfaceY+drawingSurfaceHeight);
  {
    if (draw == true) {
      draw=false;
    } else {
      draw = true;
    }
  } //End drawing tools
  //
  if (mouseX > menuX && mouseX < menuX+menuWidth && mouseY > menuY && mouseY< menuY+menuHeight) exit();
  //
  if (mouseX > popupX && mouseX < popupX+popupWidth && mouseY > popupY && mouseY< popupY+popupHeight) rect(popX, popY, popWidth, popHeight);
}//End mousePressed
//
//End MAIN Program 
