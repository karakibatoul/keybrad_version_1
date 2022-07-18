
// @dart=2.9


import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:keybrad/screens/image_filter_screen_without_filters.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/filter_utils.dart';



class ChooseLibraryCameraDialog extends StatefulWidget {
  const ChooseLibraryCameraDialog({Key key}) : super(key: key);
  static const routeName = '/choose_library_camera_screen';

  @override
  State<ChooseLibraryCameraDialog> createState() => _ChooseLibraryCameraDialogState();
}

class _ChooseLibraryCameraDialogState extends State<ChooseLibraryCameraDialog> {
  img.Image image;
  Filter filter = presetFiltersList.first;
  Uint8List list ;

  Future pickImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    final imageBytes = File(image.path).readAsBytesSync();
    setState(() {
      list = imageBytes;
    });

    final newImage = img.decodeImage(imageBytes);
    FilterUtils.clearCache();

    if (newImage != null) {
      setState(() {
        this.image = newImage;
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,

      child: Dialog(
        insetPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/3,horizontal: 10),
        alignment: Alignment.center,
        backgroundColor: Colors.white,

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin:const  EdgeInsets.all(30),
            child: Text(
              'Veuillez sélectionner la source de l\'image que vous souhaitez télécharger',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,


              ),),
          ),
         const  Divider(color: Colors.grey,),
          TextButton(
              onPressed: (){

             //   Navigator.pushNamed(context, TakePictureScreen.routeName);
              }, child:
        Container(
          alignment: Alignment.center,
          child: Text('Appareil photo',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 17.sp
          ),)
        )),
         const  Divider(color: Colors.grey,),
          TextButton(
              onPressed: (){


               /* Image.memory(
                    Uint8List.fromList(list),
                    height: 100,
                    fit: BoxFit.fitHeight);

                */
                Navigator.pushNamed(context, ImageFilterScreenWithoutFilters.routeName);


              }, child:
          Container(
              alignment: Alignment.center,
              child: Text('Bibliothéque Photo',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17.sp
                ),)
          )),

          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, child:
          Container(
              alignment: Alignment.center,
              child: Text('Annuler',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17.sp
                ),)
          )),
        ],
      ) ,),
    );
  }
}
