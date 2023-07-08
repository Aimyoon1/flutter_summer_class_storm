import 'dart:io';
import 'dart:math';

void main(){
  // a
  var random = Random();
  int randomNumber = random.nextInt(100) + 1;

  // b
  int attempts = 0;

  // c
  int? guess = 0;

  // d
  print('Welcome to Guess the Number!');
  print('I have chosen a number between 1 and 100');
  print('Can you guess the number?');

  //  e
  // numberPlayerPut(21);
  while(guess != randomNumber){
    stdout.write('Enter the guess:');
    String? input = stdin.readLineSync();
    // print(input);
    if(input == null){
      print('Invalid input. Please enter a number.');
      continue;
    }
    guess = int.tryParse(input);

    if(randomNumber > guess! ){
      print('Too low!');
      attempts++;

    } else if(randomNumber < guess){
      print('Too high');
      attempts++;

    } else {
      print('Congratulations! You guessed the correct number in $attempts attempts.');
    }
  }
  print('Thanks for playing');
  print('You attempted $attempts times');

}

