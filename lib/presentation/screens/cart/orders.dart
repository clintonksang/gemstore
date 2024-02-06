import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_assignment/presentation/widgets/orders_container.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: CustomScrollView(
        slivers: <Widget>[
          //Sliver AppBar
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

          // Circular Tab
          SliverToBoxAdapter(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: OrdersContainer(orderNumber: '1514',date: '13/05/2021',quantity: '3',subtotal: '110',) )),
          
        ],
      ),
    );
  }
}
