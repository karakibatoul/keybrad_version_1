import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';

class AddressDetailsWidget extends StatelessWidget {
  //const AddressDetailsWidget({Key? key}) : super(key: key);

  final double hintFontSize;
  final String hintText;
  final int? maxLines;
  AddressDetailsWidget({
    required this.hintFontSize,
    required this.hintText,
    required this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
      //height: 7.h,
      child:TextFormField(
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
              color: AppTheme.filterLabelColor,
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
        minLines: 8, // any number you need (It works as the rows for the textarea)
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ) ,);
  }
}
