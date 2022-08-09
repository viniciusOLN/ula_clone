class Add {
  Map<String, int> addComponent(int bitA, int bitB, int carryIn) {
    Map<String, int> result = {};

    if (bitA + carryIn + bitB == 3) {
      result = {"carryIn": 1, "result": 1};    
    } else if (bitA + carryIn + bitB == 2) {
      result = {"carryIn": 1, "result": 0};
    } else if (bitA + carryIn + bitB == 1) {
      result = {"carryIn": 0, "result": 1};
    } else {
      result = {"carryIn": 0, "result": 0};
    }
    return result;
  }
}