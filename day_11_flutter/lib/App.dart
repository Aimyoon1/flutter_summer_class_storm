import 'package:flutter/material.dart';
// Stateless Widget

class MyDearDogApp extends StatelessWidget {

  const MyDearDogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Chiaki'),),
        body: Center(
          child: Text('Aika', style: TextStyle(fontSize: 24, fontFamily:),),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},child: Center(child: Icon(Icons.add),),),
      ),
    );
  }
}