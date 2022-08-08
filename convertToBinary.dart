class ConvertNumbers {
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
    binaryNumber = shiftTo32Bits(binaryNumber);
    return binaryNumber;
  }

  static List<int> numberWithSignal(List<int> listNumber) {
    listNumber = shiftTo32Bits(listNumber);

    for (int i = 0; i < listNumber.length; i++) {
      listNumber[i] == 1 ? listNumber[i] = 0 : listNumber[i] = 1;
    }   

    listNumber = complementTwo(listNumber);
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

  static List<int> shiftTo32Bits(List<int> binaryNumber) {
    int lenghtBinaryList = binaryNumber.length;
    for (int i = 0; i < (32 - lenghtBinaryList); i++) {
      binaryNumber.insert(0, 0);
    }
    return binaryNumber;
  }
}
