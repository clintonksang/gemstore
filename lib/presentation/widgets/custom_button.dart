import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor; // Optional parameter with default value
  final Color? borderlineColor; // Optional parameter with default value
  final Color? textColor; // Optional parameter with default value

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.buttonColor =
        Colors.transparent, // Default to transparent if not provided
    this.borderlineColor = Colors.black, // Default to black if not provided
    this.textColor = Colors.black, // Default to black if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        fixedSize: const Size(193, 53),
        backgroundColor: buttonColor, // Use buttonColor for the background
        side: BorderSide(
            color: borderlineColor!), // Use borderlineColor for the border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold), // Apply textColor to Text widget
      ),
    );
  }
}
