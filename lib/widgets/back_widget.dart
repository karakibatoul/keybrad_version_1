import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';

import '../Utils/app_theme.dart';


class BackWidget extends StatelessWidget {
  //const BackWidget({Key? key}) : super(key: key);
  final double height;
  final double width;
   const BackWidget({Key? key,
    required this.height,
    required this.width,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Bouncing(
      onPress: (){Timer(const Duration(milliseconds: 200), () {
        Navigator.of(context, rootNavigator: true).pop();
      });},
      child: Container(
        // margin: const EdgeInsets.only(top: 24, right: 24, bottom: 10, left: 24),
        //margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),//the true one
        //  margin: const EdgeInsets.all(50),
        width: width,
        height: height,
        decoration:
        const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.backButtonBackgroundColor),
        child: Image.asset('assets/icons/back.png',
                width: IconTheme.of(context).size,
                height: IconTheme.of(context).size),

      ),
    );
  }
}
