import 'package:flutter/material.dart';

import '../../Utils/app_theme.dart';


class CheckboxRow extends StatefulWidget {
  const CheckboxRow({Key? key}) : super(key: key);

  @override
  State<CheckboxRow> createState() => _CheckboxRowState();
}

class _CheckboxRowState extends State<CheckboxRow> {
  bool? _deliverychecked = false;
  bool? _pickupchecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topCenter,
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
                leading: Checkbox(
                    value: _pickupchecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _pickupchecked = value;
                      });}
                )
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
                leading: Checkbox(
                    value: _deliverychecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _deliverychecked = value;
                      });}
                )
            ),
          ),
        ],),);

  }
}
