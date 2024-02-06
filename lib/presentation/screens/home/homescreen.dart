import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';

import '../../widgets/carousel_slider.dart';
import '../../widgets/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: CustomScrollView(
          slivers: <Widget>[
            //Sliver AppBar
            SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              backgroundColor: AppColors().primaryColor,
              foregroundColor: AppColors().primaryColor,
              shadowColor: AppColors().primaryColor,
              leading: IconButton(
                icon: SvgPicture.asset('assets/images/svg/drawer.svg'),
                onPressed: () {
                  // Handle drawer icon press
                },
              ),
              title: Text('Gemstore',
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
                    child: HomeTab())),
            //Caroussel Autumn Collectionß
            SliverToBoxAdapter(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Carousel())),

            // Featured
                    SliverToBoxAdapter(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Carousel()))
          ],
        ),
      ),
    );
  }
}
