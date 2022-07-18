import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';


class FullScreenSlider extends StatelessWidget {
  final List<String> imgList ;
  const FullScreenSlider({Key? key, required this.imgList}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.greyBackgroundColor,
        foregroundColor: Colors.black,
        // title: Text('Fullscreen sliding carousel demo',)
      ),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Center(
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      height: height,
                    )))
                .toList(),
          );
        },
      ),
    );
  }
}