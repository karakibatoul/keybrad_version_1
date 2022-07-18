import 'package:flutter/material.dart';
import 'package:keybrad/providers/category_provider.dart';
import 'package:keybrad/widgets/items_widget/category_item_widget.dart';
import 'package:provider/provider.dart';


class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {


  // The key of the list
  //final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    final categories = provider.categories;
    return

      ListView(
        children: categories.map((country) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height / 4,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child:
            CategoryItemWidget(category: country),

          );
        }).toList(),
      );
  }

/*ListView.builder(
            shrinkWrap: true,

            itemCount: categories.length,
              itemBuilder: (context,index){
            return SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              //height: 500,
              width:  MediaQuery.of(context).size.width,
              child: ChangeNotifierProvider.value(
                value: categories[index],
                child: const CategoryItemWidget(),
              ),
            );
          }),
          */

/*SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.spaceEvenly,
          //  spacing: 100,



          children: List.generate(categories.length, (index) {
            final cellWidth = MediaQuery.of(context).size.width;
            final cellHeight = MediaQuery.of(context).size.height / 4;
            return SizedBox(
              height: cellHeight,
              width: cellWidth,
              child: ChangeNotifierProvider.value(
                value: categories[index],
                child: const CategoryItemWidget(),
              ),
            );
          }),
        ),
      ),
    );
    */

///////////////////////////////////////////
/*GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: categrories.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: categrories[i],
        child: CategoryItemWidget(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        // childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );*/
}
