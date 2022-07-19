import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/screens/landing_all_empty_screen.dart';
import 'package:keybrad/widgets/items_widget/categories_grid.dart';
import 'package:keybrad/widgets/items_widget/items_grid_final.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/categories_screen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  bool empty=false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppTheme.greyBackgroundColor,

          bottom: PreferredSize(
            preferredSize:
                Size(MediaQuery.of(context).size.width, kToolbarHeight),
            child:  const TabBar(

              indicatorColor:AppTheme.textOrange ,
              labelColor: AppTheme.blackTitleColor,
              unselectedLabelColor: AppTheme.greyTextColor,
              labelPadding: EdgeInsets.all(2),
              labelStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,),
              tabs: [
                Tab(

                  text: 'Catégories',

                ),
                Tab(
                  text: 'Tous les articles',
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          color: AppTheme.greyBackgroundColor,
          child:  TabBarView(

            children: [
             // const AnimatedCategoriesGrid(),

              const CategoriesGrid(),
              empty?const LandingAllEmptyScreen(): ItemsGridFinal(),


              //CategoryItemWidget(),
              //Icon(Icons.directions_transit, size: 350),
              // ItemsGrid(),

            ],
          ),
        ),
      ),
    );
  }
}
