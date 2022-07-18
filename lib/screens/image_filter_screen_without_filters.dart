// @dart=2.9

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:keybrad/screens/image_filter_screen.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/app_theme.dart';
import '../Utils/filter_utils.dart';
import '../widgets/filters_widget/filtered_image_list_widget.dart';
import '../widgets/filters_widget/filtered_image_widget.dart';


class ImageFilterScreenWithoutFilters extends StatefulWidget {
  const ImageFilterScreenWithoutFilters({Key key, @required this.title}) : super(key: key);
  final String title;
  static const routeName = '/image_filter_screen_without_filters';


  @override
  State<ImageFilterScreenWithoutFilters> createState() => _ImageFilterScreenWithoutFiltersState();
}

class _ImageFilterScreenWithoutFiltersState extends State<ImageFilterScreenWithoutFilters> {
  img.Image image;
  Filter filter = presetFiltersList.first;
  Uint8List list ;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: pickImage,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                filter = presetFiltersList[3];
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          buildImage(),
          const SizedBox(height: 12),
         Container(
           margin: const EdgeInsets.all(10),
             child:  Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children:  [
             Expanded(
               child: InkWell(
                 onTap: (){
                   if(image!=null) {
                     Navigator.pushNamed(context,ImageFilterScreen.routeName,arguments: image );
                   }
                 },
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    const  Icon(Icons.filter,color:Colors.orangeAccent ,size: 35,),
                   const SizedBox(width: 4,),
                   Container(
                     alignment: Alignment.center,
                     child: Text('Filtre',
                         style: TextStyle(
                             fontSize: 18.sp,
                             fontWeight: FontWeight.w700,
                             color: Colors.black)),
                   ),],),
               ),
             ),
             Expanded(
                 child: InkWell(
                   onTap: (){},
                   child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [const  Icon(Icons.crop,color:Colors.orangeAccent ,size: 35,),
               const SizedBox(width: 4,),
               Container(
                   alignment: Alignment.center,
                   child: Text('Recadrer',
                       style: TextStyle(
                           fontSize: 18.sp,
                           fontWeight: FontWeight.w700,
                           color: Colors.black)),
               ),],),
                 ))





           ],))
         // buildFilters(),
        ],
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    final imageBytes = File(image.path).readAsBytesSync();

    final newImage = img.decodeImage(imageBytes);
    FilterUtils.clearCache();

    if (newImage != null) {
      setState(() {
        this.image = newImage;
      });
    }
  }

  Widget buildImage() {
    const double height = 450;
    if (image == null) {
      return Container(
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

            InkWell(
              onTap: pickImage,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.add_a_photo,color: AppTheme.trierButtonBackgroundColor,),
                ),
              ),
            ),
            SizedBox(height: 5.h,),
            const
            Center(child: Text('Upload Image Here',style: TextStyle(fontSize: 30,color: Colors.white),),)

          ]),);}

    return FilteredImageWidget(
      filter: presetFiltersList.first,
      image: image,
      successBuilder: (imageBytes) => Image.memory(
          Uint8List.fromList(imageBytes),
          height: height,
          fit: BoxFit.fitHeight),
      errorBuilder: () => Container(height: height),
      loadingBuilder: () =>const  SizedBox(
        height: height,
        child:  Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget buildFilters() {
    if (image == null) return Container();

    return FilteredImageListWidget(
      filters: presetFiltersList,
      image: image,
      onChangedFilter: (filter) {
        setState(() {
          this.filter = filter;
        });
      },
    );
  }
}
