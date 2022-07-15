// @dart=2.9

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/providers/item_image_prime.dart';
import 'package:keybrad/providers/item_images_prime.dart';
import 'package:keybrad/screens/add_item_screen.dart';
import 'package:keybrad/screens/item_details.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Utils/filter_utils.dart';
import '../providers/imageFiles.dart';
import '../widgets/filters_widget/filtered_image_list_widget.dart';
import '../widgets/filters_widget/filtered_image_widget.dart';


class ImageFilterScreen extends StatefulWidget {
  const ImageFilterScreen({Key key, @required this.title}) : super(key: key);
  final String title;
  static const routeName = '/image_filter_screen';

  @override
  State<ImageFilterScreen> createState() => _ImageFilterScreenState();
}

class _ImageFilterScreenState extends State<ImageFilterScreen> {
  img.Image image;
  Filter filter = presetFiltersList.first;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,() {
      var  args = ModalRoute.of(context).settings.arguments;
      print('google:$args');
      if(args!=null) {
        setState(() {
            this.image = args as img.Image;

        });
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    final imageFiles = Provider.of<ImageFiles>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: pickImage,
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                filter = presetFiltersList[3];
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (this.image!=null){
                Provider.of<ItemImagesPrime>(context, listen: false).addItemImagePrime(
                    ItemImagePrime(imagePath: '',isGallary: true,image: image,filter: filter));
                print('boubaty${ Provider.of<ItemImagesPrime>(context,listen: false).images}');
                Navigator.pushNamed(context, AddItemScreen.routeName);
              }

            },
          ),
        ],
      ),
      body: ListView(
        children: [
          buildImage(),
          const SizedBox(height: 12),
          buildFilters(),
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

          ]),);
    }


    return FilteredImageWidget(
      filter: filter,
      image: image,
      successBuilder: (imageBytes) =>
          Image.memory(
              Uint8List.fromList(imageBytes),
              height: height,
              fit: BoxFit.contain),

      errorBuilder: () => Container(height: height),
      loadingBuilder: () => Container(
        height: height,
        child:const Center(child: CircularProgressIndicator()),
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
