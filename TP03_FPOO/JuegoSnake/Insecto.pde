class Insecto extends Animal {
  /* --- CONSTRUCTORES --- */
  public Insecto(PVector posicion) {
    super(posicion, loadImage("insecto.png"));
  }
  /* --- METODOS --- */
  //* Metodo para visualizar la imagen del Insecto
  public void display() {
    image(imagen, posicion.x, posicion.y, 50, 50);
  }
}
