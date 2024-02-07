import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/models/featured_model.dart';
import 'package:flutter_assignment/presentation/widgets/fab_container.dart';
import 'package:flutter_assignment/presentation/widgets/fetured_container.dart';
import 'package:flutter_assignment/presentation/widgets/reccomended.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';

import '../../../data/models/fab_items.dart';
import '../../../domain/service/fab_service.dart';
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
  bool showFeaturedGrid = false;

  @override
  void initState() {
    super.initState();
    featuredItems = FeaturedItemService.getFeaturedItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: CustomScrollView(
          slivers: <Widget>[
            //Sliver AppBar
            SliverAppBar(
              backgroundColor: AppColors().primaryColor,
              floating: true,
              pinned: false,
              snap: false,
              forceElevated: false,
              elevation: 1,
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
                    height: 200,
                    child: Carousel())),

           // FEATURED SECTION(Expandable)
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
                        InkWell(
                          onTap: () {
                            setState(() {
                              showFeaturedGrid = !showFeaturedGrid;
                            });
                          },
                          child: Text(
                            'show all',
                            style: TextStyle(color: AppColors().greyTextColor),
                          ),
                        ),
                      ],
                    )),
              ),
            ),

            //  expand featured items`
            if (showFeaturedGrid)
              SliverGrid(
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    FeaturedItem item = featuredItems[index];
                    return FeaturedContainer(
                      image: item.image,
                      hasLike: item.hasLike,
                      productName: item.productName,
                      productPrice: item.productPrice,
                    );
                  },
                  childCount: featuredItems.length,
                ),
              )
            else
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

            // New collection
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
            // Reccomended
            
            
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
                    title: "| Summer Collection 2021",
                    bodyText: 'Most sexy\n& fabulous\ndesign ',
                    assetImage:
                        'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady_9.png?alt=media&token=d334d43c-297f-4f19-9cb1-66bee463077e',
                    isSingleCircle: true,
                    containerHeight: 115,
                  ),
                ),
              ),
            ),

            // bottom container
            SliverToBoxAdapter(
              child: Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: FabService.fetchFabItems().length,
                  itemBuilder: (context, index) {
                    FabItem item = FabService.fetchFabItems()[index];
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * .45,
                      child: FabContainer(
                        image: item.image,
                        subtitle: item.subtitle,
                        title: item.title,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
