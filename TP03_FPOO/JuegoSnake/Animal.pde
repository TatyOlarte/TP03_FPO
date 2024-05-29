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
//* Metodo para Visualizar al Animal en la Pantalla
  public void display(){
  image(imagen,posicion.x,posicion.y, 50, 50);
  }
/* --- METODOS ACCESORES --- */
  public PVector getPosicion(){
    return posicion;
  }
}
