import 'package:flutter/material.dart';

import '../Utils/app_theme.dart';


class GeneralAppbar extends StatelessWidget {



  final String assetImage;
  final String searchIcon;
  final String menuIcon;
  final Color backgroundColor;

  GeneralAppbar({

     this.assetImage='',
     this.searchIcon='',
     this.menuIcon='',
     this.backgroundColor=Colors.white,
});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        elevation: 0,
        toolbarHeight: kToolbarHeight,
        backgroundColor: backgroundColor,
        title: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all( 10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child:  Image(
            image: AssetImage(assetImage),
            fit: BoxFit.fill,
            height: kToolbarHeight-20,
            width:130,
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                searchIcon,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
        leading: Builder(builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(menuIcon,
                  width: IconTheme.of(context).size,
                  height: IconTheme.of(context).size),
            ),
          );
        }));
  }
}
