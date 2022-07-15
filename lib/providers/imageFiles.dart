import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'image_file.dart';

class ImageFiles with ChangeNotifier{
  List<ImageFile> _imageFiles = [];



  List<ImageFile> get images {
    return [..._imageFiles];
  }
   set setImageFiles(List<ImageFile> imageList){

    [..._imageFiles = imageList];
    notifyListeners();

  }

  void addFile(ImageFile itemImage) {
    final newImage = ImageFile(
      imageFile: itemImage.imageFile,
      selectedFilter: itemImage.selectedFilter
       );




    _imageFiles.add(newImage);
    print('images:$_imageFiles');
    //_items.insert(0, newProduct);//to add it the beginning of the list
    notifyListeners();
  }

 /* void updateImageFile(DateTime id,ImageFile imageFile){
    print('in provider edit : $id');
    final imageFileIndex = _imageFiles.indexWhere((element) => element.id == id);
    if(imageFileIndex>=0){
      _imageFiles[imageFileIndex] = imageFile;
      notifyListeners();
    }else{
      print('no such image file found');
    }

  }

  */
  void updateImageFile(int index,ImageFile imageFile){
    print('in provider edit : $index');
      _imageFiles[index] = imageFile;
      notifyListeners();


  }

  /*void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('.... No such id found');
    }
  }

   */

  /*void deleteProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

   */

  void deleteFile(int index){
    _imageFiles.removeAt(index);
    notifyListeners();
  }

}