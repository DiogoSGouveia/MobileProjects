import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySquareButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const MySquareButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      //shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 5,
      color: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
