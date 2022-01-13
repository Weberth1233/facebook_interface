import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback action;

  const ButtonCircle(
      {Key? key, required this.icon, required this.size, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.all(6),
      child: IconButton(
        icon: Icon(icon),
        onPressed: action,
        iconSize: size,
        color: Colors.black,
      ),
    );
  }
}
