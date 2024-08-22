import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/components/my_button.dart';
import 'package:gym_app/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_app/helper/helper_fucntions.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // sign up
    try {
      // check if passwords match
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        showErrorMessage(context, 'Passwords do not match');
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // Handle sign up errors
      if (e.code == 'email-already-in-use') {
        showErrorMessage(context, 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showErrorMessage(context, 'The email address is not valid.');
      } else if (e.code == 'operation-not-allowed') {
        showErrorMessage(context, 'Email/password accounts are not enabled.');
      } else if (e.code == 'weak-password') {
        showErrorMessage(context, 'The password is too weak.');
      }
    }
  }

  // create a user document in firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': userCredential.user!.email,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //const SizedBox(height: 50),
              // Logo
              Image.asset(
                'assets/phive_logo.png',
                width: 150,
              ),
              // Text
              Text(
                'Create an account',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
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
              // Confirm Password
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                text: 'Sign up',
                onTap: signUserUp,
              ),
              // or continue with

              // Google button
              const SizedBox(height: 50),
              // Sign in button
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Already have an account?',
                  // style:
                  //     TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Login now',
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
