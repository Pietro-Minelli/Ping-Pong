class Racchetta {

  float x;
  float y;
  float latoOriz;
  float latoVertic;

  Racchetta() {
    x=20;
    y=mouseY;
    latoOriz=20;
    latoVertic=60;
  }

  Racchetta(float yPalla) {
    x=width-20;
    y=yPalla;
    latoOriz=20;
    latoVertic=60;
  }

  void Update() {
    x=20;
    y=mouseY;
    if (y+latoVertic/2>height) {
      y=height-latoVertic/2;
    } else if (y-latoVertic/2<0) {
      y=latoVertic/2;
    }
  }

  void Update(float yPalla) {
    y=yPalla;
    if (y-latoVertic/2<0) {
      y=latoVertic/2;
    } else if (y+latoVertic/2>height) {
      y=height-latoVertic/2;
    }
  }

  void UpdateDrastico() {
    //Se la velocita è maggiore dell altezza/2 della barra non la incremento piu, altrimenti è ingiocabile
    y+=vel;
    if (y-latoVertic/2<0) {
      y=latoVertic/2;
      if (vel>-latoVertic/2) {
        vel-=3;
      }
      vel*=-1;
    } else if (y+latoVertic/2>height) {
      y=height-latoVertic/2;
      if (vel<latoVertic/2) {
        vel+=3;
      }
      vel*=-1;
    }
  }

  void Show(int id) {
    if (id==1) {
      tint(255, 150, 150);
    } else {
      tint(150, 150, 255);
    }
    stroke(0);
    imageMode(CENTER);
    image(racchetta, x, y, latoOriz, latoVertic);
    noTint();
    noFill();
  }
}
