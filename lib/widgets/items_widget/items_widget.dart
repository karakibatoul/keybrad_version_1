
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/screens/common_item_screen.dart';
import 'package:provider/provider.dart';
import 'package:keybrad/providers/item_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../bouncing_widget.dart';

class ItemWidget extends StatelessWidget {
  final int index;
  const ItemWidget({Key? key, required this.index}) : super(key: key);
  static const routeName = '/item_screen';

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Item>(context);
    var itemRow = Container(
      height: MediaQuery.of(context).size.height / 4,
      margin:  EdgeInsets.symmetric(horizontal: 2.5.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child:  Container(
       // padding: const EdgeInsets.all(15),//second approuch
        padding:  EdgeInsets.all(3.w),
        child:

         Row(mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                  width: MediaQuery.of(context).size.width / 3 ,
                  height: MediaQuery.of(context).size.height / 4,
                 // margin: const EdgeInsets.all(15),
                margin:  EdgeInsets.only(right: 2.w),//second approuch
              //  padding: const EdgeInsets.only(right: 10),
                //width:100,
                //  height: 100,

                  decoration: BoxDecoration(
                    color: Colors.transparent,


                    borderRadius: const BorderRadius.only(topLeft:Radius.circular(10),bottomLeft: Radius.circular(10)),
                    image: DecorationImage(



                        fit: BoxFit.fill, image: AssetImage(item.images[0])
                    ),
                  )),
            ),
            Expanded(
              flex:3,
              child: Container(
              //  margin: const EdgeInsets.all( 15),
                //margin: const EdgeInsets.only(left: 5), second approuch
              //  height: MediaQuery.of(context).size.height / 4,
                padding: const EdgeInsets.all(0),

                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                 // verticalDirection: VerticalDirection.up,
                  children: [



                    Flexible(
                      flex: 2,
                      child: Text(

                            item.title,
                            style:  TextStyle(
                                color: AppTheme.itemTitleColor, fontSize: 18.sp,overflow: TextOverflow.visible,
                              fontWeight: FontWeight.w500

                            ),
                            maxLines: 1,
                          ),
                    ),


                     SizedBox(height: 1.5.h,),
                     Flexible(
                       flex: 1,
                       child: Text(
                          item.postDate,
                          style:  TextStyle(color: AppTheme.itemDateColor, fontSize: 15.sp,overflow: TextOverflow.visible),
                        ),
                     ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Flexible(
                      flex: 2,

                      child: Center(


                        child: Row(children: [
                            Expanded(
                             // flex: 1,
                              child:  Text(
                                item.price,
                                maxLines: 1,
                                overflow: TextOverflow.visible,

                                style:  TextStyle(

                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,


                                    color: AppTheme.itemPriceColor),

                              ),),
                            Expanded(
                             // flex: 2,
                                child: IntrinsicHeight(

                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                               Text(
                                  item.currency,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.visible,
                                  textDirection: TextDirection.ltr,

                                  maxLines: 1,

                                  style:  TextStyle(
                                    fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,


                                      color: AppTheme.itemCurrencyColor),
                                ),

                              Text(
                                item.isNegociable ? '/Négociable' : '',
                                overflow: TextOverflow.visible,
                                style:  TextStyle(
                                  fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.itemCurrencyColor),
                              ),


                            ],),
                                ))
                          ],),

                      ),
                    ),
                  //Spacer(flex: 1,),
                    SizedBox(
                      height: 3.h,
                    )


                  /*  Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          children: [
                            Flexible(
                              flex:1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  item.price,
                                  maxLines: 1,
                                  overflow: TextOverflow.visible,

                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,


                                      color: AppTheme.itemPriceColor),
                                ),
                              ),
                            ),

                               Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    item.currency,
                                    overflow: TextOverflow.visible,

                                    style: const TextStyle(
                                        color: AppTheme.itemCurrencyColor),
                                  ),
                                ),

                            ),
                            Flexible(
                              flex: 1,
                              child: Text(

                                item.isNegociable ? '/Negociable' : '',
                               overflow: TextOverflow.visible,
                                style: const TextStyle(color: AppTheme.itemCurrencyColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    */

                    ,
                    const Spacer(
                      flex: 3,
                    ),



                     Flexible(
                       flex: 4,
                       child: SizedBox(
                          height: MediaQuery.of(context).size.height / 30,

                          child: Row(
                            children: [

                              Expanded(
                                flex: 3,
                                child: Row(children: [
                                  Flexible(
                                    flex:1,
                                    child: InkWell(
                                      onTap: () {},
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image.asset('assets/icons/locationIcon.png',
                                            width: 15,
                                            height: 15
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex:6,
                                    child: Text(
                                        item.locationDetails,
                                        overflow: TextOverflow.visible,
                                        style:  const TextStyle(
                                            color: AppTheme.itemDateColor, fontSize: 18),
                                      ),
                                    ),


                                ],),
                              ),
                              const VerticalDivider(
                                color: Colors.grey,
                              ),
                              Expanded(
                                flex: 2,
                                  child: Row(children: [
                                item.isPickUp
                                    ? Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      child: Image.asset('assets/icons/pickupIcon.png',
                                          width: IconTheme.of(context).size,
                                          height: IconTheme.of(context).size),
                                    ),
                                  ),
                                )
                                    : Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      child: Image.asset(
                                          'assets/icons/pickupIcon_off.png',
                                          width: IconTheme.of(context).size,
                                          height: IconTheme.of(context).size),
                                    ),
                                  ),
                                ),
                              const  SizedBox(width: 2,),
                                item.isDelivery
                                    ? Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      child: Image.asset(
                                          'assets/icons/deliveryIcon.png',
                                          width: IconTheme.of(context).size,
                                          height: IconTheme.of(context).size),
                                    ),
                                  ),
                                )
                                    : Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      child: Image.asset(
                                          'assets/icons/deliveryIcon_off.png',
                                          width: IconTheme.of(context).size,
                                          height: IconTheme.of(context).size),
                                    ),
                                  ),
                                ),
                                const VerticalDivider(
                                  color: AppTheme.greyBackgroundColor,
                                ),
                                Flexible(
                                  flex: 1,

                                  child:  InkWell(
                                      onTap: () {},
                                      child: ClipRRect(

                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image.asset('assets/icons/viewBtn.png',
                                            width: IconTheme.of(context).size,
                                            height: IconTheme.of(context).size),
                                      ),

                                  ),
                                ),
                              ],)),


                            ],
                          ),
                        ),
                     ),

                  ],
                ),
              ),
            ),
          ]),

      ),

    );
    return Scaffold(
        body: Bouncing(
      onPress: () {
        Timer(const Duration(milliseconds: 200), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  CommonItemScreen(index: index)),
          );
        });
            //Navigator.pushReplacementNamed(context, CommonItemScreen.routeName);

      },
      child: itemRow,
    ));
  }
}
