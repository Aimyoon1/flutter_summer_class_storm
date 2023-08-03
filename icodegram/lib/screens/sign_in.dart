import 'package:flutter/material.dart';
import 'package:icodegram/screen-managers/after_login.dart';

import 'package:icodegram/widgets/lobster_text.dart';
import 'package:icodegram/widgets/my_button.dart';
import 'package:icodegram/widgets/my_gradient_text.dart';
import 'package:icodegram/widgets/my_textfield.dart';
import 'package:icodegram/widgets/rubik_text.dart';

class SignInScreen extends StatelessWidget {
  final Function setIsClientHasAccount;
  const SignInScreen({super.key, required this.setIsClientHasAccount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // APP NAME
          _appName(),

          // USERNAME
          _getUserName(),

          // PASSWORD
          _getUserPassword(),

          // Sign In Button
          _signInBtn(context: context),

          // Create Account and Navigate Sign Up screen
          _buildQuestionForClientToSignUp()
        ],
      ),
    );
  }

  Widget _appName() {
    return const Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: LobsterText(text: 'ICodegram', size: 36),
        ),
        SizedBox(height: 52),
      ],
    );
  }

  Widget _getUserName() {
    return const Column(
      children: [
        MyTextField(
          text: 'Нэвтрэх нэр',
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Widget _getUserPassword() {
    return const Column(
      children: [
        MyTextField(
          text: 'Нууц үг',
          obscureText: true,
        ),
        SizedBox(
          height: 48,
        ),
      ],
    );
  }

  // FUNCTIONS

  void signIn({context}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ScreenAfterLogin()));
  }

  Widget _signInBtn({context}) {
    return Column(
      children: [
        MyButton(
            action: () {
              signIn(context: context);
            },
            gradientColor: true,
            text: 'Нэвтрэх'),
        const SizedBox(
          height: 26,
        ),
      ],
    );
  }

  Widget _buildQuestionForClientToSignUp() {
    return Column(
      children: [
        // Message
        const RubikText(
          text: 'Эсвэл',
          textColor: Color.fromRGBO(255, 255, 255, 0.6),
        ),
        const SizedBox(
          height: 30,
        ),

        // Sign Up
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RubikText(
                text: 'Шинэ хэрэглэгч үү?',
                textColor: Color.fromRGBO(255, 255, 255, 0.6)),
            const SizedBox(
              width: 18,
            ),
            GestureDetector(
              onTap: () {
                setIsClientHasAccount();
              },
              child: const MyGradientText(text: 'Бүртгүүлэх'),
            )
          ],
        ),
      ],
    );
  }
}
