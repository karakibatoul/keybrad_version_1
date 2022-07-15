
// A screen that allows users to take a picture using a given camera.
/*import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/app_theme.dart';
import 'display_picture_screen.dart';

class TakePictureScreen extends StatefulWidget {
  static const routeName = '/take_picture_screen';
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body:
      Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,

        child: Column(



          children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.25 ,),
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_controller);
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
           const Spacer(),
            Container(
              height: MediaQuery.of(context).size.height*0.08,
              margin:const  EdgeInsets.only(left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child:
                 const Text('Cancel',style: TextStyle(color: Colors.white,
                      //fontSize: 18.sp
                      fontSize: 15
                  ),)
                  ),
                  const Spacer(),
                  Container(
                    //margin: EdgeInsets.only(right: 10.h),
                    margin:const  EdgeInsets.only(right: 5),
                    child: FloatingActionButton(

                      // Provide an onPressed callback.
                      onPressed: () async {
                        // Take the Picture in a try / catch block. If anything goes wrong,
                        // catch the error.
                        try {
                          // Ensure that the camera is initialized.
                          await _initializeControllerFuture;

                          // Attempt to take a picture and get the file `image`
                          // where it was saved.
                          final image = await _controller.takePicture();

                          // If the picture was taken, display it on a new screen.
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DisplayPictureScreen(
                                // Pass the automatically generated path to
                                // the DisplayPictureScreen widget.
                                imagePath: image.path,
                              ),
                            ),
                          );
                        } catch (e) {
                          // If an error occurs, log the error to the console.
                          print(e);
                        }
                      },
                      child: const Icon(Icons.camera_alt),
                    ),
                  ),
                  const Spacer(),


                ],
              ),
            ),

          ],
        ),
      ),

      /*FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      */
    );
  }

 */
//}

