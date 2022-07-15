import 'package:flutter/material.dart';
import 'package:keybrad/widgets/my_items_widget/my_item_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/app_theme.dart';
import '../../screens/item_details.dart';
import '../../screens/my_items_empty_3.dart';
import '../bouncing_widget.dart';
import '../filter_trier_round_widget.dart';


class MyItemsVente extends StatelessWidget {
   MyItemsVente({Key? key}) : super(key: key);
  bool isMyItemEmpty = false;

  @override
  Widget build(BuildContext context) {

    Widget widget =
    Container(
      margin:  EdgeInsets.only(right: 3.w,left: 1.w,top: 0.5.h,bottom: 2.h),
      //margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 00),
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 1.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                child:
                Column(children: [Bouncing(
                  onPress:(){},
                  child: Image.asset(
                    'assets/icons/add copy.png',
                    width: 35,
                    height: 35,
                    fit: BoxFit.contain,

                  ),
                ),
                  const  Text('Ajouter',style: TextStyle(color: AppTheme.itemTitleColor))
                ],),

            ),
            const Spacer(),
            const FilterTrierRoundWidget(),
          ],
        ),
      ),
    );

    return Scaffold(
      body:
      SingleChildScrollView(
        child: isMyItemEmpty? SizedBox(
            height: MediaQuery.of(context).size.height-4*kToolbarHeight,
            child: const MyItemsEmpty3(showAppbar: false,)):
        SizedBox(
          height: MediaQuery.of(context).size.height-4*kToolbarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget,
              Expanded(
                child: Stack(
                  children: [

                    Positioned(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child:
                  GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 2,
                    childAspectRatio: 2/4.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    padding: const EdgeInsets.only(right: 20,left: 20),
                    shrinkWrap: true,




                    // Generate 100 widgets that display their index in the List.
                    children:
                    List.generate(10, (index) {
                      return Center(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ItemDetails(indexPage: 1)
                                )
                            );
                          },
                            child: const MyItemGrid())
                      );
                    }),

                  ),
                  /*ListView(
                    children:  [
                      widget,
                      const SizedBox(
                        height: 10,
                      ),
                   //   const ItemsGrid(),
                    ],

                  ),
                  */
                ),
    ),
                Positioned(
                  height: 3.5.h,
                  bottom:  MediaQuery.of(context).size.height / 4-MediaQuery.of(context).size.height / 11,
                  right: 10,
                  width: 1.5.h+3.w,
                  //left:MediaQuery.of(context).size.width-100,
                  child: InkWell(
                    onTap: () {
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft:Radius.circular(80) ,bottomLeft: Radius.circular(80)),
                      child: Container(
                        height: 10,
                        width: 10,
                        color: AppTheme.backgroundOrange,
                        child: Bouncing(
                          onPress: (){},
                          child: Image.asset(
                            'assets/icons/up.png',

                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

    ],),
              ),
            ],
          ),
        ),
      ),);




  }
}
