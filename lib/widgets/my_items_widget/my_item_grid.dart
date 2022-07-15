import 'package:flutter/material.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:keybrad/widgets/icon_label_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/app_theme.dart';


class MyItemGrid extends StatelessWidget {
  const MyItemGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin:EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width/2,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),

      ),
      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:200 ,
                  height: 200,
                  margin:const  EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/electricalChair.jpeg',)
                ),
              )),
              Container(
                margin:const  EdgeInsets.only(right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Spacer(),
                    Text('ID 30999',style: TextStyle(color: AppTheme.greyTextColor),),
                  ],
                ),
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
                  onPress: (){},
                  child: IconLabelButtonWidget(
                    width: 175,
                    height: 35,
                    icon: 'assets/icons/rightArrow.png',
                    label: 'Voir',
                    backgroundColor: AppTheme.trierButtonBackgroundColor,
                    onPressed: (){},
                    gap: 2.w,
                    iconWidth: 20,
                    iconHeight: 20,

                  ),
                ),
              ),
              Container(
                margin:const  EdgeInsets.symmetric(horizontal: 4),
                child: Bouncing(
                  onPress: (){},
                  child: IconLabelButtonWidget(
                    width: 175,
                    height: 35,
                    icon: 'assets/icons/check.png',
                    label: 'Vendu',
                    backgroundColor: AppTheme.greyIconLabelButtonColor,
                    onPressed: (){},
                    gap: 2.w,
                    iconHeight: 30,
                    iconWidth: 30,

                  ),
                ),
              )

            ],
          )

    );
  }
}
