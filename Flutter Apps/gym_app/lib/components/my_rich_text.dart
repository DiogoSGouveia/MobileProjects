import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  final String text;
  final String user;
  const MyRichText({super.key, required this.text, required this.user});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "$text: ",
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(color: Theme.of(context).colorScheme.primary)),
          TextSpan(
              text: user.toString(),
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(color: Theme.of(context).colorScheme.inverseSurface)),
        ],
      ),
    );
  }
}
