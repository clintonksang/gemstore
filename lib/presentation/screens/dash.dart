import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/screens/home/homescreen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../utils/app_colors.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color activeColor = AppColors().secondaryColor;
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/images/svg/home.svg",
            width: 21, color: AppColors().secondaryColor),
        inactiveIcon: SvgPicture.asset("assets/images/svg/home.svg",
            width: 21, color: AppColors().inactiveButtonColor),
        activeColorPrimary: AppColors().secondaryColor,
        inactiveColorPrimary: AppColors().inactiveButtonColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/svg/search.svg",
          width: 21,
          color: AppColors().secondaryColor,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/images/svg/search.svg",
          width: 21,
          color: AppColors().inactiveButtonColor,
        ),
        activeColorPrimary: AppColors().secondaryColor,
        inactiveColorPrimary: AppColors().inactiveButtonColor,
      ),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/images/svg/cart.svg",
            width: 21,
            color: AppColors().secondaryColor,
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/images/svg/cart.svg",
            width: 21,
            color: AppColors().inactiveButtonColor,
          )),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/svg/profile.svg",
          width: 21,
          color: AppColors().secondaryColor,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/images/svg/profile.svg",
          width: 21,
          color: AppColors().inactiveButtonColor,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarHeight: 100,
      onItemSelected: (value) {
        setState(() {
          activeColor = AppColors().secondaryColor;
        });
      },
      confineInSafeArea: true,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style6,
    );
  }
}

 

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text("Search Screen")));
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text("Cart Screen")));
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text("Profile Screen")));
}

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget(
    this.items, {
    required final Key key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  Widget _buildItem(
          final PersistentBottomNavBarItem item, final bool isSelected) =>
      Container(
        alignment: Alignment.center,
        height: kBottomNavigationBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: IconTheme(
                data: IconThemeData(
                    size: 26,
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary ?? item.activeColorPrimary),
                child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                    child: Text(
                  item.title!,
                  style: TextStyle(
                      color: isSelected
                          ? (item.activeColorSecondary ??
                              item.activeColorPrimary)
                          : item.inactiveColorPrimary,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                )),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(final BuildContext context) => Container(
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((final item) {
              final int index = items.indexOf(item);
              return Flexible(
                child: GestureDetector(
                  onTap: () {
                    onItemSelected(index);
                  },
                  child: _buildItem(item, selectedIndex == index),
                ),
              );
            }).toList(),
          ),
        ),
      );
}
