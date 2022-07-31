import 'package:flutter/material.dart';
import 'package:keybrad/screens/add_item_step_2_screen.dart';
import 'package:keybrad/widgets/radio_group_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../widgets/address_details_widget.dart';
import 'dart:io' as file;
import '../widgets/profile_text_field_widget.dart';


class EditItemScreen extends StatefulWidget {
  const EditItemScreen({Key? key}) : super(key: key);
  static const routeName = '/edit_item_screen';

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}
enum menuitem { item1, item2, item3, item4 }

class _EditItemScreenState extends State<EditItemScreen> {

  List<String> images = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments ;

    setState(() {

      images.add(args.toString());
    });


  }



  @override
  Widget build(BuildContext context) {
   // menuitem? _mitem = menuitem.item1;
    final  telephoneController = TextEditingController();
    final prixController = TextEditingController();
   // final locationController = TextEditingController();


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
            borderSide: const BorderSide(
              color: AppTheme.greyBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: AppTheme.greyTextFieldColor,
          border: const OutlineInputBorder(),
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
              SizedBox(height: 5.h,),
              Flexible(
                flex: 1,
                child: ProfileTextFieldWidget(
                  validateText: 'Title can not be null',
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
                  flex: 1,
                  child: prixTextField),
              SizedBox(height: 2.h,),
              const Flexible(
                  flex: 4,
                  child: RadioGroup()),


              SizedBox(height: 2.h,),
              SizedBox(height: 2.h,),
              Flexible(
                flex:3,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.7.h,),
                    child: AddressDetailsWidget(
                      maxLines: 10,
                      hintText: 'Description:',
                      hintFontSize: 17.sp,)),
              ),
              SizedBox(height: 2.h,),
              Flexible(
                flex: 1,
                child: ProfileTextFieldWidget(
                  keyboardType: TextInputType.text,
                  validateText: 'Category can not be null',
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
                flex: 3,
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
                          InkWell(
                            onTap: (){
                              //Navigator.pushNamed(context, TakePictureScreen.routeName);
                            },
                            child: SizedBox(
                              //margin: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width/6-4.w,
                                child:
                                Image.asset('assets/icons/add copy 2.png')
                              // Image.file(file.File(images[0]))
                            ),
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width/6-4.w,
                                  child: Image.asset('assets/images/NewItem_background.png')),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child:CircleAvatar(radius:(MediaQuery.of(context).size.width/6-4.w)/2 ,
                                  backgroundImage:
                                  // file.File(images[0]).existsSync()?null:FileImage(file.File(images[0])),
                                  file.File(images[0]).existsSync()?FileImage(file.File(images[0])):null,
                                  //AssetImage('assets/images/personalImage.jpg'),

                                  // FileImage(file.File(images[0])),
                                ),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.width/6-8.w,
                                  right: (MediaQuery.of(context).size.width/6-4.w)/20,
                                  child: Image.asset('assets/icons/checkboxOff.png',height: 20,width: 20,))
                            ],
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width/6-4.w,
                                  child: Image.asset('assets/images/NewItem_background.png')),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child:CircleAvatar(radius:(MediaQuery.of(context).size.width/6-4.w)/2 ,
                                  backgroundImage:
                                  // file.File(images[0]).existsSync()?null:FileImage(file.File(images[0])),
                                  images.length==2 &&file.File(images[1]).existsSync()?FileImage(file.File(images[1])):null,
                                  //AssetImage('assets/images/personalImage.jpg'),

                                  // FileImage(file.File(images[0])),
                                ),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.width/6-8.w,
                                  right: (MediaQuery.of(context).size.width/6-4.w)/20,
                                  child: Image.asset('assets/icons/checkboxOff.png',height: 20,width: 20,))
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width/6-4.w,
                              child: Image.asset('assets/images/NewItem_background.png')),
                          SizedBox(
                              width: MediaQuery.of(context).size.width/6-4.w,
                              child: Image.asset('assets/images/NewItem_background.png')),
                          SizedBox(
                              width: MediaQuery.of(context).size.width/6-4.w,
                              child: Image.asset('assets/images/NewItem_background.png')),

                        ],),
                    ),
                  ],
                ),
              ),


              Flexible(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.8.h,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AddItemStep2Screen.routeName);
                        },
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
