class Tanque {
  /* --- ATRIBUTOS --- */
  private Transform transform;//Clase Transform
  private ImageComponent imagen;//Clase ImageComponent
  private PVector velocidad;//Velocidad del Tanque

  /* --- CONSTRUCTORES --- */
  public Tanque(Transform transform, ImageComponent imagen, PVector velocidad) {
    this.transform=transform;
    this.imagen=imagen;
    this.velocidad=velocidad;
  }

  /* --- METODOS --- */
  //Metodo para VISUALIZAR el tanque
  void display() {
    imageMode(CENTER);
    imagen.displayImage(transform.posicion, 250, 250);
  }

  //Metodo para MOVER el Tanque
  void mover(float dx) {
    transform.posicion.x += dx * velocidad.x * Time.getDeltaTime(frameRate);//Implementacion del DeltaTime
    transform.posicion.x = constrain(transform.posicion.x, 20, width - 20);//Para que no salga de la pantalla
  }

  //Metodo para DISPARAR las Balas
  Bala disparar() {
    PVector posicionBala = new PVector(transform.posicion.x - 2, transform.posicion.y - 60);//POsicion Inicial de la Bala
    return new Bala(new Transform(posicionBala), new PVector(0, -100));//Inicializacion de la Clase Bala
  }
}
