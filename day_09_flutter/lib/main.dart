import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    title: 'Dude',
    home: Scaffold(
      // backgroundColor: Colors,
      appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.5),
          title: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Icon(
                Icons.gamepad,
                color: Colors.blue,
              )),
              Center(
                child: Text("Khongoroo's first app"),
              )
            ],
          ))),
      body: Center(
        child: Text('Khangaikhuu developing this app'),
      ),
    ),
  ));
}
