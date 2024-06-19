class Escenario {
  private int tiempo;
  private int tiempoInicial;
  /* --- CONSTRUCTORES --- */
  public Escenario() {
    tiempoInicial = millis();
  }
  
  /* --- METODOS --- */
  public void display() {
    visualizarEscenario();
  }
  //* Metodo para visualizar el Escenario
  public void visualizarEscenario() {
    snake.display();
    mostrarPuntaje();
    mostrarTiempo();
  }

  public void mostrarPuntaje() {
    textSize(20);
    fill(255);
    textAlign(LEFT);
    text("Puntaje: " + snake.getPuntaje(), 120, 20);
  }
  //* Metodo que establece y visualiza el Tiempo Trascurrido
  public void mostrarTiempo() {
    textSize(20);
    fill(255);
    textAlign(LEFT);
    if (joyPad.up==true||joyPad.down==true||joyPad.left==true||joyPad.right==true) {
      tiempo = (millis() - tiempoInicial) / 1000;// Calcula el tiempo transcurrido en segundos
    }
    text("Tiempo: " + tiempo + "s", 10, 20);
  }
}
