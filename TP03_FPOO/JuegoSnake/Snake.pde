class Snake extends Collider {
  private PVector posicion;
  private PVector velocidad;
  private int puntaje;
  private Cabeza cabeza;
  private ArrayList<Cuerpo> cuerpo; // Lista para almacenar los segmentos del cuerpo
  private float tamanoSegmento; // Tamaño de cada segmento del cuerpo
  private ArrayList<PVector> colaPosiciones; // Cola para almacenar las posiciones de la cabeza

  /* --- CONSTRUCTORES --- */
  public Snake() {
  }

  public Snake(PVector posicion, PVector velocidad, int puntaje, Cabeza cabeza) {
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.cabeza = cabeza;
    this.puntaje = puntaje;
    this.ancho = 50;
    this.alto = 50;
    this.cuerpo = new ArrayList<Cuerpo>();
    this.tamanoSegmento = 70;
    this.colaPosiciones = new ArrayList<PVector>();
  }
  /* --- METODOS --- */
  void display() {
    dibujar();
  }
  //* Metodo para dibujar la Cabeza
  public void dibujar() {
    imageMode(CENTER);
    cabeza.visualizarCabeza(posicion, ancho, alto);
    
    for (Cuerpo segmento : cuerpo) {
      segmento.dibujarCuerpo();
    }
    dibujarLimites();
  }

  public void dibujarLimites() {
    noFill();
    rectMode(CENTER);
    stroke(#4FD859);
    rect(posicion.x, posicion.y, ancho, alto);
  }

  public boolean verificarColision(Animal animal) {
    // Llama al método de colisión específico del animal
    return animal.verificarColision(this);
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
    
        // Guarda la posición previa de la cabeza
    PVector prevPos = posicion.copy();
          // Agregar la nueva posición de la cabeza a la cola de posiciones
      colaPosiciones.add(prevPos);


    // Actualiza la posición de cada segmento del cuerpo
    for (int i = 0; i < cuerpo.size(); i++) {
      int index = colaPosiciones.size() - 1 - (i * (int)(tamanoSegmento / movimiento.mag()));
      if (index >= 0 && index < colaPosiciones.size()) {
        cuerpo.get(i).setPosicion(colaPosiciones.get(index));
      }
    }
  }
  
  public void crecer() {
    PVector nuevaPosicion= posicion.copy();
    if (cuerpo.size() == 0) { 
      nuevaPosicion.y += tamanoSegmento;
    } else {
      // Obtener la posición del último segmento y agregar un nuevo segmento detrás de él
      Cuerpo ultimoSegmento = cuerpo.get(cuerpo.size() - 1);
      nuevaPosicion = ultimoSegmento.getPosicion().copy();
    }
    cuerpo.add(new Cuerpo(nuevaPosicion));
    puntaje++;
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
  
  public int getPuntaje() {
    return this.puntaje;
  }
}
