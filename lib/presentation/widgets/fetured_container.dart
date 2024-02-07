import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedContainer extends StatelessWidget {
  final bool? hasLike;
  final double? starCount;
  final String? image;
  final String? productName;
  final String? productPrice;
  const FeaturedContainer(
      {super.key,
      this.hasLike = false,
      required this.image,
      this.starCount,
      required this.productName,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: SizedBox(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // CONTAINER

            Container(
              width: 126,
              height: 227,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300]!),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          image!, // Assuming `image` is now a network image URL
                      fit: BoxFit.fitHeight,
                      width: 126,
                      height: 227,
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
                    if (hasLike!)
                      Positioned(
                        top: 5,
                        right: 10,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/images/svg/heart.svg",
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Container(
            //   width: 126,
            //   height: 227,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage(
            //             image!,
            //           ),
            //           fit: BoxFit.fitHeight),
            //       borderRadius: BorderRadius.circular(15)),
            //   child: Stack(
            //     children: [
            //       hasLike!
            //           ? Positioned(
            //               top: 5,
            //               right: 10,
            //               child: CircleAvatar(
            //                 radius: 13,
            //                 backgroundColor: Colors.white,
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: SvgPicture.asset(
            //                     "assets/images/svg/heart.svg",
            //                     color: Colors.red,
            //                   ),
            //                 ),
            //               ))
            //           : Container()
            //     ],
            //   ),
            // ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                productName!,
                style: AppTextStyle.subtitle().copyWith(fontSize: 12),
              ),
            ),
            Container(
              width: 100,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "\$${productPrice}",
                  style: AppTextStyle.subtitle().copyWith(fontSize: 16),
                ),
              ),
            ),

            hasLike!
                ? AnimatedRatingStars(
                    initialRating: starCount!,
                    minRating: 0.0,
                    maxRating: 5.0,
                    filledColor: Colors.green,
                    emptyColor: Colors.green,
                    filledIcon: Icons.star,
                    halfFilledIcon: Icons.star_half,
                    emptyIcon: Icons.star_border,
                    onChanged: (double rating) {
                      // Handle the rating change here
                      print('Rating: $rating');
                    },
                    displayRatingValue: true,
                    interactiveTooltips: true,
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border,
                    starSize: 15.0,
                    animationDuration: Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                    readOnly: false,
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
