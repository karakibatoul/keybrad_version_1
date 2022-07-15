import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/providers/categories.dart';
import 'package:keybrad/screens/landing_categories.dart';
import 'package:keybrad/screens/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../models/category.dart';
import '../bouncing_widget.dart';
import '/providers/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryItemWidget extends StatefulWidget {
  //const CategoryItemWidget({Key? key}) : super(key: key);
  final Category category;
  CategoryItemWidget({

    required this.category,

  }) ;




  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> with TickerProviderStateMixin {

  double _imageWidth = 50;
  double _imageHeight = 50;
  double _textHeight  = 5.h;
  double _categoryFontSize = 10.sp;
  double _subCategoryFontSize  = 6.sp;
  double _mainContainerHeight = 200;




  @override
  void initState() {
    super.initState();
    // Rebuild the screen after 3s which will process the animation from green to blue
    Future.delayed(const Duration(milliseconds: 300)).then((value) =>

        setState(() {
      _imageHeight = 150;
      _imageWidth = 150;
      _textHeight = 7.h;
      _categoryFontSize = 17.sp;
      _subCategoryFontSize = 13.sp;


    }));
  }


  @override
  Widget build(BuildContext context) {
   // final category = Provider.of<Category>(context);
    final category = widget.category;
   // double _mainContainerHeight = MediaQuery.of(context).size.height / 4;


    var phoneNumber =
        Bouncing(child: AnimatedContainer(
          // curve: Curves.easeInOutBack,
          duration:const  Duration(milliseconds: 250),
          height: _mainContainerHeight,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.all(5),

          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Expanded(
                child: AnimatedContainer(
                  duration:const  Duration(milliseconds:100 ),
                  // width: _imageWidth,
                  height:_textHeight ,
                  curve: Curves.bounceOut,
                  padding: const EdgeInsets.symmetric( horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*AnimatedTextKit(
                animatedTexts: [
                  ScaleAnimatedText(
                    category.category,
                    textStyle: const TextStyle(color: AppTheme.categoriesTitleColor, fontSize: 20,fontWeight: FontWeight.w400),
                    //speed: const Duration(milliseconds: 100),
                    //  curve: Curves.bounceIn
                  ),
                ],

                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 10),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              AnimatedTextKit(

                animatedTexts: [
                  ScaleAnimatedText(
                    category.subcategory,
                    textStyle: const TextStyle(color: AppTheme.categoriesDescriptionColor, fontSize: 12,overflow: TextOverflow.visible,fontWeight: FontWeight.w500),
                   duration:const  Duration(milliseconds: 10),



                   // speed: const Duration(milliseconds: 100),
                   // curve: Curves.bounceIn
                  ),
                ],

                totalRepeatCount: 3,
                pause: const Duration(milliseconds: 10),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                isRepeatingAnimation: true,

              ),

               */
                      Text(
                        category.category,
                        style:  TextStyle(color: AppTheme.categoriesTitleColor, fontSize: _categoryFontSize,fontWeight: FontWeight.w400),
                      ),
                      Text(
                        category.subcategory,
                        style:  TextStyle(color: AppTheme.categoriesDescriptionColor, fontSize: _subCategoryFontSize,overflow: TextOverflow.visible,fontWeight: FontWeight.w500),
                      )

                    ],
                  ),
                )),
            Expanded(
              child: AnimatedContainer(
                curve: Curves.bounceOut,

                width: _imageWidth,
                height: _imageHeight,

                //  height: (MediaQuery.of(context).size.height) / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    ///////////////////////////////////////////////////////////////
                      fit: BoxFit.contain, image: AssetImage('assets/images/categories/Pour la maison.png')),
                ), duration: const Duration(milliseconds: 300),),
            ),
          ]),
        ), onPress: (){})

    ;
    return Scaffold(
        body: GestureDetector(
      onTap: () {

       /* setState(() {
          _mainContainerHeight = MediaQuery.of(context).size.height/6;
        });


        Future.delayed(const Duration(milliseconds: 250)).then((value) =>
            setState(() {
              _mainContainerHeight = 200;
            }));

        */

        Future.delayed(const Duration(milliseconds: 250)).then((value) =>

        Navigator.of(context).pushNamed(
          LandingCategories.routeName,
          arguments: category,
        ));





      },
      child: phoneNumber,

      /*   Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 3,

            //  height: (MediaQuery.of(context).size.height) / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/kibradLogo.png')),
            )),
        Center(child: Text('data')),
      ],
    )*/
    ));
  }
}
