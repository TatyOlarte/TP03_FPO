class Tanque extends Collider {
  /* --- ATRIBUTOS --- */
  private Transform transform;
  private ImageComponent imagen;
  private PVector velocidad;

  /* --- METODOS --- */
  public Tanque(Transform transform/*, ImageComponent imagen*/, PVector velocidad) {
    this.transform=transform;
    // this.imagen=imagen;
    this.velocidad=velocidad;
  }

  void display() {
    visualizarTanque();
  }

  void visualizarTanque() {
    //imagen.displayImage(transform.posicion);
    noStroke();
    fill(100, 63, 165);
    rect(transform.posicion.x, transform.posicion.y, 40, 40);
  }

  void mover(float dx) {
    transform.posicion.x += dx * velocidad.x * Time.getDeltaTime(frameRate);
    transform.posicion.x = constrain(transform.posicion.x, 0, width - 40); //para que no salga de la pantalla
  }

  Bala disparar() {
    PVector posicionBala = new PVector(transform.posicion.x + 15 /*+ imagen.image.width / 2*/, transform.posicion.y - 10);
    return new Bala(new Transform(posicionBala)/*, new ImageComponent("")*/, new PVector(0, -100));
  }
}
