import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class RadioGroup extends StatefulWidget {
  const RadioGroup({Key? key}) : super(key: key);

  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State {

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  Color? prixNegogiableColor = AppTheme.checkedRadioButtonColor;
  Color? prixfinalColor = AppTheme.uncheckedRadioButtonColor;


  @override
  Widget build(BuildContext context) {
    return


        Theme(
          
          data: Theme.of(context).copyWith(
              unselectedWidgetColor: AppTheme.uncheckedRadioButtonColor,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Expanded(child: Row(children: [
                  Radio(
                    activeColor: AppTheme.textOrange,
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {

                      setState(() {
                        prixfinalColor = AppTheme.uncheckedRadioButtonColor;
                        prixNegogiableColor = AppTheme.checkedRadioButtonColor;
                        radioButtonItem = 'Prix négogiable';
                        id = 1;
                      });
                    },
                  ),
                  Text(
                    'Prix négogiable',
                    style: TextStyle(
                      color: prixNegogiableColor,
                        fontSize: 17.0),
                  ),

                ],)),
                Expanded(child: Row(
                  children: [
                    Radio(
                      activeColor: AppTheme.textOrange,
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          prixfinalColor = AppTheme.checkedRadioButtonColor;
                          prixNegogiableColor = AppTheme.uncheckedRadioButtonColor;
                          radioButtonItem = 'Prix final';
                          id = 2;
                        });
                      },
                    ),
                     Text(
                      'Prix final',
                      style:  TextStyle(
                        color: prixfinalColor,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ))




              ],
    ),
          ),
        );
  }
}