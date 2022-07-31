import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keybrad/screens/login_screen.dart';
import 'package:keybrad/screens/sign_up_screen.dart';
import 'package:keybrad/widgets/login_widgets/forget_pass.dart';
import '../../screens/add_item_screen.dart';
import '../../screens/tabs_screen.dart';
import '/Utils/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginModel extends StatefulWidget {
  const LoginModel({Key? key}) : super(key: key);

  @override
  State<LoginModel> createState() => _LoginModelState();
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const TabsScreen(),
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

class _LoginModelState extends State<LoginModel> with TickerProviderStateMixin {


  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  /*late final  Animation<double> _animation =
  CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );


  late final  Animation<double> _fingerAnimation =
  CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  );


   */


  String text = "text";
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

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
        flex: 5,
        fit: FlexFit.loose,
        child: Container(
          height: textFieldHeight,
          margin:commonMarginTextField,
          child: IntlPhoneField(
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
            initialCountryCode: 'IN',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
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
        child: Form(
          key: _formKey,
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
                            text:  TextSpan(text: ' ', children: [
                               TextSpan(
                                text: 'Se connecter',
                                style: TextStyle(
                                    overflow: TextOverflow.visible,
                                    color: AppTheme.blackTitleColor,
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
                                    color: AppTheme.greyTitleColor,
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


              SizedBox(
                height: 6.h,
              ),






              labelTextWidget('Numéro de téléphone:', 15.sp),
              SizedBox(height:1.5.h ,),

              textFieldWidget(textController),
              SizedBox(height:0.2.h ,),
              labelTextWidget('Mot de passe:', 15.sp),
              SizedBox(height:1.5.h ,),

              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: Container(
                  margin: commonMarginTextField,
                  height: textFieldHeight,
                  child: TextFormField(
                      validator: (value){
                        if( value!.isEmpty){
                          return "Password can not be null";
                        }
                        if(value.isNotEmpty){
                          return null;
                        }
                        return null;
                    },
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
              //SizedBox(height:1.2.h ,),


               Flexible(
                  flex:5,
                  //fit: FlexFit.tight,
                  child:
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                        //  margin: EdgeInsets.only(bottom: 10),
                          child:  const ForgetPass(),),
                      )
                 ),
              Flexible(
                flex: 0,
                child: SizedBox(
                  height: 2.h,
                ),
              ),


              Flexible(
                flex: 5,
                child: Center(
                  child:Container(
                    alignment: Alignment.center,
                    // margin:const  EdgeInsets.only(right: 100,left: 100,bottom: 100,top: 10),

                    margin:  EdgeInsets.symmetric(horizontal: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                           flex: 1,
                          //  fit: FlexFit.loose,
                          child:
                          Center(
                            child: InkWell(
                              onTap: () {
                                // _updateSize();
                                _controller.reset();
                                //  _controller.forward();
                                if(!_formKey.currentState!.validate()){
                                  return;
                                }
                                else {
                                  Timer(const Duration(milliseconds: 100), () {
                                    Navigator.of(context).push(_createRoute());
                                  });
                                }
                              },
                              child:

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
                          /*Container(
                            //  padding: const EdgeInsets.all(5),
                             alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(TabsScreen.routeName);
                                },
                                child: Container(

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
                              )
                            */
                        ),

                        Flexible(
                          flex: 1,
                          // fit: FlexFit.loose,
                          child: Container(
                            alignment: Alignment.center,


                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AddItemScreen.routeName);
                            //    Navigator.pushNamed(context, ShowPictureFinalScreen.routeName);

                               // Navigator.pushNamed(context, ItemEditScreen.routeName);

                              },
                              child: ClipRRect(


                               // borderRadius: BorderRadius.all(Radius.circular(20)),
                                child:
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      // _updateSize();
                                      _controller.reset();
                                      //  _controller.forward();
                                      Timer(const Duration(milliseconds: 100), () {
                                        Navigator.of(context).push(_createRoute());
                                      });

                                    },
                                    child:

                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        color: AppTheme.backgroundOrange,
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/icons/fingerPrint.png',
                                        width: 12.h,
                                        height: 12.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),

                                  ),
                                ),
                                /*Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: AppTheme.backgroundOrange,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    shape: BoxShape.circle,
                                  ),

                                  child: Image.asset(
                                    'assets/icons/fingerPrint.png',
                                    width: 12.h,
                                    height: 12.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                */
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: SizedBox(
                  height: 2.5.h,
                ),
              ),



            ],
          ),
        ),
      ),

    );
  }
}
