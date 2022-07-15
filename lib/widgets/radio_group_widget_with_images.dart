import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';

class RadioGroupWidgetWithImages extends StatefulWidget {
  const RadioGroupWidgetWithImages({Key? key}) : super(key: key);

  @override
  State<RadioGroupWidgetWithImages> createState() => _RadioGroupWidgetWithImagesState();
}

class _RadioGroupWidgetWithImagesState extends State<RadioGroupWidgetWithImages> {
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

              Expanded(
                child: ListTile(
                  minVerticalPadding: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  horizontalTitleGap: 0,
                  dense: true,
                  title: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset('assets/icons/pickupIcon.png',
                              width: IconTheme.of(context).size,
                              height: IconTheme.of(context).size),
                        ),
                      ),
                      const Flexible(
                        flex: 2,
                        child: Text(
                          "À récupérer",
                          style: TextStyle(color: AppTheme.checkboxLabelColor,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  leading:    Radio(

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
                ),
              ),
              Expanded(
                child: ListTile(
                  minVerticalPadding: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  horizontalTitleGap: 0,
                  dense: true,
                  title: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset('assets/icons/deliveryIcon.png',
                              width: IconTheme.of(context).size,
                              height: IconTheme.of(context).size),
                        ),
                      ),
                      const Flexible(
                        flex: 2,
                        child: Text(
                          "À Livrer",
                          style: TextStyle(color: AppTheme.checkboxLabelColor,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  leading:   Radio(
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
                ),
              ),



            ],
          ),
        ),
      );
  }
}