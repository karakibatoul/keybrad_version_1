
import 'package:flutter/material.dart';
class SingleSelectionListview extends StatelessWidget {
  final List items;
  final bool isMultiSelection;
  final void Function()? onTap;
  final String attributeToShow;
  const SingleSelectionListview({Key? key, required this.items, required this.isMultiSelection, this.onTap, required this.attributeToShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  items.isNotEmpty
        ?

   Container(
          padding:const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: onTap,
                child: Card(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: ListTile(

                    title: Text(items[index][attributeToShow]),

                  ),
                ),
              );
            },
          ),

    ):Container();
  }
}
