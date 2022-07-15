import 'package:flutter/material.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';

class SignatureWidget extends StatelessWidget {
  final Function()? onTap;
  const SignatureWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/6,
      margin:const  EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            // margin: const EdgeInsets.only(top: 24, right: 24, bottom: 10, left: 24),
            //  margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
            //  margin: const EdgeInsets.all(50),
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
                    child: Image.asset('assets/icons/report btn.png',
                        width: IconTheme.of(context).size,
                        height: IconTheme.of(context).size),
                  ),
                ),
              ),
            ),
          ),
          Text('Signaler',style: TextStyle(
              overflow: TextOverflow.visible,
              color: AppTheme.itemPriceColor,

              fontSize: 13.sp),)
        ],
      ),
    );
  }}
