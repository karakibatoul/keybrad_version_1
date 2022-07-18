
import 'package:flutter/material.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/app_theme.dart';
import '../filter_trier_round_widget.dart';
import '../items_widget/items_grid.dart';


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
                child: const BackWidget(width: 35,height: 35,)),

           const  Spacer(),
            const FilterTrierRoundWidget(),
          ],
        ),
      ),
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
