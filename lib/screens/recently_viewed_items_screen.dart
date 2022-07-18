import 'package:flutter/material.dart';
import 'package:keybrad/widgets/recently_viewed_widgets/recently_viewed_grid_final.dart';

class RecentlyViewedItemsScreen extends StatelessWidget {
  const RecentlyViewedItemsScreen({Key? key}) : super(key: key);
  static const routeName = '/recently_viewed_items_screen';

  @override
  Widget build(BuildContext context) {
    return
    const Scaffold(
      body: RecentlyViewedGridFinal() ,
    )
       ;
      //const RecentlyViewedGridFinal();

  }
}
