

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybrad/providers/image_files.dart';
import 'package:keybrad/screens/add_item_step_2_screen.dart';
import 'package:keybrad/screens/normal_screen.dart';
import 'package:keybrad/screens/show_picture_page.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:keybrad/widgets/radio_group_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../widgets/address_details_widget.dart';
import '../widgets/back_widget.dart';
import '../widgets/circular_stack.dart';
import '../widgets/profile_text_field_widget.dart';



class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);
  static const routeName = '/add_item_screen';

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const NormalPage(),
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
  );
}

class _AddItemScreenState extends State<AddItemScreen> {

  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    final imageFiles = Provider.of<ImageFiles>(context);
    final  telephoneController = TextEditingController();
    final prixController = TextEditingController();

     positionedOnTap(int index)  {
      if(imageFiles.images.length>=index+1) {
        if (imageFiles.images.isNotEmpty) {
          Provider.of<ImageFiles>(
              context, listen: false)
              .deleteFile(index);
        }
      }

    }

    Route _createNewRoute(int index) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>  ShowPicturePage(
          imageFile: imageFiles.images[index].imageFile ,selectedFilter: imageFiles.images[index].selectedFilter,isEdit: true,
          index:index, isGallary: null,),
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
      );
    }

    Route _createSecondAddItemRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const AddItemStep2Screen(),
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
      );
    }


    newItemOnTap(int index){
      if(imageFiles.images.length>=index+1) {

        Timer(const Duration(milliseconds: 100), () {
          Navigator.push(
            context,
            _createNewRoute(index),
          );
        });
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              ShowPicturePage(
                imageFile: imageFiles.images[index].imageFile ,selectedFilter: imageFiles.images[index].selectedFilter,isEdit: true,
                index:index,)
          ),
        );

         */
      }
    }


    Widget prixTextField = Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 0.2.h),
      height: 6.h,
      child: TextField(
        keyboardType: TextInputType.number,
        cursorColor: Colors.grey,
        style:const TextStyle(color: Colors.grey),
        onTap:(){} ,
        controller:prixController ,
        onSubmitted: (_) {
        },

        decoration: InputDecoration(
          focusColor: Colors.grey,
         hintText: 'Prix:',
          focusedBorder: OutlineInputBorder(
            borderSide:const  BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),




          suffixIcon: Container(
            width: 3.w,
            padding: const EdgeInsets.only(right: 10),

            alignment: Alignment.centerRight,
              child:const  Text('FCFA',style: TextStyle(color: AppTheme.greyTextColor),)),
          hintStyle:  TextStyle(
            color: AppTheme.filterLabelColor,
            fontSize: 17.sp,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:const  BorderSide(
              color: AppTheme.greyBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: AppTheme.greyTextFieldColor,
          border:const OutlineInputBorder(),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height-2*kToolbarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 6.h,),
              Row(
                children: [
                  Container(
                      padding:const EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width/5,
                      child: const BackWidget(height: 35, width:35 )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*1/2+50,
                    child: Column(children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text('Nouvel article',style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.blackTitleColor
                        ),),
                      ),

                    ],),
                  )
                ],
              ),
              SizedBox(height: 5.h,),
              Flexible(
                flex: 2,
                child: ProfileTextFieldWidget(
                  keyboardType: TextInputType.text,
                  controller: telephoneController,
                  hintText: 'Titre:',
                  textFieldHeight: 6.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.h,),
                  hintColor: AppTheme.filterLabelColor,
                  hintFontSize: 17.sp,
                ),
              ),
              SizedBox(height: 2.h,),
              Flexible(
                flex: 2,
                  child: prixTextField),
              SizedBox(height: 2.h,),
              const Flexible(
                  flex: 5,
                  child:RadioGroup()),
              SizedBox(height: 2.h,),
              SizedBox(height: 2.h,),
              Flexible(
                flex:4,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.7.h,),
                    child: AddressDetailsWidget(
                      maxLines: 10,
                     hintText: 'Description:',
                      hintFontSize: 17.sp,)),
              ),
              SizedBox(height: 2.h,),
              Flexible(
                flex: 2,
                child: ProfileTextFieldWidget(
                  keyboardType: TextInputType.text,
                  controller: telephoneController,
                  hintText: 'Catégorie:',
                  textFieldHeight: 6.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.h,),
                  hintColor: AppTheme.filterLabelColor,
                  hintFontSize: 17.sp,
                ),
              ),
              SizedBox(height: 2.h,),
              Flexible(
                flex: 5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10),
                          child: Text('Images:',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.filterLabelColor
                            ),)),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width/6-4.w,
                                child:
                                    Bouncing(
                                      onPress: (){
                                        if(imageFiles.images.length>4){
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) => AlertDialog(
                                              title: const Text('vous ne pouvez pas ajouter plus de six images :(',
                                                style: TextStyle(color: AppTheme.blackTitleColor),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                                  child: const Text('Cancel',style: TextStyle(color: AppTheme.trierButtonBackgroundColor),),
                                                ),
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context, 'OK',),
                                                  child: const Text('OK',style: TextStyle(color: AppTheme.trierButtonBackgroundColor),),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                        else {

                                          Timer(const Duration(milliseconds: 100), () {
                                            Navigator.of(context).push(_createRoute());
                                          });

                                        }
                                      },
                                        child: Image.asset('assets/icons/add copy 2.png'))
                                   // Image.file(file.File(images[0]))
                               ),
                            CircularStack(
                              index: 0,
                              newItemOnTap:(){
                                 newItemOnTap(0);
                                },
                              positionedOnTap: (){
                                 positionedOnTap(0);
                              },
                            ),
                            CircularStack(
                              index: 1,
                              newItemOnTap:(){
                                newItemOnTap(1);
                              },
                              positionedOnTap: (){
                                positionedOnTap(1);
                              },
                            ),
                            CircularStack(
                              index: 2,
                              newItemOnTap:(){
                                newItemOnTap(2);
                              },
                              positionedOnTap: (){
                                positionedOnTap(2);
                              },
                            ),
                            CircularStack(
                              index: 3,
                              newItemOnTap:(){
                                newItemOnTap(3);
                              },
                              positionedOnTap: (){
                                positionedOnTap(3);
                              },
                            ),
                            CircularStack(
                              index: 4,
                              newItemOnTap:(){
                                newItemOnTap(4);
                              },
                              positionedOnTap: (){
                                positionedOnTap(4);
                              },
                            ),
                        ],),
                      ),
                    ],
                  ),
              ),


              Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.8.h,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Timer(const Duration(milliseconds: 100), () {
                            Navigator.of(context).push(_createSecondAddItemRoute());
                          });
                        },
                        child: Bouncing(
                          onPress: (){},
                          child: Container(
                              width: 170,
                              height: 45,
                              decoration: const BoxDecoration(
                                  color: AppTheme.trierButtonBackgroundColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(25.0))),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [

                                  Container(
                                    alignment: Alignment.center,
                                    //padding: EdgeInsets.only(right: 10),


                                    child: Text('Continuer',
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white)),
                                  ),


                                  Image.asset('assets/icons/rightArrow.png',height: 20,width: 20,)
                                ],)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
