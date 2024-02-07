import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/models/featured_model.dart';
import 'package:flutter_assignment/presentation/widgets/fetured_container.dart';
import 'package:flutter_assignment/presentation/widgets/reccomended.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';

import '../../../domain/service/featured_service.dart';
import '../../widgets/carousel_slider.dart';
import '../../widgets/home_tab.dart';
import '../../widgets/new_collection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<FeaturedItem> featuredItems;
  @override
  void initState() {
    // TODO: implement initState
    featuredItems = FeaturedItemService.getFeaturedItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: CustomScrollView(
          slivers: <Widget>[
            //Sliver AppBar
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              forceElevated: false,
              // backgroundColor: Colors.white,
              // foregroundColor: Colors.red,
              // shadowColor: Colors.yellow,
              elevation: 0,
              leading: IconButton(
                icon: SvgPicture.asset('assets/images/svg/drawer.svg'),
                onPressed: () {},
              ),
              title: Text('GemStore',
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

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured Products',
                          style: AppTextStyle.title(),
                        ),
                        Text(
                          'show all',
                          style: TextStyle(color: AppColors().greyTextColor),
                        ),
                      ],
                    )),
              ),
            ),

            // Featured
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 290,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredItems.length,
                    itemBuilder: (context, index) {
                      FeaturedItem item = featuredItems[index];
                      return FeaturedContainer(
                        image: item.image,
                        hasLike: item.hasLike,
                        productName: item.productName,
                        productPrice: item.productPrice,
                      );
                    },
                  ),
                ),
              ),
            ),
     

            // new collection
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: AppColors().secondaryContainerColor,
                  width: MediaQuery.of(context).size.width,
                  height: 171,
                  child: const CollectionContainer(
                    title: '| NEW COLLECTION',
                    assetImage:
                        'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady_collection.png?alt=media&token=ec5f0e75-9d24-49c4-8e24-4fb30c5ba288',
                    bodyText: 'HANG OUT \n& PARTY',
                    isSingleCircle: false,
                  ),
                ),
              ),
            ),
            // reccomended
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reccomended',
                          style: AppTextStyle.title(),
                        ),
                        Text(
                          'show all',
                          style: TextStyle(color: AppColors().greyTextColor),
                        ),
                      ],
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const Reccomended(
                        assetImage:
                            'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady7.png?alt=media&token=a4fc526b-d57a-4eb1-ab25-b887c8f77832',
                        text: 'White Fashion Hoodie\n\n\$29.00',
                      );
                    },
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Collection',
                          style: AppTextStyle.title(),
                        ),
                        Text(
                          'show all',
                          style: TextStyle(color: AppColors().greyTextColor),
                        ),
                      ],
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: AppColors().secondaryContainerColor,
                  width: MediaQuery.of(context).size.width,
                  height: 171,
                  child: const CollectionContainer(
                      title: "| Sale up to 40%",
                      bodyText: 'FOR SLIM\n& BEAUTY',
                      assetImage:
                          'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady_8.png?alt=media&token=a6f9cf6c-bcbf-4a90-a151-fb53a32c7bc4',
                      isSingleCircle: true),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: AppColors().secondaryContainerColor,
                  width: MediaQuery.of(context).size.width,
                  height: 171,
                  child: const CollectionContainer(
                    title: "Summer Collection 2021",
                    bodyText: 'Most sexy\n& fabulous\ndesign ',
                    assetImage:
                        'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady_9.png?alt=media&token=d334d43c-297f-4f19-9cb1-66bee463077e',
                    isSingleCircle: true,
                    containerHeight: 115,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
