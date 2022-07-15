import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/screens/about_us_screen.dart';
import 'package:keybrad/screens/contact_us_screen.dart';
import 'package:keybrad/screens/login_screen.dart';
import 'package:keybrad/screens/my_profile_screen.dart';
import 'package:keybrad/screens/phising_screen.dart';
import 'package:keybrad/screens/recently_viewed_items_screen.dart';
import 'package:keybrad/screens/search_results_screen.dart';
import 'package:keybrad/screens/sign_up_screen.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}



class _MainDrawerState extends State<MainDrawer> {

  double? fontSize = 16;


  Widget buildListTile(String title,  VoidCallback tapHandler) {
    return
    Padding(padding: const EdgeInsets.only(top: 10,bottom:10,left: 4,right: 4),
        child:
        Bouncing(
          onPress: (){},
          child: ListTile(
            horizontalTitleGap: 0,
          leading: const
      VerticalDivider(
           // width: 3,

    thickness: 5,
    color: AppTheme.textOrange),

    title: Text(

    title,
    maxLines: 2,
    style:  const TextStyle(
      overflow: TextOverflow.visible,
    fontSize: 16,
    fontWeight: FontWeight.bold,

    color: AppTheme.drawerSubtitleColor,
    ),
    ),
    onTap: tapHandler,
    ),
        ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(

                color: AppTheme.greyBackgroundColor
          ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                flex: 5,

                child:  DrawerHeader(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children:  [
                      const Flexible(
                        flex: 4,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,

                            radius: 50,
                            backgroundImage: AssetImage('assets/images/personalImage.jpg'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Flexible(
                        flex: 2,
                        child:Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            child: const Text(
                          'Nassim Zahi Samir',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                              color: AppTheme.drawerTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ))
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  )
              ),),


              Flexible(
                flex: 1,
                child: buildListTile('S’inscrire',  () {

                  Timer(const Duration(milliseconds: 300), () {
                    Navigator.of(context).push(
                        PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const SignUpScreen(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.elasticInOut;
                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ));
                  });

               //   Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
                }),
              ),
              Flexible(
                flex: 1,
                child: buildListTile('Se connecter',  () {

                  Timer(const Duration(milliseconds: 300), () {
                    Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.elasticInOut;
                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ));
                  });
                }),
              ),
              Flexible(
                flex: 1,
                child: buildListTile('Mon profil', () {
                  Timer(const Duration(milliseconds: 300), () {
                    Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const MyProfileScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.elasticInOut;
                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ));
                  });
                }),
              ),
              Flexible(
                flex: 1,

                fit: FlexFit.tight,
                child:Container(margin: const EdgeInsets.symmetric(vertical: 0),

                child: buildListTile('Articles récemment consultés  ',
                        () {
                          Timer(const Duration(milliseconds: 300), () {
                            Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => const RecentlyViewedItemsScreen(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    const begin = Offset(0.0, 1.0);
                                    const end = Offset.zero;
                                    const curve = Curves.elasticInOut;
                                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ));
                          });
                    }),
              )),
              Flexible(
                flex: 1,
                child: buildListTile('Termes et conditions',  () {
                  Timer(const Duration(milliseconds: 300), () {
                    Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const PhishingScreen(phisingIndex: 1),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.elasticInOut;
                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ));
                  });
                }),
              ),
              Flexible(
                flex: 1,
                child: buildListTile('A’ propos de nous', () {
                  Timer(const Duration(milliseconds: 300), () {
                    Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const AboutUsScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.elasticInOut;
                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ));
                  });
                }),
              ),
              Flexible(
                flex: 1,
                child: buildListTile('Nous contacter',  () {
                  Timer(const Duration(milliseconds: 300), () {
                    Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const ContactUsScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.elasticInOut;
                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ));
                  });
                }),
              ),
              Flexible(
                flex: 1,
                child: buildListTile('Noter l’application',  () {
                  Timer(const Duration(milliseconds: 300), () {
                    Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const SearchResultsScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.elasticInOut;
                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ));
                  });
                }),
              ),
              const Flexible(
                flex: 0,
                child: SizedBox(height:50,)
              ),
              Flexible(
                flex: 1,
                child:  Padding(

                  padding: const EdgeInsets.only(top: 10,bottom:10,left: 4,right: 4),
                  child:
                  ListTile(
                    horizontalTitleGap: 0,
                    leading: const
                    VerticalDivider(
                      // width: 3,
                        thickness: 5,
                        color: AppTheme.trierButtonBackgroundColor),

                    title: const Text(
                      'Se déconnecter',
                      maxLines: 2,
                      style:  TextStyle(
                        overflow: TextOverflow.visible,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,

                        color: AppTheme.drawerSubtitleColor,
                      ),
                    ),
                    onTap: () {
                      Timer(const Duration(milliseconds: 300), () {
                        Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                const curve = Curves.elasticInOut;
                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ));
                      });
    }),
                  ),
                )],
              ),

            ],
          ),
        );
  }
}
