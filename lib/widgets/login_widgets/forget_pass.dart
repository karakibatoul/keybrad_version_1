import 'package:flutter/material.dart';
import '/Utils/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/*class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 30),
      //padding: const EdgeInsets.all(10),
      color: AppTheme.greyBackgroundColor,
      child: Center(
          child: Text.rich(TextSpan(
              text: 'Mot te passe  ',
              style: const TextStyle(

                  fontSize: 16, color: AppTheme.greyTextColor,overflow: TextOverflow.visible,fontWeight: FontWeight.w700),
              children: <TextSpan>[
            TextSpan(
                text: 'Oubilé ',

                style: const TextStyle(

                  overflow: TextOverflow.visible,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textOrange,

                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch(
                        'https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget');
                    // code to open / launch terms of service link here
                  }),
            TextSpan(
              text: ' ?',
              style: TextStyle(fontSize: 16, color: AppTheme.greyTextColor,fontWeight: FontWeight.w700),
            )
          ]))),
    );
  }
}

 */



class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // alignment: Alignment.center,
        margin:  EdgeInsets.symmetric(vertical: 0.1.h, horizontal: 3.w),
       // padding:const  EdgeInsets.all(10),
        child: Center(
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Mot te passe  ',
                      style: TextStyle(
                          overflow: TextOverflow.visible,
                          fontSize: 16.5.sp,
                          color: AppTheme.greyTextColor,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: 'Oubilé',
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
              TextSpan(
                text: ' ?',
                style: TextStyle(fontSize: 16.5.sp, color: AppTheme.greyTextColor,fontWeight: FontWeight.w700)),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                overflow: TextOverflow.visible,
                fontSize: 20.0.sp, ),
            )

          /*Text.rich(

            TextSpan(
              text: 'En creant un compte,vous acceptez nos  ',

              style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.greyTextColor,

                  fontWeight: FontWeight.w500),
              children: <TextSpan>[
                TextSpan(
                    text: 'Conditions Générales d\'Utilisation',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      decoration: TextDecoration.none,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch(
                            'https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget');
                        // code to open / launch terms of service link here
                      }),
              ])),*/
        ),
      ),
    );
  }
}

