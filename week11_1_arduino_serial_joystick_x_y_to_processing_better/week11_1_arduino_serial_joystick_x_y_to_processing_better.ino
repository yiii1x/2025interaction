// week11_1_arduino_serial_joystick_x_y_to_processing_better
// 修改自 week10_7_arduino_serial_joystick_x_y_to_processing
void setup() {
  Serial.begin(9600);
  pinMode(2,INPUT_PULLUP);
  pinMode(8,OUTPUT);
}
int count = 0,totalX = 0,totalY = 0;
int x0 = 512,y0 = 512;
void loop() {
  delay(30);
  int x = analogread(A2);
  int y = analogread(A3);
  if(total<20){
    totalX += x;
    totalY += y;
    count++;
    x0 = totalX / count;
    y0 = totalY / count;
  }
  //Serial.write(x/4);
  //Serial.write(y/4);
  if( abs(x-x0) < 25 ) x = 128;
  else x = (x-x0)/4.4 + 128;
  if( abs(y-y0) < 25 ) y = 128;
  else y = (y-y0)/4.4 + 128;
  Serial.write(x);
  Serial.write(y);
  
  if(x>900) tone(8,784,100);
  if(x<100) tone(8,523,100);
  if(y>900) tone(8,659,100);
  if(y<100) tone(8,500,100);
}