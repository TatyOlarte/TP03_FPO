class Muro extends Collider {
  /* --- ATRIBUTOS --- */
  private Transform transform;
  private ImageComponent imagen;
  private int resistencia;
  private int puntaje;

  /* --- METODOS --- */
  public Muro(Transform transform, ImageComponent imagen, int resistencia, int puntaje) {
    super(50, 30, transform.posicion);
    this.transform = transform;
    this.imagen = imagen;
    this.resistencia = resistencia;
    this.puntaje = puntaje;
  }

  void display() {
    imageMode(CENTER);
    imagen.displayImage(transform.posicion, 60, 60);
    mostrarResistencia();
    mostrarLimites();
  }

  void mostrarLimites() {
    rectMode(CENTER);
    noFill();
    stroke(255, 0, 0);
    rect(transform.posicion.x, transform.posicion.y, getAncho(), getAlto());
  }

  void mostrarResistencia() {
    fill(255);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(resistencia, transform.posicion.x + 20, transform.posicion.y + 20);
  }

  void debilitar(int puntos) {
    resistencia -= puntos;
  }

  boolean destruido() {
    return resistencia <= 0;
  }
  
  /* --- METODOS ACCESORES --- */
  int getPuntaje() {
    return puntaje;
  }
}
