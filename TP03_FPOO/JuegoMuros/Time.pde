static class Time {
  /* METODOS */
  //* Metodo estatico para calcular el DeltaTime
  static float getDeltaTime(float frame) {
    int framePorSegundo = round(frame);
    float deltaTime = 1.0/framePorSegundo;
    return deltaTime;
  }
}
