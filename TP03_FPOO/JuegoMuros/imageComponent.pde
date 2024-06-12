class ImageComponent {
  private PImage image;

  public ImageComponent(String path) {
    image = loadImage("path");
  }

  public void displayImage(PVector posicion) {
    image(image, posicion.x, posicion.y);
  }

  public void displayImage(PVector posicion, int ancho, int alto) {
    image(image, posicion.x, posicion.y, ancho, alto);
  }
}
