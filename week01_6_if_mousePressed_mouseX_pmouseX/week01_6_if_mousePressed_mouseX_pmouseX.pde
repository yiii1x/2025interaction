//week01-6-if-mousePressed-mouseX-pmouseX
//結合mouse keyboard
void setup(){
  size(500,500);
}
int x=200,y=250;
void draw(){
  background(#FFFFAA);
  if(mousePressed&& x<mouseX && mouseX<x+100 && y<mouseY && mouseY<y+50){
    x+=mouseX-pmouseX;
    y+=mouseY-pmouseY;
  }
  rect(x,y,100,50);
}
