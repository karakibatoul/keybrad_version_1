
import 'package:flutter/material.dart';
import '../Utils/app_theme.dart';

class ProfileTextFieldWidget extends StatelessWidget {
  //const ProfileTextFieldWidget({Key? key}) : super(key: key);

  final  TextEditingController controller ;
  final  String hintText;
  final Color? hintColor;
  final EdgeInsetsGeometry? margin;
  final double? textFieldHeight;
  final double? hintFontSize;
  final TextInputType keyboardType;


  const ProfileTextFieldWidget(
      {Key? key,
        required this.controller,
        required this.hintText,
        required this.hintColor,
        required this.margin,
        required this.textFieldHeight,
        required this.hintFontSize,
        required this.keyboardType
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: textFieldHeight,
      child: TextField(
        keyboardType: keyboardType,
        cursorColor: Colors.grey,
        style:const TextStyle(color: Colors.grey),
        onTap: (){
        },
        controller:controller ,
        onSubmitted: (_) {


        },

        decoration: InputDecoration(
          focusColor: Colors.grey,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),



          hintStyle:  TextStyle(
              color: hintColor,
            fontSize: hintFontSize
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppTheme.greyBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: AppTheme.greyTextFieldColor,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
