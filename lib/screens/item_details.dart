
import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keybrad/screens/item_edit_screen.dart';
import 'package:keybrad/screens/user_details_screen.dart';
import 'package:keybrad/widgets/back_widget.dart';
import 'package:keybrad/widgets/delete_widget.dart';
import 'package:keybrad/widgets/edit_widget.dart';
import 'package:keybrad/widgets/full_screen_slider_widget.dart';
import 'package:keybrad/widgets/like_widget.dart';
import 'package:keybrad/widgets/share_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../widgets/bouncing_widget.dart';
import '../widgets/radio_group_widget_with_images.dart';
import '../widgets/signature_widget.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];


class ItemDetails extends StatefulWidget {
  final int indexPage ;
  const ItemDetails({Key? key, required this.indexPage}) : super(key: key);
  static const routeName = '/item_details_screen';

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {

    Widget priceRow = Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child:
      Row(children: [
        Text('300,000',style: TextStyle(
            color: AppTheme.blackTitleColor,
          fontSize: 18.5.sp,
          fontWeight: FontWeight.bold

        ),),
        SizedBox(width: 2.w,),
        Text('FCFA/Negogiable',style:
        TextStyle(
          color: AppTheme.greyTextColor,
          fontSize: 15.sp
        ),)

    ],),);


    Widget topButtonWidget = SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        Container(
           // width: MediaQuery.of(context).size.width/5,
          margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: BackWidget(height: 40, width: 40)),
                const Spacer(),
                 Container(
                   margin: EdgeInsets.only(right: 10),
            child:
            Row(children:
            [widget.indexPage==1?DeleteWidget(onTap: (){},)
              :SignatureWidget(onTap: (){},),
              widget.indexPage==1?EditWidget(onTap: (){
                Navigator.pushNamed(context, ItemEditScreen.routeName);
              },):ShareWidget(onTap: (){},),
              widget.indexPage==1?ShareWidget(onTap: (){},):LikeWidget(onTap: (){},),
            ],),),




    ],),);

    Widget titleWidget = Container(
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Text('Chambre â coucher compléte',style: TextStyle(color:
          AppTheme.blackTitleColor,fontSize: 18.sp,fontWeight: FontWeight.bold),),
        ),
         Text('11 y a 1jour  -  250 vues',style: TextStyle(
          color: AppTheme.greyTextColor,
          fontSize: 16.sp

        ),)

      ],
    ),);

    Widget descriptionWidget =
    Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text('Description',style: TextStyle(
              fontSize: 16.sp,
              color: AppTheme.greyTextColor
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8),
            child: Text('Chambre â coucher compléte :lit 1 place,\n'
                'banquette qui se transforme en coffre, et bac de rangement.',
              style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w400),
            ),
          )

        ],),);

    Widget profileWidget =
    Bouncing(
      onPress: (){
        Timer(const Duration(milliseconds: 200), () {
          Navigator.pushNamed(context, UserDetailsScreen.routeName);
        });
        },
      child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:20.0),
            child: Text('Vendu par:',style:
            TextStyle(
                color: AppTheme.greyTextColor,
                fontSize: 16.sp

            ),),
          ),
          Row(children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                backgroundImage: AssetImage('assets/images/personalImage.jpg',),


              ),

            ),
            SizedBox(width: 5.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nassim Zahi Samir',
                  style: TextStyle(fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.itemPriceColor),),
                Text('Membre depuis le 12-03-2020',
                  style: TextStyle(fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.greyTextColor),),

              ],
            ),
            const Spacer(),
            Container(
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
                    child: Image.asset('assets/icons/view btn_grey.png',
                        width: IconTheme.of(context).size,
                        height: IconTheme.of(context).size),
                  ),
                ),
              ),
            ),


          ],)

        ],
      ),),
    );

    Widget locationWidget =
    Bouncing(child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Localization:',style:
            TextStyle(
                color: AppTheme.greyTextColor,
                fontSize: 16.sp

            ),),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 3.w,
                      padding:const EdgeInsets.only(top:5),
                      child: Image.asset('assets/icons/locationIcon.png',height: 15,width: 15,),),
                  ),
                  SizedBox(width: 2.w,),
                  Flexible(
                    flex: 15,
                    child:
                    SizedBox(
                      width: 90.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bingerville',style: TextStyle(
                              color: AppTheme.blackTitleColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.sp
                          ),),
                          Text('Route dAlepe / au terminus des taxis woro\nworo .Immeuble  Duodensson',
                            style: TextStyle(
                                fontSize: 15.5.sp,
                                color: AppTheme.greyTextColor
                            ),
                          )
                        ],
                      ),
                    ), ),

                  //SizedBox(width: 2.h,),

                  Flexible(
                    flex: 3,
                    child: Container(
                      width: 20.w,

                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/map icon.png',width: 50,height: 60,),
                          const Text('Itinéraire',style: TextStyle(color: AppTheme.greyTextColor),)
                        ],
                      )

                      ,),
                  )

                ],),)


          ],)
    ), onPress: (){})
    ;

    Widget categoryWidget = Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:20.0),
            child: Text('Categorie:',style:
            TextStyle(
                color: AppTheme.greyTextColor,
                fontSize: 16.sp

            ),),
          ),
          Row(children: [
            Image.asset('assets/images/categories/Pour la maison.png',width: 70,),
            SizedBox(width: 5.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pour la maison',
                  style: TextStyle(fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.itemPriceColor),),
                Text('2100 annouces',
                  style: TextStyle(fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.greyTextColor),),

              ],
            ),
            const Spacer(),
            Container(
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
                    child: Image.asset('assets/icons/view btn_grey.png',
                        width: IconTheme.of(context).size,
                        height: IconTheme.of(context).size),
                  ),
                ),
              ),
            ),


          ],)

        ],
      ),);



    return Scaffold(

      body: Builder(
        builder: (context) {
          if(widget.indexPage ==0) {
            return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 3.h),
            height: MediaQuery.of(context).size.height-kToolbarHeight*1.5,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topButtonWidget,
                  titleWidget,
                  const CarouselWithIndicatorDemo(),
                  priceRow,
                  descriptionWidget,
                  const Divider(),
                  profileWidget,
                  const Divider(),
                  locationWidget,
                  const Divider(),
                  const RadioGroupWidgetWithImages(),
                  const Divider(),
                  categoryWidget,


                ],
              ),
            ),
          );
          }
          else if(widget.indexPage ==1)
            {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 3.h),
                height: MediaQuery.of(context).size.height-kToolbarHeight*1.7,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topButtonWidget,
                      titleWidget,
                      // imageSlider,
                      const  CarouselWithIndicatorDemo(),
                      priceRow,
                      descriptionWidget,
                      const Divider(),
                      locationWidget,
                      const Divider(),
                      const RadioGroupWidgetWithImages(),
                      const  Divider(),
                      categoryWidget,


                    ],
                  ),
                ),
              );
            }
          else {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 3.h),
              height: MediaQuery.of(context).size.height-kToolbarHeight*1.7,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topButtonWidget,
                    titleWidget,
                    // imageSlider,
                    const CarouselWithIndicatorDemo(),
                    priceRow,
                    descriptionWidget,
                    const Divider(),
                    profileWidget,
                    const Divider(),
                    locationWidget,
                    const Divider(),
                    const RadioGroupWidgetWithImages(),
                    const Divider(),


                  ],
                ),
              ),
            );
          }

        }
      ),
    );
  }
}


final List<Widget> imageSliders = imgList
    .map((item) => Container(
      margin:const  EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius:const  BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Material(
                child: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  FullScreenSlider(imgList: imgList)),
                        );

                        },
                        child: Image.network(item, fit: BoxFit.cover, width: 1000.0));
                  }
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. ${imgList.indexOf(item)} image',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    ))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
     height: 250,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
          Expanded(
            child: Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: (){

                    },
                  child: CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                );
              }
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 2.w,
                        height: 2.w,
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.black
                                : Colors.orange)
                                .withOpacity(_current == entry.key
                                ? 0.9 : 0.3)
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const Spacer(),
                Text('ID 22531',style: TextStyle(
                    color: AppTheme.greyTextColor,
                  fontSize: 15.sp
                ),)
              ],
            ),
          ),
        ]
      ),
    );
  }
}

