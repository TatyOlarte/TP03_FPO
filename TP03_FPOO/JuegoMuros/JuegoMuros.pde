/* --- ATRIBUTOS --- */
private Tanque tanque;//Clase Tanque
private GestorMurallas gestorMurallas;//Clase GestorMurallas
private JoyPad joyPad;//JoyPad
private ArrayList<Bala> balas;//ArrayList de Bala
private int puntaje;//Puntaje
private TipoMuro[] tipoMuro;//Array de TipoMuro

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
  background(0);//Fondo Negro

  tanque.display();//Llama al metodo display() de Tanque
  gestorMurallas.display();//Llama al metodo displa() de GestorMurallas
  gestorMurallas.verificarColision(balas);//Llama a la colision de GestorMurallas con Balas

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
    bala.display();//Llama al metodo display() de Bala
    bala.mover();//Mueve al metodo mover() de Bala
    if (bala.fuera()) {//Si la bala esta fuera de la pantalla
      balas.remove(i);//Se elimina una bala
    }
  }

  fill(255);
  textSize(20);
  text("Balas:" + balas.size(), 150, 30);
  text("Puntaje: " + puntaje, 50, 30);//Muestra el buntaje obtenido durante la partida
}

/* --- Al PRESIONAR una TECLA --- */
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
