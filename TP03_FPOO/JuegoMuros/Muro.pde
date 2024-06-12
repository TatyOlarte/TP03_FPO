class Muro {
  /* --- ATRIBUTOS --- */
  private Transform transform;
  private ImageComponent imagen;
  private int resistencia;
  private int puntaje;

  /* --- METODOS --- */
  public Muro(Transform transform/*, ImageComponent imagen*/, int resistencia, int puntaje) {
    this.transform = transform;
    //this.imagen = imagen;
    this.resistencia = resistencia;
    this.puntaje = puntaje;
  }

  void display() {
    visualizarMuro();
    mostrarResistencia();
  }

  void visualizarMuro() {
    //imagen.displayImage(transform.posicion);
    noStroke();
    fill(63, 165, 105);
    ellipse(transform.posicion.x, transform.posicion.y, 50, 50);
  }

  void mostrarResistencia() {
    fill(255);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(resistencia, transform.posicion.x, transform.posicion.y);
  }

  boolean colision(float bx, float by) {
    return bx >= transform.posicion.x && bx <= transform.posicion.x + 50/*+ imagen.image.width*/ &&
      by >= transform.posicion.y && by <= transform.posicion.y + 50/*+ imagen.image.height*/;
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
