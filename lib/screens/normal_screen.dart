// @dart=2.9
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:keybrad/screens/show_picture_page.dart';
import '../Utils/Utils.dart';
import '../Utils/app_theme.dart';
import '../widgets/bouncing_widget.dart';


class NormalPage extends StatefulWidget {
  static const routeName = '/normal_page';
  const NormalPage({Key key}) : super(key: key);

  @override
  State<NormalPage> createState() => _NormalPageState();
}



class _NormalPageState extends State<NormalPage> with SingleTickerProviderStateMixin {
  bool isGallery = true;
  final PageStorageBucket bucket = PageStorageBucket();

  Future onClickedButtonTry() async {
    final file = await Utils.pickMediaWithoutFilter(
      isGallery: isGallery,
      cropImage: cropCustomImage as Future<File> Function(File),
    );
    if (file == null) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>
          ShowPicturePage(imageFile: file,isGallary: isGallery,isEdit: false, )
      ),
    );


    // setState(() => imageFiles.add(file));
  }


  static Future<File> cropCustomImage(File imageFile) async =>
      await ImageCropper().cropImage(
        aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        sourcePath: imageFile.path,
        androidUiSettings: androidUiSettings(),
        iosUiSettings: iosUiSettings(),
      );

  static IOSUiSettings iosUiSettings() => const IOSUiSettings(
    aspectRatioLockEnabled: false,
  );

  static AndroidUiSettings androidUiSettings() => const AndroidUiSettings(
    toolbarTitle: 'Crop Image',
    toolbarColor: Colors.red,
    toolbarWidgetColor: Colors.white,
    lockAspectRatio: false,
  );



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.greyBackgroundColor,
          foregroundColor: AppTheme.blackTitleColor,
          title: const Text('Uploader',style: TextStyle(color: AppTheme.blackTitleColor),),
          actions: [
            Row(
              children: [
                Text(
                  isGallery ? 'Galerie' : 'Appareil photo',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: isGallery,
                  onChanged: (value) => setState(() => isGallery = value),
                ),
              ],

            )]),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.orange,
                    Colors.yellow,
                  ],
                )
            ),
            child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Hero(
                    tag: 5,
                    child: Center(
                      child: Bouncing(
                        onPress: onClickedButtonTry,
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Icon(Icons.add_a_photo,color: Colors.orange,),
                        ),
                      ),
                    ),
                  ),
                  const  SizedBox(height: 10,),
                  const
                  Center(child: Text('Télécharger une image',style: TextStyle(fontSize: 30,color: Colors.white),),)

                ]),),


          // buildFilters(),
        ],
      ),
    );
  }
}
