PImage Plane;
PImage Enemy;
float step=5;
Plane plane;
boolean [] keys = new boolean[256];
Enemy [] enemys = new Enemy[5];
int yourlife=10;
int score=0;

int bestScore=0;
boolean gameOver=false;
boolean gameBegin=false;

ArrayList<Ammo> ammos=new ArrayList<Ammo>();


int firespeed=10;
int count=0;

void setup()
{
  size(400,800);
  Plane=loadImage("Plane.png");
  Enemy=loadImage("Enemy.png");
  Plane.resize(100,100);
  Enemy.resize(50,50);
  plane=new Plane(width/2,height-150);
  
  for(int i=0;i<enemys.length;i++){
    enemys[i]=new Enemy(random(10,width-10),random(-100,-50));
  }
  
}
void draw()
{
  if(gameBegin == false)
  {
    showBegin();
  }
  if(keyPressed && key == 'r' && gameBegin == false)
  {
    gameBegin=true;
  }
  if(keyPressed && key == 'r' && gameOver)
  {
    restart();
  }
  if(yourlife<=0)
  {
    showOver();
  }
  if(gameOver || gameBegin==false)
  {
    return;
  }
  rectMode(CENTER);
  noStroke();
  fill(255,150);
  rect(width/2,height/2,width,height);
  
  textAlign(LEFT);
  textSize(20);
  fill(#FF0000);
  text("Score:"+score,0.05*width,0.05*height);
  text("Life:"+yourlife,0.05*width,0.1*height);
  //飛機
  move();
  plane.display();
  plane.check();
  
  //敵人
  for(int i=0;i<enemys.length;i++){
    enemys[i].display();
    enemys[i].update();
    enemys[i].hit();
    if(enemys[i].reach()){
      yourlife-=1;
      enemys[i]=new Enemy((int)random(10,width-10),-50);
    }
    if(enemys[i].die()){
      score++;
      enemys[i]=new Enemy((int)random(10,width-10),-50);
    }
  }
  
  //子彈
  if(count%firespeed==0){
    Ammo ammo1=new Ammo(plane.x-15,plane.y-24);
    Ammo ammo2=new Ammo(plane.x-15,plane.y-24);
    ammos.add(ammo1);
    ammos.add(ammo2);
  }
  count +=1;
  
  for(int i=0;i<ammos.size();i++)
  {
    Ammo a=(Ammo)ammos.get(i);
    
    a.display();
    if(a.check()){
      ammos.remove(i);
    }
  }
  
}
//_____________//
class Plane//飛機類
{
  float x,y;//x位置,y位置
  Plane(float x,float y)//構造函數
  {
    this.x=x;
    this.y=y;
  }
  void display(){
    tint(255,255);
    imageMode(CENTER);
    image(Plane,x,y);
  }
  void check()
  {
    if(x<0)x=0;if(x>width)x=width;if(y<0) y=0;if(y>height)y=height;
  }
}
void move(){
  if(keys['a'])
    plane.x-=step;
  if(keys['d'])
    plane.x+=step;
  if(keys['w'])
    plane.y-=step;
  if(keys['s'])
    plane.y+=step;
}
void keyPressed(){
  if(key<256) keys[key]=true;
}
void keyReleased(){
  if(key<256) keys[key]=false;
}
//_______________________//

class Enemy{
  float x,y;
  float velocity=4;
  float accelerate=0.01;
  int life;
  Enemy(float x,float y)
  {
    this.x=x;
    this.y=y;
    life=(int)random(1,6);
  }
  void display()
  {
    imageMode(CENTER);
    tint(255,255-20*life);
    image(Enemy,x,y);
  }
  void update()
  {
    y+=velocity;
    velocity += accelerate;
  }
  //
  boolean die(){
    if(life<=0)//如果飛機生命值小於等於0
    {
      return true;
    } return false;
  }
  //判斷有沒有突破防線
  boolean reach(){
    if(y>height+25)
    {
      return true;
    } return false;
  }
  void hit(){
    for(int i=0;i<ammos.size();i++){//
      Ammo ammo=(Ammo) ammos.get(i);
      if(dist(x,y,ammo.x,ammo.y)<25){//
        life -=1;
        ammos.remove(i);
      }
    }
  }
}

//____________________//

class Ammo
{
  float x,y,speed=9;
  Ammo(float x,float y)
  {
    this.x=x;
    this.y=y;
  }
  void display(){
    fill(#F50202);
    noStroke();
    rectMode(CENTER);
    rect(x,y,3,14);
    y-=speed;
  }
  boolean check(){
    if(y<0)
    {
      return true;
    }else
      return false;
  }
}

void showOver()
{
  gameOver=true;
  for(int i=0;i<ammos.size();i++)
  {
    ammos.remove(i);
  }
  bestScore=bestScore>score ? bestScore: score ;//
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(42);
  text("BestScore:"+bestScore,width/2,height/2-100);
  text("Score:"+score,width/2,height/2);
  textSize(20);
  text("Press R to restart",width/2,height/2+100);
}
void restart(){
  gameOver=false;
  score=0;
  yourlife=10;
  plane=new Plane(width/2,height-150);//
  for(int i=0;i<enemys.length;i++){
    enemys[i]=new Enemy(random(10,width-10),random(-100,-50));
  }
}
void showBegin()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(30);
  text("Wellcome to our game",width/2,height/2);
  textSize(20);
  text("Press R to start",width/2,height/2+100);
}
