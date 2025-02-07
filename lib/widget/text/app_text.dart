import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  const AppText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
