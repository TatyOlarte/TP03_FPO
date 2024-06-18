class JoyPad {
  /* --- ATRIBUTOS --- */
  private boolean left;
  private boolean right;

  /* --- METODOS ACCESORES --- */
  public void setLeft(boolean state) {
    left = state;
  }

  public void setRight(boolean state) {
    right = state;
  }

  public boolean isLeft() {
    return left;
  }

  public boolean isRight() {
    return right;
  }
}
