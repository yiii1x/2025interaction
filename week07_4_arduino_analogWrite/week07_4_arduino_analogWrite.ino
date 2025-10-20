//week07_4_arduino_analogWrite
void setup() {
  pinMode(11,OUTPUT);//第11個pin腳(有PWM功能，可0-255輸出) 要輸出
}//這些特別的腳，分別是第3第5第6第9第10第11共6個腳都可控制他的量暗程度
int a=0;
void loop() {
  analogWrite(11,a);//亮的程度是a的值
  a=(a+1)%256;//會在亮一點點
  delay(10);//每0.01秒

}
