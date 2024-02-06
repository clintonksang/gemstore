import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? borderlineColor;
  final Color? textColor;
  final double? width;
  final bool? isFilter;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width = 193,
    this.buttonColor = Colors.transparent,
    this.isFilter = false,
    this.borderlineColor = Colors.black,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        fixedSize: Size(width!, 53),
        backgroundColor: buttonColor,
        side: BorderSide(color: borderlineColor!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: isFilter!
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset(
                  "assets/images/svg/dropdown.svg",
                )
              ],
            )
          : Text(
              label,
              style: TextStyle(
                  color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
            ),
    );
  }
}
