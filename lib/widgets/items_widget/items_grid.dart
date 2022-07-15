import 'package:flutter/material.dart';
import 'package:keybrad/widgets/login_widgets/login_textfield_widget.dart';
import 'package:provider/provider.dart';
import 'package:keybrad/providers/items.dart';
import 'package:keybrad/widgets/items_widget/items_widget.dart';

class ItemsGrid extends StatelessWidget {
  final int param;
  const ItemsGrid({Key? key, required this.param}) : super(key: key);


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


//here i can put the height over 3 and delete the padding form the conatiner but
              //the space will be increased
              children: List.generate(items.length, (index) {
                final cellWidth = MediaQuery.of(context).size.width;
                final cellHeight = MediaQuery.of(context).size.height /4;

                return Container(
                  padding: const EdgeInsets.only(bottom:30),
                  height: cellHeight,
                  width: cellWidth,
                  child: ChangeNotifierProvider.value(
                    value: items[index],
                    child: ItemWidget(index: param,),
                  ),
                );
              }),
            ),
          ),
        ],

      );
 
  }
}
