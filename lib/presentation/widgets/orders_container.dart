import 'package:flutter/material.dart';
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), 
            offset: Offset(0, 4), 
            blurRadius: 10.0,  
            spreadRadius: 0,  
          ),
         
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Order #${orderNumber}',
                style: AppTextStyle.subtitle(),
              ),
              Spacer(),
              Text(
                'Order #${date}',
                style: AppTextStyle.subtitle(),
              )
            ],
          ),

          // tracking number
          RichText(
              text: TextSpan(children: [
            const TextSpan(
              text: 'Tracking number:',
            ),
            TextSpan(
                text: '$trackingNumber:',
                style: AppTextStyle.subtitle(color: Colors.black)),
          ])),

          // quantity
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: 'Quantity:',
                ),
                TextSpan(
                    text: '$quantity:',
                    style: AppTextStyle.subtitle(color: Colors.black)),
              ])),
              const Spacer(),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: 'Subtotal:',
                ),
                TextSpan(
                    text: '\$$subtotal:',
                    style: AppTextStyle.subtitle(color: Colors.black)),
              ])),
            ],
          ),
          // status
          Row(
            children: [
              Text(
                'DELIVERED',
                style: AppTextStyle.light()
                    .copyWith(color: Colors.green, fontSize: 20),
              ),
              const Spacer(),
              CustomButton(
                  label: 'Details',
                  borderlineColor: AppColors().secondaryColor,
                  buttonColor: AppColors().primaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.initial);
                  }),
            ],
          )
        ],
      ),
    );
  }
}
