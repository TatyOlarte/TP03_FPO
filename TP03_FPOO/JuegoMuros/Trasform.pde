class Transform {
  /* --- ATRIBUTOS --- */
  private PVector posicion;

  /* --- CONSTRUCTORES --- */
  public Transform(PVector posicion) {
    this.posicion = posicion;
  }

  /* --- METODOS ACCESORES --- */
  public PVector getPosicion() {
    return this.posicion;
  }

  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
}
