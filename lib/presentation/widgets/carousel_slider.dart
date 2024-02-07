import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_assignment/presentation/utils/app_text_styles.dart';
import 'package:flutter_assignment/presentation/widgets/loader.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady%20(1).jpg?alt=media&token=ec8e702d-1bc8-40a5-a6d0-c229b399fbd2',
    'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady2.jpg?alt=media&token=6557e38a-3419-44eb-8ab7-593b243292f2',
    // 'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady3.jpg?alt=media&token=5560c951-e27c-4b1c-b6e6-25ba9bcd02cb',
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
                .map((item) => ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: CachedNetworkImage(
                        imageUrl: item,
                        fit: BoxFit.cover,
                        width: screenSize.width,
                        placeholder: (context, url) => Loader(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
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
                      duration: Duration(milliseconds: 0),
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
