
import 'package:flutter/material.dart';
import 'package:keybrad/widgets/items_favorite_widget/items_grid_final_favorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const routeName = '/favorite_screen';

  @override
  Widget build(BuildContext context) {
    return const  ItemsGridFinalFavorite();
  }
}
