

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/screens/search_screen.dart';
import 'package:keybrad/widgets/address_details_widget.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:keybrad/widgets/location_widget.dart';
import 'package:keybrad/widgets/profile_text_field_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../widgets/selection_listview_widgets/city_selection_listview.dart';
import 'my_profile_screen.dart';
import 'my_profile_screen.dart';


class MyProfileScreen extends StatefulWidget {
   MyProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/my_profile_screen';

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final locationController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,() {
      String locationString = '';
      var  args = ModalRoute.of(context)!.settings.arguments;
      if(args==null){
        setState(() {
          locationController.text='';
        });
      }
      else{
        setState(() {
          final  args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
          for(int i=0;i<args.nbrOfCities;i++){
            locationString  =locationString + args.city[i].name +',' ;
          }
          locationString = locationString.toString().substring(0,locationString.length-1);

          locationController.text = 'localization: $locationString';
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _telephoneController = TextEditingController();
    final _whatsappController = TextEditingController();
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
                      if(!_formKey.currentState!.validate()){
                        return;
                      }
                      else {
                        Timer(const Duration(milliseconds: 200), () {
                          Navigator.of(context, rootNavigator: true).pop();
                        });
                      }

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  topWidget,
                  imageWidget,
                  SizedBox(height:6.h ,),
                  ProfileTextFieldWidget(
                    validateText: 'Phone can not be null',
                    keyboardType: TextInputType.phone,
                    controller: _telephoneController,
                    hintText: 'Numéro de téléphone:',
                    textFieldHeight: 7.h,
                    margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
                    hintColor: AppTheme.filterLabelColor,
                    hintFontSize: 17.sp,
                  ),
                  SizedBox(height: 1.h,),
                  ProfileTextFieldWidget(
                    validateText: 'Whatsapp can not be null',
                    keyboardType: TextInputType.phone,
                    controller: _whatsappController,
                    hintText: 'WhatsApp:',
                    textFieldHeight: 7.h,
                    margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
                    hintColor: AppTheme.filterLabelColor,
                    hintFontSize: 17.sp,
                  ),
                  SizedBox(height: 1.h,),
                  LocationWidget(
                      controller: locationController,
                      onTap:(){
                        /* Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                              const CitySelectionListview(returnPage:SearchScreen.routeName ,)),
                            );

                            */
                        Navigator.pushReplacementNamed(context, CitySelectionListview.routeName,arguments: MyProfileScreen.routeName);
                      },
                      suffixOnTap: (){  Navigator.pushNamed(context, CitySelectionListview.routeName);},
                      fontsize: 17.sp),
                  SizedBox(height: 1.h,),
                   AddressDetailsWidget(
                     maxLines: 8,
                     hintText: 'Détails de l\'adresse:',
                     hintFontSize: 17.sp,),


                ],
              ),
            ),
          ),


    );
  }
}
