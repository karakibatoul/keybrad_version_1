

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/widgets/address_details_widget.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:keybrad/widgets/location_widget.dart';
import 'package:keybrad/widgets/profile_text_field_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';


class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/my_profile_screen';

  @override
  Widget build(BuildContext context) {

    final telephone = TextEditingController();
    final location = TextEditingController();






    Widget imageWidget =
    Container(
      margin:const   EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
      const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 45,
          backgroundImage: AssetImage('assets/images/personalImage.jpg',),


        ),

      ),
      SizedBox(width: 2.w,),
      Text('Nassim Zahi Samir',
        style: TextStyle(fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.drawerTitleColor),)
    ],) ,);



    Widget topWidget =
    Container(

      margin: const EdgeInsets.only(top: 20),
      child: Row(children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
            child: const BackWidget(height: 35, width: 35)),
        const Spacer(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 35),
          child:Column(
            children: [
              Container(

                // margin: const EdgeInsets.only(top: 24, right: 24, bottom: 10, left: 24),
                //the true one
                //  margin: const EdgeInsets.all(50),
                width: 35,
                height: 35,
                decoration:
                const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.backButtonBackgroundColor),
                child: Bouncing(
                    onPress: (){
                      Timer(const Duration(milliseconds: 200), () {
                        Navigator.of(context, rootNavigator: true).pop();
                      });

                       },
                  child: Image.asset('assets/icons/saveIcon.png',
                      width: IconTheme.of(context).size,
                      height: IconTheme.of(context).size),
                ),


              ),
             const  Text('Enregistrer',style: TextStyle(color: AppTheme.greyTextColor),)
            ],
          )
          ,
        )


      ],),)
   ;

    return Scaffold(
      body:
          SingleChildScrollView(
            child: Column(
              
              children: [
                topWidget,
                imageWidget,
                SizedBox(height:6.h ,),
                ProfileTextFieldWidget(
                  keyboardType: TextInputType.phone,
                  controller: telephone,
                  hintText: 'Numéro de téléphone:',
                  textFieldHeight: 7.h,
                  margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
                  hintColor: AppTheme.filterLabelColor,
                  hintFontSize: 17.sp,
                ),
                SizedBox(height: 1.h,),
                ProfileTextFieldWidget(
                  keyboardType: TextInputType.phone,
                  controller: telephone,
                  hintText: 'WhatsApp:',
                  textFieldHeight: 7.h,
                  margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
                  hintColor: AppTheme.filterLabelColor,
                  hintFontSize: 17.sp,
                ),
                SizedBox(height: 1.h,),
                LocationWidget(controller: location, onTap: (){
                  //Navigator.pushReplacementNamed(context, CitySelectionListview.routeName);
                  }, suffixOnTap: (){
                 // Navigator.pushNamed(context, CitiesListScreen.routeName);
                },fontsize: 17.sp),
                SizedBox(height: 1.h,),
                 AddressDetailsWidget(
                   maxLines: 8,
                   hintText: 'Détails de l\'adresse:',
                   hintFontSize: 17.sp,),

              ],
            ),
          ),


    );
  }
}
