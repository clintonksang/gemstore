import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_assignment/presentation/widgets/loader.dart';

import '../utils/app_colors.dart';

class CollectionContainer extends StatelessWidget {
  final String? title;
  final String? bodyText;
  final double? containerHeight;
  final String? assetImage;
  final bool? isSingleCircle;

  const CollectionContainer(
      {super.key,
      required this.title,
      required this.assetImage,
      this.bodyText,
      this.containerHeight = 91.0,
      this.isSingleCircle = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Text Part
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width * .4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  // '| NEW COLLECTION',
                  style: AppTextStyle.light().copyWith(fontSize: 12),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    bodyText!,
                    // 'HANG OUT \n& PARTY',
                    style: AppTextStyle.light().copyWith(
                        color: AppColors().secondaryColor, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Circular shapes

        Container(
          height: 160,
          width: 154,
          child: Stack(
            children: [
              Positioned(
                right: 10,
                child: Container(
                  width: 132,
                  height: 132,
                  decoration: BoxDecoration(
                      color: AppColors().secondcircularShapeColor,
                      shape: BoxShape.circle),
                ),
              ),
              !isSingleCircle!
                  ? Positioned(
                      right: 35,
                      top: 25,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[500], shape: BoxShape.circle),
                      ),
                    )
                  : SizedBox(),
              Positioned(
                right: 10,
                top: 1,
                child: CachedNetworkImage(
                  width: 119,
                  height: 158,
                  fit: BoxFit.cover,
                  imageUrl: assetImage!,
                  placeholder: (context, url) => Loader(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
