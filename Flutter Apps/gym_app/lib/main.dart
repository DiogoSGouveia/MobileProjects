import 'package:firebase_core/firebase_core.dart';
import 'package:gym_app/pages/authPages/auth_page.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/pages/drawerPages/messages_page.dart';
import 'package:gym_app/pages/drawerPages/profile_page.dart';
import 'package:gym_app/pages/drawerPages/schedule_page.dart';
import 'package:gym_app/pages/drawerPages/settings_page.dart';
import 'package:gym_app/pages/drawerPages/store_page.dart';

import 'package:gym_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/Profile': (context) => const ProfilePage(),
        '/Messages': (context) => const MessagesPage(),
        '/Store': (context) => const StorePage(),
        '/Schedule': (context) => const SchedulePage(),
        '/Settings': (context) => const SettingsPage(),
      },
    );
  }
}
