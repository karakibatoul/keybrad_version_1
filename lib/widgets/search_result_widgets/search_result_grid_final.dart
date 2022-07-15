
import 'package:flutter/material.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/app_theme.dart';
import '../filter_trier_round_widget.dart';
import '../items_widget/fliter_widget.dart';
import '../items_widget/items_grid.dart';
import '../items_widget/trier_widget.dart';
class SearchResultFinal extends StatelessWidget {
  const SearchResultFinal({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    Widget searchText =
    Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child:  Row(children: [
      Image.asset('assets/icons/search.png',width: 30,height: 30,),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child:  Text(
            '120 articles',//it should be the nbr of articles rendered by the profile
            style: TextStyle(

              fontSize: 15.sp,
            ),
          ),
      )],),);


    Widget bottomDrawer =
    Container(
      margin:  EdgeInsets.only(right: 3.w,left: 1.w,top: 0.5.h,bottom: 2.h),
      //margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 00),
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 1.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                child: BackWidget(width: 35,height: 35,)),

            Spacer(),
            Container(
              // margin: EdgeInsets.all(50),
                child: const FilterTrierRoundWidget()
            ),
          ],
        ),
      ),
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
              bottomDrawer,
              searchText,
              SizedBox(height: 2.h,),
              const ItemsGrid(param: 0,),
            ],

          ),
        ),
      ),
        Positioned(

          //top: 370,

          height: 3.5.h,
          bottom:  MediaQuery.of(context).size.height / 4-MediaQuery.of(context).size.height / 11,
          right: 10,
          width: 1.5.h+3.w,
          //left:MediaQuery.of(context).size.width-100,
          child: Bouncing(
            onPress: (){},
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft:Radius.circular(80) ,bottomLeft: Radius.circular(80)),
              child: Container(
                height: 10,
                width: 10,
                //alignment: Alignment.bottomRight,
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
