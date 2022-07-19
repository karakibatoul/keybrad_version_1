import 'package:flutter/material.dart';
import 'package:keybrad/widgets/bouncing_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:io' as file;
import '../providers/image_files.dart';
class CircularStack extends StatelessWidget {


  final Function()? newItemOnTap;
  final int index;
  final Function()? positionedOnTap;

  const CircularStack({Key? key, this.newItemOnTap, required this.index, this.positionedOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageFiles = Provider.of<ImageFiles>(context);
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width/6-4.w,
            child: Image.asset('assets/images/NewItem_background.png')),
        InkWell(

            onTap: newItemOnTap,
            child: Builder(
                builder: (context) {

                  if( imageFiles.images.length>=index+1
                      && file.File(imageFiles.images[index].imageFile.path).existsSync()
                      && imageFiles.images[index].selectedFilter!=null){
                    return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          shape: BoxShape.circle,

                        ),
                        child:ColorFiltered(
                          colorFilter:imageFiles.images[index].selectedFilter ,
                          child: CircleAvatar(radius:(MediaQuery.of(context).size.width/6-4.w)/2 ,
                              backgroundImage:
                              FileImage(file.File(imageFiles.images[index].imageFile.path))
                            //AssetImage('assets/images/personalImage.jpg'),
                            // FileImage(file.File(images[0])),
                          ),

                        )
                    );
                  }
                  else if (imageFiles.images.length>=index+1
                      && file.File(imageFiles.images[index].imageFile.path).existsSync()
                      && imageFiles.images[index].selectedFilter==null)
                  {
                    return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          shape: BoxShape.circle,

                        ),
                        child:CircleAvatar(radius:(MediaQuery.of(context).size.width/6-4.w)/2 ,
                            backgroundImage:
                            FileImage(file.File(imageFiles.images[index].imageFile.path))
                          //AssetImage('assets/images/personalImage.jpg'),
                          // FileImage(file.File(images[0])),
                        )
                    );
                  }
                  else {
                    return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          shape: BoxShape.circle,

                        ),
                        child:CircleAvatar(radius:(MediaQuery.of(context).size.width/6-4.w)/2 ,
                            backgroundImage:
                            const   AssetImage('assets/images/white-background-image.png')
                          //AssetImage('assets/images/personalImage.jpg'),
                          // FileImage(file.File(images[0])),
                        )
                    );
                  }

                }
            )),
        Positioned(
            top: MediaQuery.of(context).size.width/6-8.w,
            right: (MediaQuery.of(context).size.width/6-4.w)/20,
            child: InkWell(
                onTap:positionedOnTap,
                child: Bouncing(
                  onPress: (){},
                    child: Image.asset('assets/icons/checkboxOff.png',height: 20,width: 20,))))
      ],
    );
  }
}
