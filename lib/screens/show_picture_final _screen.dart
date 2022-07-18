
/*import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:keybrad/screens/take_picture_screen.dart';


class ShowPictureFinalScreen extends StatefulWidget {
  const ShowPictureFinalScreen({Key? key}) : super(key: key);
  static const routeName = '/show_picture_final_screen';

  @override
  State<ShowPictureFinalScreen> createState() => _ShowPictureFinalScreenState();
}

class _ShowPictureFinalScreenState extends State<ShowPictureFinalScreen> {

     late CameraDescription firstCamera  ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero,() async {

      // Ensure that plugin services are initialized so that `availableCameras()`
      // can be called before `runApp()`
      WidgetsFlutterBinding.ensureInitialized();

      // Obtain a list of the available cameras on the device.
      final cameras = await availableCameras();
      firstCamera = cameras.first;

      // Get a specific camera from the list of available cameras.

      Future.delayed(Duration.zero,()async{
        setState (() {
          firstCamera = cameras.first;
        });
      });




    });

  }



  @override
  Widget build(BuildContext context) {
    return Container();
      TakePictureScreen(camera: firstCamera);
  }
}

 */
