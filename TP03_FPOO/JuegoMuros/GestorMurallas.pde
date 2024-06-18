class GestorMurallas {
  /* --- ATRIBUTOS --- */
  ArrayList<Muro> muros;//Array que almacena los Muros a generar
  int numFilas = 5; // Número de filas de Muros
  int numColumnas = 5; // Número de columnas de Muros
  int espacioEntreMuros = 10; // Espacio entre los Muros
  int anchoMuro = 50; // Ancho del muro
  int altoMuro = 30; // Alto del muro

  /* --- CONSTRUCTORES --- */
  public GestorMurallas() {
    muros = new ArrayList<Muro>();
  }

  /* --- METODOS --- */
  //Metodo para AGREGAR Muros al ArrayList
  void agregarMuro(Muro muro) {
    muros.add(muro);//Agrega un Muro al ArrayList muros
  }

  //Metodo para GENERAR los Muros
  void generarMuros(TipoMuro[] tiposMuro, int margenSuperior, int anchoTotal) {
    //Calcula el ancho total ocupado por los muros y los espacios entre ellos
    int anchoTotalMuros = numColumnas * anchoMuro + (numColumnas - 1) * espacioEntreMuros;
    //Calcula el punto de inicio x para centrar los muros
    int startX = (anchoTotal - anchoTotalMuros) / 2;

    for (int fila = 0; fila < numFilas; fila++) {
      for (int columna = 0; columna < numColumnas; columna++) {
        //Calcula posición del muro centrada
        float x = startX + columna * (anchoMuro + espacioEntreMuros);
        float y = fila * (altoMuro + espacioEntreMuros) + margenSuperior;

        //Escoge el tipo de muro aleatoriamente del Array tiposMuro
        int indiceTipoMuro = (int) random(tiposMuro.length);
        int resistencia = tiposMuro[indiceTipoMuro].getResistencia();
        int puntos = tiposMuro[indiceTipoMuro].getPuntaje();

        //Crear nuevo muro y lo agrega al gestor de murallas
        agregarMuro(new Muro(new Transform(new PVector(x, y)), new ImageComponent(tiposMuro[indiceTipoMuro].getImagen()), resistencia, puntos));
      }
    }
  }

  //Metodo para VISUALIZAR el Muro
  void display() {
    for (Muro muro : muros) {
      muro.display();
    }
  }

  //Metodo que VERIFICA la COLISION con las Balas
  void verificarColision(ArrayList<Bala> balas) {
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bala bala = balas.get(i);
      for (int j = muros.size() - 1; j >= 0; j--) {
        Muro muro = muros.get(j);
        if (muro.colision(bala)) {
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

  //Metodo que VERIFICA la COLISION de un nuevo muro con los existentes
  boolean colisionMuro(Muro nuevoMuro) {
    for (Muro muro : muros) {
      if (nuevoMuro.colision(muro)) {
        return true;
      }
    }
    return false;
  }

  /* --- METODOS ACCESORES --- */
  public ArrayList<Muro> getMuro() {//Metodo para obetener el ArrayList que almacena Muros
    return muros;
  }
}
