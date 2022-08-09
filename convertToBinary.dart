class ConvertNumbers {
  static late int totalBitsUla;

  ConvertNumbers({totalBitsUla});

  static List<int> toBinary(int number) {
    List<int> binaryNumber = [];
    final binaryNumberConverted = number.toRadixString(2).split('');

    if (binaryNumberConverted.contains('-')) {
      binaryNumberConverted.remove('-');
      binaryNumber = binaryNumberConverted.map((e) => int.parse(e)).toList();
      List<int> newList = numberWithSignal(binaryNumber);
      return newList;
    }

    binaryNumber = binaryNumberConverted.map((e) => int.parse(e)).toList();
    binaryNumber = shiftBits(binaryNumber);
    return binaryNumber;
  }

  static List<int> numberWithSignal(List<int> listNumber) {
    listNumber = shiftBits(listNumber);
    listNumber = invertNumber(listNumber);
    listNumber = complementTwo(listNumber);

    return listNumber;
  }

  static List<int> invertNumber(List<int> listNumber) {
    for (int i = 0; i < listNumber.length; i++) {
      listNumber[i] == 1 ? listNumber[i] = 0 : listNumber[i] = 1;
    }
    return listNumber;
  }

  static List<int> complementTwo(List<int> listNumber) {
    int carryIn = 1;
    for (int i = listNumber.length - 1; i != 0; i--) {
      if (listNumber[i] == carryIn) {
        listNumber[i] = 0;
        carryIn = 1;
      } else {
        listNumber[i] = 1;
        break;
      }
    }
    return listNumber;
  }

  static List<int> shiftBits(List<int> binaryNumber) {
    int lenghtBinaryList = binaryNumber.length;
    for (int i = 0; i < (totalBitsUla - lenghtBinaryList); i++) {
      binaryNumber.insert(0, 0);
    }
    return binaryNumber;
  }
}
