//week02-3-myMusic-serial.ino
//week02-2-myMusic
//把makerUno_Defaultsketch先複製過來
//把setup()裡的for迴圈 35-41
//copy
#define NOTE_C5 523
#define NOTE_E5 659
#define NOTE_G5 784

#define BUTTON 2
#define BUZZER 8

int melody[] = {
  NOTE_E5, NOTE_E5, 0, NOTE_E5, 0, NOTE_C5, NOTE_E5, 0, NOTE_G5
};

int noteDurations[] = {
  10, 10, 10, 10, 10, 10, 10, 10, 10
};

int pin;
int ledArrayHigh;
int ledArrayLow;
boolean mode = false;
boolean buttonPressed = false;

void setup()
{
  delay(1000);
  Serial.begin(9600);
  pinMode(BUTTON, INPUT_PULLUP);
  for (pin = 3; pin < 14; pin++) { 
    pinMode(pin, OUTPUT);
  }

  for (int thisNote = 0; thisNote < 9; thisNote++) {
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(BUZZER, melody[thisNote], noteDuration);
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    noTone(BUZZER);
  }
}
void myMusic(){
    for (int thisNote = 0; thisNote < 9; thisNote++) {
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(BUZZER, melody[thisNote], noteDuration);
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    noTone(BUZZER);
  }
}
void serialEvent(){//第6行，負責USB的serial的函式
  while(Serial.available()){//第七行，如果USB有資料
    Serial.read();//第8行，就讀近來
    myMusic();//順便myMusic播音樂
  }
}
void loop()
{
  for (pin = 0; pin < 5; pin++) {
    if (digitalRead(BUTTON) == LOW &&
        buttonPressed == false) {
      myMusic();//加上這行，按下白色按鈕
      myMusic();//加上這行，按下白色按鈕
      myMusic();//加上這行，按下白色按鈕
      buttonPressed = true;
      mode = !mode;
      pin = 0;
      if (mode == false) {
        tone(BUZZER, NOTE_C5, 300);
        delay(300);
        tone(BUZZER, NOTE_G5, 300);
        delay(300);
        noTone(BUZZER);
      }
      else if (mode == true) {
        tone(BUZZER, NOTE_G5, 300);
        delay(300);
        tone(BUZZER, NOTE_C5, 300);
        delay(300);
        noTone(BUZZER);
      }
    }

    if (mode == false) {
      ledArrayHigh = 13 - pin;
      ledArrayLow = 7 - pin;
    }
    else if (mode == true) {
      ledArrayHigh = 9 + pin;
      ledArrayLow = 3 + pin;
    }
    digitalWrite(ledArrayHigh, HIGH);
    digitalWrite(ledArrayLow, HIGH);
    delay(100);
    digitalWrite(ledArrayHigh, LOW);
    digitalWrite(ledArrayLow, LOW);
    if (pin == 4) delay(100);
  }

  if (buttonPressed == true) {
    buttonPressed = false;
  }
}