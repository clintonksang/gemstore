import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';

import '../widgets/back_button.dart';
import '../widgets/order_list.dart';

class OrderDetailPage extends StatefulWidget {
  final String? orderNumber;
  final String? trackingNumber;
  const OrderDetailPage(
      {super.key, required this.trackingNumber, required this.orderNumber});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 15,
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  height: 20,
                ),
                // Top Section
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const ButtonBack()),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 45.0,
                      ),
                      child: Text(
                        'Order #${widget.orderNumber!}',
                        style: AppTextStyle.title(),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                OrderList(orderNumber: widget.orderNumber,trackingNumber: widget.trackingNumber,)
              ])),
        ),
      ),
    );
  }
}
