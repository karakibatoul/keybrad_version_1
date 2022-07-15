import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'dart:async';
import 'package:keybrad/screens/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SignUpScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.elasticInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _SplashScreenState extends State<SplashScreen> {
  String isLogged = '';

//THis method will be used later in submitting the user

  /* loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isLogged = sharedPreferences.getString("isLoged");
      print(isLogged);
    });
  }
  */

  @override
  void initState() {
    super.initState();
    //  loadData();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).push(_createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
      decoration:const BoxDecoration(
        color:  AppTheme.splashTextColor,
        image:  DecorationImage(
          image: AssetImage('assets/images/splashBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
          child:Stack(children: [
          Positioned(
            top: (MediaQuery.of(context).size.height)*2/3,
            child: Container(
           height: 100,
             width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [


                  FadeAnimatedText(
                    'Et si vous croisiez\n\nvotre client chez lui?! ',
                    textAlign: TextAlign.center,

                    textStyle: const TextStyle(color: AppTheme.splashTextColor,fontSize: 25,fontWeight: FontWeight.w300),
                  ),
                ],

                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 100),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
              /*const Text(
                'Et si vous croisiez\n\nvotre client chez lui?! ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppTheme.splashTextColor,fontSize: 25,fontWeight: FontWeight.w300),)
                  */

            ),
          ),
    ]),

          )

    );
  }
}
