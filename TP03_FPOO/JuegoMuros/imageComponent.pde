class ImageComponent {
  /* --- ATRIBUTOS --- */
  private PImage image;

  /* --- CONSTRUCTORES --- */
  public ImageComponent(PImage image) {
    this.image = image;
  }
  /* --- METODOS --- */
  public void displayImage(PVector posicion) {
    image(image, posicion.x, posicion.y);
  }

  public void displayImage(PVector posicion, int ancho, int alto) {
    image(image, posicion.x, posicion.y, ancho, alto);
  }

  /* --- METOPDOS ACCESORES --- */
  public PImage getImage() {
    return image;
  }
}
