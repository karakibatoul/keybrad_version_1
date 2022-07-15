import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:keybrad/widgets/icon_label_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/app_theme.dart';
import '../bouncing_widget.dart';


class MyItemGridVendus extends StatelessWidget {
  const MyItemGridVendus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.red.withOpacity(0.0) ,
    //  decoration: BoxDecoration(color: Colors.red.withOpacity(0.0)),
      child: Container(
        // margin:EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width/2,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),

          ),
          child:
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                  child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
                  ),
                  ),
                      width:200 ,
                      height: 200,
                      margin:const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/electricalChair.jpeg',)

                        ),
                      )

                  ),

                  Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: const Text('11 y a 1 jour',style: TextStyle(color: AppTheme.greyTextColor))),
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                    child: Row(
                      children:  [
                        Text('750,000', style:  TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.itemPriceColor),),
                        SizedBox(width: 3.w,),
                        Text('FCFA', style:TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,


                            color: AppTheme.itemCurrencyColor),)
                      ],),
                  ),
                  Container(
                    margin:const  EdgeInsets.symmetric(horizontal: 4),
                    child: Bouncing(
                      onPress:(){},
                      child: IconLabelButtonWidget(
                        width: 175,
                        height: 35,
                        icon: 'assets/icons/check.png',
                        label: 'Récupérer',
                        backgroundColor: AppTheme.trierButtonBackgroundColor,
                        onPressed: (){},
                        gap: 2.w,
                        iconHeight: 30,
                        iconWidth: 30,

                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Bouncing(
                      onPress: (){},
                      child: IconLabelButtonWidget(
                        width: 175,
                        height: 35,
                        icon: 'assets/icons/rightArrow.png',
                        label: 'Voir',
                        backgroundColor: AppTheme.greyIconLabelButtonColor,
                        onPressed: (){},
                        gap: 2.w,
                        iconWidth: 20,
                        iconHeight: 20,

                      ),
                    ),
                  ),


                ],
              ),

              Positioned(
                top: 190,
              left: 132,
              //  height: 200,
                  child: Container(
                    height: 60,
                    width: 60,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/soldIcon.png'), fit: BoxFit.cover),
                    ),
                  )
              )
            ],
          )

      ),
    );
  }
}
