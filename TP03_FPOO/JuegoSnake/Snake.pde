class Snake extends Collider {
  private PVector posicion;
  private PVector velocidad;
  private Cabeza cabeza;

  /* --- CONSTRUCTORES --- */
  public Snake() {
    posicion = new PVector();
    velocidad = new PVector();
    this.ancho = 50;
    this.alto = 50;
  }

  public Snake(PVector posicion, PVector velocidad, Cabeza cabeza) {
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.cabeza = cabeza;
    this.ancho = 50;
    this.alto = 50;
  }
  /* --- METODOS --- */
  void display() {
    dibujar();
  }
  //* Metodo para dibujar la Cabeza
  public void dibujar() {
    imageMode(CENTER);
    cabeza.visualizarCabeza(posicion, ancho, alto);
    dibujarLimites();
  }

  public void dibujarLimites() {
    noFill();
    rectMode(CENTER);
    stroke(255, 0, 0);
    rect(posicion.x, posicion.y, ancho, alto);
  }

  public boolean verificarColision(Animal animal) {
    // Llama al método de colisión específico del animal
    return animal.verificarColision(this);
  }

  public void actualizarPuntaje() {
  }
  //* Metodo para mover al Snake
  public void mover(int direccion) {
    //Implementacion DelaTime en el movimiento del Snake
    PVector movimiento = PVector.mult(velocidad, Time.getDeltaTime(frameRate));
    cabeza.setDireccion(direccion);

    switch(direccion) {
    case 1: //ARRIBA
      if (posicion.y - movimiento.y >= 20) {
        this.posicion.y -= movimiento.y;
      }
      break;
    case 2: //ABAJO
      if (posicion.y + movimiento.y <= height - 20) {
        this.posicion.y += movimiento.y;
      }
      break;
    case 3: //IZQUIERDA
      if (posicion.x - movimiento.x >= 20) {
        this.posicion.x -= movimiento.x;
      }
      break;
    case 4: //DERECHA
      if (posicion.x + movimiento.x <= width - 20) {
        this.posicion.x += movimiento.x;
      }
      break;
    }
  }
  /* --- METODOS ACCESORES --- */
  public PVector getPosicion() {
    return this.posicion;
  }

  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }

  public PVector getVelocidad() {
    return this.velocidad;
  }

  public void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;
  }
}
