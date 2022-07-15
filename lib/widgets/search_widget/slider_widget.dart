import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/app_theme.dart';

class SliderWidget extends StatelessWidget {


  final TextEditingController startController;
  final TextEditingController endController;
  final double starValue;
  final double endValue;
  final double minValue;
  final double maxValue;
  final Function(RangeValues)? onChanged;
  final String leftFirstLabel;
  final String leftLastLabel;
  final String rightFirstLabel;
  final String rightLastLabel;
  final double textFieldHeight;
  final double textFieldWidth;
  final double rowWidth;
  final double rowHeight;
  final double minWidth;
  final double maxWidth;
  final double currencyWidth;

 // final String titleString;


  const SliderWidget({Key? key, required this.startController, required this.endController, required this.starValue, required this.endValue, required this.minValue, required this.maxValue, this.onChanged, required this.leftFirstLabel, required this.leftLastLabel, required this.rightFirstLabel, required this.rightLastLabel, required this.textFieldHeight, required this.textFieldWidth, required this.minWidth, required this.currencyWidth, required this.maxWidth, required this.rowWidth, required this.rowHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:const  EdgeInsets.only(left:25, top:30, right:0, bottom:0),
          // padding:const  EdgeInsets.symmetric(vertical: 20,horizontal: 25),
          child: Text('Prix',style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color:
              AppTheme.itemPriceColor),),
        ),
        SliderTheme(
          data:  const SliderThemeData(
            trackHeight: 1,
          ),
          child: RangeSlider(
            activeColor: AppTheme.trierColor,
            inactiveColor: AppTheme.sliderInactiveColor,
            values: RangeValues(starValue, endValue),
            min: minValue,
            max: maxValue,
            onChanged: onChanged
          ),
        ),
        Padding(
          padding: const  EdgeInsets.symmetric(vertical: 0,horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    height: rowHeight,
                    width:rowWidth,
                    decoration:const BoxDecoration(
                        color: AppTheme.greyTextFieldColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                              width:minWidth,
                              height: 5.h,
                              margin:const  EdgeInsets.only(left: 10),
                              padding: EdgeInsets.only(top:5.h/4),
                              decoration:const BoxDecoration(
                                  color:
                                  AppTheme.greyTextFieldColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                              child: Text('Min:',style:  TextStyle(fontSize: 16.sp, color: AppTheme.filterLabelColor))),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.center,
                          //  padding: EdgeInsets.only(left:0.2.w,),
                            width:textFieldWidth,
                            height: textFieldHeight,//was 40
                            decoration:const BoxDecoration(
                                color:AppTheme.greyTextFieldColor,
                                //color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 16.5.sp,
                                  color: AppTheme.filterMinMaxColor),
                              decoration: const InputDecoration(
                                border: InputBorder.none,),
                              controller: startController,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Flexible(
                          flex: 2,
                          child: Container(
                              width: 8.w,
                              height: 5.h,
                              margin:const  EdgeInsets.only(right: 10),
                              padding: EdgeInsets.only(top: 5.h/4),
                              alignment: Alignment.centerRight,
                              decoration:const BoxDecoration(
                                  color:
                                  AppTheme.greyTextFieldColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                              child: Text('FCFA',style: TextStyle(
                                  fontSize: 12.5.sp,
                                  color: AppTheme.greyTextColor))),
                        ),
                      ],)),
              ),
              SizedBox(width: 3.w,),
              Expanded(
                child: Container(
                    height: rowHeight,
                    width:rowWidth,
                    decoration:const BoxDecoration(
                        color: AppTheme.greyTextFieldColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                              alignment: Alignment.topCenter,
                              width:maxWidth,
                              height: 5.h,
                              margin:const  EdgeInsets.only(left: 5),
                              padding: EdgeInsets.only(top:5.h/4),
                              decoration:const BoxDecoration(
                                  color:
                                  AppTheme.greyTextFieldColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                              child: Text('Max:',
                                  overflow: TextOverflow.visible,
                                  style:  TextStyle(fontSize: 16.sp, color: AppTheme.filterLabelColor))),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.center,
                           // padding: EdgeInsets.only(left:0.2.w,top: 0.0.h),
                            width: textFieldWidth,
                            height: textFieldHeight,//was 40
                            decoration:const BoxDecoration(
                                color:AppTheme.greyTextFieldColor,
                                //color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 16.5.sp,
                                  color: AppTheme.filterMinMaxColor),
                              decoration: const InputDecoration(
                                border: InputBorder.none, ),
                              controller: endController,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Flexible(
                          flex: 2,
                          child: Container(

                              width: currencyWidth,
                              height: 5.h,
                              margin:const  EdgeInsets.only(right: 10),
                              padding: EdgeInsets.only(top: 5.h/4),
                              alignment: Alignment.centerRight,
                              decoration:const BoxDecoration(
                                  color:
                                  AppTheme.greyTextFieldColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                              child: Text('FCFA',style: TextStyle(
                                  fontSize: 12.5.sp,
                                  color: AppTheme.greyTextColor))),
                        ),
                      ],)),
              ),
            ],),
        ),

      ],
    )
    ;
  }
}
