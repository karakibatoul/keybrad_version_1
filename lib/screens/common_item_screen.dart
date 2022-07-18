import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/screens/item_details.dart';
import 'package:keybrad/screens/phising_screen.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:url_launcher/url_launcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//index == 0,itemDetails
//index == 1,itemDetailsWithoutProfile
//index == 2,itemDetailsWithoutCategory


class CommonItemScreen extends StatefulWidget {
  final int index ;
  const CommonItemScreen({Key? key, required this.index}) : super(key: key);
  static const routeName = '/common_item_screen';


  @override
  State<CommonItemScreen> createState() => _CommonItemScreenState();
}

class _CommonItemScreenState extends State<CommonItemScreen> {
  /*int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

   */

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
    }
  }

  openwhatsapp(String tel) async{
    var whatsappURlAndroid = "whatsapp://send?phone="+tel+"&text=hello";
    url_launcher.launch(whatsappURlAndroid);
  }
  openSMS (String sms,String tel)async{
    var smsUrl = "sms:"+tel+"?body="+sms;
    url_launcher.launch(smsUrl);
  }



  @override
  Widget build(BuildContext context) {

    CurvedNavigationBar bottomNavigationBar = CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      animationDuration:const Duration(milliseconds: 200),


      onTap: (index){

        if(index==0)
        {
          Timer(const Duration(milliseconds: 250), () {
            showGeneralDialog(
              context: context,
              pageBuilder: (ctx, a1, a2) {
                return Container();
              },
              transitionBuilder: (ctx, a1, a2, child) {
                var curve = Curves.easeInOut.transform(a1.value);
                return Transform.scale(
                  scale: curve,
                  child: const PhishingScreen(phisingIndex: 1,),
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
            );
          });

        }
        else if(index==1){

          Timer(const Duration(milliseconds: 250), () {
            showGeneralDialog(
              context: context,
              pageBuilder: (ctx, a1, a2) {
                return Container();
              },
              transitionBuilder: (ctx, a1, a2, child) {
                var curve = Curves.easeInOut.transform(a1.value);
                return Transform.scale(
                  scale: curve,
                  child: const PhishingScreen(phisingIndex: 1,),
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
            );
          });


        }
        else if (index==2){

          Timer(const Duration(milliseconds: 250), () {
            showGeneralDialog(
              context: context,
              pageBuilder: (ctx, a1, a2) {
                return Container();
              },
              transitionBuilder: (ctx, a1, a2, child) {
                var curve = Curves.easeInOut.transform(a1.value);
                return Transform.scale(
                  scale: curve,
                  child: const PhishingScreen(phisingIndex: 1,),
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
            );
          });




        }

      },
      items: [
        Image.asset('assets/icons/call icon.png',
            width: IconTheme.of(context).size,
            height: (IconTheme.of(context).size)!-5),
        Image.asset('assets/icons/sms icon.png',
            width: IconTheme.of(context).size,
            height: (IconTheme.of(context).size)!-5),
        Image.asset('assets/icons/wtsp icon.png',
            width: IconTheme.of(context).size,
            height: (IconTheme.of(context).size)!-5),

      ],
    );

    /*BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index){

        if(index==0)
          {
            showGeneralDialog(
              context: context,
              pageBuilder: (ctx, a1, a2) {
                return Container();
              },
              transitionBuilder: (ctx, a1, a2, child) {
                var curve = Curves.easeInOut.transform(a1.value);
                return Transform.scale(
                  scale: curve,
                  child: const PhishingScreen(phisingIndex: 0,),
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
            );
          }
        else if(index==1){

          showGeneralDialog(
            context: context,
            pageBuilder: (ctx, a1, a2) {
              return Container();
            },
            transitionBuilder: (ctx, a1, a2, child) {
              var curve = Curves.easeInOut.transform(a1.value);
              return Transform.scale(
                scale: curve,
                child: const PhishingScreen(phisingIndex: 1,),
              );
            },
            transitionDuration: const Duration(milliseconds: 300),
          );
        }
        else if (index==2){

            showGeneralDialog(
              context: context,
              pageBuilder: (ctx, a1, a2) {
                return Container();
              },
              transitionBuilder: (ctx, a1, a2, child) {
                var curve = Curves.easeInOut.transform(a1.value);
                return Transform.scale(
                  scale: curve,
                  child: const PhishingScreen(phisingIndex: 2,),
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
            );



        }

        },
      selectedLabelStyle:const TextStyle(height: 2) ,
      unselectedLabelStyle: const TextStyle(height: 2),
      unselectedItemColor: AppTheme.trierButtonBackgroundColor,
      showUnselectedLabels: true,
      selectedItemColor:AppTheme.trierButtonBackgroundColor,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/call icon.png',
              width: IconTheme.of(context).size,
              height: IconTheme.of(context).size),
          label: 'Appeler',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/sms icon.png',
              width: IconTheme.of(context).size,
              height: IconTheme.of(context).size),

          label: 'SMS',
        ),
        BottomNavigationBarItem(

          icon: Image.asset('assets/icons/wtsp icon.png',
              width: IconTheme.of(context).size,
              height: IconTheme.of(context).size),
          label: 'Whatsapp',
        ),
      ],
    );*/

    return
      Scaffold(
        extendBody: true,
        body:
        Builder(
          builder: (context) {
           if(widget.index==0) {
             return const  ItemDetails(indexPage: 0,);
           } else if(widget.index==1) {
             return const ItemDetails(indexPage: 1,);
           } else if(widget.index==2) {
             return const ItemDetails(indexPage: 2,);
           }
           return const  ItemDetails(indexPage: 0,);
          }
        ),
        bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            child: bottomNavigationBar),
      );


  }

}
