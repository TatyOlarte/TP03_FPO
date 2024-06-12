class GestorMurallas {
  /* --- ATRIBUTOS --- */
  ArrayList<Muro> muros;

  /* --- METODOS --- */
  public GestorMurallas() {
    muros = new ArrayList<Muro>();
  }

  void agregarMuro(Muro muro) {
    muros.add(muro);
  }

  void display() {
    for (Muro muro : muros) {
      muro.display();
    }
  }

  void verificarColision(ArrayList<Bala> balas) {
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bala bala = balas.get(i);
      for (int j = muros.size() - 1; j >= 0; j--) {
        Muro muro = muros.get(j);
        if (muro.colision(bala.transform.posicion.x, bala.transform.posicion.y)) {
          muro.debilitar(10);
          balas.remove(i);
          if (muro.destruido()) {
            puntaje += muro.getPuntaje();
            muros.remove(j);
          }
          break;
        }
      }
    }
  }
}
