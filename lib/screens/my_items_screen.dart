import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/screens/landing_all_empty_screen.dart';
import 'package:keybrad/widgets/my_items_widget/my_items_vendus.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/my_items_widget/my_items_vente.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({Key? key}) : super(key: key);
  static const routeName = '/my_items_screen';

  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

class _MyItemsScreenState extends State<MyItemsScreen> {

  bool empty=false;
  Color selectedTitleColor = AppTheme.blackTitleColor;
  Color selectedSubtitleColor = AppTheme.greyTextColor;
  Color unselectedTitleColor = AppTheme.unselectedMyItemTitleColor;
  Color unselectedSubTitleColor = AppTheme.unselectedMyItemSubTitleColor;
  Color rightTitleColor = AppTheme.blackTitleColor;
  Color rightSubTitleColor = AppTheme.greyTextColor;
  Color leftTitleColor =AppTheme.unselectedMyItemTitleColor;
  Color leftSubtitleColor = AppTheme.unselectedMyItemSubTitleColor;
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
            Size(MediaQuery.of(context).size.width, kToolbarHeight*2.5),

            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  //indicatorColor: Colors.transparent,
                  labelColor: AppTheme.blackTitleColor,
                  unselectedLabelColor: AppTheme.greyTextColor,
                  labelPadding: const EdgeInsets.all(2),



                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 21.sp,
                      color: AppTheme.blackTitleColor
                  ),
                  onTap: (int index){
                    if(index ==0)
                      {
                        setState(() {
                          rightTitleColor = selectedTitleColor;
                          rightSubTitleColor=selectedSubtitleColor;
                          leftTitleColor=unselectedTitleColor;
                          leftSubtitleColor=unselectedSubTitleColor;
                        });
                      }


                    else {
                      setState(() {
                      rightTitleColor = unselectedTitleColor;
                      rightSubTitleColor = unselectedSubTitleColor;
                      leftTitleColor = selectedTitleColor;
                      leftSubtitleColor = selectedSubtitleColor;

                    });
                    }
                  },
                  tabs: [
                     Builder(
                       builder: (context) {
                         return SizedBox(
                                height: kToolbarHeight*2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Mes articles',
                                      style:
                                      TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 21.sp,
                                        color:rightTitleColor
                                      )


                                    ),
                                    Text('en vente',
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,fontSize: 18.sp,
                                      color: rightSubTitleColor
                                    ),)
                                  ],
                                ),
                              );
                       }
                     ),
                    SizedBox(
                      height: kToolbarHeight*2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mes articles',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 21.sp,
                                color: leftTitleColor
                            ),),
                          Text('vendus',
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,fontSize: 18.sp,
                                color: leftSubtitleColor
                            ),)
                        ],
                      ),
                    ),

                  ],
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

              MyItemsVente(),
              empty?const LandingAllEmptyScreen(): const MyItemsVendus(),


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
