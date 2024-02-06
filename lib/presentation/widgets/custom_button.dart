import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor; 
  final Color? borderlineColor; 
  final Color? textColor; 

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.buttonColor =
        Colors.transparent, 
    this.borderlineColor = Colors.black, 
    this.textColor = Colors.black, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        fixedSize: const Size(193, 53),
        backgroundColor: buttonColor, 
        side: BorderSide(
            color: borderlineColor!), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold), 
      ),
    );
  }
}
