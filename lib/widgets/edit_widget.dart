import 'package:flutter/material.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';

class EditWidget extends StatelessWidget {
  final Function()? onTap;
  const EditWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/6,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration:
            const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.backButtonBackgroundColor),
            child: InkWell(
              onTap: onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: const Color.fromARGB(255, 247, 201, 133),
                  child: Bouncing(
                    onPress: (){},
                    child: Image.asset('assets/icons/edit btn.png',
                        width: IconTheme.of(context).size,
                        height: IconTheme.of(context).size),
                  ),
                ),
              ),
            ),
          ),
          Text('Modifier',
            textAlign: TextAlign.center,
            style: TextStyle(

                overflow: TextOverflow.visible,
                color: AppTheme.itemPriceColor,

                fontSize: 13.sp),)
        ],
      ),
    );
  }
}
