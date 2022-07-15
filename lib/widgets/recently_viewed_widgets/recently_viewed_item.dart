import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/app_theme.dart';
import '../../providers/item_provider.dart';

class RecentlyViewedItem extends StatelessWidget {
  const RecentlyViewedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Item>(context);
    Widget  itemRow =
    Stack(children: [  Container(
      height: MediaQuery.of(context).size.height / 4,
      margin:  EdgeInsets.symmetric(horizontal: 2.5.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child:  Container(
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
                    margin:  EdgeInsets.only(right: 2.w),
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
                  padding: const EdgeInsets.all(0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
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
                      SizedBox(
                        height: 3.h,
                      ),
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


    ),
      Positioned(
          top: MediaQuery.of(context).size.height / 4-70,
          left: 3.2.h,
          child: Image.asset('assets/icons/viewedItem.png',height: 35,))

    ],);
    return Scaffold(
        body: GestureDetector(
          onTap: () {

          },
          child: itemRow,
        ));
  }
}
