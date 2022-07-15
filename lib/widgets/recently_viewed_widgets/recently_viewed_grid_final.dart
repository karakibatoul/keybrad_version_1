

import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/items_favorite_widget/items_grid_favorites.dart';
import 'package:keybrad/widgets/recently_viewed_widgets/recently_viewed_grid.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../providers/items.dart';
import '../items_widget/fliter_widget.dart';
import '../items_widget/trier_widget.dart';



class RecentlyViewedGridFinal extends StatelessWidget {
  const RecentlyViewedGridFinal({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context);
    final items = itemsData.items;

    Widget topWidget =
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
           margin: EdgeInsets.symmetric(horizontal: 0.2.h),
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                child:  BackWidget(width: 40,height: 40,))),
        SizedBox(height: 1.h,),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 2.5.h),
            child: Text('Articles récemment consultés ',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),))
      ],
    );

    Widget filterButton = Row(
      children: [
        SafeArea(
          child: Container(
            width: (MediaQuery.of(context).size.width - 80-1.w) / 2,
            height: 4.5.h,
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            //margin: const EdgeInsets.all(20),
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            FilterWidget());
                  },
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child:  Row(mainAxisSize: MainAxisSize.min, children: [
                      Image.asset(
                        'assets/icons/filterInBtn.png',
                        fit: BoxFit.fill,
                        width: 20,
                        height:20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Filter',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppTheme.trierColor, fontSize: 15),
                      )
                    ]),
                  ),

                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget trierButton = Row(
      children: [
        SafeArea(
          child: Container(
            width: (MediaQuery.of(context).size.width - 80-1.w) / 2,
            height: 4.5.h,



            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            //margin: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => const TrierWidget());
                  },
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Image.asset(
                        'assets/icons/sortInBtn.png',
                        fit: BoxFit.fill,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,

                      ),
                      const SizedBox(
                        height: 20,
                        child: Text(
                          'Trier',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppTheme.trierColor, fontSize: 15),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );

    Widget buttonsRow =
    Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 0.5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded( child: trierButton),

          Expanded( child: (filterButton))
        ],
      ) ,);
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
