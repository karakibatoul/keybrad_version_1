
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../models/category.dart';
import '../providers/items.dart';
import '../widgets/back_widget.dart';
import '../widgets/filter_trier_round_widget.dart';
import '../widgets/items_widget/items_grid.dart';

class LandingCategories extends StatefulWidget {
  const LandingCategories({Key? key}) : super(key: key);
  static const routeName = '/landing_categories_screen';



  @override
  State<LandingCategories> createState() => _LandingCategoriesState();
}

class _LandingCategoriesState extends State<LandingCategories> {

  String title = '';
  String image = 'assets/images/categories/Pour la maison.png';
  String subTitle = '';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero,() {
      final args = ModalRoute.of(context)!.settings.arguments as Category ;
     setState(() {
       title = args.category;
     });

    });
  }

  @override
  Widget build(BuildContext context) {

    final itemsData = Provider.of<Items>(context);
    final items = itemsData.items;

/*    Widget trailingListTileWidget =
    Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Column(children: [InkWell(
          onTap: () {
          },
          child: Image.asset(
            'assets/icons/sort.png',
            width: 35,
            height: 35,
            fit: BoxFit.contain,

          ),

        ),
        const  Text('Trier',style: TextStyle(color: AppTheme.itemTitleColor))
        ],),
        const  SizedBox(width: 25),

        Column(children: [InkWell(
          onTap: () {
          },
          child: Image.asset(
            'assets/icons/filter.png',
            width: 35,
            height: 35,
            fit: BoxFit.contain,

          ),

        ),
          const  Text('Filter',style: TextStyle(color: AppTheme.itemTitleColor),)
        ],),
      ],);

    Widget backWidget = Container(
      // margin: const EdgeInsets.only(top: 24, right: 24, bottom: 10, left: 24),
      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      //  margin: const EdgeInsets.all(50),
      width: 40,
      height: 40,
      decoration:
      const BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.backButtonBackgroundColor),
      child: InkWell(
        onTap: () {
          // Navigator.pop(context);
          //   Navigator.pushNamed(context, CategoriesScreen.routeName);
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: const Color.fromARGB(255, 247, 201, 133),
            child: Image.asset('assets/icons/back.png',
                width: IconTheme.of(context).size,
                height: IconTheme.of(context).size),
          ),
        ),
      ),
    );

 */



    Widget widget =  SizedBox(
      width: MediaQuery.of(context).size.width ,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight: Radius.circular(20)),
        ),
        color: AppTheme.greyBackgroundColor,
        elevation: 5,

        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const BackWidget(height: 40,width: 40,),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 20.w,
                          maxHeight: 15.w,
                        ),
                        child: Image.asset(
                            image,
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                            child: Text(
                              '${items.length.toString()} annonces',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  const  FilterTrierRoundWidget(),
                  ],
                ),
              ),
            ],)


      ),
    );







    return Scaffold(body:  Stack(children: [ Positioned(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children:  [
            widget,
           const SizedBox(
              height: 10,
            ),
            const ItemsGrid(param: 2,),
          ],

        ),
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
              child: Image.asset(
                'assets/icons/up.png',

                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),

    ],),);




  }
}
