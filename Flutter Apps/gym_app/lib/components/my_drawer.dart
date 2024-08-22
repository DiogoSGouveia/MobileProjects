import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signedOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
              child: Center(
            child: Image(
              image: AssetImage('assets/phive_logo.png'),
              height: 100,
            ),
          )),
          drawerButton(
            context,
            'Profile',
            Icons.person,
          ),
          drawerButton(
            context,
            'Messages',
            Icons.mail,
          ),
          drawerButton(
            context,
            'Store',
            Icons.store,
          ),
          drawerButton(
            context,
            'Schedule',
            Icons.fitness_center,
          ),
          drawerButton(
            context,
            'Settings',
            Icons.settings,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, bottom: 10.0),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                'Logout',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              onTap: () {
                signedOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget drawerButton(BuildContext context, String name, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/$name');
      },
    ),
  );
}
