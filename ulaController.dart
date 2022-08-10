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

  Map<String, dynamic> inputOperation(List<int> op, int numA, int numB) {
    List<int> numAConverted = ConvertNumbers.toBinary(numA);
    List<int> numBConverted = ConvertNumbers.toBinary(numB);
    List<int> numBOverflowCheck = ConvertNumbers.toBinary(numB); // Converte b
    int carryOutput = 0; // Sinal da saída carryOutput
    int zeroOutput = 0; // Sinal da saída Zero
    int overflowSignal = 0; // Sinal da saída Overflow
    List<int> andList = [];
    List<int> orList = [];
    List<int> addList = [];
    List<int> resultList = [];
    int carryIn = (op[2] == 1 && op[1] == 1) ? 1 : 0;
    int isBiggerThen = 0; // Indica se é maior ou menor

    for (int i = sizeUla - 1; i != 0; i--) {
      if (op[0] == 1) {
        // Checa se A inverte
        numAConverted[i] = And.bitInverse(numAConverted[i]);
      }
      if (op[1] == 1) {
        // Checa se B inverte
        numBConverted[i] = And.bitInverse(numBConverted[i]);
      }

      andList.insert(0, andOperation(numAConverted[i], numBConverted[i]));
      orList.insert(0, orOperation(numAConverted[i], numBConverted[i]));
      Map result = addOperation(numAConverted[i], numBConverted[i], carryIn);

      carryIn = result['carryIn'];
      addList.insert(0, result['result']);

      Map resultOp = opChoices(op, andList, orList, addList);
      resultList = resultOp['resultList'];
      isBiggerThen = resultOp['isBiggerThen'];
    }

    if (op[2] == 1 && op[3] == 1) {
      // Resultado da Operação A < B
      resultList.add(isBiggerThen);
    }

    Map checkOverflow = checkOver(
      op,
      numAConverted[0],
      numBOverflowCheck[0],
      resultList,
    );

    carryOutput = checkOverflow['carryOutput'];
    overflowSignal = checkOverflow['overflowSignal'];

    if (resultList.every((element) => element == 0)) {
      // Zero
      zeroOutput = 1;
    }

    return {
      "result": resultList,
      "carryOutput": carryOutput,
      "zero": zeroOutput,
      "overflow": overflowSignal,
    };
  }

  int andOperation(int bitA, int bitB) {
    And and = And(); // Operação Lógica E
    return and.operationAnd(bitA, bitB);
  }

  int orOperation(int bitA, int bitB) {
    Or or = Or(); // Operação Lógica Ou
    return or.operationOr(bitA, bitB);
  }

  Map addOperation(int bitA, int bitB, int carryIn) {
    Add add = Add(); // Operação de Adição
    return add.addComponent(
      bitA,
      bitB,
      carryIn,
    );
  }

  Map opChoices(
      List<int> op, List<int> andList, List<int> orList, List<int> addList) {
    List<int> resultList = [];
    int isBiggerThen = 0;
    if (op[2] == 0 && op[3] == 0) {
      resultList = andList;
    } else if (op[2] == 0 && op[3] == 1) {
      resultList = orList;
    } else if (op[2] == 1 && op[3] == 0) {
      resultList = addList;
    } else if (op[2] == 1 && op[3] == 1) {
      // Operação A < B
      (addList[0] == 0) ? isBiggerThen = 0 : isBiggerThen = 1;
    }

    return {
      'resultList': resultList,
      'isBiggerThen': isBiggerThen,
    };
  }

  Map checkOver(List<int> op, int numA, int numB, List<int> resultList) {
    int carryOutput = 0;
    int overflowSignal = 0;
    if (op[2] == 1 && op[3] == 0) {
      if (!(numA == numB && numB == resultList[0]) &&
          op[1] == 0 &&
          op[2] == 1) {
        carryOutput = 1;
        overflowSignal = 0;
      }
      if (((numA != numB && op[2] == 1 && op[1] == 1 && op[3] == 0) &&
          (numB == resultList[0]))) {
        carryOutput = 0;
        overflowSignal = 1;
      }
    }

    return {"carryOutput": carryOutput, "overflowSignal": overflowSignal};
  }
}
