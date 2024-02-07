import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/search/order_detail_page.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_assignment/presentation/widgets/custom_button.dart';

import '../../routes/router.dart';

class OrdersContainer extends StatelessWidget {
  final String? orderNumber;
  final String? date;
  final String? quantity;
  final String? subtotal;
  final String? status;
  final String? trackingNumber;

  const OrdersContainer(
      {super.key,
      required this.orderNumber,
      this.trackingNumber,
      this.status = 'DELIVERED',
      this.quantity = '3',
      this.subtotal,
      this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: 336,
        height: 200,
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
                    'Order #${orderNumber}',
                    style: AppTextStyle.title(),
                  ),
                  Spacer(),
                  Text(
                    'Order #${date}',
                    style: AppTextStyle.normal(),
                  )
                ],
              ),

              // tracking number
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Tracking number:', style: AppTextStyle.light()),
                  TextSpan(
                      text: '$trackingNumber:',
                      style: AppTextStyle.normal(color: Colors.black)),
                ])),
              ),

              // quantity
              Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(text: 'Quantity:', style: AppTextStyle.normal()),
                    TextSpan(
                        text: ' $quantity',
                        style: AppTextStyle.normal(color: Colors.black))
                  ])),
                  const Spacer(),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(text: 'Subtotal: ', style: AppTextStyle.normal()),
                    TextSpan(
                        text: '\$$subtotal',
                        style: AppTextStyle.subtitle(color: Colors.black)),
                  ])),
                ],
              ),
              // status
              Row(
                children: [
                  Text(
                    status!,
                    style: AppTextStyle.normal()
                        .copyWith(color: AppColors().green, fontSize: 14),
                  ),
                  const Spacer(),
                  CustomButton(
                      width: 150,
                      label: 'Details',
                      borderlineColor: AppColors().secondaryColor,
                      buttonColor: AppColors().orderContainerColor,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return OrderDetailPage(
                                trackingNumber: trackingNumber,
                                orderNumber: orderNumber);
                          },
                        )
                            // arguments: {
                            //   'orderNumber': orderNumber,
                            //   'trackingNumber': trackingNumber,
                            // },
                            );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
