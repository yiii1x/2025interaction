//week07_3_arduino_blink_blink
//修改至week07_1_arduino_blink只是再多插一隻LED
//小心，有一隻腳要接地GND，另一隻要接10(多這一行)
//小心，有一隻腳要接地GND，另一隻要接11(多這一行)
//小心，有一隻腳要接地GND，另一隻要接12(多這一行)
//小心，有一隻腳要接地GND，另一隻要接13
void setup() {
  pinMode(10,OUTPUT);//(多這一行)
  pinMode(11,OUTPUT);//(多這一行)
  pinMode(12,OUTPUT);//把第12隻腳，能送出資料OUTPUT
  pinMode(13,OUTPUT);//把第13隻腳，能送出資料OUTPUT

void loop() {
  for(int i=10;i<=13;i++){
    digitalWrite(13,LOW);//暗掉
    digitalWrite(i-1,LOW);//暗掉
    digitalWrite(i,HIGH);//發亮
    delay(500);
  }
}
