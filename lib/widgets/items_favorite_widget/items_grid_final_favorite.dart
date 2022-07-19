

import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/widgets/items_favorite_widget/items_grid_favorites.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../bouncing_widget.dart';
import '../items_widget/filter_widget.dart';
import '../items_widget/trier_widget.dart';


class ItemsGridFinalFavorite extends StatelessWidget {
  const ItemsGridFinalFavorite({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Widget filterButton = Row(
      children: [
        SafeArea(
          child: Container(
            width: (MediaQuery.of(context).size.width - 80-1.w) / 2,
            height: 4.5.h,
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            //margin: const EdgeInsets.all(20),
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (ctx, a1, a2) {
                        return Container();
                      },
                      transitionBuilder: (ctx, a1, a2, child) {
                        var curve = Curves.easeInOut.transform(a1.value);
                        return Transform.scale(
                          scale: curve,
                          child: const FilterWidget(),
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                    );
                  },
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child:  Row(mainAxisSize: MainAxisSize.min, children: [
                      Image.asset(
                        'assets/icons/filterInBtn.png',
                        fit: BoxFit.fill,
                        width: 20,
                        height:20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Filter',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppTheme.trierColor, fontSize: 15),
                      )
                    ]),
                  ),

                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget trierButton = Row(
      children: [
        SafeArea(
          child: Container(
            width: (MediaQuery.of(context).size.width - 80-1.w) / 2,
            height: 4.5.h,



            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            //margin: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (ctx, a1, a2) {
                        return Container();
                      },
                      transitionBuilder: (ctx, a1, a2, child) {
                        var curve = Curves.easeInOut.transform(a1.value);
                        return Transform.scale(
                          scale: curve,
                          child:const  TrierWidget(),
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                    );
                  },
                  splashColor: Colors.black26,
                  child: IntrinsicHeight(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Image.asset(
                        'assets/icons/sortInBtn.png',
                        fit: BoxFit.fill,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,

                      ),
                      const SizedBox(
                        height: 20,
                        child: Text(
                          'Trier',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppTheme.trierColor, fontSize: 15),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );

    Widget buttonsRow =
    Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 0.5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded( child: trierButton),

          Expanded( child: (filterButton))
        ],
      ) ,);
    return

      Stack(children: [ Positioned(
        /* top: 20,
      bottom: 50,
      right: 10,
      left: 10,

      */

        child: SizedBox(
          height: MediaQuery.of(context).size.height-2*kToolbarHeight-6.h,
          child: ListView(

            children: [
              buttonsRow,
              const ItemsGridFavorites(),
            ],

          ),
        ),
      ),
        Positioned(
          height: 3.5.h,
          bottom:  MediaQuery.of(context).size.height / 4-MediaQuery.of(context).size.height / 11,
          right: 10,
          width: 1.5.h+3.w,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft:Radius.circular(80) ,bottomLeft: Radius.circular(80)),
            child: Container(
              height: 10,
              width: 10,
              color: AppTheme.backgroundOrange,
              child: Bouncing(
                onPress:(){},
                child: Image.asset(
                  'assets/icons/up.png',

                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),

      ],);

  }
}
