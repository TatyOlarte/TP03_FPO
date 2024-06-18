class Bala extends Collider {

  /* --- ATRIBUTOS --- */
  private Transform transform;//Clase Transform
  private PVector velocidad;//Alamacena la Velocidad de la bala

  /* --- CONSTRUCTORES --- */
  public Bala(Transform transform, PVector velocidad) {
    super(5, 5, transform.posicion);//Hereda de Collider Ancho, Alto y Posicion
    this.transform=transform;
    this.velocidad=velocidad;
  }

  /* --- METODOS --- */
  //Metodo para VISUALIZAR la Bala
  void display() {
    noStroke();
    fill(209, 152, 27);
    rect(transform.posicion.x, transform.posicion.y, getAncho(), getAlto());
  }

  //Metodo para MOVER la Bala
  void mover() {
    transform.posicion.add(PVector.mult(velocidad, Time.getDeltaTime(frameRate)));//se implemeta el uso de DeltaTime
  }

  //Metodo que verifica si la Bala esta feura de la Pantalla
  boolean fuera() {
    return transform.posicion.y < 0;
  }
}
