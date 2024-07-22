class Palla {

  float x;
  float y;
  float velX;
  float velY;
  float diametro;
  float offset;

  Palla() {
    x=width/2;
    y=height/2;
    velX=random(10, 15);
    do {
      velY=random(-5, 5);
    } while (velY==0||velY==-1||velY==1);
    diametro=20;
    offset=10;
  }

  color Update(float yGiocatore, float yCpu, color c, float latoVertic) {
    color colore=c;
    x+=velX;
    if (x<=offset*4&&x>=offset*4+velX) {
      float distanza=abs(y-yGiocatore);
      if (distanza<=latoVertic/2+offset/5) { //tolleranza 2 pixel
        velX*=-1;
        if (!value) {
          punti+=10;
          p=0;
        } else {
          punti+=p;
          puntiXFrame+=0.2;
          p=0;
        }
      }
    }
    if (x>=width-offset*4&&x<=width-offset*4+velX) {
      float distanza=abs(y-yCpu);
      if (distanza<=latoVertic/2+offset/5) { //tolleranza 2 pixel
        velX*=-1;
      }
    }
    y+=velY;
    if (y-diametro/2<0||y+diametro/2>height) {
      velY*=-1;
      int r=255;
      int g=255;
      int b=255;
      r=(int) random(255);
      g=(int) random(255);
      b=(int) random(255);
      colore=color(r, g, b);
    }
    return colore;
  }

  void Show() {
    circle(x, y, diametro);
  }
}
