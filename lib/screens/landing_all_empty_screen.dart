import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';


class LandingAllEmptyScreen extends StatelessWidget {
  const LandingAllEmptyScreen({Key? key}) : super(key: key);
  static const routeName = '/landing_all_empty_screen';

  @override
  Widget build(BuildContext context) {

    Widget refreshWidget =
   Container(

      alignment: Alignment.center,
     height: 15.h,
     //height: (MediaQuery.of(context).size.height-3*kToolbarHeight)/4,
      child: InkWell(
        onTap: () {


        },
        child:
        Container(

          alignment: Alignment.center,
          height: 10.h,
          width: 10.h,

          decoration: BoxDecoration(
            color: AppTheme.backgroundOrange,
            border: Border.all(
              color: Colors.transparent,
            ),
            shape: BoxShape.circle,
          ),

          child: Image.asset(
            'assets/icons/refresh.png',
            width: 5.5.h,
            height: 5.5.h,
            fit: BoxFit.contain,

          ),
        ),
      ),
    );

    Widget refreshText =

          Container(
          alignment: Alignment.center,
          height: 15.h,
          child:Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Flexible(
                   flex: 1,
                   child: Text('Une erreur s\'est produite',style: TextStyle(
              fontSize: 17.5.sp,color: AppTheme.landingEmptyTextColor,fontWeight: FontWeight.w500),),
                 ),
          SizedBox(height: 2.h,),
          Flexible(
            flex: 1,
            child: Text('Veuillez vérifier votre connexion ',style: TextStyle(
                fontSize: 17.5.sp,color: AppTheme.landingEmptyTextColor,fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 2.h,),
          Flexible(
            flex: 1,
            child: Text('et réessayyer',style: TextStyle(
                fontSize: 17.5.sp,color: AppTheme.landingEmptyTextColor,fontWeight: FontWeight.w500),),
          ),
        ],) ,)
   ;




    Widget avatarImage =  Container(

          padding: EdgeInsets.symmetric(horizontal: 6.w),
      height: (MediaQuery.of(context).size.height-3*kToolbarHeight)/2,
      alignment: Alignment.bottomLeft,
      child:  Image.asset(
        'assets/images/avatar01.png',
        fit: BoxFit.fitHeight,
      ) ,
    );

    return SizedBox(

     height: MediaQuery.of(context).size.height-3*kToolbarHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 2.5.h,
          ),
        Flexible(
          flex: 1,
          child: Container(


              child: refreshWidget),
        ),
          SizedBox(
            height: 2.5.h,
          ),

        Flexible(
          flex: 1,
          child: SizedBox(
            height: 15.h,
              child: refreshText),
        ),
            SizedBox(height: 5.h,),


            Expanded(flex:3,child: avatarImage),
         const SizedBox(height: kToolbarHeight,)
      ],),
    );
  }
}
