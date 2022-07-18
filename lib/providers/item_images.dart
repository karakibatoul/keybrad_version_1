import 'package:flutter/cupertino.dart';
import 'package:keybrad/providers/item_image.dart';


class ItemImages with ChangeNotifier{

  final List<ItemImage> _images = [];


  List<ItemImage> get images {
    // if (_showFavoritesOnly)
    //  return _items.where((element) => element.isFavorite).toList();

    //this will return a copy of the list not the list it self
    //why we do like this is found in the notebook last page
    return [..._images];
  }

  void addProduct(ItemImage itemImage) {

    final newImage = ItemImage(imagePath: itemImage.imagePath);

    _images.add(newImage);
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

void deleteItemImage(int index){
  _images.removeAt(index);
  notifyListeners();
}

}