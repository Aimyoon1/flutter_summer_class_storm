import 'package:flutter/material.dart';

void main() {
  const Text myText = Text('Hello Aika');

  const Center myCenteredText = Center(child: myText);

  const Scaffold myScaffold = Scaffold(
    body: myCenteredText,
  );

  const MaterialApp myApp = MaterialApp(
    home: myScaffold,
  );

  const MyDearDogApp dogApp = MyDearDogApp();

  runApp(dogApp);
}

// Stateless Widget

class MyDearDogApp extends StatelessWidget {
  const MyDearDogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chiaki'),
        ),
        body: Center(
          child: Text(
            'Aika',
            style: TextStyle(
                fontSize: 24, color: Color(0xfff9004d), fontFamily: 'Ribeye'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed:
              printHello,
            child: Image.asset(
              'assets/Aimyon.jpg',
            )),
      ),
    );
  }
}

void printHello() {
  print('Hello');
}
