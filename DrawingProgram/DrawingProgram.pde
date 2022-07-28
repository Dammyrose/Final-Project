import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Global Variables
PImage pic1;
float menuX, menuY, menuWidth, menuHeight;
float popupX, popupY, popupWidth, popupHeight;
float popX, popY, popWidth, popHeight;
color red=#CE3636, white=#FCEDED, resetButtonColour=#FFFFFF, buttonFill; //Not Night Mode Friendly Colours
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter;
Boolean draw=false;
float imageX1, imageY1, imageWidth1, imageHeight1, imageLargerDimension1, imageSmallerDimension1, imageWidthRatio1=0.0, imageHeightRatio1=0.0;
float picWidthAdjusted1, picHeightAdjusted1;
Boolean widthLarger1=false, heightLarger1=false;
//
void setup() 
{
  //Display Checker
  //Display Orientation Checker
  //Display and CANVAS Checker
  size(800, 900); //Landscape (Portrait or Square)
  //
  pic1 = loadImage("../Images Used/TryYourBest.png");// Dimensions: width 600 height 700
  //
  int picWidth1 = 600;
  int picHeight1 = 700;
  //
  if ( picWidth1 >= picHeight1 ) { //Image Dimension Comparison
    //True if Landscape or Square
    imageLargerDimension1 = picWidth1;
    imageSmallerDimension1 = picHeight1;
    widthLarger1 = true;
  } else {
    //False if Portrait
    imageLargerDimension1 = picHeight1;
    imageSmallerDimension1 = picWidth1;
    heightLarger1 = true;
  }//End Image Dimension Comparison
  println(imageSmallerDimension1, imageLargerDimension1, widthLarger1, heightLarger1); //Verify variables details
  //Aspect Ratio
  //Note: single line IFs can be summarized into IF-ELSE or IF-ElseIF-Else
  //Computer chooses which formulae to execute
  if ( widthLarger1 == true ) imageWidthRatio1 = imageLargerDimension1 / imageLargerDimension1;
  if ( widthLarger1 == true ) imageHeightRatio1 = imageSmallerDimension1 / imageLargerDimension1;
  if ( heightLarger1 == true ) imageWidthRatio1 = imageSmallerDimension1 / imageLargerDimension1;
  if ( heightLarger1 == true ) imageHeightRatio1 = imageLargerDimension1 / imageLargerDimension1;
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
  imageX1 = width*3/4;
  imageY1 = height*3/4;
  imageWidth1 = width*1/4; //CANVAS (0,0) means point doesn't match to rectangle, missing outline on two sides
  imageHeight1 = height*1/5;
  //
  picWidthAdjusted1 = imageWidth1 * imageWidthRatio1;
  picHeightAdjusted1 = imageHeight1 * imageHeightRatio1;
  println(imageX1, imageY1, picWidthAdjusted1, picHeightAdjusted1);
  //
  //rect(popX, popY, popWidth, popHeight);
  rect(menuX, menuY, menuWidth, menuHeight);
  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight ); 
  //
}//End setup
//
void draw() 
{
  //
  image(pic1, imageX1, imageY1, picWidthAdjusted1, picHeightAdjusted1);
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
