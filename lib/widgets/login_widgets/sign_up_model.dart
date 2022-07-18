import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:keybrad/screens/login_screen.dart';
import 'package:keybrad/screens/sign_up_screen.dart';
import '/Utils/app_theme.dart';
import 'privacy_policy_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpModel extends StatefulWidget {
  const SignUpModel({Key? key}) : super(key: key);

  @override
  State<SignUpModel> createState() => _SignUpModelState();
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.linear;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


class _SignUpModelState extends State<SignUpModel>  with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  /*late final  Animation<double> _animation =
  CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

   */


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  /*@override
  void didUpdateWidget(SignUpModel oldWidget) {
    _controller.reset();
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }


   */

  /*double _size = 9.h;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 150;
      _large = !_large;
    });
  }

   */


  String text = "text";

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    //in the second stage every textField will have a controller
    TextEditingController textController = TextEditingController();
    const commonMarginTextField =
    EdgeInsets.symmetric(vertical: 5, horizontal: 30);//if i change this there would be padding at start of page
     double textFieldHeight = 12.h;
    const commonMarginText = EdgeInsets.only(left: 20, right: 20,);

    Widget textFieldWidget(TextEditingController textController){
      return Flexible(
        flex: 6,
        fit: FlexFit.loose,
        child: Container(
          margin: commonMarginTextField,
          height: textFieldHeight,
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppTheme.greyTextFieldColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: AppTheme.greyTextFieldColor,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      );
    }

    Widget labelTextWidget(String label,double newfontSize){
      return
      Flexible(
        flex: 1,
        fit: FlexFit.loose,
        child: SizedBox(
          height: 8.h,
          // flex: 1,
          //  fit: FlexFit.loose,
            child: Container(
             // padding: const EdgeInsets.only(right: 10, left: 15, top: 10),
              padding:  EdgeInsets.symmetric(vertical: 2.w,horizontal:3.5.w ),
              margin: commonMarginText,
              height: 6.h,
              child:LayoutBuilder(
                builder: (ctx, constraints) {
                  const style =    TextStyle(
                      overflow: TextOverflow.visible,
                      color: AppTheme.greyTextColor,
                      fontWeight: FontWeight.w500);
                  final  style1 = TextStyle(
                      overflow: TextOverflow.visible,
                      color: AppTheme.greyTextColor,
                      fontSize: newfontSize,
                      fontWeight: FontWeight.w500);
                  final span = TextSpan(
                    text: label,
                    style: style,
                  );
                  final span1 = TextSpan( text: label,
                    style: style1, );
                  final painter = TextPainter(
                    text: span,
                    maxLines: 1,
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    textDirection: TextDirection.ltr,
                  );
                  painter.layout();
                  final overflow = painter.size.height > constraints.maxHeight || painter.size.width > constraints.maxWidth ;
                  return

                     overflow?Text.rich(span1,style: style1,):Text.rich(span, style: style);

                },
              ),)),
      );
    }


    return  Container(
        width: MediaQuery.of(context).size.width,
        //  height: MediaQuery.of(context).size.height,
        height: (MediaQuery.of(context).size.height * 3 / 4) + 20,
       // height: 340,
        decoration: const BoxDecoration(
          color: AppTheme.greyBackgroundColor,
          //Color.fromARGB(255, 230, 224, 224),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Center(
         // alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                  height: 5.h,
                ),

          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              height: 4.h,
           // padding: EdgeInsets.only(top: 20),

              
            //  margin: EdgeInsets.only(top: 20),
              //margin: commonMarginText,
            //  padding: EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,

                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                    //  height: 2.h,
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(text: ' ', children: [
                           TextSpan(
                            text: 'Se connecter',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                color: AppTheme.greyTitleColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),

                            recognizer:  TapGestureRecognizer()..onTap = () => Navigator.of(context).pushNamed(LoginScreen.routeName),
                          )
                        ]),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      alignment: Alignment.center,
                   //   height: 2.h,
                      child: RichText(
                        text:  TextSpan(text: ' ', children: [
                           TextSpan(
                            text: 'S\' inscrire',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                color: AppTheme.blackTitleColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),

                            recognizer:  TapGestureRecognizer()..onTap = () =>  Navigator.of(context)
                                .pushNamed(SignUpScreen.routeName),
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),



                /* Flexible(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                        height: 3.h,
                     // margin: commonMarginText,
                        padding: EdgeInsets.symmetric(vertical: 2.h),


                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                             flex: 1,
                              fit: FlexFit.loose,
                              child: Container(
                                  height: 2.h,
                               //  padding: const EdgeInsets.only(bottom: 15),
                                  alignment: Alignment.center,
                                  child: InkWell(
                                      onTap: () {
                                        print('hi guys');
                                        Navigator.of(context).pushNamed(CategoriesScreen.routeName);

                                      },
                                      child:   Text(
                                          'Se connecter',
                                          style: TextStyle(
                                            overflow: TextOverflow.visible,
                                              color: AppTheme.greyTitleColor,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))),


                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Container(
                                  height: 2.h,
                               //   padding: const EdgeInsets.only(bottom: 5),
                                  alignment: Alignment.center,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(SignUpScreen.routeName);
                                      },
                                      child:  Text(
                                          'S\' inscrire',
                                          style: TextStyle(
                                              overflow: TextOverflow.visible,
                                              color: AppTheme.blackTitleColor,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))),


                            //the two buttons
                          ],
                        ),
                      ),
                  ),*/
             SizedBox(
                height: 6.h,
              ),





            /*  Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                  margin: commonMarginText,
                  child: const Text(
                    'Nom:',
                    style: TextStyle(
                        color: AppTheme.greyTextColor,
                        overflow: TextOverflow.visible,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),*/
              labelTextWidget('Nom:', 15.sp),
              SizedBox(height:2.5.h ,),
              textFieldWidget(textController),
              SizedBox(height:1.2.h ,),

              labelTextWidget('Numéro de téléphone:', 15.sp),
              SizedBox(height:2.5.h ,),

              textFieldWidget(textController),
              SizedBox(height:1.2.h ,),
              labelTextWidget('Mot de passe:', 15.sp),
              SizedBox(height:2.5.h ,),

              Flexible(
                flex: 6,
                fit: FlexFit.loose,
                child: Container(
                  margin: commonMarginTextField,
                  height: textFieldHeight,
                  child: TextField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        color: Colors.grey,
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(!_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppTheme.greyTextFieldColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: AppTheme.greyTextFieldColor,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height:1.2.h ,),
              labelTextWidget('Confirmer le mot de passe: ', 15.sp),
              SizedBox(height:2.5.h ,),




              Flexible(
                flex: 6,
                fit: FlexFit.loose,
                child: Container(
                  margin: commonMarginTextField,
                  height: textFieldHeight,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        color: Colors.grey,
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(!_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppTheme.greyTextFieldColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: AppTheme.greyTextFieldColor,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Flexible(
                flex: 10,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      _controller.reset();
                      Timer(const Duration(milliseconds: 100), () {
                        Navigator.of(context).push(_createRoute());
                      });
                       /* setState(()
                        {
                          _animation = CurvedAnimation(
                            parent: _controller,
                            curve: Curves.bounceInOut,
                          );
                        }
                        );

                        */
                       // Navigator.of(context).push(_createRoute());
                    },
                    child:
                    /*Container(
                      width:_size ,
                      height: _size,

                      decoration: BoxDecoration(
                        color: AppTheme.tickButtonColor,
                        borderRadius: BorderRadius.circular(50)
                      ),



                      child: AnimatedSize(
                        curve: Curves.easeIn,
                        duration: const Duration(seconds: 1),
                        child: Image.asset(
                          'assets/icons/checkboxOn.png',
                          width: 12.h,
                          height: 12.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    */
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset(
                        'assets/icons/checkboxOn.png',
                        width: 12.h,
                        height: 12.h,
                        fit: BoxFit.contain,
                      ),
                    ),

                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              const Flexible(
                    flex:5,
                    //fit: FlexFit.tight,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: PrivacyPolicyLinkAndTermsOfService())),
              SizedBox(height: 3.h,)

            ],
          ),
        ),

    );
  }
}
