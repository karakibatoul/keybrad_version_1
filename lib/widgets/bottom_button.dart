import 'package:flutter/material.dart';


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

  const BottomButton({Key? key,
    required this.buttonLabel,
    required this.buttonBackground,
    required this.buttonOnPressed,
    required this.colorLabel,
    required this.labelFontSize,
    required this.labelFontWeight,
    required this.width,
    required this.height
}) : super(key: key);

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
             const  BorderRadius.all(Radius.circular(30.0))),
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
