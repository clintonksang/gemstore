import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_assignment/presentation/widgets/back_button.dart';

import '../widgets/custom_button.dart';
import '../widgets/fetured_container.dart'; // Ensure the spelling is correct here as well.

class FoundResults extends StatefulWidget {
  final String results;
  const FoundResults({super.key, this.results = '152'});

  @override
  State<FoundResults> createState() => _FoundResultsState();
}

class _FoundResultsState extends State<FoundResults> {
  double value = 3.5;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // Top Section
                  Row(
                    children: [
                      const ButtonBack(),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          'Dresses',
                          style: AppTextStyle.title(),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Filter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Found \n${widget.results} results',
                        style: AppTextStyle.title().copyWith(fontSize: 20),
                      ),
                      CustomButton(
                        label: 'Filter',
                        onPressed: () {},
                        buttonColor: AppColors().primaryColor,
                        width: 133,
                        isFilter: true,
                        borderlineColor: AppColors().inactiveButtonColor,
                      )
                    ],
                  ),
                  const SizedBox(
                      height: 10), // Add some spacing before the grid
                  // Wrap GridView.builder with Expanded
                  GridView.builder(
                    // It's important to limit the physics to avoid conflicts with the parent SingleChildScrollView
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap:
                        true, // Use it to let GridView know it needs to manage its own size
                    padding: EdgeInsets.all(8), // Adjust padding as needed
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 2, // Horizontal spacing between items
                      mainAxisSpacing: 10, // Vertical spacing between items
                      childAspectRatio: 0.75, // Aspect ratio of each item
                    ),
                    itemCount:
                        10, // Number of items in the grid, adjust as needed
                    itemBuilder: (BuildContext context, int index) {
                      // Return an instance of FeaturedContainer for each grid item
                      return FeaturedContainer(
                        hasLike: true,
                        image:
                            'assets/images/lady7.png', // Ensure the image path is correct
                        productName: 'Linen Dress',
                        productPrice: '52.00',
                        starCount: 4,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
