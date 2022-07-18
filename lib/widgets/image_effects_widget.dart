import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keybrad/utils/filters.dart';
import 'dart:ui' as ui;
import '../screens/edited_image_screen.dart';

class ImageEffectWidget extends StatefulWidget {
  const ImageEffectWidget({Key? key}) : super(key: key);
  static const routeName = '/image_effect_widget';

  @override
  State<ImageEffectWidget> createState() => _ImageEffectWidgetState();
}

class _ImageEffectWidgetState extends State<ImageEffectWidget> {
  final GlobalObjectKey _globalKey = const GlobalObjectKey(3);
  final List<List<double>> filters = [originalMatrix,sepiaMatrix,sepiaPrimeMatrix,greyScaleMatrix ,vintageMatrix,sweetMatrix,contrastMatrix,lightenMatrix,yellowMatrix,magentaMatrix,cyanMatrix,darkenMatrix];

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
    final Image image = Image.asset(
      "assets/images/personalImage.jpg",
      width: size.width,
      fit: BoxFit.cover,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Filters",
        ),
        backgroundColor: Colors.deepOrange,
        actions: [IconButton(icon: const Icon(Icons.check), onPressed:
        convertWidgetToImage
        )],
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
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
           const  Text('hello',style: TextStyle(color: Colors.white),),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,

                  itemBuilder: (context,index){
                return RepaintBoundary(
                  // key: _globalKey,
                  child: InkWell(

                    onTap: (){
                    },
                    child: Container(
                    width: size.width/6,
                    padding:const  EdgeInsets.all(8),
                    constraints:const  BoxConstraints(
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
