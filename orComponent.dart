class Or {
  static int bitInverse(int bit) => (bit == 1) ? 0 : 1;

  int operationOr(int bitA, int bitB) => (bitA == 1 || bitB == 1) ? 1 : 0;
}
