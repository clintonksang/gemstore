import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/search/order_detail_page.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_assignment/presentation/widgets/custom_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../routes/router.dart';

class OrderList extends StatelessWidget {
  final String? orderNumber;

  final String? trackingNumber;

  const OrderList({
    super.key,
    required this.orderNumber,
    this.trackingNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // image container
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
          ),
          child: Container(
            height: 92,
            width: 327,
            decoration: BoxDecoration(
                color: AppColors().greyContainer,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Container(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your order is delivered   ',
                          style: AppTextStyle.title(
                                  color: AppColors().primaryColor)
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          'Rate product to get 5 points for collect.',
                          style: AppTextStyle.normal(
                                  color: AppColors().primaryColor)
                              .copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),

                // right
                Padding(
                  padding: EdgeInsets.only(
                    right: 15,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/svg/hand.svg',
                  ),
                ),
              ],
            ),
          ),
        ),

        // Container 1
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: 336,
            height: 182,
            decoration: BoxDecoration(
              color: AppColors().orderContainerColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(2, 4),
                  blurRadius: 10.0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        'Order number',
                        style: AppTextStyle.normal(),
                      ),
                      Spacer(),
                      Text(
                        '#${orderNumber!}',
                        style: AppTextStyle.normal(color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Tracking Number',
                        style: AppTextStyle.normal(),
                      ),
                      Spacer(),
                      Text(
                        trackingNumber!,
                        style: AppTextStyle.normal(color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Delivery address',
                        style: AppTextStyle.normal(),
                      ),
                      Spacer(),
                      Text(
                        'SBI Building, Software Park',
                        style: AppTextStyle.normal(color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        //container 2
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: 336,
            height: 215,
            decoration: BoxDecoration(
              color: AppColors().orderContainerColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(2, 4),
                  blurRadius: 10.0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Maxi Dress',
                        style: AppTextStyle.normal(),
                      ),
                      Text(
                        'x1',
                        style: AppTextStyle.normal(color: Colors.black),
                      ),
                      Text(
                        '\$68.00',
                        style: AppTextStyle.normal(color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Linen Dress',
                        style: AppTextStyle.normal(),
                      ),
                      Text(
                        'x1',
                        style: AppTextStyle.normal(color: Colors.black),
                      ),
                      Text(
                        '\$52.00',
                        style: AppTextStyle.normal(color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Sub Total',
                        style: AppTextStyle.normal(),
                      ),
                      Spacer(),
                      Text(
                        '120.00',
                        style: AppTextStyle.normal(color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Shipping',
                        style: AppTextStyle.normal(),
                      ),
                      Spacer(),
                      Text(
                        '0.00',
                        style: AppTextStyle.normal(color: Colors.black),
                      )
                    ],
                  ),
                  Divider(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyle.normal(),
                      ),
                      Spacer(),
                      Text(
                        '\$120.00',
                        style: AppTextStyle.normal(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
                width: 200,
                label: 'Return Home',
                borderlineColor: AppColors().secondaryColor,
                buttonColor: AppColors().orderContainerColor,
                onPressed: () {}),
            CustomButton(
                width: 100,
                label: 'Rate',
                textColor: AppColors().primaryColor,
                borderlineColor: AppColors().secondaryColor,
                buttonColor: AppColors().secondaryColor,
                onPressed: () {}),
          ],
        )
      ],
    );
  }
}
