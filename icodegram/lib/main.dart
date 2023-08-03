import 'package:flutter/material.dart';
import 'package:icodegram/screen-managers/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white, size: 32)
          // iconButtonTheme: IconButtonThemeData()
          ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
