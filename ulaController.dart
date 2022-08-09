import 'addComponent.dart';
import 'andComponent.dart';
import 'convertToBinary.dart';
import 'orComponent.dart';

class Ula {
  int sizeUla;
  
  Ula({required this.sizeUla}) {
    sizeUla++;
    ConvertNumbers.totalBitsUla = sizeUla;
  }

  List<int> andOperation(int numA, int numB) {
    And andOp = And();
    List<int> resultList = defaultOperation(andOp.operationAnd, numA, numB);
    return resultList;
  }

  List<int> orOperation(int numA, int numB) {
    Or orOp = Or();
    List<int> resultList = defaultOperation(orOp.operationOr, numA, numB);
    return resultList;
  }

  List<int> defaultOperation(
      Function(int a, int b) currentOperation, int numA, int numB) {
    List<int> listNumA = ConvertNumbers.toBinary(numA);
    List<int> listNumB = ConvertNumbers.toBinary(numB);
    List<int> listNumResult = [];

    for (int i = 0; i < sizeUla; i++) {
      listNumResult.add(currentOperation(listNumA[i], listNumB[i]));
    }
    return listNumResult;
  }

  List<int> addOperation(int numA, int numB) {
    Add add = Add();
    List<int> resultList = defaultAddSubOperation(add.addComponent, numA, numB);
    return resultList;
  }

  List<int> subOperation(int numA, int numB) {
    Add add = Add();
    List<int> resultList = defaultAddSubOperation(
      add.addComponent,
      numA,
      (numB * -1),
    );
    return resultList;
  }

  List<int> defaultAddSubOperation(
      Function(int a, int b, int carryIn) currentFunction, int numA, int numB) {
    List<int> listNumA = ConvertNumbers.toBinary(numA);
    List<int> listNumB = ConvertNumbers.toBinary(numB);
    List<int> listNumResult = [];

    int carryIn = 0;
    for (int i = sizeUla - 1; i != 0; i--) {
      Map result = currentFunction(
        listNumA[i],
        listNumB[i],
        carryIn,
      );
      carryIn = result['carryIn'];
      listNumResult.insert(0, result['result']);
    }
    return listNumResult;
  }

  int largestNumber(int numA, int numB) {
    List<int> resultList = subOperation(numA, numB);
    return resultList[0] == 0 ? 0 : 1;
  }

  List<int> norOperation(int numA, int numB) {
    List<int> resultList = ConvertNumbers.invertNumber(orOperation(numA, numB));
    return resultList;
  }

  int addOverflow(int numA, int numB) {
    List<int> listNumA = ConvertNumbers.toBinary(numA);
    List<int> listNumB = ConvertNumbers.toBinary(numB);
    List<int> sumNums = addOperation(numA, numB);

    // 10 + -5
    //-10 + 5 =
    if (sumNums[0] == listNumA[0]) {
      return 0;
    } else if (sumNums[0] == listNumB[0]) {
      return 0;
    }
    return 1;
  }
}

//sumNums[0] != listNumA[0] || listNumB[0]
