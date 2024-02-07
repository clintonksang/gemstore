import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_assignment/presentation/widgets/orders_container.dart';
import 'package:flutter_assignment/presentation/widgets/tab_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/order_model.dart';
import '../../../domain/service/order_service.dart';
import '../../utils/app_colors.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late List<Order> orders;

  @override
  void initState() {
    super.initState();
    orders = OrderService.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
            forceElevated: false,
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset('assets/images/svg/drawer.svg'),
              onPressed: () {},
            ),
            title: Text('My Orders',
                style: AppTextStyle.title(color: AppColors().secondaryColor)),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset('assets/images/svg/bell.svg'),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TabButtonDemo(),
            ),
          ),
          ...orders
              .map((order) => SliverToBoxAdapter(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: OrdersContainer(
                        orderNumber: order.orderNumber,
                        date: order.date,
                        quantity: order.quantity,
                        subtotal: order.subtotal,
                        trackingNumber: order.trackingNumber,
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
