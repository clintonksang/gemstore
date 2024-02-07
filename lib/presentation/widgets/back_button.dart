import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            offset: Offset(0.0, 2.0),
            blurRadius: 5.0,
            spreadRadius: 3.0,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/images/svg/arrow_back.svg',
          width: 15,
          height: 15,
        ),
      ),
    );
  }
}
