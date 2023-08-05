import 'package:flutter/material.dart';
import 'package:icodegram/screen-managers/after_login.dart';

import 'package:icodegram/widgets/lobster_text.dart';
import 'package:icodegram/widgets/my_button.dart';
import 'package:icodegram/widgets/my_gradient_text.dart';
import 'package:icodegram/widgets/my_textfield.dart';
import 'package:icodegram/widgets/rubik_text.dart';

class RegisterScreen extends StatefulWidget {
  final Function setIsClientHasAccount;
  const RegisterScreen({super.key, required this.setIsClientHasAccount});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // APP NAME
          _appName(),

          // PHONE NUMBER
          _getPhoneNumber(),

          // USERNAME
          _getUserName(),

          // PASSWORD
          _getUserPassword(),

          // CONFIRM PASSWORD
          _confirmPassword(),

          // Sign In Button
          _signUpBtn(context: context),

          // Already have an account then navigate Sign Up screen
          _buildQuestionForClientToSignIn()
        ],
      ),
    );
  }

  void _signUp({context}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ScreenAfterLogin()));
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

  Widget _getPhoneNumber() {
    return Column(
      children: [
        MyTextField(
          controller: phoneNumberController,
          text: 'Утасны дугаар',
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Widget _getUserName() {
    return Column(
      children: [
        MyTextField(
          controller: userNameController,
          text: 'Нэвтрэх нэр',
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Widget _getUserPassword() {
    return Column(
      children: [
        MyTextField(
          controller: passwordController,
          text: 'Нууц үг',
          obscureText: true,
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Widget _confirmPassword() {
    return Column(
      children: [
        MyTextField(
          controller: confirmPasswordController,
          text: 'Нууц үг давтах',
          obscureText: true,
        ),
        SizedBox(
          height: 48,
        ),
      ],
    );
  }

  Widget _signUpBtn({context}) {
    return Column(
      children: [
        MyButton(
            action: () {
              _signUp(context: context);
            },
            gradientColor: true,
            text: 'Бүртгүүлэх'),
        const SizedBox(
          height: 26,
        ),
      ],
    );
  }

  Widget _buildQuestionForClientToSignIn() {
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
                text: 'Бүртгэлтэй юу?',
                textColor: Color.fromRGBO(255, 255, 255, 0.6)),
            const SizedBox(
              width: 18,
            ),
            GestureDetector(
              onTap: () {
                widget.setIsClientHasAccount();
              },
              child: const MyGradientText(text: 'Нэвтрэх'),
            )
          ],
        ),
      ],
    );
  }
}
