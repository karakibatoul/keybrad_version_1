import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class BottomButton extends StatelessWidget {
  //const BottomButton({Key? key}) : super(key: key);

  final String buttonLabel;
  final Color? buttonBackground;
  final Function()? buttonOnPressed;
  final Color? colorLabel;
  final double labelFontSize;
  final FontWeight? labelFontWeight;
  final double width;
  final double height;

  BottomButton({
    required this.buttonLabel,
    required this.buttonBackground,
    required this.buttonOnPressed,
    required this.colorLabel,
    required this.labelFontSize,
    required this.labelFontWeight,
    required this.width,
    required this.height
});

  @override
  Widget build(BuildContext context) {
    return

      TextButton(
      onPressed: buttonOnPressed,
      child: Container(
          width: width,
          height: height,
          decoration:  BoxDecoration(
              color: buttonBackground,
              borderRadius:
              BorderRadius.all(Radius.circular(30.0))),
          child:  Center(

            child: Text(buttonLabel,
                style: TextStyle(
                    fontSize: labelFontSize,
                    fontWeight: labelFontWeight,
                    color: colorLabel)),
          )),
    );

  }
}
