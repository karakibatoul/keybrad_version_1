import 'package:flutter/material.dart';
import '/Utils/app_theme.dart';

class LoginTextFieldWidget extends StatelessWidget {
  var textController =  TextEditingController();

  LoginTextFieldWidget(this.textController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onSubmitted: (_) {

      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppTheme.greyTextFieldColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: AppTheme.greyTextFieldColor,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
