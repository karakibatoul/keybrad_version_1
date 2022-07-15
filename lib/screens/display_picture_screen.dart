
// A widget that displays the picture taken by the user.



import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/providers/item_image.dart';
import 'package:keybrad/providers/item_image_prime.dart';
import 'package:keybrad/providers/item_images.dart';
import 'package:keybrad/providers/item_images_prime.dart';
import 'dart:io' as file;
import 'package:keybrad/screens/add_item_screen.dart';
import 'package:keybrad/screens/show_picture_final%20_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;


  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ItemImages>(context);
    return Scaffold(
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.25 ,),
            Image.file(file.File(widget.imagePath)),
         const    Spacer(),
            Container(
              height: MediaQuery.of(context).size.height*0.08,
              margin:const  EdgeInsets.only(left: 5,right: 5),
              color: AppTheme.blackTitleColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(onPressed: (){
                  //  Navigator.pushReplacementNamed(context, ShowPictureFinalScreen.routeName );
                  }, child:
                     const  Text('Retake',style: TextStyle(color: Colors.white,
                       // fontSize: 18.sp
                          fontSize: 15
                      ),)
                  ),
                const   Spacer(),
                  TextButton(
                      onPressed: (){
                        if(productsData.images.length!=5) {
                          Provider.of<ItemImages>(context, listen: false).addProduct(ItemImage(imagePath: widget.imagePath));
                          Provider.of<ItemImagesPrime>(context, listen: false).addItemImagePrime(ItemImagePrime(imagePath: widget.imagePath, isGallary: false));
                        }
                        else {
                          print('more than six');
                        //  Provider.of<ItemImagesPrime>(context, listen: false).images.clear();
                        }
                        setState(() {

                          print('batoul:${productsData.images}');
                          //print('hello spring:${productsData.images[0].imagePath}');
                        });

                        setState(() {
                          count = count+1;
                          if(count==6) {
                            count=0;
                          }
                        });
                        print('count:$count');
                    Navigator.pushReplacementNamed(context, AddItemScreen.routeName,arguments:ImageArguments(widget.imagePath, count) );
                  }, child:const  Text('Use Photo',style: TextStyle(color: Colors.white,
                    //fontSize: 18.sp
                      fontSize: 15
                  ),))

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class ImageArguments {
  final String imagePath;
  final int count;

  ImageArguments(this.imagePath, this.count);
}