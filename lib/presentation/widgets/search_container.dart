import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class SearchContainer extends StatefulWidget {
  final double? starCount;
  final String? image;
  final bool? isLiked;
  final String? productName;
  final String? reviews;
  final String? productPrice;
  const SearchContainer(
      {super.key,
      required this.image,
      this.starCount,
      this.isLiked,
      required this.productName,
      required this.reviews,
      required this.productPrice});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: Container(
        width: 120,
        height: 340,
        child: Stack(
          children: [
            // CONTAINER

            GestureDetector(
              onTap: () {
                print('like');
                setState(() {
                  isLiked = !isLiked;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: widget.image!,
                            fit: BoxFit.cover,
                            width: 126,
                            height: 190,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                                width: 150,
                                height: 66,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
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
                                  color: isLiked! ? Colors.red : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // widgets content
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName!,
                          style: AppTextStyle.subtitle().copyWith(fontSize: 12),
                        ),
                        Text(
                          "\$${widget.productPrice}",
                          style: AppTextStyle.subtitle().copyWith(fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 3,
                              child: AnimatedRatingStars(
                                initialRating: widget.starCount!,
                                minRating: 0.0,
                                maxRating: 5.0,
                                filledColor: AppColors().starGreen,
                                emptyColor: AppColors().starGreen,
                                filledIcon: Icons.star,
                                halfFilledIcon: Icons.star_half,
                                emptyIcon: Icons.star_border,
                                onChanged: (double rating) {},
                                displayRatingValue: true,
                                interactiveTooltips: true,
                                customFilledIcon: Icons.star,
                                customHalfFilledIcon: Icons.star_half,
                                customEmptyIcon: Icons.star_border,
                                starSize: 15.0,
                                animationDuration: Duration(milliseconds: 300),
                                animationCurve: Curves.easeInOut,
                                readOnly: false,
                              ),
                            ),
                            Text(
                              '(${widget.reviews!})',
                              style: AppTextStyle.subtitle()
                                  .copyWith(fontSize: 8, color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
