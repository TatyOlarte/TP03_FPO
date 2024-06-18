class ImageComponent {
  /* --- ATRIBUTOS --- */
  private PImage image;

  /* --- CONSTRUCTORES --- */
  public ImageComponent(PImage image) {
    this.image = image;
  }
  /* --- METODOS --- */
  //Metodo para VISUALIZAR la imagen en una Posicion
  public void displayImage(PVector posicion) {
    image(image, posicion.x, posicion.y);
  }

  //Metodo para VISUALIZAR la imagen en una Posicion y Dimensiones especificas
  public void displayImage(PVector posicion, int ancho, int alto) {
    image(image, posicion.x, posicion.y, ancho, alto);
  }

  /* --- METOPDOS ACCESORES --- */
  public PImage getImage() {
    return image;
  }
}
