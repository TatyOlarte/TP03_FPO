class Muro extends Collider {
  /* --- ATRIBUTOS --- */
  private Transform transform;
  private ImageComponent imagen;
  private int resistencia;
  private int puntaje;

  /* --- CONSTRUCTORES --- */
  public Muro(Transform transform, ImageComponent imagen, int resistencia, int puntaje) {
    super(50, 30, transform.posicion);
    this.transform = transform;
    this.imagen = imagen;
    this.resistencia = resistencia;
    this.puntaje = puntaje;
  }

  /* --- METODOS --- */
  //Metodo para visualizar el Muro
  void display() {
    imageMode(CENTER);
    imagen.displayImage(transform.posicion, 60, 60);
  }

  //Metodo para quitar bajo 10 puntos la resistencia del Muro
  void debilitar(int puntos) {
    resistencia -= puntos;
  }

  //Metodo para destruir el Muro cuando ya no tiene resistencia
  boolean destruido() {
    return resistencia <= 0;
  }

  /* --- METODOS ACCESORES --- */
  int getPuntaje() {
    return puntaje;
  }
}
