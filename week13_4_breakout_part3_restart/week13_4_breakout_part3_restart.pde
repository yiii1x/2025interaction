// week13_4_breakout_part3_restart
// 修改自 week13_3_breakout_part2_touch_board_gameOver
// 先用一個磚塊, 一個板子, 一個球
void setup(){
  size(500, 300);
}
float x = 250, y = 250, dx = 0, dy = 0;
boolean onBoard = true, gameOver=false;
void restart() {
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
    dx = random(-3,+3);
  }else if(gameOver){
    restart();
  }
}
