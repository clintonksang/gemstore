import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'assets/images/lady.jpeg',
    'assets/images/lady2.jpg',
    'assets/images/lady3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider(
            items: imgList
                .map((item) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(item)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                    ))
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: screenSize.height,
              autoPlay: false,
              aspectRatio: screenSize.width / screenSize.height,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          //
          Positioned(
            bottom: 10.0,
            child: SizedBox(
              width: screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => {},
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 15.0,
                      height: 15.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry.key
                            ? Colors.white
                            : Colors.transparent,
                        border: _currentIndex == entry.key
                            ? Border.all(color: Colors.white, width: 5.0)
                            : Border.all(color: Colors.white, width: 1.0),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          Positioned(
              right: 10,
              child: Text(
                'Autumn \nCollection \n2021',
                style: AppTextStyle.title(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
