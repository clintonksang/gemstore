import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/models/search_model.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_assignment/presentation/widgets/back_button.dart';

import '../../domain/service/search_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/search_container.dart';

class FoundResults extends StatefulWidget {
  final String results;
  const FoundResults({super.key, this.results = '152'});

  @override
  State<FoundResults> createState() => _FoundResultsState();
}

class _FoundResultsState extends State<FoundResults> {
  late List<SearchModel> dressItems;

  @override
  void initState() {
    super.initState();
    dressItems = fetchDressItems();
  }

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
                  const SizedBox(height: 10),

                  GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 80,
                      childAspectRatio: .75,
                    ),
                    itemCount: dressItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      SearchModel item = dressItems[index];
                      return Container(
                        height: 350,
                        child: SearchContainer(
                          image: item.image,
                          productName: item.productName,
                          productPrice: item.productPrice,
                          starCount: item.starCount.toDouble(),
                          reviews: item.reviews,
                         isLiked:  item.hasLike
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
