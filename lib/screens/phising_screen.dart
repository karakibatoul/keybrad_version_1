
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:keybrad/widgets/phising_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';
import '../Utils/open_links.dart';

class PhishingScreen extends StatelessWidget {
  final int phisingIndex;
  const PhishingScreen({Key? key, required this.phisingIndex}) : super(key: key);
  static const routeName = '/phishing_screen';

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding =const  EdgeInsets.all(20) ;


    return Scaffold(

      body:
        Stack(
          children: [
            Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 17.h),
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),


              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: Container(
                              margin: const EdgeInsets.all(0),
                              padding: const EdgeInsets.only(top: 15,bottom: 20,right: 0,left: 20),
                              child: Bouncing(
                                onPress: (){
                                  Timer(const Duration(milliseconds: 200), () {
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: Image.asset('assets/icons/back.png',
                                    width: 35,
                                    height: 35),
                              ),
                            ),
                          ),


                          Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                padding:const EdgeInsets.only(top:15,bottom: 20),
                                child: Text('Attention!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppTheme.drawerTitleColor,
                                        fontSize: 20.sp, fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding:const  EdgeInsets.only(right: 20,left: 20),
                      child:PhisingTextWidget(text:'- Évitez les paiements à distance'
                          '\n(virements bancaires,mobile money...).'),
                    ),
                  ),

                  SizedBox(height: 4.h,),

                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: padding,
                      child:PhisingTextWidget(text:'- Évitez les paiements avant la rècèption et'
                          'la vèrification de l\'article.'),


                    ),
                  ),

                  SizedBox(height: 5.h,),

                  Flexible(
                    flex: 1,
                    child: Container(
                      margin:const  EdgeInsets.only(top: 10),
                      padding: padding,
                      child:PhisingTextWidget(text:'- Préférez les rencontres dans les lieux '
                          'publics et pendant la journée.'),


                    ),
                  ),

                  SizedBox(height: 5.h,),

                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: padding,
                      child:PhisingTextWidget(text:'- Informez un proche de l\' heure et du lieu '
                          'de votre redez-vous.'),


                    ),
                  ),


                  const Spacer(),

                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                       Column(
                         mainAxisAlignment: MainAxisAlignment.end,
                         crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [  Bouncing(
                              onPress: (){},
                              child: TextButton(
                                onPressed: () {
                                  //phisingIndex = 0=>call
                                  //phisingIndex =1=>sms
                                  //phisingIndex = 2=>whatsapp
                                  if(phisingIndex ==0){
                                    OpenLinks.openPhoneCall(phoneNumber: '+961 78 846295');
                                  }
                                  else if(phisingIndex==1){
                                    OpenLinks.openSMS(sms: 'sms', tel: '+961 71231488');
                                  // OpenLinks.openSMS('hello', '+961 71231488');
                                  }
                                  else if(phisingIndex==2){
                                    OpenLinks.openWhatsapp(tel: '+96171231488',message: 'hello');


                                  }

                                },
                                child: Container(
                                    width: 40.w,
                                    height: 5.h,
                                    decoration: const BoxDecoration(
                                        color: AppTheme.trierButtonBackgroundColor,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(30.0))),
                                    child:  Center(

                                      child: Text('Ok',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white)),
                                    )),
                              ),
                            ),
                              Bouncing(
                                onPress: (){
                                Timer(const Duration(milliseconds: 200), () {
                                  Navigator.of(context).pop();
                                });
                                },
                                child: TextButton(
                                  onPressed: () {
                                    Timer(const Duration(seconds: 5), () {
                                      Navigator.of(context).pop();
                                    });

                                  },
                                  child: Container(
                                      width: 40.w,
                                      height: 5.h,
                                      decoration:const BoxDecoration(
                                         color: AppTheme.greyBackgroundColor,
                                          //color: Colors.white,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(30.0))),
                                      child:  Center(
                                        child: Text('Ne plus afficher',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                      )),
                                ),
                              ),],
                          ),

                        const Spacer(),

                        ClipRRect(

                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(16),
                            ),

                            child: Image.asset('assets/images/thief.png',height: 20.h,))
                      ],
                    ),
                  )



                ],
              ),
            ),
            Positioned(
                bottom: 14.h,
                right: 5.w,
                child: Image.asset('assets/images/money.png',height: 20.h,))

          ],
        ),

    );
  }
}
