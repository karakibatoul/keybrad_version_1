import 'package:flutter/material.dart';
import '/Utils/app_theme.dart';

class LoginTextFieldWidget extends StatelessWidget {
  var textController = new TextEditingController();

  LoginTextFieldWidget(this.textController);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10),
      child: TextField(
        controller: textController,
        onSubmitted: (_) {
          print(textController.text);
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.greyTextFieldColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: AppTheme.greyTextFieldColor,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
