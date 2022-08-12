// Alunos: Victor Cavalcante Vieira, Vinicius Oliveira do Nascimento e João Victor Castro de Oliveira

/*
  Códigos da operação:
    0000 = And
    0001 = Or
    0010 = Adição
    0110 = Subtração
    0111 = A < B
    1100 = Nor
*/

/* Caso queira fazer por escolha do usuário(Digitar a operação e os números), 
  selecione a opção "1.Digitar números".
*/

import 'ulaController.dart';
import 'dart:io';

void readFileByLines(Ula ula) async {
  File file = File('./usecases_test.txt');
  List<int> operation = [];
  List<int> resultList = [];
  int cont = 1;
  await file.readAsLines().then((line) {
    for (int i = 0; i < line.length - 2; i += 3) {
      
      for (int j = 0; j < line[0].length; j++) {
        operation.add(int.parse(line[i][j]));
      }

      resultList.add(int.parse(line[i + 1]));
      resultList.add(int.parse(line[i + 2]));

      print("resultado ${cont}");
      cont++;
      getNumbersFromUser(ula, operation, resultList[0], resultList[1]);

      operation.clear();
      resultList.clear();
    }
  });
}

void getNumbersFromUser(Ula ula, List<int> op, int numA, int numB) {
  Map<String, dynamic> result = ula.inputOperation(op, numA, numB);

  print("G = " +
      result['result'].join().toString() +
      " | carryOutput = " +
      result['carryOutput'].toString() +
      " | zero = " +
      result['zero'].toString() +
      " | overflow = " +
      result['overflow'].toString()
  );
}

void main() {
  Ula ula = Ula(sizeUla: 32);
  int userOp = 0;

  print("Escolha uma Opção:");
  print("0. Casos de teste padrão | 1. Digitar números");
  userOp = int.parse(stdin.readLineSync()!.replaceAll('\n', ''));

  if (userOp == 1) {
    print("digite a operação da ula(4 bits): ");
    List<int> op = stdin
        .readLineSync()!
        .replaceAll('\n', '')
        .split('')
        .map((e) => int.parse(e))
        .toList();

    print("digite o primeiro numero(decimal): ");
    int numA = int.parse(stdin.readLineSync()!.replaceAll('\n', ''));

    print("digite o segundo numero(decimal): ");
    int numB = int.parse(stdin.readLineSync()!.replaceAll('\n', ''));
    getNumbersFromUser(ula, op, numA, numB);
  } else if (userOp == 0) {
    readFileByLines(ula);
  } else {
    print("Operação não suportada.");
  }
}
