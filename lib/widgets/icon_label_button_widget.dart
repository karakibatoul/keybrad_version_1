import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IconLabelButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color? backgroundColor;
  final double? gap;
  final String icon;
  final String label;
  final double? width;
  final double? height;
  final double? iconWidth;
  final double? iconHeight;

  const IconLabelButtonWidget({Key? key, this.onPressed, this.backgroundColor, this.gap, required this.icon, required this.label,required this.width,required this.height, this.iconWidth, this.iconHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Container(
              width: width,
              height: height,
              decoration:  BoxDecoration(
                  color:  backgroundColor,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(25.0))),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Image.asset(icon,height: iconHeight,width: iconWidth,),
                  SizedBox(width: gap,),
                  Container(
                    alignment: Alignment.center,
                    //padding: EdgeInsets.only(right: 10),


                    child: Text(label,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),

                ],)
          ),
        ),
      ],
    );
  }
}
