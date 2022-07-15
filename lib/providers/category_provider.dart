import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../models/category.dart';

class Categoryy with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Categoryy(@required this.id, @required this.name, @required this.description,
      @required this.imageUrl);
}



class CategoryProvider with ChangeNotifier {
  CategoryProvider() {
    loadCategories().then((categories) {
      _categories = categories;
      notifyListeners();
    });
  }

  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future loadCategories() async {
    final String response = await rootBundle.rootBundle.loadString('assets/jsonFiles/Categories.json');
    Categories c = CategoriesFromJson(response);
    print('cities:');
    List<Category> a = c.data;

    return a;



  }}