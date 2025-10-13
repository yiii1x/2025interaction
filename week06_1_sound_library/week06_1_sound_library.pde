//week06_1_sound_library
//File-Preference 字形改大一點
//Sketch-Library-ManageLibrary，找SOUND安裝他
//File-Examples-Libraries核心函式庫
import processing.sound.*;//使用聲音的外掛模組
SoundFile sound;//宣告SoundFile物件變數
void setup(){
  size(500,400);//視窗大小
  sound=new SoundFile(this,"music.mp3");//將音樂檔設定好
  //老師把music.mp3傳給你 你把她拉到程式裡
  sound.play();
}
void draw(){
  
}
