import 'package:flutter/material.dart';

class HalfBackgroundWidget extends StatelessWidget {
  const HalfBackgroundWidget({Key? key}) : super(key: key);
  static const backgroundImage = 'assets/images/background.png';
  static const logoImage = 'assets/images/logo.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height) / 4,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage(backgroundImage)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
            child: Image(
          image: AssetImage(logoImage),
          alignment: Alignment.center,
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}
