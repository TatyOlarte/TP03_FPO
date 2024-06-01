class Pajaro extends Animal {
  /* --- CONSTRUCTORES --- */
  public Pajaro(PVector posicion) {
    super(posicion, loadImage("pajaro.png"));
  }
  /* --- METODOS --- */
  //* Metodo para visualizar la imagen del Pajaro
  public void display() {
    image(imagen, posicion.x, posicion.y, 50, 50);
  }
}
