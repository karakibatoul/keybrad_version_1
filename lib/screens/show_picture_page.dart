// @dart=2.9


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:keybrad/screens/add_item_screen.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/Utils.dart';
import '../Utils/app_theme.dart';
import '../providers/image_files.dart';
import '../providers/image_file.dart';
import 'filter_image_page.dart';

class ShowPicturePage extends StatefulWidget {
  static const routeName = '/show_picture_page';
  File imageFile;
  ColorFilter selectedFilter;
  final bool isGallary;
  final bool isEdit;
  final int index;
  ShowPicturePage({Key key, @required this.imageFile, @required this.isGallary,this.selectedFilter,@required this.isEdit,@required this.index
  }) : super(key: key);

  @override
  State<ShowPicturePage> createState() => _ShowPicturePageState();
}

class _ShowPicturePageState extends State<ShowPicturePage> {
  List<File> imageFiles = [];




  Future onClickedButton(BuildContext context) async {
    final file = await Utils.pickMediaInCustom(
      imageFile: widget.imageFile,
      cropImage: cropPredefinedImage,
    );

    if (file == null) return;
    setState(() {
      widget.imageFile=file;
    });
  }

  Future<File> cropPredefinedImage(File imageFile) async =>
      await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: androidUiSettingsLocked(),
        iosUiSettings: iosUiSettingsLocked(),
      );

  IOSUiSettings iosUiSettingsLocked() => const IOSUiSettings(
    aspectRatioLockEnabled: false,
    resetAspectRatioEnabled: false,
  );

  AndroidUiSettings androidUiSettingsLocked() => const AndroidUiSettings(
    toolbarTitle: 'Crop Image',
    toolbarColor: AppTheme.trierButtonBackgroundColor,
    activeControlsWidgetColor: AppTheme.trierButtonBackgroundColor,
    toolbarWidgetColor: Colors.white,
    initAspectRatio: CropAspectRatioPreset.original,
    lockAspectRatio: false,
  );


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: const Text('Modifier'),
        backgroundColor: AppTheme.trierButtonBackgroundColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Container(
            padding:const  EdgeInsets.only(right: 25),
              child: Bouncing(
                  onPress: (){
                    final itemImages = Provider.of<ImageFiles>(context,listen: false);
                    final imageFile = ImageFile(imageFile: widget.imageFile,selectedFilter:widget.selectedFilter, );

                    if(widget.isEdit==true){
                      ImageFile editedImage = ImageFile(imageFile: widget.imageFile,selectedFilter: widget.selectedFilter,);
                      itemImages.updateImageFile(widget.index,editedImage);

                    }

                    if(itemImages.images.contains(imageFile)==false && widget.isEdit==false){
                      itemImages.addFile(imageFile);

                    }

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const AddItemScreen()),
                    );
                  },
                  child:
                  const Icon(Icons.save)
              )
          )
        ],//to go to the page of circles

      ),
      body:   SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height-2*kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.selectedFilter==null? Flexible(
                flex: 10,
                child: Container(
                  //alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.8,
                    padding: const EdgeInsets.all(10),
                    margin:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.w),
                    //color: AppTheme.blackTitleColor,
                  child: Image.file(widget.imageFile)


                ),
              ):
              Flexible(
                  flex:10,
                  child:
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.all(10),
                margin:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.w),
                child: ColorFiltered(
                    colorFilter: widget.selectedFilter,
                    child: Image.file(File(widget.imageFile.path))),
              )),
              const Spacer(flex: 2,),

              Flexible(
                flex: 2,
                child: Container(
                    margin:const  EdgeInsets.all(10),
                   
                    decoration:const  BoxDecoration(
                      color: AppTheme.trierButtonBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)
                      ),
                        
                      
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Expanded(
                          child: Bouncing(
                            onPress: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>

                                    FilterImagePage(imageFile: widget.imageFile,iEdit: widget.isEdit,index: widget.index, )
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const  Icon(Icons.filter,color:Colors.white ,size: 35,),
                                const SizedBox(width: 4,),
                                Container(
                                  alignment: Alignment.center,
                                  child:const  Text('Filtre',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),
                                ),],),
                          ),
                        ),
                        Expanded(
                            child: Bouncing(
                              onPress:  (){
                                onClickedButton(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [const  Icon(Icons.crop,color:Colors.white ,size: 35,),
                                  const SizedBox(width: 4,),
                                  Container(
                                    alignment: Alignment.center,
                                    child:const  Text('Recadrer',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white)),
                                  ),],),
                            ))





                      ],)),
              ),
              /*Row(children: [
                      TextButton(onPressed :(){onClickedButton();
                      }
                      //cropCustomImage(widget.imageFile!) as void Function()?
                          , child: Text('crop')),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>

                              FilterImageScreen(imageFile: widget.imageFile, )
                          ),
                        );
                      }, child: Text('filter'))
                    ],),
                    imageFiles.length!=0 ?  ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(imageFiles[0])

                    ):Container(),
*/

            ],

          ),
        ),
      ),





    );
  }
}

