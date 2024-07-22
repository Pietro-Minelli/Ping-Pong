Palla p1;
Racchetta rGiocatore;
Racchetta rCpu;
int punti;
PImage campo;
PImage racchetta;
color c1;
int vel;
int puntiXFrame;
boolean value;
float p;

void setup() {
  size(800, 600);
  punti=0;
  p1=new Palla();
  rGiocatore=new Racchetta();
  rCpu=new Racchetta(p1.y);
  campo=loadImage("Campo.png");
  racchetta=loadImage("Racchetta.jpg");
  c1=color(255);
  vel=10;
  value=false;
  p=0;
  puntiXFrame=1;
}

//Ogni volta che si clicca il mouse si cambia modalita'. I punti x frame e la velocita' raggiunta dalla racchetta della cpu rimangono salvati, altrimenti parte sempre lenta e si fanno pochi punti
void mouseClicked() {
  if (value == false) {
    value = true;
  } else {
    value = false;
  }
}

void draw() {
  if (value) {
    p+=puntiXFrame;
  } else {
    p=0;
  }
  imageMode(CORNER);
  image(campo, 0, 0, width, height);
  textSize(20);
  textAlign(CENTER);
  text("Punti: "+punti, width/2-10, 20);
  c1=p1.Update(rGiocatore.y, rCpu.y, c1, rGiocatore.latoVertic);
  fill(c1);
  float r=red(c1);
  float g=green(c1);
  float b=blue(c1);
  stroke(255-r, 255-g, 255-b);
  p1.Show();
  if (p1.x<10) {
    background(0);
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("GAMEOVER\nPUNTI: "+punti, width/2, height/2-40);
    noLoop();
  } else if (p1.x>width-10) {
    background(0);
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("HAI VINTO\nPUNTI: "+punti, width/2, height/2-40);
    noLoop();
  } else {
    fill(255);
    rGiocatore.Update();
    rGiocatore.Show(1);
    if (value) {
      rCpu.UpdateDrastico();
      rCpu.Show(2);
    } else {
      rCpu.Update(p1.y);
      rCpu.Show(2);
    }
  }
}
