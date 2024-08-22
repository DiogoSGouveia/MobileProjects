import 'package:flutter/material.dart';
import 'package:gym_app/components/my_button.dart';
import 'package:gym_app/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // pop loading circle
      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (mounted) Navigator.pop(context);
      // WRONG Credentials
      if (e.code == 'user-not-found') {
        showErrorMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showErrorMessage('Wrong password provided for that user.');
      }
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            content: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //const SizedBox(height: 10),
              // Logo
              Image.asset(
                'assets/phive_logo.png',
                width: 150,
              ),
              const SizedBox(height: 25),
              // Email
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),
              // Password~
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                text: 'Sign in',
                onTap: signUserIn,
              ),
              // or continue with

              // Google button
              const SizedBox(height: 100),
              // Sign in button
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    ));
  }
}
