import 'package:flutter/material.dart';

import 'menu.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent.shade200,
      body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.contain),
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
            TextInput(input: 'Email'),
            TextInput(input: 'Password'),
            Row(
              children: [
                Container(
                    width: 175,
                    margin: EdgeInsets.fromLTRB(50, 25, 15, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                        ),
                        child: Text('Log in'))),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                        ),
                        child: Text('Sign up'))),
              ],
            ),
          ],
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          physics: NeverScrollableScrollPhysics()),
    );
  }
}

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent.shade200,
      body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.contain),
              ),
            ),
            Text(
              "Sign up",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
            TextInput(input: "Email"),
            TextInput(input: "Password"),
            TextInput(input: "Name"),
            TextInput(input: "Address"),
            TextInput(input: "Phone Number"),
            Row(
              children: [
                Container(
                    width: 175,
                    margin: EdgeInsets.fromLTRB(50, 25, 15, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                        ),
                        child: Text('Create account'))),
                Container(
                    width: 100,
                    margin: EdgeInsets.fromLTRB(0, 25, 15, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                        ),
                        child: Text('Log in'))),
              ],
            ),
          ],
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          physics: NeverScrollableScrollPhysics()),
    );
  }
}

class TextInput extends StatefulWidget {
  final String input;

  const TextInput({
    Key? key,
    required this.input,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 25, 50, 0),
      width: 300,
      height: 50,
      child: Align(
        alignment: Alignment(0.00, -0.30),
        child: TextField(
          style:
              new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
          decoration: InputDecoration(
            hintText: widget.input,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            prefixIcon: (widget.input == 'Email')
                ? Icon(Icons.email)
                : (widget.input == 'Password')
                    ? Icon(Icons.lock_rounded)
                    : (widget.input == 'Name')
                        ? Icon(Icons.person)
                        : (widget.input == 'Address')
                            ? Icon(Icons.house)
                            : (widget.input == 'Phone Number')
                                ? Icon(Icons.phone)
                                : null,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}
