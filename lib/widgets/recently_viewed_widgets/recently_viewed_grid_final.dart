

import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/recently_viewed_widgets/recently_viewed_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';





class RecentlyViewedGridFinal extends StatelessWidget {
  const RecentlyViewedGridFinal({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    Widget topWidget =
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
           margin: EdgeInsets.symmetric(horizontal: 0.2.h),
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                child:  const BackWidget(width: 40,height: 40,))),
        SizedBox(height: 1.h,),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 2.5.h),
            child: Text('Articles récemment consultés ',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),))
      ],
    );






    return

      Stack(children: [ Positioned(
        /* top: 20,
      bottom: 50,
      right: 10,
      left: 10,

      */

        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(

            children: [
              topWidget,
              SizedBox(height: 3.h,),
              const RecentlyViewedGrid(),
            ],

          ),
        ),
      ),
        Positioned(
          height: 3.5.h,
          bottom:  MediaQuery.of(context).size.height / 4-MediaQuery.of(context).size.height / 11,
          right: 10,
          width: 1.5.h+3.w,
          child: InkWell(
            onTap: () {
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft:Radius.circular(80) ,bottomLeft: Radius.circular(80)),
              child: Container(
                height: 10,
                width: 10,
                color: AppTheme.backgroundOrange,
                child: Image.asset(
                  'assets/icons/up.png',

                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),

      ],);

  }
}
