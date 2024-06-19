class Insecto extends Animal {
  /* --- CONSTRUCTORES --- */
  public Insecto(PVector posicion) {
    super(posicion, loadImage("insecto.png"));
    this.ancho = 50;
    this.alto = 50;
  }
  /* --- METODOS --- */
  //* Metodo para visualizar la imagen del Insecto
  public void display() {
    image(imagen, posicion.x, posicion.y, this.ancho, this.alto);
    dibujarLimites();
  }
//* Metodo para verificar la colision
  public boolean verificarColision(Snake snake) {
    // Coordenadas del SNAKE
    float snakeLeft = snake.getPosicion().x;
    float snakeRight = snake.getPosicion().x + snake.getAncho();
    float snakeTop = snake.getPosicion().y;
    float snakeBottom = snake.getPosicion().y + snake.getAlto();
    // Coordenadas del ANIMAL
    float animalLeft = this.posicion.x;
    float animalRight = this.posicion.x + this.ancho;
    float animalTop = this.posicion.y;
    float animalBottom = this.posicion.y + this.alto;
    // Comprueba si hay solapamiento entre las coordenadas
    if (snakeRight >= animalLeft && snakeLeft <= animalRight &&
      snakeBottom >= animalTop && snakeTop <= animalBottom) {
      // Hay colisión
      return true;
    } else {
      // No hay colisión
      return false;
    }
  }

  public void dibujarLimites() {
    noFill();
    rectMode(CENTER);
    stroke(#4FD859);
    rect(posicion.x, posicion.y, this.ancho-23, this.alto-23);
  }
}
