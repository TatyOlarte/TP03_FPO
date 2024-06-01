class Cabeza {
  private PImage snakeUp;
  private PImage snakeDown;
  private PImage snakeLeft;
  private PImage snakeRight;
  private PImage imgActual;
  /* --- CONSTRUCTORES --- */
  public Cabeza(String pathUp, String pathDown, String pathLeft, String pathRight) {
    snakeUp = loadImage(pathUp);
    snakeDown = loadImage(pathDown);
    snakeLeft = loadImage(pathLeft);
    snakeRight = loadImage(pathRight);
    imgActual = snakeUp;
  }
  /* --- METODOS --- */
  //* Metodo para visualizar la cabeza del Snake
  public void visualizarCabeza(PVector posicion, int ancho, int alto) {
    image(imgActual, posicion.x, posicion.y, ancho, alto);
  }
  //* Metodo donde se estabece la direccion hacia donde miraria la Cabeza
  public void setDireccion(int direccion) {
    switch(direccion) {
    case 1:
      imgActual = snakeUp;//ARRIBA
      break;
    case 2:
      imgActual = snakeDown;//ABAJO
      break;
    case 3:
      imgActual = snakeLeft;//IZQUIERDA
      break;
    case 4:
      imgActual = snakeRight;//DERECHA
      break;
    }
  }
}
