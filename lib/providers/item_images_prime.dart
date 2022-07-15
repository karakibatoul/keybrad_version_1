import 'package:flutter/cupertino.dart';
import 'package:keybrad/providers/item_image.dart';
import 'package:keybrad/providers/item_image_prime.dart';


class ItemImagesPrime with ChangeNotifier{

  List<ItemImagePrime> _images = [];


  List<ItemImagePrime> get images {
    // if (_showFavoritesOnly)
    //  return _items.where((element) => element.isFavorite).toList();

    //this will return a copy of the list not the list it self
    //why we do like this is found in the notebook last page
    return [..._images];
  }

  void addItemImagePrime(ItemImagePrime itemImage) {

    final newImage = ItemImagePrime(
        imagePath: itemImage.imagePath,isGallary: itemImage.isGallary,image: itemImage.image,filter: itemImage.filter);

    _images.add(newImage);
    print('images:$_images');
    //_items.insert(0, newProduct);//to add it the beginning of the list
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

  void deleteItemImagePrime(int index){
    _images.removeAt(index);
    notifyListeners();
  }

}