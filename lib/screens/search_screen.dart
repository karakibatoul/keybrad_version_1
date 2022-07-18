

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keybrad/widgets/location_widget.dart';
import 'package:keybrad/widgets/search_widget/grid_widget.dart';
import 'package:keybrad/widgets/search_widget/slider_widget.dart';
import 'package:keybrad/widgets/two_horizontal_buttons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../widgets/bouncing_widget.dart';
import '../widgets/profile_text_field_widget.dart';
import '../widgets/search_widget/checkbox_row.dart';
import '../widgets/selection_listview_widgets/city_selection_listview.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeName = '/search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {

  var selectedRange = const RangeValues(0, 2000);
  String minRange = '0';
  String maxRange = '2000 ';
  var locationController = TextEditingController();
  bool enabled = false;
  var minController = TextEditingController();
  var maxController = TextEditingController();
  var articleBoxColor = AppTheme.searchActiveButtonColor;
  var vendorBoxColor = AppTheme.inactiveSearchBackgroundColor;
  var categoryBoxColor = AppTheme.inactiveSearchBackgroundColor;
  var selectedLabelColor = Colors.white;
  var unselectedLabelColor = AppTheme.inactiveSearchLabelColor;
  var articleLabelColor = Colors.white;
  var vendorLabelColor = AppTheme.inactiveSearchLabelColor;
  var categoryLabelColor = AppTheme.inactiveSearchLabelColor;
  var selectedBoxColor = AppTheme.searchActiveButtonColor;
  var unselectedBoxColor = AppTheme.inactiveSearchBackgroundColor;

  double minValue = 0.0;
  double maxValue = 1000000.0;
  double _starValue = 0.0;
  double _endValue = 1000000.0;


  final startController = TextEditingController();
  final endController = TextEditingController();

  ///////////////////////////
  late Animation<Color?> animation;
  late AnimationController controller;

  late AnimationController unClickedAnimatedController;
  late Animation<Color?> unClickedAnimation;
  late AnimationController unClickedAnimatedCategoryController;
  late Animation<Color?> unClickedCategoryAnimation;


  //////////////////////////


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    startController.dispose();
    endController.dispose();
    controller.dispose();
    unClickedAnimatedController.dispose();
    unClickedAnimatedCategoryController.dispose();
    super.dispose();
  }



  _setStartValue() {
    if(isNumeric(startController.text)
        && isNumeric(endController.text)&&
    startController.text.isNotEmpty && endController.text.isNotEmpty){
      if (double.parse(startController.text).roundToDouble() <=
        double.parse(endController.text).roundToDouble() &&
        double.parse(startController.text).roundToDouble() >= minValue &&
        double.parse(endController.text).roundToDouble() >= minValue &&
        double.parse(startController.text).roundToDouble() <= maxValue &&
        double.parse(endController.text).roundToDouble() <= maxValue) {
      setState(() {
        _starValue = double.parse(startController.text).roundToDouble();
      });
    }}

  }

  _setEndValue() {
    if(isNumeric(startController.text)
        && isNumeric(endController.text)
        && startController.text.isNotEmpty
        && endController.text.isNotEmpty){
      if (double.parse(startController.text).roundToDouble() <=
          double.parse(endController.text).roundToDouble() &&
          double.parse(startController.text).roundToDouble() >= minValue &&
          double.parse(endController.text).roundToDouble() >= minValue &&
          double.parse(startController.text).roundToDouble() <= maxValue &&
          double.parse(endController.text).roundToDouble() <= maxValue) {
        setState(() {
          _endValue = double.parse(endController.text).roundToDouble();
        });
      }
    }
  }
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }


  /* _setStartValue() {

    if(startController.text!='Min:' && endController.text!='Max:'){
      var cutStartText = startController.text.split(":");
      var cutEndText = endController.text.split(":");
      if (double.parse(cutStartText[1]).roundToDouble() <=
          double.parse(cutEndText[1]).roundToDouble() &&
          double.parse(cutStartText[1]).roundToDouble() >= minValue &&
          double.parse(cutEndText[1]).roundToDouble() >= minValue &&
          double.parse(cutStartText[1]).roundToDouble() <= maxValue &&
          double.parse(cutEndText[1]).roundToDouble() <= maxValue) {
        setState(() {
          _starValue = double.parse(cutStartText[1]).roundToDouble();
        });
      }
    }
    print("Second text field: ${startController.text}");
  }

  _setEndValue() {
    if(startController.text!='Min:' && endController.text!='Max:'){
      var cutStartText = startController.text.split(":");
      var cutEndText = endController.text.split(":");
      if (double.parse(cutStartText[1]).roundToDouble() <=
          double.parse(cutEndText[1]).roundToDouble() &&
          double.parse(cutStartText[1]).roundToDouble() >= minValue &&
          double.parse(cutEndText[1]).roundToDouble() >= minValue &&
          double.parse(cutStartText[1]).roundToDouble() <= maxValue &&
          double.parse(cutEndText[1]).roundToDouble() <= maxValue) {
        setState(() {
          _endValue = double.parse(cutEndText[1]).roundToDouble();
        });
      }
    }

    print("Second text field: ${endController.text}");
  }


  */






  @override
  void initState() {
    super.initState();
    /////////////////////



    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    unClickedAnimatedController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    unClickedAnimatedCategoryController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    unClickedCategoryAnimation =
        ColorTween(begin: AppTheme.inactiveSearchBackgroundColor, end: AppTheme.searchActiveButtonColor ).animate(unClickedAnimatedCategoryController);
    unClickedAnimation =
        ColorTween(begin: AppTheme.inactiveSearchBackgroundColor, end: AppTheme.searchActiveButtonColor ).animate(unClickedAnimatedController);
    animation =
    ColorTween(begin: AppTheme.searchActiveButtonColor, end: AppTheme.inactiveSearchBackgroundColor ).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });



    /////////////////////
    startController.addListener(_setStartValue);
    endController.text = _endValue.toString();
    startController.text = _starValue.toString();
    endController.addListener(_setEndValue);
    Future.delayed(Duration.zero,() {
      String locationString = '';
      var  args = ModalRoute.of(context)!.settings.arguments;
      if(args==null){
        setState(() {
          locationController.text='';
        });
      }
      else{
        setState(() {
          final  args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
          for(int i=0;i<args.nbrOfCities;i++){
            locationString  =locationString + args.city[i].name +',' ;
          }
          locationString = locationString.toString().substring(0,locationString.length-1);

          locationController.text = 'localization: $locationString';
        });
      }
    });
  }



  bool buttonToggle = true;
  bool secondButtonToggle = false;
  bool thirdButtonToggle = false;

  int index = 1;
  int previousIndex = 0;


  void animateColor() {
    if (index == 1 && previousIndex == 2) {
      unClickedAnimatedController.reverse();
      controller.forward();
    }
    else if (index == 1 && previousIndex == 3) {
      controller.forward();
      unClickedAnimatedCategoryController.reverse();
    }


    else if (index == 1 && previousIndex == 0) {
      return;
    }
    else if (index == 2 && previousIndex == 1) {
      controller.forward();
      unClickedAnimatedController.forward();
    }
    else if (index == 2 && previousIndex == 3) {
      unClickedAnimatedCategoryController.forward();
      unClickedAnimatedController.reverse();
    }

    else if (index == 3 && previousIndex == 1) {
          controller.forward();
          unClickedAnimatedCategoryController.forward();
    }
    else if (index == 3 && previousIndex == 2) {
        unClickedAnimatedController.reverse();
        unClickedAnimatedCategoryController.forward();
    }
  }

  /*void animateColor() {

    if (buttonToggle) {
      //vendeur
      print('in if');
      controller.forward();
      unClickedAnimatedController.forward();
     // unClickedAnimatedCategoryController.reverse();
    } else if(secondButtonToggle) {
      print('in else');
      controller.reverse();
      unClickedAnimatedController.reverse();
     // unClickedAnimatedCategoryController.reverse();
    }
    else if(thirdButtonToggle){

      print('in 3');

      //controller.forward();
     // unClickedAnimatedController.reverse();
      unClickedAnimatedCategoryController.forward();
    }
    buttonToggle = !buttonToggle;
    secondButtonToggle = !secondButtonToggle;


  }

   */



  @override
  Widget build(BuildContext context) {

    var articleController = TextEditingController();

    /*Widget tryPriceWidget =
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left:25, top:30, right:0, bottom:0),
       // padding:const  EdgeInsets.symmetric(vertical: 20,horizontal: 25),
        child: Text('Prix',style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            color:
            AppTheme.itemPriceColor),),
      ),
      SliderTheme(
        data:  const SliderThemeData(
          trackHeight: 1,
        ),
        child: RangeSlider(
          activeColor: AppTheme.trierColor,
          inactiveColor: AppTheme.sliderInactiveColor,
          values: RangeValues(_starValue, _endValue),
          min: minValue,
          max: maxValue,
          onChanged: (values) {
            setState(() {
              _starValue = values.start.roundToDouble();
              _endValue = values.end.roundToDouble();
              startController.text =
              values.start.roundToDouble().toString();
              endController.text = values.end.roundToDouble().toString();
            });
          },
        ),
      ),
      Padding(
        padding: const  EdgeInsets.symmetric(vertical: 0,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  height: 6.h,
                  width:( MediaQuery.of(context).size.width/2)-30,
                  decoration:const BoxDecoration(
                      color: AppTheme.greyTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Container(
                      width:8.w,
                      height: 5.h,
                      margin:const  EdgeInsets.only(left: 10),
                      padding: EdgeInsets.only(top:5.h/4),
                      decoration:const BoxDecoration(
                          color:
                          AppTheme.greyTextFieldColor,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                      child: Text('Min:',style:  TextStyle(fontSize: 16.5.sp, color: AppTheme.filterLabelColor))),
                    Container(
                      padding: EdgeInsets.only(left:1.w),
                      width: 20.w,
                      height: 6.h,//was 40
                      decoration:const BoxDecoration(
                          color:AppTheme.greyTextFieldColor,
                        //color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: AppTheme.filterMinMaxColor),
                        decoration: const InputDecoration(
                            border: InputBorder.none,),
                        controller: startController,
                      ),
                    ),
                      const Spacer(),
                      Container(
                        width: 8.w,
                          height: 5.h,
                          margin:const  EdgeInsets.only(right: 10),
                          padding: EdgeInsets.only(top: 5.h/4),
                            alignment: Alignment.center,
                          decoration:const BoxDecoration(
                              color:
                              AppTheme.greyTextFieldColor,
                              borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                          child: Text('FCFA',style: TextStyle(
                              fontSize: 12.5.sp,
                              color: AppTheme.greyTextColor))),
                    ],)),
            ),
            SizedBox(width: 3.w,),
            Expanded(
              child: Container(
                  height: 6.h,
                  width:( MediaQuery.of(context).size.width/2)-30,
                  decoration:const BoxDecoration(
                      color: AppTheme.greyTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width:10.w,
                          height: 5.h,
                          margin:const  EdgeInsets.only(left: 10),
                          padding: EdgeInsets.only(top:5.h/4),
                          decoration:const BoxDecoration(
                              color:
                              AppTheme.greyTextFieldColor,
                              borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                          child: Text('Max:',
                              overflow: TextOverflow.visible,
                              style:  TextStyle(fontSize: 16.sp, color: AppTheme.filterLabelColor))),
                      Container(
                        padding: EdgeInsets.only(left:1.w),
                        width: 20.w,
                        height: 6.h,//was 40
                        decoration:const BoxDecoration(
                            color:AppTheme.greyTextFieldColor,
                            //color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 17.sp,
                              color: AppTheme.filterMinMaxColor),
                          decoration: const InputDecoration(
                              border: InputBorder.none, ),
                          controller: endController,
                        ),
                      ),
                      const Spacer(),
                      Container(
                          width: 8.w,
                          height: 5.h,
                          margin:const  EdgeInsets.only(right: 10),
                          padding: EdgeInsets.only(top: 5.h/4),
                          alignment: Alignment.center,
                          decoration:const BoxDecoration(
                              color:
                              AppTheme.greyTextFieldColor,
                              borderRadius: BorderRadius.all(Radius.circular(10.0))) ,
                          child: Text('FCFA',style: TextStyle(
                              fontSize: 12.5.sp,
                              color: AppTheme.greyTextColor))),
                    ],)),
            ),
        ],),
      ),
      /*Container(
        margin: EdgeInsets.all(20),
        child: TextField(

          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Enter  start value'),
          controller: startController,
        ),
      ),
      Container(
        margin:EdgeInsets.all(20),

        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Enter end value'),
          controller: endController,
        ),),

       */




    ],
    );

    Widget slider =
    SliderTheme(data:  const SliderThemeData(
      trackHeight: 1,

    ), child: RangeSlider(


        activeColor: AppTheme.trierColor,
        inactiveColor: AppTheme.sliderInactiveColor,
        //  inactiveColor: Colors.blue,
        values: selectedRange,

        labels: RangeLabels('${selectedRange.start}', '${selectedRange.end}'),
        divisions: 5,
        min: 0,
        max: 10000,
        // max: ,
        onChangeStart:(RangeValues newRange) {
          setState(() {
            minRange = selectedRange.start.toString();

          });
        } ,
        onChanged: (RangeValues newRange) {
          setState(() {
            selectedRange = newRange;
            minRange = selectedRange.start.toString();
            maxRange = selectedRange.end.toString();
            setState(() {
              minController.text = maxRange;
            });
          });
        }));

    Widget minAndMaxRow =
    Container(
      alignment: Alignment.center,
      child:   Row(
        children: [
          Expanded(
            child:  TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                  width: 160,
                  height: 5.h,
                  decoration: const BoxDecoration(
                      color: AppTheme.greyTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: RichText(
                        text:  TextSpan(
                            style:  TextStyle(fontSize: 16.5.sp, color: AppTheme.filterLabelColor),
                            children: [
                              const TextSpan(text: 'Min: '),
                              TextSpan(
                                  text: minRange + ' ',
                                  style:const TextStyle(color: AppTheme.filterMinMaxColor)),
                              //here the currency is constant but it will be the currency of the item selected
                              TextSpan(
                                  text: 'FCFA',
                                  style: TextStyle(
                                      fontSize: 12.5.sp,
                                      color: AppTheme.greyTextColor))
                            ]),
                      ),
                    ),
                  )),
            ),
          ),
          Expanded(
            // flex: 1,
            //   fit: FlexFit.loose,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                //  margin: EdgeInsets.only(right: 15),
                  width: 160,
                  height: 5.h,//was 40
                  decoration:const BoxDecoration(
                      color: AppTheme.greyTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            style:  TextStyle(fontSize: 16.5.sp, color: AppTheme.filterLabelColor),
                            children: [
                              const   TextSpan(text: 'Max: '),
                              TextSpan(
                                  text: maxRange + ' ',
                                  style:const TextStyle(color: AppTheme.filterMinMaxColor)),
                              //here the currency is constant but it will be the currency of the item selected
                              TextSpan(
                                  text: 'FCFA',
                                  style: TextStyle(
                                      fontSize: 12.5.sp,
                                      color: AppTheme.filterLabelColor))
                            ]),
                      ),
                    ),
                  )),
            ),
          ),
        ],

      ) ,);

    Widget minAndMaxRowTry =
    Container(
      alignment: Alignment.center,
      child:   Row(
        children: [
          Expanded(
            child: Container(
              child:
                Container(
                  width: 160,
                  height: 5.h,
                  decoration: const BoxDecoration(
                      color: AppTheme.greyTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: TextField(


                    cursorColor: Colors.grey,

                    style:const TextStyle(color: Colors.grey),
                    onChanged: (String s){
                      setState(() {
                        minRange = s;
                        selectedRange = RangeValues(double.parse(s), 2000);
                      });
                      print(minController.text);
                      print('s:$s');
                    },
                    onTap: (){

                    },
                    controller:minController ,
                    onSubmitted: (_) {


                    },


                    decoration: InputDecoration(
                      focusColor: Colors.grey,
                      hintText: '',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),



                      hintStyle:  TextStyle(
                          color: Colors.grey,
                          fontSize: 15
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppTheme.greyBackgroundColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: AppTheme.greyTextFieldColor,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                )
              /*TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    width: 160,
                    height: 5.h,
                    decoration: const BoxDecoration(
                        color: AppTheme.greyTextFieldColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: RichText(
                          text:  TextSpan(
                              style:  TextStyle(fontSize: 16.5.sp, color: AppTheme.filterLabelColor),
                              children: [
                                const TextSpan(text: 'Min: '),
                                TextSpan(
                                    text: minRange + ' ',
                                    style:const TextStyle(color: AppTheme.filterMinMaxColor)),
                                //here the currency is constant but it will be the currency of the item selected
                                TextSpan(
                                    text: 'FCFA',
                                    style: TextStyle(
                                        fontSize: 12.5.sp,
                                        color: AppTheme.greyTextColor))
                              ]),
                        ),
                      ),
                    )),
              ),
              */
            ),
          ),
          Expanded(
            // flex: 1,
            //   fit: FlexFit.loose,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                //  margin: EdgeInsets.only(right: 15),
                  width: 160,
                  height: 5.h,//was 40
                  decoration:const BoxDecoration(
                      color: AppTheme.greyTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            style:  TextStyle(fontSize: 16.5.sp, color: AppTheme.filterLabelColor),
                            children: [
                              const   TextSpan(text: 'Max: '),
                              TextSpan(
                                  text: maxRange + ' ',
                                  style:const TextStyle(color: AppTheme.filterMinMaxColor)),
                              //here the currency is constant but it will be the currency of the item selected
                              TextSpan(
                                  text: 'FCFA',
                                  style: TextStyle(
                                      fontSize: 12.5.sp,
                                      color: AppTheme.filterLabelColor))
                            ]),
                      ),
                    ),
                  )),
            ),
          ),
        ],

      ) ,);
    */



    AppBar appbar = AppBar(
        elevation: 0,

        toolbarHeight: kToolbarHeight,
        backgroundColor: AppTheme.greyBackgroundColor,
        leadingWidth: 55,
        title: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all( 10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: const Image(
            image: AssetImage('assets/images/topLogo.png'),
            fit: BoxFit.fill,
            height: kToolbarHeight-20,
            width:130,
          ),
        ),

        leading: Builder(builder: (BuildContext context) {
          return Bouncing(
            onPress: () {  Navigator.pop(context); },
            child: Container(
              margin:const  EdgeInsets.only(left: 20),
             // borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/icons/back btn.png',fit: BoxFit.fitWidth,
                height: 10,
                  ),
            ),
          );
        }));

    Widget searchText =
    Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child:  Row(children: [
        Image.asset('assets/icons/search.png',width: 45,height: 45,),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child:  Text(
            'Recherche',//it should be the nbr of articles rendered by the profile
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: AppTheme.searchTitleColor
            ),
          ),
        )],),);

    /*Widget iconButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Container(
          width: 100,
          height: 45,
          decoration: const BoxDecoration(
              color: AppTheme.trierButtonBackgroundColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0))),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(Colors.red, BlendMode.modulate),
                  child: Image.asset('assets/icons/itemIcon.png',height: 30,width: 30,)),
              Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.only(right: 10),


              child: Text('Article',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ),



            ],)
      ),
    );
    */
    return Scaffold(
        appBar: appbar,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-kToolbarHeight-20,
          margin: const EdgeInsets.only(top: 10),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                    fit: FlexFit.loose,
                    child: searchText),
               const Divider(),
                Flexible(
                  flex: 4,
                  fit: FlexFit.loose,
                  child: GridView.count(
                    padding: EdgeInsets.only(right: 30,left: 30,top: 2.5.h,bottom: 0),
                   // padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                    childAspectRatio: 2.5,
                    crossAxisCount: 3,
                    scrollDirection: Axis.vertical,

                    shrinkWrap: true,
                    children: [
                      ZoomTapAnimation(

                       onTap: (){

                         setState(() {
                           previousIndex=index;
                           index=1;
                         });
                         animateColor();
                              setState(() {
                                articleBoxColor = selectedBoxColor;
                                vendorBoxColor = unselectedBoxColor;
                                categoryBoxColor = unselectedBoxColor;
                                articleLabelColor = selectedLabelColor;
                                vendorLabelColor = unselectedLabelColor;
                                categoryLabelColor = unselectedLabelColor;
                              });
                       },
                      begin: 1.0,
                      end: 0.83,
                      beginDuration: const Duration(milliseconds: 20),
                      endDuration: const Duration(milliseconds: 150),
                      beginCurve: Curves.decelerate,
                      endCurve: Curves.fastOutSlowIn,
                       child: GridWidget(
                            icon: CupertinoIcons.cube_fill,
                            iconColor: articleLabelColor,
                           image: 'assets/icons/itemIcon.png',
                           label: 'Article',
                           color: articleBoxColor,
                         //color: animation.value,
                           labelColor: articleLabelColor,
                         bottomLeft: const Radius.circular(10.0) ,
                         bottomRight: const  Radius.circular(0.0),
                         topLeft: const Radius.circular(10.0) ,
                         topRight:const  Radius.circular(0.0) ,

                       ),
                     ),
                      ZoomTapAnimation(
                        onTap: (){
                          setState(() {
                            previousIndex=index;
                            index=2;
                          });
                          animateColor();
                          setState(() {
                            articleBoxColor = unselectedBoxColor;
                            vendorBoxColor = selectedBoxColor;
                            categoryBoxColor = unselectedBoxColor;
                            articleLabelColor = unselectedLabelColor;
                            vendorLabelColor = selectedLabelColor;
                            categoryLabelColor = unselectedLabelColor;
                          });

                        },
                        begin: 1.0,
                        end: 0.83,
                        beginDuration: const Duration(milliseconds: 20),
                        endDuration: const Duration(milliseconds: 150),
                        beginCurve: Curves.decelerate,
                        endCurve: Curves.fastOutSlowIn,
                        child: GridWidget(
                          icon: Icons.person,
                          iconColor: vendorLabelColor,
                          image: 'assets/icons/sellerIcon.png',
                          label: 'Vendeur',
                          color: vendorBoxColor,
                          //color:unClickedAnimation.value,
                          labelColor: vendorLabelColor,
                          bottomLeft: const Radius.circular(0.0) ,
                          bottomRight: const  Radius.circular(0.0),
                          topLeft: const Radius.circular(0.0) ,
                          topRight:const  Radius.circular(0.0) ,
                        ),
                      ),
                      ZoomTapAnimation(
                        onTap: (){
                          setState(() {
                            previousIndex = index;
                            index = 3;
                          });
                          animateColor();
                          setState(() {
                            articleBoxColor = unselectedBoxColor;
                            vendorBoxColor = unselectedBoxColor;
                            categoryBoxColor = selectedBoxColor;
                            articleLabelColor = unselectedLabelColor;
                            vendorLabelColor = unselectedLabelColor;
                            categoryLabelColor = selectedLabelColor;
                          });

                        },
                        begin: 1.0,
                        end: 0.83,
                        beginDuration: const Duration(milliseconds: 20),
                        endDuration: const Duration(milliseconds: 150),
                        beginCurve: Curves.decelerate,
                        endCurve: Curves.fastOutSlowIn,
                        child: GridWidget(
                          icon: Icons.grid_view_sharp,
                          iconColor: categoryLabelColor,
                            image: 'assets/icons/categoryIcon.png',
                            label: 'Catègorie',
                          //color: unClickedCategoryAnimation.value,
                            color:categoryBoxColor,
                          labelColor: categoryLabelColor,
                          bottomLeft: const Radius.circular(0.0) ,
                          bottomRight: const  Radius.circular(10.0),
                          topLeft: const Radius.circular(0.0) ,
                          topRight:const  Radius.circular(10.0) ,
                        ),
                      ),

                    ],
                  ),
                ),


                SizedBox(height: 2.h,),
                Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                  child: ProfileTextFieldWidget(
                    controller: articleController,
                    hintText: 'Titre de l\'article:',
                    textFieldHeight: 6.h,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    hintColor: AppTheme.filterLabelColor,
                    hintFontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 5.h,),
                const Divider(),
                Flexible(
                    fit: FlexFit.loose,
                    flex: 9,
                    child: SliderWidget(
                      rowWidth: ( MediaQuery.of(context).size.width/2)-30,
                      rowHeight: 6.h,
                      currencyWidth: 8.w,
                      textFieldWidth: 20.w,
                      maxWidth:10.w,
                      minWidth: 5.h,
                      textFieldHeight: 6.h,
                      leftFirstLabel: 'Min:',
                      leftLastLabel: 'FCFA',
                      rightFirstLabel: 'Max:',
                      rightLastLabel: 'FCFA',
                      endController: endController,
                      startController: startController,
                        endValue: _endValue,
                      starValue: _starValue,
                      maxValue: maxValue,
                      minValue: minValue,
                      onChanged: (values) {
                        setState(() {
                          _starValue = values.start.roundToDouble();
                          _endValue = values.end.roundToDouble();
                          startController.text =
                              values.start.roundToDouble().toString();
                          endController.text = values.end.roundToDouble().toString();
                        });
                      },
                    )
                  //priceWidget
                ),

                Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: LocationWidget(
                          controller: locationController,
                          onTap:(){
                           /* Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                              const CitySelectionListview(returnPage:SearchScreen.routeName ,)),
                            );

                            */
                            Navigator.pushReplacementNamed(context, CitySelectionListview.routeName,arguments: SearchScreen.routeName);
                            },
                          suffixOnTap: (){  Navigator.pushNamed(context, CitySelectionListview.routeName);},
                          fontsize: 16.sp),
                  ),
                ),

                SizedBox(height: 5.h,),
                const Flexible(
                  flex: 1,
                    fit: FlexFit.loose,
                    child: CheckboxRow()),
                const  Spacer(flex: 3,),

                 Flexible(
                   flex: 4,
                   fit: FlexFit.loose,
                   child: TwoHorizontalButtons(
                     leftButtonBackground:AppTheme.greyTextFieldColor ,
                     rightButtonBackground: AppTheme.trierButtonBackgroundColor,
                     leftButtonLabel: 'Tout effacer',
                     rightButtonLabel: 'Rechercher',
                     leftButtonOnPressed: (){
                       //Navigator.pushNamed(context, TryScreen.routeName);
                     },
                     rightButtonOnPressed: (){},
                     leftColorLabel: Colors.grey,
                     rightColorLabel: Colors.white,
                     leftFontWeight: FontWeight.w500,
                     leftLabelFontSize: 15.sp,
                     rightFontWeight: FontWeight.w500,
                     rightLabelFontSize: 15.sp,
                     leftButtonHeight: 5.h,
                     rightButtonHeight: 5.h,
                     leftButtonWidth: 100.w,
                     rightButtonWidth: 100.w,

                   ),
                 )





              ],
            ),
          ),
      ),
      );
  }
}
