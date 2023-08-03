import 'package:flutter/material.dart';
import 'package:icodegram/screens/sign_in.dart';
import 'package:icodegram/screens/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // show sign in screen if it is true, otherwise show Register screen
  bool isClientHasAccount = true;

  // Set variable isClientHasAccount
  void setIsClientHasAccount() {
    setState(() {
      isClientHasAccount = !isClientHasAccount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isClientHasAccount
        ? SignInScreen(setIsClientHasAccount: setIsClientHasAccount)
        : RegisterScreen(setIsClientHasAccount: setIsClientHasAccount);
  }
}
