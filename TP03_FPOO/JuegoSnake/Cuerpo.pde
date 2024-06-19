class Cuerpo {
  private PVector posicion;
  private PImage cuerpo;

  public Cuerpo() {
  }
  
  public Cuerpo(PVector posicion){
    this.posicion = posicion;
    this.cuerpo = loadImage("cuerpo.png");
    cuerpo.resize(50,50);
  }

  public void dibujarCuerpo() {
    image(cuerpo, posicion.x, posicion.y); 
  }
  
  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }

  public PVector getPosicion() {
    return posicion;
  }
}
