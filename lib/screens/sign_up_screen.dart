import 'package:flutter/material.dart';
import 'package:keybrad/widgets/wrap_widget.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/sign_up_screen';

  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      backgroundColor: Colors.yellow,
      body: WrapWidget(),
    );
    */

       const Scaffold(
      body: WrapWidget(),
        /* Stack(
          overflow: Overflow.visible,
          children: [
            HalfBackgroundWidget(),
            Positioned(child: SignUpModel()),
          ],
        ),*/

    );

    /* Scaffold(
      backgroundColor: AppTheme.greyBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HalfBackgroundWidget(),
            SignUpModel(),
          ],
        ),
      ),
    );*/
  }
}
