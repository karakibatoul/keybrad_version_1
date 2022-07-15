import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';

class MyItemsEmptyWidget extends StatefulWidget {

  //the add button is looking to big ,not setting its  width and height to 80
  //const MyItemsEmptyWidget({Key? key}) : super(key: key);

  final String backgroundImageName;
  final double backgroundImageBottom;
  final double addRightPositioned;
  final double addLeftPositioned;
  final double addHeightPositioned;
  final double addImageWidth;
  final double addImageHeight;

  const MyItemsEmptyWidget({
    Key? key,
    required this.backgroundImageName,
    required this.backgroundImageBottom,
    required this.addRightPositioned,
    required this.addLeftPositioned,
    required this.addHeightPositioned,
    required this.addImageHeight,
    required this.addImageWidth
  }) : super(key: key);

  @override
  State<MyItemsEmptyWidget> createState() => _MyItemsEmptyWidgetState();
}

class _MyItemsEmptyWidgetState extends State<MyItemsEmptyWidget> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(


        toolbarHeight: kToolbarHeight+3.h,
        backgroundColor: AppTheme.greyBackgroundColor,
        title:const Text('Mes articles',
          textAlign: TextAlign.left,
          style: TextStyle(color: AppTheme.itemTitleColor,fontSize: 30),),


        automaticallyImplyLeading: false,
      ),
      body:   LayoutBuilder(
        builder: (context,constraint){
          return Stack(
            children: <Widget>[
              Positioned(
                top: 0,right: 0,left: 0,bottom: widget.backgroundImageBottom,
                child:  Image.asset(
                  widget.backgroundImageName,
                  fit: BoxFit.fill,
                  //alignment: Alignment.bottomLeft,
                ),
              ),
              Positioned(

                right: widget.addRightPositioned,
                height:widget.addHeightPositioned,
                left: widget.addLeftPositioned,



                child: InkWell(

                  onTap: () {
                    print(widget.addImageHeight);

                  },
                  child: SizedBox(
                    width: constraint.maxHeight,
                    height: widget.addImageHeight,
                    child: Image.asset(
                      'assets/icons/add copy.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ), ),
            ],
          );
        },

      ),


    );
  }
}
