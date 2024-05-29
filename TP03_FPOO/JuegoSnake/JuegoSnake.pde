private Escenario escenario;
private Snake snake;
private JoyPad joyPad;
private SpawnAnimal spawn;
float lastTime;
int estado = MaquinaEstados.PantallaInicio;
PImage inicio;

void setup() {
  size(600, 600);
  frameRate(60); // La velocidad de Frames por Segundo
  escenario = new Escenario();
  Cabeza cabeza = new Cabeza("cabezaUp.png", "cabezaDown.png", "cabezaLeft.png", "cabezaRight.png"); // Inicializacion de la clase Cabeza
  snake = new Snake(new PVector(width/2, height/2), new PVector(100, 100), cabeza); // inicilizacion de la clase Snake
  joyPad = new JoyPad(); // Inicializacion de la clase JoyPad para el movimiento
  spawn = new SpawnAnimal();
  lastTime = millis(); // Guarda el tiempo actual de la variable lastTime
  inicio = loadImage("InicioSnake.png");
}
void draw() {
  background(0);
  /* --- CALCULO DELTATIME --- */
  float currentTime = millis(); //Obtiene el tiempo actual
  float deltaTime = (currentTime - lastTime) / 1000.0; //Calcula el tiempo desde el ultimo Frame
  lastTime = currentTime; //Se actualiza el valor del lastTime para el proximo ciclo
  /* --- JOYPAD --- */
  if (estado == MaquinaEstados.Jugando) {
    if (joyPad.IsUp()) {
      snake.mover(1, deltaTime);
    }
    if (joyPad.IsDown()) {
      snake.mover(2, deltaTime);
    }
    if (joyPad.IsLeft()) {
      snake.mover(3, deltaTime);
    }
    if (joyPad.IsRight()) {
      snake.mover(4, deltaTime);
    }
  }
  /* --- MAQUINA ESTADOS --- */
  switch(estado) {
  case MaquinaEstados.PantallaInicio:
    image(inicio, 0, 0, 600, 600);
    textSize(25);
    fill(68,90,64);
    text("Press ENTER", width/2, 400);
    textAlign(CENTER);
    break;
  case MaquinaEstados.Jugando:
    spawn.visualizarAnimales();
    escenario.display();
    break;
  case MaquinaEstados.PantallaGanador:
    break;
  case MaquinaEstados.PantallaPerdedor:
    break;
  case MaquinaEstados.PantallaPausa:
    text("Snake", width/2, 50);
    text("Pulsa 'P' para continuar", width/2, 80);
    textAlign(CENTER);
    break;
  }
}

void keyReleased() {
  //Pantalla Inicio
  if (keyCode==ENTER && (estado == MaquinaEstados.PantallaInicio ||
    estado == MaquinaEstados.PantallaGanador ||
    estado == MaquinaEstados.PantallaPerdedor)) {
    estado = MaquinaEstados.Jugando;
  }
  //Pantalla Pausa
  if (key=='p'||key=='P') {
    if (estado == MaquinaEstados.Jugando) {
      estado = MaquinaEstados.PantallaPausa;
    } else if (estado == MaquinaEstados.PantallaPausa) {
      estado = MaquinaEstados.Jugando;
    }
  }
  //Control JoyPad
  if (estado == MaquinaEstados.Jugando) {
    if (key=='w'||key=='W'||keyCode==UP) { //Arriba
      joyPad.setUp(true);
      joyPad.setDown(false);
      joyPad.setLeft(false);
      joyPad.setRight(false);
    }

    if (key=='s'||key=='S'||keyCode==DOWN) { //Abajo
      joyPad.setDown(true);
      joyPad.setUp(false);
      joyPad.setLeft(false);
      joyPad.setRight(false);
    }

    if (key=='a'||key=='A'||keyCode==LEFT) { //Izquierda
      joyPad.setLeft(true);
      joyPad.setUp(false);
      joyPad.setDown(false);
      joyPad.setRight(false);
    }

    if (key=='d'||key=='D'||keyCode==RIGHT) { //Derecha
      joyPad.setRight(true);
      joyPad.setUp(false);
      joyPad.setDown(false);
      joyPad.setLeft(false);
    }
  }
}
