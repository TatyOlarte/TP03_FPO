class Raton extends Animal {
  /* --- CONSTRUCTORES --- */
  public Raton(PVector posicion) {
    super(posicion, loadImage("raton.png"));
  }
  /* --- METODOS --- */
  //* Metodo para visualizar la imagen del Raton
  public void display() {
    image(imagen, posicion.x, posicion.y, 50, 50);
  }
}
