// week13_6_breakout_part5_many_bricks
// 修改自 week13_5_breakout_part4_one_brick
// 先用一個磚塊, 一個板子, 一個球
void setup(){
  size(500, 300);
  restart();
}
//boolean brickAlive = true;
//int brickX = 230, brickY = 100; // 有1個磚塊
boolean [] brickAlive = new boolean[10];
int [] brickX = new int[10];
int [] brickY = new int[10];
float x = 250, y = 250, dx = 0, dy = 0;
boolean onBoard = true, gameOver=false;
void restart() {
  for(int i=0; i<10;i++){
    brickAlive[i] = true;
    brickX[i] = 40+i*42;
    brickY[i] = 100;
  }
  x = 250;
  y = 250;
  dx = 0;
  dy = 0;
  onBoard = true;
  gameOver = false;
}
void draw(){
  background(0);
  ellipse(x, y, 8, 8);
  rect(mouseX-50, 254, 100, 15);
  for(int i=0; i<10; i++){
    if(brickAlive[i]){
      rect(brickX[i], brickY[i], 40, 10); // 1個磚塊
      if(brickX[i] < x+dx && x+dx < brickX[i]+40){
        if( (brickY[i]+10 <= y && brickY[i]+10 > y+dy) || (brickY[i] >= y && brickY[i] < y+dy) ){
          brickAlive[i] = false;
          dy = -dy;
        }
      }
    }
  }
  if(onBoard) x = mouseX;
  else{
    if(x+dx < 0 || x+dx > 500) dx = -dx;
    if(y+dy < 0) dy = -dy;
    if(y+dy > 254 && mouseX-50 < x+dx && x+dx < mouseX+50){ // touch board
      dy = -dy;
    }
    if(y+dy>300) { // game over!!
      gameOver = true;
    }
    if(!gameOver){
      x += dx;
      y += dy;
    }
  }
}
void mousePressed(){
  if(onBoard) {
    onBoard = false;
    dy = -3;
    dx = 1; //random(-1,+1);
  }else if(gameOver){
    restart();
  }
}
