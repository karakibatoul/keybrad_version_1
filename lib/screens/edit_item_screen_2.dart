import 'package:flutter/material.dart';
import 'package:keybrad/screens/item_edit_screen.dart';
import 'package:keybrad/widgets/address_details_widget.dart';
import 'package:keybrad/widgets/location_widget.dart';
import 'package:keybrad/widgets/profile_text_field_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../widgets/selection_listview_widgets/city_selection_listview.dart';

class EditItemScreen2 extends StatefulWidget {
  const EditItemScreen2({Key? key}) : super(key: key);

  @override
  State<EditItemScreen2> createState() => _EditItemScreen2State();
}

enum menuitem { item1, item2, item3, item4 }

class _EditItemScreen2State extends State<EditItemScreen2> {
  menuitem? _mitem = menuitem.item1;
  @override
  Widget build(BuildContext context) {
    final  telephoneController = TextEditingController();
    final locationController = TextEditingController();


    Widget radioButtonRow = Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
        ],),);

    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height-2*kToolbarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 3.h,),
            Flexible(
              flex: 1,
              child: ProfileTextFieldWidget(
                  controller: telephoneController,
                  hintText: 'Numéro de téléphone:',
                  textFieldHeight: 6.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.h,),
                  hintColor: AppTheme.filterLabelColor,
                  hintFontSize: 16.sp,
              ),
            ),
            SizedBox(height: 2.h,),
            Flexible(
              flex: 1,
              child: ProfileTextFieldWidget(
                controller: telephoneController,
                hintText: 'WhatsApp:',
                textFieldHeight: 6.h,
                margin: EdgeInsets.symmetric(horizontal: 2.h,),
                hintColor: AppTheme.filterLabelColor,
                hintFontSize: 16.sp,
              ),
            ),
            SizedBox(height: 2.h,),
            const Divider(),
            SizedBox(height: 2.h,),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.7.h),
                child: LocationWidget(
                    controller: locationController,
                    onTap:(){
                        Navigator.pushReplacementNamed(
                        context,
                        CitySelectionListview.routeName,
                        arguments: ItemEditScreen.routeName);
             },
                  suffixOnTap: () {
                    Navigator.pushReplacementNamed(
                        context,
                        CitySelectionListview.routeName,
                        arguments: ItemEditScreen.routeName);
                  },
                    fontsize: 16.sp),
              ),
            ),

            SizedBox(height: 2.h,),
             Flexible(
               flex:2,
               child: Container(
                   margin: EdgeInsets.symmetric(horizontal: 0.7.h,),
                   child: AddressDetailsWidget(
                     maxLines: 8,
                     hintText: 'Détails de l\'adresse:',
                     hintFontSize: 16.sp,)),
             ),
            SizedBox(height: 2.h,),
            Flexible(
              flex: 1,
                child: radioButtonRow)

          ],
        ),
      ),
    );
  }
}
