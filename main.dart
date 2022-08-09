import 'ulaController.dart';

void main() {
  Ula ula = Ula(sizeUla: 8);

  List<int> andOp = ula.andOperation(10, 10);
  List<int> orOp = ula.orOperation(10, 10);
  List<int> addOp = ula.addOperation(11, 3);
  List<int> subOp = ula.subOperation(13, 15);
  int largestNumber = ula.largestNumber(-3, 10);
  List<int> norOp = ula.norOperation(10, 10);
  int overOp = ula.addOverflow(-90, -40);

  //print(andOp);
  //print(orOp);
  //print(addOp);
  // print(subOp);
  // print(largestNumber);
  //print(norOp);
  print(overOp);
}
