import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';


class FavoriteEmptyScreen extends StatelessWidget {
  const FavoriteEmptyScreen({Key? key}) : super(key: key);
  static const routeName = '/favorite_empty_screen';

  @override
  Widget build(BuildContext context) {



    Widget favoriteText =

    Container(
      alignment: Alignment.center,
      height: 15.h,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Text('Votre liste de favoris est vide!',style: TextStyle(
                fontSize: 18.5.sp,color: AppTheme.categoriesTitleColor,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 3.h,),
          Flexible(
            flex: 1,
            child: Text('Retrouvez vos articles préférés ici en cliquant sur  ',style: TextStyle(
              overflow: TextOverflow.visible,
                fontSize: 16.sp,color: AppTheme.trierColor,fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 2.h,),
          Flexible(
            flex: 1,
            child: Text('"Ajouter aux favoris"',style: TextStyle(
                fontSize: 16.sp,color: AppTheme.trierColor,fontWeight: FontWeight.w500),),
          ),
        ],) ,)
    ;




    Widget avatarImage =  Container(

      padding: EdgeInsets.symmetric(horizontal: 6.w),
      height: (MediaQuery.of(context).size.height-3*kToolbarHeight)/2,
      alignment: Alignment.bottomLeft,
      child:  Image.asset(
        'assets/images/avatar02.png',
        fit: BoxFit.fitHeight,
      ) ,
    );

    return


        SizedBox(

       // height: MediaQuery.of(context).size.height-3*kToolbarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [


               Flexible(
                 flex: 1,
                 child: Container(

                    child: favoriteText),
               ),

             Expanded(
                 flex:1,child: avatarImage),
            const SizedBox(height: kToolbarHeight,)

          ],),

    );

  }
}
