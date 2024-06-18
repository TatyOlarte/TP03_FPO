/* --- ATRIBUTOS --- */
private Tanque tanque;//Clase Tanque
private GestorMurallas gestorMurallas;//Clase GestorMurallas
private JoyPad joyPad;//JoyPad
private ArrayList<Bala> balas;//ArrayList de Bala
private int puntaje;//Puntaje
private TipoMuro[] tipoMuro;//Array de TipoMuro
private boolean gameOver = false;//Determina el estado del juego, Juego terminado

/* --- METODOS --- */
void setup() {
  size(500, 500);//Tamaño del Lienzo
  //Inicializacion de Tanque
  tanque = new Tanque(new Transform(new PVector(width/2, height - 50)), new ImageComponent(loadImage("tanque.png")), new PVector(100, 100));
  gestorMurallas = new GestorMurallas();//Inicializacion de GestorMurallas
  joyPad = new JoyPad();//Inicializacion de JoyPad
  balas = new ArrayList<Bala>();//Inicializacion del ArrayList de Bala
  puntaje = 0;//Puntaje Inicial 0

  tipoMuro = new TipoMuro[3];// Inicializacion del Array de TipoMuro
  tipoMuro[0] = new TipoMuro((int)random(5, 10), 10, loadImage("muro1.png"));
  tipoMuro[1] = new TipoMuro((int)random(11, 20), 20, loadImage("muro2.png"));
  tipoMuro[2] = new TipoMuro((int)random(21, 31), 30, loadImage("muro3.png"));

  gestorMurallas.generarMuros(tipoMuro, 100, 550);// Generar muros usando el gestor de murallas
}

void draw() {
  background(50);//Fondo Gris Oscuro

  /* --- Si el Juego NO a Terminado --- */
  if (!gameOver) {
    tanque.display();//Mostrar Tanque
    gestorMurallas.display();//Mostrar Muros
    gestorMurallas.verificarColision(balas);//Colision entre Balas y Muros

    /* --- Establece el JOYPAD --- */
    if (joyPad.isLeft()) {//Mueve hacia La IZQUIERDA
      tanque.mover(-1);
    }
    if (joyPad.isRight()) {//Mueve hacia La DERECHA
      tanque.mover(1);
    }

    /* --- Establece las BALAS --- */
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bala bala = balas.get(i);
      bala.display();//Mostrar Bala
      bala.mover();//Mover Bala
      if (bala.fuera()) {//Si la bala esta fuera de la pantalla
        balas.remove(i);//Se elimina una bala
      }
    }

    // Si todos los muros han sido destruidos
    if (gestorMurallas.getMuro().isEmpty()) {
      gameOver = true;//El juego ha terminado
    }

    fill(255);
    textSize(20);
    text("Puntaje: " + puntaje, 20, 30);//Muestra el puntaje
    
  } else {//Si TERMINA el Juego

    background(229, 229, 229);
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("Juego Terminado", width / 2, height / 2 - 20);//Muestra un mensaje de JUEGO TERMINADO
    textSize(20);
    text("Puntaje Total: " + puntaje, width / 2, height / 2 + 20);//Muestra el Puntaje Final
  }
}

/* --- Al PRESIONAR una TECLA en el TECLADO --- */
void keyPressed() {
  if (key=='a'||key=='A'||keyCode==LEFT) {//IZQUIERDA
    joyPad.setLeft(true);
    joyPad.setRight(false);
  }

  if (key=='d'||key=='D'||keyCode==RIGHT) {//DERECHA
    joyPad.setLeft(false);
    joyPad.setRight(true);
  }
}

/* --- AL PRESIONAR una TECLA del MOUSE --- */
void mousePressed() {
  if (mouseButton==LEFT) {//DISPARA
    balas.add(tanque.disparar());
  }
}
