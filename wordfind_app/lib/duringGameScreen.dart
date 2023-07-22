import 'package:flutter/material.dart';
import 'package:wordfind_app/gradient_text.dart';

class DuringGameScreen extends StatelessWidget {
  const DuringGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 16),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
                child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
              ),
              GradientText(text: 'Aimyon', size: 24),
              Row(
                children: [
                  Image.asset('assets/trophy.png'),
                  GradientText(text: '0', size: 20),
                  SizedBox(
                    width: 16,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset('assets/nonColored.png'),
                  // Image.asset('assets/ColoredOrange.png')
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Stack(
                children: [
                  Image.asset('assets/nonColored.png'),
                  // Image.asset('assets/ColoredOrange.png')
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Stack(
                children: [
                  Image.asset('assets/nonColored.png'),
                  // Image.asset('assets/ColoredOrange.png')
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Stack(
                children: [
                  Image.asset('assets/nonColored.png'),
                  // Image.asset('assets/ColoredOrange.png')
                ],
              ),
              SizedBox(width: 5),
              Stack(
                children: [
                  Image.asset('assets/nonColored.png'),
                  // Image.asset('assets/ColoredOrange.png')
                ],
              )
            ],
          ),
          SizedBox(
            height: 31,
          ),
          GradientText(text: '10/10', size: 20),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [-0.025, 1.6875],
                        transform: GradientRotation(180),
                        colors: [
                          Color.fromRGBO(255, 144, 2, 0),
                          Color(0xFFE48000)
                        ])),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back
                  , color: Colors.white,),
                  padding: EdgeInsets.all(0),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: Container(
                  width: 265,
                  height: 265,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Elsa.png')
                    )
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
