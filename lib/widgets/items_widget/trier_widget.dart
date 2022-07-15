//https://kickertech.com/how-to-create-a-dialog-box-in-flutter-dialogbox-with-radio-button/

import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:animated_radio_buttons/animated_radio_buttons.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrierWidget extends StatefulWidget {
  const TrierWidget({Key? key}) : super(key: key);

  @override
  State<TrierWidget> createState() => _TrierWidgetState();
}

enum menuitem { item1, item2, item3, item4 }



class _TrierWidgetState extends State<TrierWidget>  with SingleTickerProviderStateMixin {

  double _popImageWidth = 35;
  double _popImageHeight = 35;
  double _trierWidth = 170;
  double _trierHeight = 45;

  Color radioButtonTextColorInActive = AppTheme.radioButtonTextColor;
  Color radioButtonTextColorActive = AppTheme.radioButtonColor;
  Color firstRadioButton = AppTheme.radioButtonColor;
  Color secondRadioButton =  AppTheme.radioButtonTextColor;
  Color thirdRadioButton = AppTheme.radioButtonTextColor;
  Color fourthRadioButton = AppTheme.radioButtonTextColor;


  late double _scale;
  late AnimationController _controller;
  late AnimationController _popController;
  @override
  void initState() {

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }@override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  menuitem? _mitem = menuitem.item1;
  int? myVar = 1;
  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;


    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),


              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _popImageHeight = 25;
                          _popImageWidth = 25;
                        });

                        Future.delayed(const Duration(milliseconds: 60)).then((value) => Navigator.of(context).pop());
                      },
                      child:
                      AnimatedContainer(
                        curve: Curves.bounceIn,
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.only(top: 15,bottom: 20,right: 0,left: 20),
                        duration:const  Duration(milliseconds: 50),
                        child: Image.asset('assets/icons/back.png',
                            width: _popImageWidth,
                            height: _popImageHeight),
                      ),
                    ),
                  ),


                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Center(
                      child: Container(
                        padding:const EdgeInsets.only(top:15,bottom: 20),
                        child: const Text('Trier',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppTheme.drawerTitleColor,
                                fontSize: 20, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ////////////////////

         /* Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: AnimatedRadioButtons(
             // backgroundColor: Colors.yellow[400],
              value: myVar ?? 0,

              layoutAxis: Axis.vertical,
              animationCurve: Curves.bounceInOut,

              buttonRadius: 40.0,
              items: [

                AnimatedRadioButtonItem(

                    label: "Star Battles",
                    color: Colors.black,
                    fillInColor: Colors.grey),
                AnimatedRadioButtonItem(
                    label: "Star Trek",
                    labelTextStyle: TextStyle(color: Colors.blue),
                    fillInColor: Colors.yellow[400]),
                AnimatedRadioButtonItem(
                    label: "Losers",
                    color: Colors.green,
                    fillInColor: Colors.greenAccent)
              ],
              onChanged: (value) {
                setState(() {
                  myVar = value;
                });
              },
            ),
          ),
          */

          ///////////////////
          Flexible(
            flex: 2,
            child: ListTile(
              minVerticalPadding: 0,
              title:  Text('Les plus récents',style: TextStyle(fontWeight: FontWeight.w500,color: firstRadioButton),),
              leading: Radio<menuitem>(
                activeColor: AppTheme.radioButtonColor,
                value: menuitem.item1,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                    firstRadioButton = radioButtonTextColorActive;
                    secondRadioButton = radioButtonTextColorInActive;
                    thirdRadioButton = radioButtonTextColorInActive;
                    fourthRadioButton = radioButtonTextColorInActive;
                  });
                },
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: ListTile(
              title:  Text('Les moins récents ',style: TextStyle(fontWeight: FontWeight.w500,color: secondRadioButton),),
              leading: Radio<menuitem>(
                value: menuitem.item2,
                activeColor: AppTheme.radioButtonColor,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                    firstRadioButton = radioButtonTextColorInActive;
                    secondRadioButton = radioButtonTextColorActive;
                    thirdRadioButton = radioButtonTextColorInActive;
                    fourthRadioButton = radioButtonTextColorInActive;
                  });
                },
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: ListTile(
              title:  Text('Prix croissants',style: TextStyle(fontWeight: FontWeight.w500,color: thirdRadioButton),),
              leading: Radio<menuitem>(
                activeColor: AppTheme.radioButtonColor,
                value: menuitem.item3,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                    firstRadioButton = radioButtonTextColorInActive;
                    secondRadioButton = radioButtonTextColorInActive;
                    thirdRadioButton = radioButtonTextColorActive;
                    fourthRadioButton = radioButtonTextColorInActive;

                  });
                },
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: ListTile(
              title:  Text('Prix decroissants',style: TextStyle(fontWeight: FontWeight.w500,color: fourthRadioButton),),
              leading: Radio<menuitem>(
                activeColor: AppTheme.radioButtonColor,
                value: menuitem.item4,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                    firstRadioButton = radioButtonTextColorInActive;
                    secondRadioButton = radioButtonTextColorInActive;
                    thirdRadioButton = radioButtonTextColorInActive;
                    fourthRadioButton = radioButtonTextColorActive;

                  });
                },
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Bouncing(
              onPress: (){
                Navigator.of(context).pop();
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(right: 8.0,left: 8.0,bottom: 8.0,top: 20.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: Container(
                      width: _trierWidth,
                      height: _trierHeight,
                      decoration: const BoxDecoration(
                          color: AppTheme.trierButtonBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      child: const Center(
                        child: Text('Trier',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


  ////////////////////////////////////////
 /* int? myVar = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[400],
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedRadioButtons(
            backgroundColor: Colors.yellow[400],
            value: myVar ?? 0,
            layoutAxis: Axis.vertical,
            buttonRadius: 40.0,
            items: [
              AnimatedRadioButtonItem(
                  label: "Star Battles",
                  color: Colors.black,
                  fillInColor: Colors.grey),
              AnimatedRadioButtonItem(
                  label: "Star Trek",
                  labelTextStyle: TextStyle(color: Colors.blue),
                  fillInColor: Colors.yellow[400]),
              AnimatedRadioButtonItem(
                  label: "Losers",
                  color: Colors.green,
                  fillInColor: Colors.greenAccent)
            ],
            onChanged: (value) {
              setState(() {
                myVar = value;
              });
            },
          ),
          myVar == null
              ? Text(" Current selected index: *please select one* ")
              : Text(" Current selected index: $myVar"),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  myVar = 2;
                });
              },
              child: Text("Set value to last")),
        ],
      ),
    );
  }

}

  */
 /* menuitem? _mitem = menuitem.item1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),


              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                          Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.only(top: 15,bottom: 20,right: 0,left: 20),

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
                        padding:const EdgeInsets.only(top:15,bottom: 20),
                        child: const Text('Trier',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppTheme.drawerTitleColor,
                                fontSize: 20, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: ListTile(
              minVerticalPadding: 0,
              title: const Text('Les plus récents',style: TextStyle(fontWeight: FontWeight.w500,color: AppTheme.radioButtonTextColor),),
              leading: Radio<menuitem>(
                activeColor: AppTheme.radioButtonColor,
                value: menuitem.item1,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                  });
                },
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: ListTile(
              title: const Text('Les moins récents ',style: TextStyle(fontWeight: FontWeight.w500,color: AppTheme.radioButtonTextColor),),
              leading: Radio<menuitem>(
                value: menuitem.item2,
                activeColor: AppTheme.radioButtonColor,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                  });
                },
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: ListTile(
              title: const Text('Prix croissants',style: TextStyle(fontWeight: FontWeight.w500,color: AppTheme.radioButtonTextColor),),
              leading: Radio<menuitem>(
                activeColor: AppTheme.radioButtonColor,
                value: menuitem.item3,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                  });
                },
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: ListTile(
              title: const Text('Prix decroissants',style: TextStyle(fontWeight: FontWeight.w500,color: AppTheme.radioButtonTextColor),),
              leading: Radio<menuitem>(
                activeColor: AppTheme.radioButtonColor,
                value: menuitem.item4,
                groupValue: _mitem,
                onChanged: (menuitem? value) {
                  setState(() {
                    _mitem = value;
                  });
                },
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 8.0,left: 8.0,bottom: 8.0,top: 20.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    width: 170,
                    height: 45,
                    decoration: const BoxDecoration(
                        color: AppTheme.trierButtonBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    child: const Center(
                      child: Text('Trier',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  */
