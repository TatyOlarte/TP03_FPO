class TipoMuro {
  /* --- ATRIBUTOS --- */
  private int resistencia;
  private int puntaje;
  private PImage imagen;

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
