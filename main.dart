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

import 'ulaController.dart';
import 'dart:io';

void main() {
  Ula ula = Ula(sizeUla: 32);

  print("digite a operação da ula(4 bits): ");
  List<int> op = stdin.readLineSync()!.replaceAll('\n', '').split('').map((e) => int.parse(e)).toList();
  List<int> opInt = op; 

  print("digite o primeiro numero(decimal): ");
  int numA = int.parse(stdin.readLineSync()!.replaceAll('\n', ''));

  print("digite o segundo numero(decimal): ");
  int numB = int.parse(stdin.readLineSync()!.replaceAll('\n', ''));
 
  Map<String, dynamic> result = ula.inputOperation(opInt, numA, numB); 

  print("G = " + result['result'].join().toString() + 
  " | carryOutput = " + result['carryOutput'].toString() + 
  " | zero = " + result['zero'].toString() + 
  " | overflow = " + result['overflow'].toString()
  );
}
