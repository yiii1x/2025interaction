// week13_2_breakout_part1_board_onBoard_x_y_dx_dy_mousePressed
// 先用一個磚塊, 一個板子, 一個球
void setup(){
  size(500, 300);
}
float x = 250, y = 250, dx = 0, dy = 0;
boolean onBoard = true;
void draw(){
  background(0);
  ellipse(x, y, 8, 8);
  rect(mouseX-50, 254, 100, 15);
  if(onBoard) x = mouseX;
  else{
    if(x+dx < 0 || x+dx > 500) dx = -dx;
    if(y+dy < 0) dy = -dy;
    x += dx;
    y += dy;
  }
}
void mousePressed(){
  if(onBoard) {
    onBoard = false;
    dy = -3;
    dx = random(-3,+3);
  }
}
