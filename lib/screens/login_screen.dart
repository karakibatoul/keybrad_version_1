import 'package:flutter/material.dart';
import 'package:keybrad/widgets/login_widgets/shadow_widget_login.dart';
import 'package:keybrad/Utils/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppTheme.greyBackgroundColor, body: ShadowWidgetLogin()

        );
  }
}
