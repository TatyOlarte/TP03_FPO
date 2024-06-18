class TipoMuro {
  /* --- ATRIBUTOS --- */
  private int resistencia;//Resistencia del muro
  private int puntaje;//Puntaje del muro
  private PImage imagen;//Imagen que representa el muro

  /* --- CONSTRUCTORES --- */
  public TipoMuro(int resistencia, int puntaje, PImage imagen) {
    this.resistencia = resistencia;
    this.puntaje = puntaje;
    this.imagen = imagen;
  }

  /* --- METODOS ACCESORES --- */
  public PImage getImagen() {
    return this.imagen;
  }

  public int getResistencia() {
    return this.resistencia;
  }

  public int getPuntaje() {
    return this.puntaje;
  }
}
