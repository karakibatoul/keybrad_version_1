import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';

class LocationWidget extends StatelessWidget {
 // const LocationWidget({Key? key}) : super(key: key);

  final TextEditingController controller;
  final Function()? onTap;
  final Function()? suffixOnTap;
  final double fontsize;

  LocationWidget({required this.controller,required this.onTap,required this.suffixOnTap,required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
      height: 7.h,
      child: TextField(
        cursorColor: Colors.grey,
        style:const TextStyle(color: Colors.grey),

        onTap:onTap ,



        controller:controller ,
        onSubmitted: (_) {


        },

        decoration: InputDecoration(
          focusColor: Colors.grey,
          hintText: 'Localisation:',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),



          suffixIcon: InkWell(
            onTap:suffixOnTap,
            child:  Container(
              //color: AppTheme.backgroundOrange,
              child: Image.asset(
                'assets/icons/locationButtonIcon.png',

                fit: BoxFit.fill,
                height: IconTheme.of(context).size,
                width: IconTheme.of(context).size,
              ),
            ),

          ),
          hintStyle:  TextStyle(
              color: AppTheme.filterLabelColor,
            fontSize: fontsize,
             ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.greyBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: AppTheme.greyTextFieldColor,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
