class Muro extends Collider {
  /* --- ATRIBUTOS --- */
  private Transform transform;//Clase Transform
  private ImageComponent imagen;//Clase ImageComponent
  private int resistencia;//Resistencia de cada Muro
  private int puntaje;//Puntaje de cada Muro

  /* --- CONSTRUCTORES --- */
  public Muro(Transform transform, ImageComponent imagen, int resistencia, int puntaje) {
    super(50, 30, transform.posicion);//Hereda de Collider Ancho, Alto y Posicion
    this.transform = transform;
    this.imagen = imagen;
    this.resistencia = resistencia;
    this.puntaje = puntaje;
  }

  /* --- METODOS --- */
  //Metodo para VISUALIZAR el Muro
  void display() {
    imageMode(CENTER);
    imagen.displayImage(transform.posicion, 60, 60);
  }

  //Metodo para debilitar el Muro
  void debilitar(int puntos) {
    resistencia -= puntos;
  }

  //Metodo para verificar si el Muro esta DESTRUIDO
  boolean destruido() {
    return resistencia <= 0;
  }

  /* --- METODOS ACCESORES --- */
  int getPuntaje() {
    return puntaje;
  }
}
