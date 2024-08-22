import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Settings'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.dark_mode_outlined),
            CupertinoSwitch(
              activeColor: Theme.of(context).colorScheme.primary,
              value: !Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
            ),
            const Icon(Icons.lightbulb_outline)
          ],
        ),
      ),
    );
  }
}
