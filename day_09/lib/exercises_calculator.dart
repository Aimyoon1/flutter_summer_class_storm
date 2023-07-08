import 'dart:io';

void main() {
  String gameStatement = 'Started';

  while (gameStatement != 'Game over!') {
    stdout.write('1st number? :');
    String? input1 = stdin.readLineSync();
    stdout.write('2nd number? :');
    String? input2 = stdin.readLineSync();
    stdout.write('What operation u want? ');
    String? operation = stdin.readLineSync();

    int? a = int.tryParse(input1!), b = int.tryParse(input2!);
    num value = 0;
    if (operation == '+') {
      value = add(a!, b!);
    } else if (operation == '-') {
      value = subtraction(a!, b!);
    } else if (operation == '*') {
      value = multiply(a!, b!);
    } else if (operation == '/') {
      value = division(a!, b!);
    } else if (operation == '%') {
      value = modulo(a!, b!);
    } else if (operation == 'q') {
      print('Bye');
      gameStatement = 'Game over!';
    } else {
      continue;
    }
    print(value);
  }
}

int add(int a, int b) {
  return a + b;
}

int subtraction(int a, int b) {
  return a - b;
}

int multiply(int a, int b) {
  return a * b;
}

num division(int a, int b) {
  return a / b;
}

int modulo(int a, int b) {
  return a % b;
}
