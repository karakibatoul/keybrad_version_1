
import 'package:flutter/material.dart';
import 'package:keybrad/screens/add_item_screen.dart';
import 'package:keybrad/screens/edit_item_screen.dart';

import '../Utils/app_theme.dart';
import 'edit_item_screen_2.dart';
import 'login_screen.dart';

class ItemEditScreen extends StatelessWidget {
  //const ItemEditScreen({Key? key}) : super(key: key);
  static const routeName = '/item_edit_screen';
  int pageIndex;
  ItemEditScreen({required this.pageIndex});

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      initialIndex: pageIndex,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //toolbarHeight: 0,
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all( 10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: const Text('ID 22531',style: TextStyle(color: AppTheme.blackTitleColor),)
          ),
          leading: Builder(builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20),
                // borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/icons/back btn.png',fit: BoxFit.fitWidth,
                  height: 10,
                ),
              ),
            );
          }),
          actions: <Widget>[
            InkWell(
            onTap: () {
      Navigator.pop(context);
      },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          // borderRadius: BorderRadius.circular(20.0),
          child: Column(
            children: [
              Image.asset('assets/icons/saveIcon.png',
                fit: BoxFit.fitHeight,
                height: 35,
              ),
              Text('Enregistrer',style: TextStyle(color: AppTheme.greyTextColor),)
            ],
          ),
        ),
      )
          ],
          backgroundColor: AppTheme.greyBackgroundColor,

          bottom: PreferredSize(
            preferredSize:
            Size(MediaQuery.of(context).size.width, kToolbarHeight),
            child:  const TabBar(

              //indicatorColor: Colors.transparent,

              labelColor: AppTheme.blackTitleColor,
              unselectedLabelColor: AppTheme.greyTextColor,
              labelPadding: EdgeInsets.all(2),
              labelStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,),
              tabs: [
                Tab(

                  text: 'Aperçu',

                ),
                Tab(
                  text: 'Détails du contact',
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          color: AppTheme.greyBackgroundColor,
          child: const  TabBarView(

            children: [
              EditItemScreen(),
              EditItemScreen2()
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
