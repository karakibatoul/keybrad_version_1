
import 'package:flutter/material.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:keybrad/widgets/radio_botton_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../widgets/address_details_widget.dart';
import '../widgets/location_widget.dart';
import '../widgets/profile_textField_widget.dart';


class AddItemStep2Screen extends StatelessWidget {
  const AddItemStep2Screen({Key? key}) : super(key: key);
  static const routeName = '/add_item_step2_screen';

  @override
  Widget build(BuildContext context) {

    final  telephoneController = TextEditingController();
    final locationController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height-2*kToolbarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 6.h,),
              Row(
                children: [
                  Container(
                    padding:const  EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width/5,
                      child: BackWidget(height: 35, width:35 )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*1/2+50,
                    child: Column(children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text('Nouvel article',style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.blackTitleColor
                        ),),
                      ),
                      Text('Chambre à coucher compléte')
                    ],),
                  )
                ],
              ),
              SizedBox(height: 5.h,),
              Flexible(
                flex: 1,
                child: ProfileTextFieldWidget(
                  controller: telephoneController,
                  hintText: 'Numéro de téléphone:',
                  textFieldHeight: 6.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.h,),
                  hintColor: AppTheme.filterLabelColor,
                  hintFontSize: 16.sp,
                ),
              ),
              SizedBox(height: 2.h,),
              Flexible(
                flex: 1,
                child: ProfileTextFieldWidget(
                  controller: telephoneController,
                  hintText: 'WhatsApp:',
                  textFieldHeight: 6.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.h,),
                  hintColor: AppTheme.filterLabelColor,
                  hintFontSize: 16.sp,
                ),
              ),
              SizedBox(height: 2.h,),
              const Divider(),
              SizedBox(height: 2.h,),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.7.h),
                  child: LocationWidget(
                      controller: locationController,
                      onTap:(){

                      },
                      suffixOnTap: () {

                      },
                      fontsize: 16.sp),
                ),
              ),
              SizedBox(height: 2.h,),
              Flexible(
                flex:2,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.7.h,),
                    child: AddressDetailsWidget(
                      maxLines: 8,
                      hintText: 'Détails de l\'adresse:',
                      hintFontSize: 16.sp,)),
              ),
              SizedBox(height: 2.h,),
              const Flexible(
                  flex: 1,
                  child:RadioButtonRow()),
              SizedBox(height: 2.h,),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.8.h,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Bouncing(
                        onPress: () {  },
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              width: 170,
                              height: 45,
                              decoration: const BoxDecoration(
                                  color: AppTheme.trierButtonBackgroundColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(25.0))),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [

                                  Container(
                                  alignment: Alignment.center,
                                  //padding: EdgeInsets.only(right: 10),


                                  child: Text('Publier',
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),
                                ),


                                  Image.asset('assets/icons/rightArrow.png',height: 20,width: 20,)
                                ],)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}