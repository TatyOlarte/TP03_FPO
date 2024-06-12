private Tanque tanque;
private GestorMurallas gestorMurallas;
private JoyPad joyPad;
private ArrayList<Bala> balas;
private int puntaje;

void setup() {
  size(500, 500);
  tanque = new Tanque(new Transform(new PVector(width/2, height - 50))/*, new ImageComponent("")*/, new PVector(100, 100));
  gestorMurallas = new GestorMurallas();
  joyPad = new JoyPad();
  balas = new ArrayList<Bala>();
  puntaje = 0;

  for (int i = 0; i < 4; i++) {
    Muro muro = new Muro(new Transform(new PVector(random(50 * i, 450), random(50 * i, 250)))/*, new ImageComponent("muro.png")*/,
      int(random(10, 30))*2, int(random(1, 10))*2);
    gestorMurallas.agregarMuro(muro);
  }
}

void draw() {
  background(25);

  tanque.display();
  gestorMurallas.display();
  gestorMurallas.verificarColision(balas);

  if (joyPad.isLeft()) {
    tanque.mover(-1);
  }
  if (joyPad.isRight()) {
    tanque.mover(1);
  }

  // Dibujar y mover balas
  for (int i = balas.size() - 1; i >= 0; i--) {
    Bala bala = balas.get(i);
    bala.mover();
    bala.display();
    if (bala.fuera()) {
      balas.remove(i);
    }
  }

  fill(255);
  textSize(20);
  text("Balas:" + balas.size(), 50, 50);
  text("Puntaje: " + puntaje, 150, 50);
}

void keyPressed() {
  if (key == ' ') {
    balas.add(tanque.disparar());
  }
}
void mousePressed() {
  if (mouseButton == LEFT) {
    joyPad.setLeft(true);
  }
  if (mouseButton == RIGHT) {
    joyPad.setRight(true);
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    joyPad.setLeft(false);
  }
  if (mouseButton == RIGHT) {
    joyPad.setRight(false);
  }
}
