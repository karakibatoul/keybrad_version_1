import 'package:flutter/material.dart';
import 'item_provider.dart';
import 'package:provider/provider.dart';
import 'categories.dart';

class Items with ChangeNotifier {
  //it is not final bcs it will change

  List<Item> _items = [
    Item(
        1,
        1,
        'Réfrigérateur â vendre',
        '1 y 2 month',
        '750000000',
        'USD',
        true,
        true,
        true,
        'assets/images/topLogo.png',
        true,
        'itemCategory',
        0,
        ['assets/images/refrigerator.png'],
        'description',
        'itemSeller',
        'Bengerville',
        'longtitude',
        'latitude'),
    Item(
        2,
        1,
        'Chaise bébé électro',
        '1 y 2 month',
        '150000',
        'USD',
        false,
        false,
        true,
        'assets/images/topLogo.png',
        false,
        'itemCategory',
        0,
        ['assets/images/electricalChair.jpeg'],
        'description',
        'itemSeller',
        'Zone4',
        'longtitude',
        'latitude'),
    Item(
        2,
        1,
        'furniture',
        '1y2 month',
        '100078',
        'USD',
        false,
        false,
        true,
        'assets/images/topLogo.png',
        false,
        'itemCategory',
        0,
        ['assets/images/categories/Pour la maison.png'],
        'description',
        'itemSeller',
        'Zone4',
        'longtitude',
        'latitude'),
    Item(
        2,
        1,
        'furniture',
        '1y2 month',
        '100078',
        'USD',
        false,
        false,
        true,
        'assets/images/topLogo.png',
        false,
        'itemCategory',
        0,
        ['assets/images/categories/Pour la maison.png'],
        'description',
        'itemSeller',
        'Zone4',
        'longtitude',
        'latitude')
  ];
  List<Item> get items {
    return [..._items];
  }
}
