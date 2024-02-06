import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';

class Reccomended extends StatelessWidget {
  final String? assetImage;
  final String? text;
  const Reccomended({super.key, required this.assetImage, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .75,
        height: 66,
        decoration: BoxDecoration(
          border:
              Border.all(width: 3.0, color: AppColors().inactiveButtonColor),
          borderRadius: BorderRadius.all(Radius.circular(15.0) //

              ),
        ),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 66,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(assetImage!), fit: BoxFit.cover),
                border: Border.all(width: 3.0, color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(15.0) //

                    ),
              ),
            ),
            Spacer(),
            Container(
                width: 150,
                height: 66,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    text!,
                    style: AppTextStyle.title().copyWith(fontSize: 12),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
