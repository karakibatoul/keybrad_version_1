import 'package:flutter/material.dart';
import 'package:keybrad/providers/category_provider.dart';

class Categories with ChangeNotifier {
  //it is not final bcs it will change

  List<Categoryy> _categories = [
    Categoryy('p1', 'Supermarché', 'Alimentaire..',
        'assets/images/categories/Supermarché.png'),
    Categoryy('p1', 'Pour la maison', 'Meuble..',
        'assets/images/categories/Pour la maison.png'),
    Categoryy('p1', 'Pour la maison', 'Meuble..',
        'assets/images/categories/Pour la maison.png'),
    Categoryy('p1', 'Pour la maison', 'Meuble..',
        'assets/images/categories/Pour la maison.png'),
    Categoryy('p1', 'Pour la maison', 'Meuble..',
        'assets/images/categories/Pour la maison.png'),
  ];
  List<Categoryy> get items {
    return [..._categories];
  }
}
