// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as img;
import 'package:photofilters/filters/filters.dart';

class ItemImagePrime with ChangeNotifier{

  final String imagePath;
  final bool isGallary;
  final Filter filter;
  final img.Image image;





  ItemImagePrime(

      { this.image,
        this.filter,
        @required this.imagePath,
        @required this.isGallary

      }
      );







}