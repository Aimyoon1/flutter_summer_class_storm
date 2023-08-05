import 'package:flutter/material.dart';
import 'package:icodegram/datas/users.dart';
import 'package:icodegram/screen-managers/after_login.dart';
import 'package:icodegram/services/auth/auth_service.dart';

import 'package:icodegram/widgets/lobster_text.dart';
import 'package:icodegram/widgets/my_button.dart';
import 'package:icodegram/widgets/my_gradient_text.dart';
import 'package:icodegram/widgets/my_textfield.dart';
import 'package:icodegram/widgets/rubik_text.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  final Function setIsClientHasAccount;
  const SignInScreen({super.key, required this.setIsClientHasAccount});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //
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
    return Column(
      children: [
        MyTextField(
          controller: userNameController,
          text: 'Нэвтрэх нэр',
        ),
        const SizedBox(
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
        const SizedBox(
          height: 48,
        ),
      ],
    );
  }

  // FUNCTIONS
  void signIn(email, password) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signIn(email, password);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const ScreenAfterLogin()));
  }

  Widget _signInBtn({context}) {
    return Column(
      children: [
        MyButton(
            action: () {
              signIn(emailController.text, passwordController.text);
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
                widget.setIsClientHasAccount();
              },
              child: const MyGradientText(text: 'Бүртгүүлэх'),
            )
          ],
        ),
      ],
    );
  }
}
