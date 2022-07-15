import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/app_theme.dart';

class GridWidget extends StatelessWidget {
  final String image;
  final String label;
  final Color? color;
  final Color? labelColor;
  final Radius bottomLeft;
  final Radius bottomRight;
  final Radius topLeft;
  final Radius topRight;
  final IconData icon;
  final Color iconColor;

  const GridWidget({
    Key? key,
    required this.image,
    required this.label,
    this.color,
    this.labelColor,
    required this.bottomLeft,
    required this.bottomRight,
    required this.topLeft,
    required this.topRight, required this.icon, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 100,
        height: 45,
        decoration:  BoxDecoration(
            color: color,
           borderRadius: BorderRadius.only(
             bottomLeft: bottomLeft,
             bottomRight: bottomRight,
             topLeft: topLeft,
             topRight: topRight
           )
           /* borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            )

            */
        ),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(icon,color:iconColor ,size: 25,),
            const SizedBox(width: 4,),
            Container(
              alignment: Alignment.center,
              child: Text(label,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: labelColor)),
            ),



          ],)
    );
  }
}
