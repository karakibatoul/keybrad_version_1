import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
  static const routeName = '/about_us_screen';

  @override
  Widget build(BuildContext context) {

    Widget kibradFacebook = Stack(
      children: [
        Bouncing(
          onPress: () async {
    const url = 'https://www.google.com';
    if (await canLaunch(url)) launch(url);
    },
          child: Container(
            margin:const  EdgeInsets.symmetric(horizontal: 25),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Text("Suivre ", style: TextStyle(
                  // decoration: TextDecoration.underline,
                    color: AppTheme.facebookLinkColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500
                )),
                Text(" kiBrad ", style: TextStyle(
                  // decoration: TextDecoration.lineThrough,
                    fontFamily: 'Superfruit',
                    color: AppTheme.logoColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold
                )),
                Text(" sur Facebook", style: TextStyle(
                  //  decoration: TextDecoration.underline,
                    color: AppTheme.facebookLinkColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500
                )),
              ],
            ),
          ),
        ),
        Positioned(
          left: 24,
          top:MediaQuery.of(context).size.height*0.027,
          child: Container(
            color: AppTheme.underlineColor,
            height: 1,
            width: MediaQuery.of(context).size.width*0.58,
          ),
        ),
      ],
    );

    Widget developersFacebook = Stack(
      children: [
        Container(
          margin:const  EdgeInsets.symmetric(horizontal: 25),
          width: MediaQuery.of(context).size.width,
          child: Bouncing(
            onPress: () async {
              const url = 'https://www.google.com';
              if (await canLaunch(url)) launch(url);
            },
            child: Row(
              children: [
                Text("Suivre ", style: TextStyle(
                   // decoration: TextDecoration.underline,
                    color: AppTheme.facebookLinkColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500
                )),
                Text(" developers ", style: TextStyle(
                 // decoration: TextDecoration.lineThrough,
                    fontFamily: 'Superfruit',
                    color: AppTheme.logoColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500
                )),
                Text(" sur Facebook", style: TextStyle(
                  //  decoration: TextDecoration.underline,
                    color: AppTheme.facebookLinkColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500
                )),
              ],
            ),
          ),
        ),
        Positioned(
          left: 24,
         top:MediaQuery.of(context).size.height*0.027,
          child: Container(
            color: AppTheme.underlineColor,
            height: 1,
            width: MediaQuery.of(context).size.width*0.65,
          ),
        ),
      ],
    );

    Widget kibradLogoRow = Container(
      margin: const EdgeInsets.only(top: 35,right: 10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Flexible(
          flex:1,child: Image.asset('assets/images/kibradLogo.png',height: 125,width: 140,)),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Flexible(
              flex: 2,
              child: Image.asset('assets/images/kibradSlogan.png',fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width*2/3-20,height: 5.h,),
            ),
              Flexible(
                flex: 3,
                child: Text(


                  'KiBrad est une application mobile\nde ventre en ligne ouverte aux'
                      '\nparticuliers et aux professionnels.',
                  maxLines: 5,
                  style: TextStyle(
                    overflow: TextOverflow.visible,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.greyTextColor),),
              )
          ],),
        )
    ],),);

    Widget developersLogoRow = Container(
      margin: const EdgeInsets.only(top: 35,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/developersLogo.png',height: 125,width: 140,),
          Container(
            margin:const  EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex:2,
                  child: Image.asset('assets/images/developersSlogan.png',fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width*2/3-70,height: 7.h,),
                ),
                Flexible(
                  flex: 3,
                    child: Text(



                  'Developers est une entreprise spé-\ncialisée dans la conception de sites'
                      '\nweb et d\' applications mobiles.',
                  maxLines: 5,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.greyTextColor),))
              ],),
          )
        ],),);


    return Scaffold(
      //appBar: AppBar(title: Text('hello'),),
      body:  Container(
          height: MediaQuery.of(context).size.height-kToolbarHeight,
          margin:const  EdgeInsets.only(top: kToolbarHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Flexible(
            flex: 1,
            child: Container(
              //margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 25.h),
               // margin: EdgeInsets.symmetric(vertical: 2.h),

                margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                child: BackWidget(height: 40, width: 40)),
          ),
            Flexible(
              flex: 1,
              child: Container(
                //padding: EdgeInsets.only(left: 10),

                  margin:const  EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                  child: Text('A’ propos de nous',style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    color: AppTheme.drawerTitleColor

                  ),)),
            ),
              Flexible(flex:2,child: kibradLogoRow),
              SizedBox(height: 4.h,),

              Flexible(
                flex: 1,
                  child: kibradFacebook),
              SizedBox(height: 4.h,),
             const  Divider(),
                SizedBox(height: 5.h,),
              Flexible(
                flex: 1,
                child: Container(
                  margin:const  EdgeInsets.symmetric(horizontal: 25),
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Cette application a été conçue par  ',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 16.sp,
                                color: AppTheme.itemTitleColor,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: 'developers',
                            style:  TextStyle(
                              fontFamily: 'Superfruit',
                                color: AppTheme.itemTitleColor,
                                fontSize: 18.sp
                            ),
                            ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.visible,
                      fontSize: 20.0.sp, ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                  child: developersLogoRow),
              SizedBox(height: 4.h,),
              Flexible(
                flex: 1,
                  child: developersFacebook)


    ],),
        ),
      );
  }
}
