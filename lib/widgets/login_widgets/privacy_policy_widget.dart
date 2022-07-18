

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '/Utils/app_theme.dart';

class PrivacyPolicyLinkAndTermsOfService extends StatelessWidget {
  const PrivacyPolicyLinkAndTermsOfService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // alignment: Alignment.center,
        margin:  EdgeInsets.symmetric(vertical: 0.1.h, horizontal: 3.w),
      //  margin:  EdgeInsets.symmetric(vertical: 0..h, horizontal: 3.w),
       // padding:const  EdgeInsets.all(10),
        child: Center(
            child:
           /* Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  totalRepeatCount: 2,
                  isRepeatingAnimation: true,
                  animatedTexts: [

                    TyperAnimatedText(
                      'En creant un compte,vous acceptez nos  ',
                      textAlign: TextAlign.center,
                     // duration: const Duration(seconds: 1),
                      textStyle:  TextStyle(
                          overflow: TextOverflow.visible,
                          fontSize: 16.5.sp,
                          color: AppTheme.greyTextColor,
                          fontWeight: FontWeight.w500)),

                  ],

                  pause: const Duration(milliseconds: 100),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,


                ),
                AnimatedTextKit(
                  isRepeatingAnimation: true,
                  totalRepeatCount: 2,

                  onTap: (){
                    launch(
                        'https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget');
                    // code to open / launch terms of service link here
                  },
                    animatedTexts: [
                      TyperAnimatedText(

                    'Conditions Générales d\'Utilisation',
                    textAlign: TextAlign.center,
                    //duration:const  Duration(seconds: 1),
                    textStyle:  TextStyle(
                      fontSize: 16.5.sp,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textOrange,
                      decoration: TextDecoration.none,
                    ),),
                ])
              ],
            )
                */
            Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'En creant un compte,vous acceptez nos  ',
                  style: TextStyle(
                      overflow: TextOverflow.visible,
                      fontSize: 16.5.sp,
                      color: AppTheme.greyTextColor,
                      fontWeight: FontWeight.w500)),
              TextSpan(
                  text: 'Conditions Générales d\'Utilisation',
                  style:  TextStyle(
                    fontSize: 16.5.sp,
                    overflow: TextOverflow.visible,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textOrange,
                    decoration: TextDecoration.none,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          'https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget');
                      // code to open / launch terms of service link here
                    }),
            ],
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
              overflow: TextOverflow.visible,
              fontSize: 20.0.sp, ),
        )



            ),
      ),
    );
  }
}
