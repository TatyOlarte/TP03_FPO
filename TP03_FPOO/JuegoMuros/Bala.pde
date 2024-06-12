class Bala {
  /* --- ATRIBUTOS --- */
  private Transform transform;
  private ImageComponent imagen;
  private PVector velocidad;

  /* --- METODOS --- */
  public Bala(Transform transform, /*ImageComponent imagen,*/ PVector velocidad) {
    this.transform=transform;
    //this.imagen=imagen;
    this.velocidad=velocidad;
  }

  void mover() {
    transform.posicion.add(PVector.mult(velocidad, Time.getDeltaTime(frameRate)));
  }

  void display() {
    visualizarBala();
  }

  void visualizarBala() {
    //imagen.displayImage(transform.posicion);
    noStroke();
    fill(232, 30, 81);
    rect(transform.posicion.x, transform.posicion.y, 10, 10);
  }

  boolean fuera() {
    return transform.posicion.y < 0;
  }
}
