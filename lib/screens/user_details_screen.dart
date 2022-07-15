
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/filter_trier_round_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../widgets/bouncing_widget.dart';
import '../widgets/items_widget/items_grid.dart';


class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/user_details_screen';

  @override
  Widget build(BuildContext context) {
    //final itemsData = Provider.of<Items>(context);
   // final items = itemsData.items;

    Widget headDrawer =
    DrawerHeader(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children:  [
            const Flexible(
              flex: 5,
              child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/personalImage.jpg',),


                  ),

              ),
            ),
             SizedBox(
              height: 3.h,
            ),
            Flexible(
                flex: 1,
                child:Container(
                    alignment: Alignment.center,
                   // margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: const Text(
                      'Nassim Zahi Samir',
                      style: TextStyle(
                          overflow: TextOverflow.visible,
                          color: AppTheme.drawerTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ))
            ),
             SizedBox(
              height: 0.5.h,
            ),
            Flexible(
                flex: 1,
                child:Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: const Text(
                      'Membre depuis le 12-03-2020',
                      style: TextStyle(
                          overflow: TextOverflow.visible,
                          color: AppTheme.itemPriceColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ))
            ),
          ],
        )
    );




    Widget widget =  SizedBox(
      width: MediaQuery.of(context).size.width ,
      child: Card(
          color: AppTheme.greyBackgroundColor,
          elevation: 0,
          child:
          Stack(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children:  [

                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                      child:   InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                          print('hello');
                        },
                          child:
                          IgnorePointer(child: BackWidget(height: 40,width: 40,)))),
                  const Spacer(),

                  Column(
                    children: [
                      Container(
                         margin: const EdgeInsets.only(top: 20, right: 20, bottom: 5, left: 20),
                       // margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                        //  margin: const EdgeInsets.all(50),
                        width: 40,
                        height: 40,
                        decoration:
                        const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.backButtonBackgroundColor),
                        child: Bouncing(
                          onPress: (){
                            print('jjjjjjj');
                            Timer(const Duration(milliseconds: 200), () {
                              Navigator.of(context, rootNavigator: true).pop();
                            });
                            },
                          child: Image.asset('assets/icons/report btn.png',
                                  width: IconTheme.of(context).size,
                                  height: IconTheme.of(context).size),
                        ),
                          ),

                      Text('Signaler',style: TextStyle(
                          overflow: TextOverflow.visible,
                          color: AppTheme.itemPriceColor,

                          fontSize: 15.sp),)
                    ],
                  ),


                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.24,
                //height: 20.h,
                  margin: EdgeInsets.only(top: 2.h),
                  child: headDrawer),



            ],)


      ),
    );



Widget bottomDrawer =
Container(
  margin:  EdgeInsets.only(right: 3.w,left: 1.w,top: 0.5.h,bottom: 2.h),
  //margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 00),
  child: Container(
     margin:  EdgeInsets.symmetric(horizontal: 1.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              '120 articles',//it should be the nbr of articles rendered by the profile
              style: TextStyle(

                fontSize: 15.sp,
              ),
            ),
          ),
        ),
        const Spacer(),
         const FilterTrierRoundWidget(),
      ],
    ),
  ),
);
    return Scaffold(body:  Stack(
      children: [
        Positioned(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(

          children:  [
            widget,
            const SizedBox(
              height: 10,
            ),
            bottomDrawer,

            const ItemsGrid(param: 1,),
          ],

        ),
      ),
    ),
      Positioned(
        height: 3.5.h,
        bottom:  MediaQuery.of(context).size.height / 4-MediaQuery.of(context).size.height / 11,
        right: 10,
        width: 1.5.h+3.w,
        //left:MediaQuery.of(context).size.width-100,
        child: InkWell(
          onTap: () {
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft:Radius.circular(80) ,bottomLeft: Radius.circular(80)),
            child: Container(
              height: 10,
              width: 10,
              color: AppTheme.backgroundOrange,
              child: Bouncing(
                onPress: (){},
                child: Image.asset(
                  'assets/icons/up.png',

                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),

    ],),);
  }
}
