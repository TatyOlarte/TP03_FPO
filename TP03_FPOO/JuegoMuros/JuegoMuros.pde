private Tanque tanque;
private GestorMurallas gestorMurallas;
private JoyPad joyPad;
private ArrayList<Bala> balas;
private int puntaje;
private PImage[] obtenerImagen;
private int[][] tipoMuro = {
  {(int)random(5, 10), 10, 1},
  {(int)random(11, 20), 20, 2},
  {(int)random(21, 31), 30, 3} };

int numFilas = 5;     // Número de filas de muros
int numColumnas = 5;  // Número de columnas de muros
int espacioEntreMuros = 10;  // Espacio entre los muros
int anchoMuro = 50;   // Ancho del muro
int altoMuro = 30;    // Alto del muro

void setup(){
 size(500, 500);
  tanque = new Tanque(new Transform(new PVector(width/2, height - 50))/*, new ImageComponent("")*/, new PVector(100, 100));
  gestorMurallas = new GestorMurallas();
  joyPad = new JoyPad();
  balas = new ArrayList<Bala>();
  puntaje = 0;
  
  obtenerImagen = new PImage[tipoMuro.length];
   for (int i = 0; i < tipoMuro.length; i++) {
   int tipoImagen = tipoMuro[i][2];
   obtenerImagen[i] = loadImage("muro" + tipoImagen + ".png");
   }

   // Calcular el ancho total ocupado por los muros
   int anchoTotalMuros = numColumnas * anchoMuro + (numColumnas - 1) * espacioEntreMuros;
   // Calcular el punto de inicio x para centrar los muros
   int startX = (550 - anchoTotalMuros) / 2;
   
   for (int fila = 0; fila < numFilas; fila++) {
   for (int columna = 0; columna < numColumnas; columna++) {
   // Calcular posición del muro centrada
   float x = startX + columna * (anchoMuro + espacioEntreMuros);
   float y = fila * (altoMuro + espacioEntreMuros) + 100;  // Empieza a partir de y=100
   
   // Escoger tipo de muro aleatoriamente del array tipoMuro
   int indiceTipoMuro = floor(random(tipoMuro.length));
   int resistencia = tipoMuro[indiceTipoMuro][0];
   int puntos = tipoMuro[indiceTipoMuro][1];
   
   // Crear nuevo muro y agregarlo al gestor de muros
   gestorMurallas.agregarMuro(new Muro(new Transform(new PVector(x, y)), new ImageComponent(obtenerImagen[indiceTipoMuro]), resistencia, puntos));
   }
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
    bala.display();
    bala.mover();
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
  if (key=='a'||key=='A'||keyCode==LEFT) {
    joyPad.setLeft(true);
    joyPad.setRight(false);
  }

  if (key=='d'||key=='D'||keyCode==RIGHT) {
    joyPad.setLeft(false);
    joyPad.setRight(true);
  }
}

void mousePressed() {
  if (mouseButton==LEFT) {
    balas.add(tanque.disparar());
  }
}
