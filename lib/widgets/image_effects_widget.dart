import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import '../Utils/filters.dart';
import '../screens/edited_image_screen.dart';

class ImageEffectWidget extends StatefulWidget {
  const ImageEffectWidget({Key? key}) : super(key: key);
  static const routeName = '/image_effect_widget';

  @override
  State<ImageEffectWidget> createState() => _ImageEffectWidgetState();
}

class _ImageEffectWidgetState extends State<ImageEffectWidget> {
  final GlobalObjectKey _globalKey = const GlobalObjectKey(3);
  final List<List<double>> filters = [ORIGINAL_MATRIX,SEPIA_MATRIX,SEPIA_PRIME_MATRIX, GREYSCALE_MATRIX ,VINTAGE_MATRIX,SWEET_MATRIX,CONTRAST_MATRIX,LIGHTEN_MATRIX,YELLOW_MATRIX,MAGENTA_MATRIX, CYAN_MATRIX,DARKIN_MATRIX];

  void convertWidgetToImage() async {
    RenderRepaintBoundary repaintBoundary = _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
   // RenderRepaintBoundary repaintBoundary = _globalKey.currentContext.findRenderObject();
    ui.Image boxImage = await repaintBoundary.toImage(pixelRatio: 1);
    ByteData? byteData = await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? uint8list = byteData?.buffer.asUint8List();

    Navigator.of(_globalKey.currentContext as BuildContext).push(MaterialPageRoute(
        builder: (context) => EditedImageScreen(
          imageData: uint8list,
        ))
    );



  }




  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ColorFilter colorFilter = ColorFilter.matrix(filters[0]);
    List<ColorFilter> colors = [
      ColorFilter.matrix(filters[0]),
      ColorFilter.matrix(filters[1]),
      ColorFilter.matrix(filters[2]),

    ];
    final Image image = Image.asset(
      "assets/images/personalImage.jpg",
      width: size.width,
      fit: BoxFit.cover,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Filters",
        ),
        backgroundColor: Colors.deepOrange,
        actions: [IconButton(icon: Icon(Icons.check), onPressed:
        convertWidgetToImage
        )],
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:300,
              alignment: Alignment.center,
              child: RepaintBoundary(
                key: _globalKey,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: size.width,
                    maxHeight: size.width,
                  ),
                  child: PageView.builder(

                      itemCount: filters.length,

                      itemBuilder: (context, index) {
                        return ColorFiltered(
                          colorFilter: ColorFilter.matrix(filters[index]),
                          child: image,
                        );
                      }),
                ),
              ),
            ),
            Text('hello',style: TextStyle(color: Colors.white),),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,

                  itemBuilder: (context,index){
                return RepaintBoundary(
                  // key: _globalKey,
                  child: InkWell(

                    onTap: (){
                      print('bouba');
                      print('index:$index');
                    },
                    child: Container(
                    width: size.width/6,
                    padding: EdgeInsets.all(8),
                    constraints: BoxConstraints(
                     // maxWidth: 30,
                     // maxHeight: 50,
                    ),
                    child:
                    ColorFiltered(
                      colorFilter: ColorFilter.matrix(filters[index]),
                      child: image,

                    ),

                ),
                  ));

      }
              ),
            ),
            /*GridView.count(
              //  childAspectRatio: 2.5,
                crossAxisCount: 1,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,

                children:
                  List.generate(filters.length, (index) => RepaintBoundary(
                    // key: _globalKey,
                    child: Expanded(
                      child: Container(
                        width: 30,
                        constraints: BoxConstraints(
                          maxWidth: 30,
                          maxHeight: 50,
                        ),
                        child:
                        ColorFiltered(
                          colorFilter: ColorFilter.matrix(filters[index]),
                          child: image,

                        ),
                      ),
                    ),
                  ),)



              ),

             */

          ],
        ),
      ),
    );
  }
}
