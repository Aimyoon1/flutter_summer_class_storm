import 'package:flutter/material.dart';
import 'package:icodegram/widgets/LobsterText.dart';
import 'package:icodegram/widgets/my_button.dart';
import 'package:icodegram/widgets/my_text.dart';
import 'package:icodegram/widgets/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // APP NAME
          Align(
            alignment: Alignment.center,
            child: LobsterText(text: 'ICodegram', size: 36),
          ),
          SizedBox(height: 52),

          // USERNAME
          MyTextField(text: 'Нэвтрэх нэр',),
          SizedBox(height: 14,),

          // PASSWORD
          MyTextField(text: 'Нууц үг'),
          SizedBox(height: 48,),

          // Sign In Button
          MyButton(gradientColor: true, text: 'Нэвтрэх'),
          SizedBox(height: 26,),

          // Message
          MyButton(text: 'Эсвэл', gradientColor: false, textColor: Color(0xffA0A0A0),),
          SizedBox(height: 30,),

          // Create Account and Navigate Sign Up screen
          _buildQuestionForClientToSignUp()



        ],
      ),
    );
  }

  Widget _buildQuestionForClientToSignUp (){
    return Row(
      children: [
        MyText(text: 'Шинэ хэрэглэгч үү?'),
        MyText(text: 'Бүртгүүлэх', isGradientText: true)
      ],
    );
  }
}
