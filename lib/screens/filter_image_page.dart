// @dart=2.9

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:keybrad/screens/show_picture_page.dart';
import 'package:keybrad/utils/filters.dart';


class FilterImagePage extends StatefulWidget {
  static const routeName = '/filter_image_page';
  final File imageFile;
  final bool  iEdit;
  final int index;
  const FilterImagePage({Key key, @required this.imageFile,@required this.iEdit,@required this.index}) : super(key: key);
  @override
  _FilterImagePageState createState() => _FilterImagePageState();
}

class _FilterImagePageState extends State<FilterImagePage> {

  // VARIABLES AND CONSTANTS
  double _screenHeight = 0.0;
  File _image ;

  final picker = ImagePicker();
  ColorFilter _selectedFilter;
  List<ColorFilter> filterList = [
    const ColorFilter.matrix(originalMatrix),
    const ColorFilter.matrix(greyScaleMatrix),
    const  ColorFilter.matrix(vintage2Matrix),
    const  ColorFilter.matrix(vintageMatrix),
    const ColorFilter.matrix(sweetMatrix),
    const  ColorFilter.matrix(contrastMatrix),
    const  ColorFilter.matrix(sepiaMatrix),
    const  ColorFilter.matrix(sepiaPrimeMatrix),
    const  ColorFilter.matrix(yellowMatrix),
    const  ColorFilter.matrix(magentaMatrix),
    const  ColorFilter.matrix(cyanMatrix),
    const  ColorFilter.matrix(darkenMatrix),
    const  ColorFilter.matrix(lightenMatrix),
  ];

  // LIFE CYCLE

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          addImageContainer(context),
          filterColorOptionContainer(context),
          // imageFilterOptionContainer(context)
        ],
      ),
    );
  }

  // HELPERS

  Future getImage(ImageSource imageSource) async {
    //final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    // final pickedFile = await picker.getImage(source: imageSource);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {

      }
    });
  }

  // WIDGETS
  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.trierButtonBackgroundColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title:const  Text('Filtre', style:TextStyle(color: Colors.white),),
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
               /* if(widget.imageFile!=null){
                  print('imageFile in filter image page ${widget.imageFile}');
                  print('filter in filter image page $_selectedFilter');
                  Provider.of<ImageFiles>(context, listen: false).addFile(
                      ImageFile(imageFile:widget.imageFile,selectedFilter: _selectedFilter));

                }

                */
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                     ShowPicturePage(imageFile: widget.imageFile, selectedFilter: _selectedFilter,isEdit: widget.iEdit, index: widget.index, isGallary: null,)));

              },
              child: const Icon(
                Icons.check,
                size: 26.0,
              ),
            )
        ),],
      leading: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child:
        const  Icon(
          Icons.close,  // add custom icons also
        ),),
    );
  }


  Widget addImageContainer(BuildContext context) {
    return Container(
        height: _screenHeight * 0.5,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
       // color: Theme.of(context).primaryColorLight,
        child:  widget.imageFile == null ?const  Center(
          child:  Text('empty'),
        ) : Container(
          child: _selectedFilter == null ? Image.file(File(widget.imageFile.path)) : ColorFiltered(
            colorFilter: _selectedFilter,
            child: Image.file(File(widget.imageFile.path),
            ),
          ),
        )
    );
  }

  Widget filterColorOptionContainer(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(itemBuilder: (context, index) {
          return imageContainer(filterList[index]);
        },
          itemCount: filterList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget filterCropOptionsContainer(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  Widget imageFilterOptionContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: _screenHeight * 0.08,
      width: 250,
      child: OutlineButton(
        borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowPicturePage(imageFile: widget.imageFile, selectedFilter: _selectedFilter,index: null,isEdit: null,isGallary: null,)));
          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CropScreen(imageFile: _image, filter: _selectedFilter,)));
        },
        child: Text('crop_button.toUpperCase()', style: Theme.of(context).textTheme.bodyText1,),
      ),
    );
  }

  Widget imageContainer(ColorFilter filter) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = filter;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
                colorFilter: filter,
                child: Image.file(widget.imageFile, fit: BoxFit.contain,)
            ),
            //Text("name")
          ],
        ),
      ),
    );
  }
}