import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:keybrad/screens/categories_screen.dart';
import 'package:keybrad/screens/my_items_empty_1.dart';
import 'package:keybrad/screens/search_screen.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:keybrad/widgets/main_drawer.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'favorites_screen.dart';
import 'my_items_empty_2.dart';
import 'my_items_empty_3.dart';
import 'dart:math';


class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const  routeName = '/tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();

}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {

  int _selectedPageIndex = 0;
  int _selectedMyItemPageIndex=0;

  final List<Widget> _indexes = [const MyItemsEmpty1(),const MyItemsEmpty2(),const MyItemsEmpty3(showAppbar: true,)];



  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectMyItemPage(){
    int randomIndex = Random().nextInt(_indexes.length);
    setState(() {
      _selectedMyItemPageIndex=randomIndex;
    });

  }
  int get selectedMyItemPageIndex => _selectedMyItemPageIndex;
  
  Widget function(int r){
    if(r==0) {
      return const  MyItemsEmpty1();
    } else if(r==1) {
      return const MyItemsEmpty2();
    } else {
      return const MyItemsEmpty3(showAppbar: true,);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectMyItemPage();

  }


  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SearchScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.slowMiddle;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
        elevation: 0,
        toolbarHeight: kToolbarHeight,
        backgroundColor: AppTheme.greyBackgroundColor,
        title: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all( 10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: const Image(
            image: AssetImage('assets/images/topLogo.png'),
            fit: BoxFit.fill,
            height: kToolbarHeight-20,
            width:130,
          ),
        ),
        actions:
            _selectedPageIndex!=2?
        <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Bouncing(
              onPress: (){
                Timer(const Duration(milliseconds: 100), () {
                Navigator.of(context).push(_createRoute());
              });},
              child: Image.asset(
                'assets/icons/search.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ]:null,
        leading: Builder(builder: (BuildContext context) {
          return InkWell(
            onTap: () {

            },
            child: Bouncing(
              onPress: (){  Scaffold.of(context).openDrawer();},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/icons/menu.png',
                    width: IconTheme.of(context).size,
                    height: IconTheme.of(context).size),
              ),
            ),
          );
        }));

    /*BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _selectPage,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      selectedItemColor: Theme.of(context).accentColor,
      currentIndex: _selectedPageIndex,
      items: [
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {},

              child: Image.asset('assets/icons/home.png',
                  width: IconTheme.of(context).size,
                  height: IconTheme.of(context).size),

          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              print('selected:$_selectedPageIndex');
            },
           //wrap  it with cliprect to add a border radius
              child: Image.asset('assets/icons/my items.png',
                  width: IconTheme.of(context).size,
                  height: IconTheme.of(context).size),
            ),

          label: '',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
                 // print('selected:$_selectedPageIndex');
            },

              child: Image.asset('assets/icons/fav.png',
                  width: IconTheme.of(context).size,
                  height: IconTheme.of(context).size),

          ),
          label: '',
        ),
      ],
    );

     */

    CurvedNavigationBar curvedNavigationBar = CurvedNavigationBar(
     // type: BottomNavigationBarType.fixed,
      onTap: _selectPage,
     backgroundColor: AppTheme.textOrange,

     // unselectedItemColor: Colors.black,
     // showUnselectedLabels: true,
     // selectedItemColor: Theme.of(context).accentColor,

      index: _selectedPageIndex,


      items: [

         InkWell(
            onTap: () {},
//if you want the circle to be complete only less the height by 5.5
            child: Image.asset('assets/icons/home.png',
                width: (IconTheme.of(context).size),
                height: (IconTheme.of(context).size)
            ),

          ),

        InkWell(
            onTap: () {

            },
            //wrap  it with cliprect to add a border radius
            child: Image.asset('assets/icons/my items.png',
                width: IconTheme.of(context).size,
                height: IconTheme.of(context).size),
          ),

         InkWell(
            onTap: () {
              // print('selected:$_selectedPageIndex');
            },

            child: Image.asset('assets/icons/fav.png',
                width: IconTheme.of(context).size,
                height: IconTheme.of(context).size),

          ),

      ],
    );

    return DefaultTabController(

      length: 2,
      initialIndex: 0,
      child: Scaffold(

        extendBody: true,
        appBar: appbar,
        drawer: const MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        //  body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: Builder(
          builder: (context) {
            return  ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                child: curvedNavigationBar);
          }
        ),
      ),
    );
  }


  List<Map<String, Widget>> get _pages => [
    {
      'page': const CategoriesScreen(),
    },
    {
      'page':const  FavoriteScreen(),
    },
    {
      'page':
      Builder(
          builder: (BuildContext context) {
            if(selectedMyItemPageIndex==0) {
              return const MyItemsEmpty1();
            } else if(selectedMyItemPageIndex==1) {
              return const MyItemsEmpty2();
            } else {
              return const MyItemsEmpty3(showAppbar: true,);
            }
          }),





     // MyItemsEmpty3(showAppbar: true,)
      
      //selectedMyItemPageIndex==0?MyItemsEmpty1():MyItemsEmpty2(),
      //MyItemsScreen(),
    },
  ];
}
