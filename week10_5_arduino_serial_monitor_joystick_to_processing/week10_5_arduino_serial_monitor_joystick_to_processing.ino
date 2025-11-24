//week10_5_arduino_serial_monitor_joystick_to_processing
// 修改自 week10_4_arduino_serial_monitor_joystick_Serial_println
// 不使用Serial.println() 要改用 serial.write()
void setup() {
  Serial.begin(9600);
  pinMode(2,INPUT_PULLUP);
  pinMode(8,OUTPUT);
}

void loop() {
  delay(100);
  int now = analogRead(A3);
  Serial.write(now);
  if(now>200) tone(8,784,100);
  if(now<50) tone(8,523,100);
}

