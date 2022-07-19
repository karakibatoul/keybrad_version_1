import 'package:flutter/material.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:keybrad/widgets/items_widget/filter_widget.dart';
import 'package:keybrad/widgets/items_widget/trier_widget.dart';

import '../Utils/app_theme.dart';


class FilterTrierRoundWidget extends StatelessWidget {
  const FilterTrierRoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(children: [
          Bouncing(
            onPress: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (ctx, a1, a2) {
                  return Container();
                },
                transitionBuilder: (ctx, a1, a2, child) {
                  var curve = Curves.easeInOut.transform(a1.value);
                  return Transform.scale(
                    scale: curve,
                    child:const TrierWidget(),
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              );
            },
            child: Image.asset(
            'assets/icons/sort.png',
            width: 35,
            height: 35,
            fit: BoxFit.contain,
        ),
          ),
          const  Text('Trier',style: TextStyle(color: AppTheme.itemTitleColor))
        ],),
        const SizedBox(width: 25),

        Column(children: [
          Bouncing(
          onPress: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (ctx, a1, a2) {
                return Container();
              },
              transitionBuilder: (ctx, a1, a2, child) {
                var curve = Curves.easeInOut.transform(a1.value);
                return Transform.scale(
                  scale: curve,
                  child: const FilterWidget(),
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
            );
          },
          child: Image.asset(
            'assets/icons/filter.png',
            width: 35,
            height: 35,
            fit: BoxFit.contain,

          ),
        ),
          const  Text('Filter',style: TextStyle(color: AppTheme.itemTitleColor),)
        ],),
      ],);
  }
}
