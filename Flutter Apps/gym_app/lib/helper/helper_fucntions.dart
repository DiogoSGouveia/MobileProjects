import 'package:flutter/material.dart';

// dispay error message to user
void showErrorMessage(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Adjust as needed
            ),
            title: Text(message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface)),
          ));
}
