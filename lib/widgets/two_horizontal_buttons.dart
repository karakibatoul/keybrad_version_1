import 'package:flutter/material.dart';
import 'package:keybrad/widgets/bottom_button.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';


class TwoHorizontalButtons extends StatelessWidget {
  //const TwoHorizontalButtons({Key? key}) : super(key: key);

  final String rightButtonLabel;
  final String leftButtonLabel;
  final Color? leftButtonBackground;
  final Color? rightButtonBackground;
  final Function()? rightButtonOnPressed;
  final Function()? leftButtonOnPressed;
  final Color? rightColorLabel;
  final Color? leftColorLabel;
  final double rightLabelFontSize;
  final double leftLabelFontSize;
  final FontWeight? rightFontWeight;
  final FontWeight? leftFontWeight;
  final double rightButtonHeight;
  final double leftButtonHeight;
  final double rightButtonWidth;
  final double leftButtonWidth;

  TwoHorizontalButtons({
    required this.rightButtonBackground,
    required this.leftButtonBackground,
    required this.rightButtonLabel,
    required this.leftButtonLabel,
    required this.leftButtonOnPressed,
    required this.rightButtonOnPressed,
    required this.rightColorLabel,
    required this.rightLabelFontSize,
    required this.leftColorLabel,
    required this.leftLabelFontSize,
    required this.rightFontWeight,
    required this.leftFontWeight,
    required this.leftButtonHeight,
    required this.leftButtonWidth,
    required this.rightButtonHeight,
    required this.rightButtonWidth
});


  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(),
      margin: EdgeInsets.symmetric(horizontal: 1.h,vertical: 1.5.h),
      child: Row(

        children: [
          Expanded(child:
          Bouncing(
            onPress: (){},
            child: BottomButton(
              labelFontWeight:  leftFontWeight,
              height:leftButtonHeight ,
              width:leftButtonWidth ,
              buttonBackground:leftButtonBackground ,
              buttonLabel:leftButtonLabel ,
              buttonOnPressed: leftButtonOnPressed,
              colorLabel:leftColorLabel ,
              labelFontSize: leftLabelFontSize,
            ),
          )),
          Expanded(child:
          Bouncing(
            onPress: (){},
            child: BottomButton(
              labelFontWeight:  rightFontWeight,
              height:rightButtonHeight ,
              width:rightButtonWidth ,
              buttonBackground:rightButtonBackground ,
              buttonLabel:rightButtonLabel ,
              buttonOnPressed: rightButtonOnPressed,
              colorLabel:rightColorLabel ,
              labelFontSize: rightLabelFontSize,
            ),
          )),

        ],
      ),
    );
  }
}
