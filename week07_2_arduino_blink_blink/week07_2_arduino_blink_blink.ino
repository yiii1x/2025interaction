//week07_2_arduino_blink_blink
//修改至week07_1_arduino_blink只是再多插一隻LED
//小心，有一隻腳要接地GND，另一隻要接12(多這一行)
void setup() {
  pinMode(12,OUTPUT);//把第12隻腳，能送出資料OUTPUT
  pinMode(13,OUTPUT);//把第13隻腳，能送出資料OUTPUT

void loop() {
  digitalWrite(12,LOW);//暗掉
  digitalWrite(13,HIGH);//發亮
  delay(500);
  digitalWrite(13,LOW);//暗掉
  digitalWrite(12,HIGH);//發亮
  delay(500);
}
