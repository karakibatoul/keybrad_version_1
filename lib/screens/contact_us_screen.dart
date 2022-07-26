

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);
  static const routeName = '/contact_us_screen';


  @override
  Widget build(BuildContext context) {
    var objectController = TextEditingController();

    Widget messageWidget =
    Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
      //height: 7.h,
      child:TextFormField(
        decoration: InputDecoration(
          focusColor: Colors.grey,
          hintText: 'Message:',
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),

          hintStyle: const TextStyle(
              color: AppTheme.filterLabelColor,
              backgroundColor: AppTheme.greyBackgroundColor),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppTheme.greyBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: AppTheme.greyBackgroundColor,
          border: const OutlineInputBorder(),
        ),
      minLines: 20, // any number you need (It works as the rows for the textarea)
      keyboardType: TextInputType.multiline,
      maxLines: null,
    ) ,)
    ;

    Widget objectWidget = Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
      height: 7.h,
      child: TextField(
        keyboardType: TextInputType.text,
        cursorColor: Colors.grey,
        style:const TextStyle(color: Colors.grey),
        onTap: (){
        },
        controller:objectController ,
        onSubmitted: (_) {


        },

        decoration: InputDecoration(
          focusColor: Colors.grey,
          hintText: 'Objet:',
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),



          hintStyle: const TextStyle(
              color: AppTheme.filterLabelColor,
              backgroundColor: AppTheme.greyBackgroundColor),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppTheme.greyBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: AppTheme.greyBackgroundColor,
          border: const OutlineInputBorder(),
        ),
      ),
    );
    return
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 5.w,),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child:  Padding(
                            padding:  EdgeInsets.only(top: 15,bottom: 20,right: 0,left: 20),
                            child: BackWidget(width: 35,height: 35,))
                      ),


                      Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 20,left: 40),
                            child:  Text('Nous contacter',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppTheme.drawerTitleColor,
                                    fontSize: 21.sp, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 1.5.h,),

              objectWidget,
              SizedBox(height: 1.h,),
              messageWidget,



              Padding(
                padding: const EdgeInsets.only(
                    right: 8.0, left: 8.0, bottom: 8.0, top: 20.0),
                child:  Center(
                    child: Bouncing(
                      onPress: (){
                        Timer(const Duration(milliseconds: 200), () {
                          Navigator.of(context).pop();
                        });
                      },
                      child: TextButton(
                        onPressed: () {
                          Timer(const Duration(milliseconds: 200), () {
                            Navigator.of(context).pop();
                          });
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
                                  children:  [  Container(
                                    alignment: Alignment.center,
                                    //padding: EdgeInsets.only(right: 10),


                                  child: Text('Envoyer',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),
                                ),


                                    Image.asset('assets/icons/rightArrow.png',height: 20,width: 20,)
                                  ],)
                          ),
                      ),
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