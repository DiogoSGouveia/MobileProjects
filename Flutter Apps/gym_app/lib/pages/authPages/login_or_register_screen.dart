import 'package:flutter/material.dart';
import 'package:gym_app/pages/authPages/login_page.dart';
import 'package:gym_app/pages/authPages/register_page.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  bool isLoginScreen = true;

  void toggleLoginRegister() {
    setState(() {
      isLoginScreen = !isLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoginScreen) {
      return LoginScreen(
        onTap: toggleLoginRegister,
      );
    } else {
      return RegisterScreen(
        onTap: toggleLoginRegister,
      );
    }
  }
}
