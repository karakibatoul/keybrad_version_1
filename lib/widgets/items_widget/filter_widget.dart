
import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/widgets/location_widget.dart';
import 'package:keybrad/widgets/search_widget/checkbox_row.dart';
import 'package:keybrad/widgets/selection_listview_widgets/city_selection_listview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../search_widget/slider_widget.dart';
import '../two_horizontal_buttons.dart';

class FilterWidget extends StatefulWidget {
  
  static const routeName = '/filter_widget';

  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}


class _FilterWidgetState extends State<FilterWidget> {
  var selectedRange = const RangeValues(200, 2000);
  String minRange = '200 ';
  String maxRange = '2000 ';
  var locationController = TextEditingController();

  double minValue = 0.0;
  double maxValue = 1000000.0;
  double _starValue = 0.0;
  double _endValue = 1000000.0;


  final startController = TextEditingController();
  final endController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    startController.dispose();
    endController.dispose();
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
    return double.tryParse(s) != null;
  }




  @override
  void initState() {
    super.initState();
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


  @override
  Widget build(BuildContext context) {




    /*Widget slider = SliderTheme(data:  const SliderThemeData(
      trackHeight: 1,

    ), child: RangeSlider(


        activeColor: AppTheme.trierColor,
        inactiveColor: AppTheme.sliderInactiveColor,
      //  inactiveColor: Colors.blue,
        values: selectedRange,

        labels: RangeLabels('${selectedRange.start}', '${selectedRange.end}'),
        divisions: 5,
        min: 100,
        max: 10000,
        // max: ,
        onChanged: (RangeValues newRange) {
          setState(() {
            selectedRange = newRange;
            minRange = selectedRange.start.toString();
            maxRange = selectedRange.end.toString();
          });
        }));

    Widget minAndMaxRow =
    Container(
      alignment: Alignment.center,
     // margin: EdgeInsets.all(4.w),
      //margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0.h),
     // margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),

     // margin: EdgeInsets.symmetric(horizontal: 1.h,vertical: .h),
      child:   Row(
      children: [
        Expanded(
         // flex: 1,
         // fit: FlexFit.loose,
          child: TextButton(
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
                    color: AppTheme.greyBackgroundColor,
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


    Widget backWidget = Container(
     // margin: const EdgeInsets.only(top: 24, right: 24, bottom: 10, left: 24),
      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
      //  margin: const EdgeInsets.all(50),
      width: 40,
      height: 40,
      decoration:
          const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.backButtonBackgroundColor),
      child: InkWell(
        onTap: () {
         // Navigator.pop(context);
       //   Navigator.pushNamed(context, CategoriesScreen.routeName);
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: const Color.fromARGB(255, 247, 201, 133),
            child: Image.asset('assets/icons/back.png',
                width: IconTheme.of(context).size,
                height: IconTheme.of(context).size),
          ),
        ),
      ),
    );



    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,

      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            backWidget,
           // priceWidget,
            SliderWidget(
              rowWidth: ( MediaQuery.of(context).size.width/2)-30,
              rowHeight: 6.h,
              currencyWidth: 8.w,
              textFieldWidth: 17.w,
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
            ),

             Divider(
              height: 10.h,

            ),

            LocationWidget(
                controller: locationController,
                onTap:(){

                  Navigator.pushReplacementNamed(
                      context,
                      CitySelectionListview.routeName,
                      arguments: FilterWidget.routeName);
                  },
                suffixOnTap: (){ Navigator.pushReplacementNamed(
                    context,
                    CitySelectionListview.routeName,
                    arguments: FilterWidget.routeName);}, fontsize: 15.5.sp),
            Divider(
              height: 8.h,

            ),


           const CheckboxRow(),
            SizedBox(height: 2.h,),
            TwoHorizontalButtons(
              leftButtonBackground:AppTheme.greyTextFieldColor ,
              rightButtonBackground: AppTheme.trierButtonBackgroundColor,
              leftButtonLabel: 'Tout effacer',
              rightButtonLabel: 'Filter',
              leftButtonOnPressed: (){},
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

            )

          ],
        ),
      ),
    );
  }
}
