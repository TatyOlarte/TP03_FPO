private Escenario escenario;
private Snake snake;
private JoyPad joyPad;
private SpawnAnimal spawn;

void setup() {
  size(600, 600);
  frameRate(40); // La velocidad de Frames por Segundo
  escenario = new Escenario();
  Cabeza cabeza = new Cabeza("cabezaUp.png", "cabezaDown.png", "cabezaLeft.png", "cabezaRight.png"); // Inicializacion de la clase Cabeza
  snake = new Snake(new PVector(width/2, height/2), new PVector(80, 80), 0, cabeza); // inicilizacion de la clase Snake
  joyPad = new JoyPad(); // Inicializacion de la clase JoyPad para el movimiento
  spawn = new SpawnAnimal();
}

void draw() {
  background(#4FD859);
  /* --- VISUALIZACIONES --- */
  snake.display();
  spawn.visualizarAnimales();
  escenario.display();
  
  // Lista temporal para almacenar los animales colisionados
  ArrayList<Animal> colisiones = new ArrayList<Animal>();
  
/* --- COLISION --- */
  //Detecta las colisiones entre el snake y los animales
  for (Animal animal : spawn.getAnimales()) {
    if (snake.verificarColision(animal)) {
      colisiones.add(animal);
    }
  }
  
  //Manejar colisiones
  for (Animal animal : colisiones) {
    spawn.getAnimales().remove(animal); // Eliminar el animal de la lista de spawn
    spawn.generarAnimales(); // Generar nuevos animales
    snake.crecer(); // Hacer crecer la serpiente
  }

  /* --- JOYPAD --- */
  if (joyPad.IsUp()) {
    snake.mover(1);
  }
  if (joyPad.IsDown()) {
    snake.mover(2);
  }
  if (joyPad.IsLeft()) {
    snake.mover(3);
  }
  if (joyPad.IsRight()) {
    snake.mover(4);
  }
}

void keyReleased() {
  /* --- CONTROL JOYPAD --- */
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
