//week07_1_arduino_blink
void setup() {
  pinMode(13,OUTPUT);//把第13隻腳，能送出資料OUTPUT
  

void loop() {
  digitalWrite(13,HIGH);//發亮
  delay(500);
  digitalWrite(13,LOW);//暗掉
  delay(500);
}
