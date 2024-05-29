class Snake {
  private PVector posicion;
  private PVector velocidad;
  private Cabeza cabeza;
/* --- CONSTRUCTORES --- */
  public Snake() {
    posicion = new PVector();
    velocidad = new PVector();
  }

  public Snake(PVector posicion, PVector velocidad, Cabeza cabeza) {
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.cabeza = cabeza;
  }
/* --- METODOS --- */
  void display() {
    dibujar();
  }

  public void dibujar() {
    imageMode(CENTER);
    cabeza.visualizarCabeza(posicion, 50, 50);
  }

  public void comerAnimal() {
  }

  public void actualizarPuntaje() {
  }

  public void mover(int direccion, float deltaTime) {
    PVector movimiento = PVector.mult(velocidad, deltaTime); 
    cabeza.setDireccion(direccion);

    switch(direccion) {
    case 1: //---> Arriba
      if (posicion.y - movimiento.y >= 20) {
        this.posicion.y -= movimiento.y;
      }
      break;
    case 2: //---> Abajo
      if (posicion.y + movimiento.y <= height - 20) {
        this.posicion.y += movimiento.y;
      }
      break;
    case 3: //---> Izquierda
      if (posicion.x - movimiento.x >= 20) {
        this.posicion.x -= movimiento.x;
      }
      break;
    case 4: //---> Derecha
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
