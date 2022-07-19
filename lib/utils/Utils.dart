import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<File?> pickMedia({
    required bool isGallery,
    Future<File> Function(File file)? cropImage,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().getImage(source: source);

    if (cropImage == null) {
      return File(pickedFile.path);
    } else {
      final file = File(pickedFile.path);
     // return File(pickedFile.path);

      return cropImage(file);
    }
  }

  static Future<File?> pickMediaInCustom({
    required File imageFile,
    Future<File> Function(File file)? cropImage,
  }) async {


    //if (imageFile == null) return null;

    if (cropImage == null) {
      {
        return File(imageFile.path);}
    } else {

      final file = File(imageFile.path);
      // return File(pickedFile.path);

      return cropImage(file);
    }
  }


  static Future<File?> pickMediaWithoutFilter({
    required bool isGallery,
    Future<File> Function(File file)? cropImage,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().getImage(source: source);

   // if (pickedFile == null) return null;

    if (cropImage == null) {
      return File(pickedFile.path);
    } else {
      final file = File(pickedFile.path);
      return file;

        //return cropImage(file);
    }
  }
}