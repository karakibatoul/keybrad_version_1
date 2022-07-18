import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' as root_bundle;
import '../models/category.dart';

class Categoryy with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Categoryy(this.id, this.name, this.description,
      this.imageUrl);
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
    final String response = await root_bundle.rootBundle.loadString('assets/jsonFiles/Categories.json');
    Categories c = categoriesFromJson(response);
    List<Category> a = c.data;

    return a;



  }}