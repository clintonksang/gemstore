import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';

class FabContainer extends StatefulWidget {
  final String? image;
  final String? title;
  final String? subtitle;

  const FabContainer({super.key, this.image, this.title, this.subtitle});
  @override
  _FabContainerState createState() => _FabContainerState();
}

class _FabContainerState extends State<FabContainer> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[100],
              ),
              width: screenSize.width / 2,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  widget.image!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title!,
                      style: AppTextStyle.normal(
                        color: AppColors().greyTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.subtitle!,
                      style: AppTextStyle.normal(color: Colors.black)
                          .copyWith(fontSize: 20),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
