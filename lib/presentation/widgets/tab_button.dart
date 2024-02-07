import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class TabButtonDemo extends StatefulWidget {
  @override
  _TabButtonDemoState createState() => _TabButtonDemoState();
}

class _TabButtonDemoState extends State<TabButtonDemo> {
  int _selectedIndex = 1;

  final List<String> _tabLabels = ['Pending', 'Delivered', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) => _buildTabButton(index)),
      ),
    );
  }

  Widget _buildTabButton(int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 91,
        height: 28,
        decoration: BoxDecoration(
          color: isSelected ? AppColors().blackTabColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color:
                  isSelected ? AppColors().blackTabColor : Colors.transparent),
        ),
        child: Center(
          child: Text(
            _tabLabels[index],
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors().blackTabColor,
            ),
          ),
        ),
      ),
    );
  }
}
