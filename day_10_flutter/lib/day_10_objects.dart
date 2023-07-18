void main() {
  // Sprite Class
  final Sprite cat = Sprite(0, 0);
  print(cat);
  print(cat.x);

  // make sound
  cat.makeSound();



  // Named Sprite class
  final NamedSprite namedSprite = NamedSprite(x: 10, y: 10);
  namedSprite.printMyLocation();

  // Animal Class
  final Animal ari = Animal(name: 'Ari', type: 'human');
  print(ari);
  ari.makeNoice();


  // Building class
  final Building ajnai101 = Building(name: 'Ajnai 101', floors: Floor(numberOfFloors: 3), doors: Door(numberOfDoors: 2));
  print(ajnai101.floors.numberOfFloors);

}

class Sprite {
  // constructor
  Sprite(int x, int y) {
    this.x = x;
    this.y = y;
  }

  int x = 0, y = 0;

  void makeSound() {
    print('Hello I am a Sprite');
  }
}

class Animal {
  String name = 'Tiger';
  String type = 'Animal';

  // constructor
  Animal({required String name, required String type}) {
    this.name = name;
    this.type = type;
  }

  void makeNoice() {
    print('$name Roaring');
  }
}

class NamedSprite {
  int? x, y;
  NamedSprite({required int x, required y}) {
    this.x = x;
    this.y = y;
  }
  void printMyLocation (){
    print('My location is x -> $x y -> $y ');
  }
}

class Door {
  int numberOfDoors = 2;
  Door({required int numberOfDoors }) {
    this.numberOfDoors = numberOfDoors;
  }
}

class Floor {
  int numberOfFloors = 2;
  Floor({required int numberOfFloors}) {
    this.numberOfFloors = numberOfFloors;
  }

}

class Building {
  String name = 'Shangrila';
  Floor floors = Floor(numberOfFloors: 5);
  Door doors = Door(numberOfDoors: 69);
  Building({required String name, required Floor floors, required Door doors}){
    this.name = name;
    this.floors = floors;
    this.doors = doors;
  }
}


