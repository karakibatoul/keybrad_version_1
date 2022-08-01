import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';

class AddressDetailsWidget extends StatelessWidget {
  //const AddressDetailsWidget({Key? key}) : super(key: key);

  final double hintFontSize;
  final String hintText;
  final int? maxLines;
  const AddressDetailsWidget({Key? key,
    required this.hintFontSize,
    required this.hintText,
    required this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
      //height: 7.h,
      child:TextFormField(

      validator: (value) {
        if (value!.isEmpty) {
          return "La description de l'adresse ne peut pas être nulle";
        }
        if (value.isNotEmpty) {
          return null;
        }
        return null;
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
        maxLines: null
     ,
      ) ,);
  }
}
