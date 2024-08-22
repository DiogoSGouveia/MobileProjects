import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/components/my_drawer.dart';
import 'package:gym_app/components/my_rich_text.dart';
import 'package:gym_app/components/my_square_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showQr = false;
  String gymName = 'Celas';

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (showQr) {
          setState(() {
            showQr = false;
          });
        }
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: Row(
                children: [
                  Text(
                    'PHIVE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(width: 5, height: 5),
                  Text(
                    gymName,
                    style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      setState(() {
                        gymName = gymName == 'Celas'
                            ? 'Leiria'
                            : (gymName == 'Leiria' ? 'Lágrimas' : 'Celas');
                      });
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                ],
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),

            // Body of the home page

            body: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyRichText(
                            text: 'Name', user: user!.displayName.toString()),
                        MyRichText(text: 'Email', user: user!.email.toString()),
                        MyRichText(text: 'Age', user: '25'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Divider(
                    height: 10,
                    thickness: 3,
                    color: Theme.of(context).colorScheme.background),
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: const [
                      MySquareButton(
                          icon: Icons.add_alarm, text: 'Book a Class/PT'),
                      MySquareButton(
                          icon: Icons.calendar_month_outlined,
                          text: 'Current Payment'),
                      MySquareButton(icon: Icons.access_time, text: 'History'),
                      MySquareButton(
                          icon: Icons.sports_gymnastics_outlined,
                          text: 'Training Plan'),
                      MySquareButton(
                        icon: Icons.question_mark_rounded,
                        text: 'Survey',
                      ),
                      MySquareButton(
                        icon: Icons.monitor_weight_outlined,
                        text: 'Body Statistics',
                      ),
                      SizedBox(),
                      MySquareButton(
                        icon: Icons.food_bank_outlined,
                        text: 'Yellow Points',
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
              ],
            ),

            endDrawer: const MyDrawer(),

            // Floating QR button to show QR code

            floatingActionButton: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      showQr = !showQr;
                    });
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(Icons.qr_code_scanner)),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
          if (showQr) Container(color: Colors.black.withOpacity(0.5)),
          if (showQr)
            Center(
                child: Card(
              color: Theme.of(context).colorScheme.primary,
              child: const Icon(
                Icons.qr_code_scanner_sharp,
                size: 300.0,
              ),
            ))
        ],
      ),
    );
  }
}
