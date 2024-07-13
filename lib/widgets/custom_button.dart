import 'package:flutter/material.dart';
import 'package:interactify/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(160, 50),
        foregroundColor: Colors.white
      ),
    );
  }
}
