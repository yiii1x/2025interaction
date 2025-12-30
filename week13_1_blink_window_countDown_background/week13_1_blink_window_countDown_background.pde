// week13_1_blink_window_countDown_background
// 得到分數時, 畫面閃一下
void setup(){
  size(600, 300);
}
int score = 0;
int countDown = 0;
void draw(){
  if(countDown>0){
    countDown--;
    if(frameCount%10<5) background(255,255,0);
    else background(0); // 可以決定閃爍的速度
  }else background(255);
  fill(0);
  ellipse(mouseX, mouseY, 80, 80);
  rect(550,100, 50, 100); // 得分區
  if (countDown == 0 && 550 < mouseX && 100<mouseY && mouseY<200) { // 撞到得分區
    //background(255,0,0);
    score += 10;
    countDown = 60; // 1秒的閃爍
  }
}
