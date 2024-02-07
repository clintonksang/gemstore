import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';

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
                border: Border.all(width: 3.0, color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  imageUrl: assetImage!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                      width: 150,
                      height: 66,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
