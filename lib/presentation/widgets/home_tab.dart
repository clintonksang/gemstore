import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_svg/svg.dart';
// Assuming AppColors is defined and flutter_svg package is imported correctly
// import 'package:flutter_svg/flutter_svg.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors().primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors().primaryColor,
          bottom: TabBar(
            isScrollable: false,
            dividerHeight: 0,
            // indicatorPadding: EdgeInsets.all(10),

            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              customTab(0, 'assets/images/svg/women.svg', 'Women'),
              customTab(1, 'assets/images/svg/men.svg', 'Men'),
              customTab(2, 'assets/images/svg/accessories.svg', 'Accessories'),
              customTab(3, 'assets/images/svg/beauty.svg', 'Beauty'),
            ],
            indicatorColor: Colors.transparent, // Hide the default indicator
          ),
        ),
      ),
    );
  }

  Widget customTab(int index, String svgAsset, String label) {
    bool isSelected = _selectedIndex == index;
    Color backgroundColor =
        isSelected ? AppColors().secondaryColor : AppColors().primaryColor;
    Color innerColor =
        isSelected ? AppColors().secondaryColor : Colors.grey[200]!;

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor,
            maxRadius: 37,
            child: CircleAvatar(
              backgroundColor: AppColors().primaryColor,
              radius: 35,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  maxRadius: 34,
                  backgroundColor: innerColor,
                  child: SvgPicture.asset(
                    svgAsset,
                    color: isSelected ? AppColors().primaryColor : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
