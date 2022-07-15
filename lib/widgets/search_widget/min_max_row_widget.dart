import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/app_theme.dart';

class MinMaxRow extends StatelessWidget {
  //const MinMaxRow({Key? key}) : super(key: key);
  final String minRange;
  final String maxRange;
  MinMaxRow({
    required this.minRange,
    required this.maxRange
});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      // margin: EdgeInsets.all(4.w),
      //margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0.h),
      // margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),

      // margin: EdgeInsets.symmetric(horizontal: 1.h,vertical: .h),
      child:   Row(
        children: [
          Expanded(
            // flex: 1,
            // fit: FlexFit.loose,
            child: Container(
              // margin: EdgeInsets.only(left: 15),
              // height: 7.h,
              child: TextButton(

                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    width: 160,
                    height: 5.h,
                    decoration: const BoxDecoration(
                        color: AppTheme.greyTextFieldColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: RichText(
                          text:  TextSpan(
                              style:  TextStyle(fontSize: 16.5.sp, color: AppTheme.filterLabelColor),
                              children: [
                                const TextSpan(text: 'Min: '),
                                TextSpan(
                                    text: minRange + ' ',
                                    style:const TextStyle(color: AppTheme.filterMinMaxColor)),
                                //here the currency is constant but it will be the currency of the item selected
                                TextSpan(
                                    text: 'FCFA',
                                    style: TextStyle(
                                        fontSize: 12.5.sp,
                                        color: AppTheme.greyTextColor))
                              ]),
                        ),
                      ),
                    )),
              ),
            ),
          ),
          Expanded(
            // flex: 1,
            //   fit: FlexFit.loose,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                //  margin: EdgeInsets.only(right: 15),
                  width: 160,
                  height: 5.h,//was 40
                  decoration:const BoxDecoration(
                      color: AppTheme.greyTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            style:  TextStyle(fontSize: 16.5.sp, color: AppTheme.filterLabelColor),
                            children: [
                              const   TextSpan(text: 'Max: '),
                              TextSpan(
                                  text: maxRange + ' ',
                                  style:const TextStyle(color: AppTheme.filterMinMaxColor)),
                              //here the currency is constant but it will be the currency of the item selected
                              TextSpan(
                                  text: 'FCFA',
                                  style: TextStyle(
                                      fontSize: 12.5.sp,
                                      color: AppTheme.filterLabelColor))
                            ]),
                      ),
                    ),
                  )),
            ),
          ),
        ],

      ) ,);
  }
}
