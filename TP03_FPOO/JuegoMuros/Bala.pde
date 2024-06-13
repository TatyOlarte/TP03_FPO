class Bala extends Collider {
  /* --- ATRIBUTOS --- */
  private Transform transform;
  private ImageComponent imagen;
  private PVector velocidad;

  /* --- METODOS --- */
  public Bala(Transform transform, /*ImageComponent imagen,*/ PVector velocidad) {
    super(10, 10, transform.posicion);
    this.transform=transform;
    //this.imagen=imagen;
    this.velocidad=velocidad;
  }

  void mover() {
    transform.posicion.add(PVector.mult(velocidad, Time.getDeltaTime(frameRate)));
  }

  void display() {
    visualizarBala();
    mostrarLimite();
  }

  void visualizarBala() {
    //imagen.displayImage(transform.posicion);
    noStroke();
    fill(232, 30, 81);
    rect(transform.posicion.x, transform.posicion.y, getAncho(), getAlto());
  }

  void mostrarLimite() {
    rectMode(CENTER);
    noFill();
    stroke(0, 255, 0);
    rect(transform.posicion.x, transform.posicion.y, getAncho(), getAlto());
  }

  boolean fuera() {
    return transform.posicion.y < 0;
  }
}
