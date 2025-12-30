//week12_1_dino_jump_partl

//恐龍跳跳跳 (1)圖檔

PImage img;  // 宣告恐龍圖片

void setup(){
  size(300, 500);// 視窗大小
  img = loadImage("dino.png"); // 載入圖片
}

float x = 200, y = 400, dx=0, dy=0; // x,y = 恐龍位置   dx,dy = 水平與垂直速度（跳躍靠 dy）

void draw(){
  background(255);
  //image(img, mouseX, mouseY, 100, 100)
  image(img, x, y, 100, 100);  // 畫出恐龍
  y += dy;  // 垂直位置更新
  if(y<400) dy += 0.98; // 重力（往下加速度
  else dy = 0; // 落地後停止

}

void keyPressed(){
  if(keyCode==UP) dy = -15; // 按上鍵跳躍
}
