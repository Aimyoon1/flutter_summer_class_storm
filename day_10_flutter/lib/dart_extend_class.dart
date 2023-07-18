import './day_10_objects.dart';
void main(){

  final Yesugei yesugei = Yesugei(age: 34);
  yesugei.sayMyName();

  final Temuujin temuujin = Temuujin(age: 16);
  temuujin.sayMyName();

  final Temuge temuge = Temuge(age : 29);
  temuge.sayMyName();

  final Khachiun khachiun = Khachiun(age: 21);
  khachiun.sayMyName();

  final Khasar khasar = Khasar(age: 19);
  khasar.sayMyName();

  final Pig pig = Pig(name: 'Pig', type: "Animal", food: "Dulguun");
  print(pig.food);
  pig.makeNoice();

  final Cat cat = Cat(name: 'Ruby', type: "Animal");
  cat.makeNoice();

  final Horse horse = Horse(name: 'Chloe', type: 'Animal');
  horse.makeNoice();

}



class Yesugei {
  int age = 12;
  Yesugei({required int age}){
    this.age = age;
  }

  void sayMyName(){
    print('my name is Yesugei');
  }
}

class Temuujin extends Yesugei {
  Temuujin({required super.age});

  @override
  void sayMyName() {
    print('my name is Temujin');
  }
}

class Temuge extends Yesugei {
  Temuge({required super.age});

  @override
  void sayMyName(){
    print('my name is Temuge');
  }
}

class Khasar extends Yesugei {
  Khasar({required super.age});

  @override
  void sayMyName(){
    print('My name is Khasar');
  }
}

class Khachiun extends Yesugei {
  Khachiun({required super.age});

  @override
  void sayMyName(){
    print('My name is Khachiun ');
  }
}

class Pig extends Animal{
  String food = 'Khongoroo';
  Pig({required super.name, required super.type, required String food}){
    this.food = food;
  }
  @override
  void makeNoice() {
    print('$name grant');
  }
}

class Cat extends Animal {
  Cat({required super.name, required super.type});

  @override
  void makeNoice(){
    print('$name meow');
  }
}

class Horse extends Animal {

  Horse({required super.name, required super.type});

  @override
  void makeNoice() {
    print('hoho');
  }
}

