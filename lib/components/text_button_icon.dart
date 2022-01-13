import 'package:flutter/material.dart';

class TextButtonIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const TextButtonIcon(
      {required this.icon, required this.color, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          color: color,
        ),
        label: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
