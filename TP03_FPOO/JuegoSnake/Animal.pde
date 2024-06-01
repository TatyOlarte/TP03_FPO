abstract class Animal {
  protected PVector posicion;
  protected PImage imagen;
  /* --- CONSTRUCTORES --- */
  //* Metodo para inicializar la Posicion e Imagen del Animal
  public Animal(PVector posicion, PImage imagen) {
    this.posicion = posicion;
    this.imagen = imagen;
  }
  /* --- METODOS --- */
  //* Metodo display abstracto
  abstract void display();
  /* --- METODOS ACCESORES --- */
  public PVector getPosicion() {
    return posicion;
  }
}
