// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'login.dart';
import 'menu.dart';
import 'profile.dart';
import 'JobMenu.dart';
import 'JobDetails.dart';
import 'CreateChore.dart';
import 'notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Choreless',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: Colors.indigoAccent.shade200,
          body: MyAnim(),
        ),
        routes: {
          "/JobMenu": (context) => JobMenu(),
          "/JobDetails": (context) => GMap(
                str: '',
              ),
          "/Signup": (context) => Signup(),
          "/Chores": (context) => Chores(),
          "/Notif": (context) => Notif(),
          "/Home": (context) => HomePage(),
        });
  }
}

class MyAnim extends StatefulWidget {
  @override
  State<MyAnim> createState() => MyAnimState();
}

class MyAnimState extends State<MyAnim> with SingleTickerProviderStateMixin {
  AnimationController control;
  Animation<double> rot;
  Animation<double> trasl;
  @override
  void initState() {
    super.initState();
    control = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    rot = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(control);

    trasl = Tween<double>(
      begin: 0,
      end: 504,
    ).animate(control);

    control.forward();
    Timer(Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, "/Signup");
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: control,
        builder: (_, child) => Stack(children: <Widget>[
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 75,
                bottom: trasl.value,
                child: Transform(
                  transform: Matrix4.rotationZ(rot.value),
                  alignment: Alignment.center,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
            ]));
  }
}
