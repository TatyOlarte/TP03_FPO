class ImageComponent {
  private PImage image;

  public ImageComponent(PImage image) {
    this.image = image;
  }

  public void displayImage(PVector posicion) {
    image(image, posicion.x, posicion.y);
  }

  public void displayImage(PVector posicion, int ancho, int alto) {
    image(image, posicion.x, posicion.y, ancho, alto);
  }

  public PImage getImage() {
    return image;
  }
}
