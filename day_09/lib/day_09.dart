void main(){
  // 1
  Sprite Luca = Sprite('Luca'); // constructor without parameter => default
  Sprite Hat = Sprite('Hat');
  Sprite Kia = Sprite('Kia');

  //  2
  Luca.move(10);
  Luca.changeYby(30);
  Hat.move(-30);
  Hat.changeYby(-40);
  Kia.move(-100);
  Kia.changeYby(10);
  print(Luca.sayName());
  print(Kia.sayName());
  print(Hat.sayName());


}
class Sprite {
  Sprite(String name){
    this.name = name;
  }
  String name = 'Sprite';
  int x = 0, y = 0, size = 100, direction = 90;
  bool isShow = true;

  //  functions
  void move(int x){
    this.x = x;
  }

  String sayName(){
    return name;
  }

  void changeYby(int y){
    this.y = y;
  }

  void changeDirection(int value){
    this.direction = value;
  }

  String whatDirectionSpriteIsSeeing(){
    if(direction > 0 && direction < 90 ) {
      return 'baruun $direction';
    } else if (direction > 90 && direction < 180){
      return 'zuun $direction';
    } else if (direction > 180 && direction < 270){
      return 'zuun $direction';
    } else {
      return 'baruun $direction';
    }
  }

  void setSpriteSize(int value ){
    this.size = value;
  }

}
