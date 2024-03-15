import 'package:flutter/material.dart';

class AwnserButton extends StatelessWidget {
  const AwnserButton(
      {super.key, required this.awnserText, required this.onTap});

  final String awnserText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 49, 0, 105),
        foregroundColor: Colors.white,
      ),
      child: Text(awnserText),
    );
  }
}
