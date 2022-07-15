
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';
import 'add_item_screen.dart';


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const AddItemScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.elasticInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
class MyItemsEmpty3 extends StatelessWidget {
  final bool showAppbar;
  const MyItemsEmpty3({Key? key, required this.showAppbar}) : super(key: key);
  static const routeName = '/no_items_empty_3_screen';

  @override
  Widget build(BuildContext context) {
    return

       /* MyItemsEmptyWidget(
            backgroundImageName: "assets/images/noItemsInMyItems03.png",
            backgroundImageBottom: kToolbarHeight/2+10.h,
            addRightPositioned: 10.w,
            addLeftPositioned: 0,
            addHeightPositioned: 126.h,
            addImageWidth:8 ,
            addImageHeight: 8,
        );

        */
      Scaffold(
      appBar: showAppbar ?AppBar(


        toolbarHeight: kToolbarHeight+3.h,
        backgroundColor: AppTheme.greyBackgroundColor,
        title:const Text('Mes articles',
          textAlign: TextAlign.left,
          style: TextStyle(color: AppTheme.itemTitleColor,fontSize: 30),),


        automaticallyImplyLeading: false,
      ):null,
      body:   LayoutBuilder(
        builder: (context,constraint){
          return Stack(
            children: <Widget>[
              Positioned(
                top: 0,right: 0,left: 0,bottom: kToolbarHeight/2+10.h,
                child:  Image.asset(
                  "assets/images/noItemsInMyItems03.png",
                  fit: BoxFit.fill,
                  //alignment: Alignment.bottomLeft,
                ),
              ),
              Positioned(

                right: 10.w,
                height:126.h,



                child: SizedBox(
                  width: 80,
                  height: 80,


                  child: Bouncing(
                    onPress: (){ Timer(const Duration(milliseconds: 100), () {
                      Navigator.of(context).push(_createRoute());
                    });},
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
