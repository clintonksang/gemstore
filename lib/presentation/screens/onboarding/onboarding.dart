import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/routes/router.dart';

import '../../utils/app_text_styles.dart';
import '../../widgets/custom_button.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Image at the bottom
          Container(
            decoration: BoxDecoration(
              color: AppColors()
                  .secondaryColor, // Assuming this is defined elsewhere
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/onboarding.png'),
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Welcome to GemStore!',
                  style: AppTextStyle.title(color: AppColors().primaryColor),
                ),
                const SizedBox(height: 8),
                Text(
                  'Start your journey',
                  style: AppTextStyle.subtitle(color: AppColors().primaryColor),
                ),
                const SizedBox(height: 100),
                CustomButton(
                  label: 'Get Started',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRouter.dashboard);
                  },
                  borderlineColor: AppColors().primaryColor,
                  buttonColor: AppColors().primaryColor.withOpacity(.5),
                  textColor: AppColors().primaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
