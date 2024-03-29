import 'package:flutter/material.dart';
import 'package:keybrad/widgets/recently_viewed_widgets/recently_viewed_item.dart';
import 'package:provider/provider.dart';
import '../../providers/items.dart';

class RecentlyViewedGrid extends StatelessWidget {
  const RecentlyViewedGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context);
    final items = itemsData.items;



    return Stack(
      children: [
        SingleChildScrollView(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              final cellWidth = MediaQuery.of(context).size.width;
              final cellHeight = MediaQuery.of(context).size.height /4;

              return Container(
                padding: const EdgeInsets.only(bottom:30),
                height: cellHeight,
                width: cellWidth,
                child: ChangeNotifierProvider.value(
                  value: items[index],
                  child:  const RecentlyViewedItem(),
                ),
              );
            }),
          ),
        ),
      ],

    );

  }
}