class Tanque {
  /* --- ATRIBUTOS --- */
  private Transform transform;
  private ImageComponent imagen;
  private PVector velocidad;

  /* --- CONSTRUCTORES --- */
  public Tanque(Transform transform, ImageComponent imagen, PVector velocidad) {
    this.transform=transform;
    this.imagen=imagen;
    this.velocidad=velocidad;
  }

  /* --- METODOS --- */
  //Metodo para visualizar el tanque
  void display() {
    imageMode(CENTER);
    imagen.displayImage(transform.posicion, 250, 250);
  }

  //Metodo para mover el Tanque
  void mover(float dx) {
    transform.posicion.x += dx * velocidad.x * Time.getDeltaTime(frameRate);//Implementacion del DeltaTime
    transform.posicion.x = constrain(transform.posicion.x, 20, width - 20);//Para que no salga de la pantalla
  }

  //Metodo para disparar las Balas
  Bala disparar() {
    PVector posicionBala = new PVector(transform.posicion.x - 2, transform.posicion.y - 60);//POsicion Inicial de la Bala
    return new Bala(new Transform(posicionBala), new PVector(0, -100));//Inicializacion de la Clase Bala
  }
}
