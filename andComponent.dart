class And {
  static int bitInverse(int bit) => (bit == 1) ? 0 : 1;

  int operationAnd(int bitA, int bitB) => (bitA == 0 || bitB == 0) ? 0 : 1;
}
