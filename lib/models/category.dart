import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;



Categories CategoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));



class Categories {
  Categories({

    required this.data,
  });


  List<Category> data;

  factory Categories.fromJson(Map<String, dynamic> json) {
    return  Categories(

        data:// json["Categories"]!=null ?
        List<Category>.from(json["Categories"].map((x) => Category.fromJson(x)))
      // : <Category>[],
    );
  }



}


class Category {
  final int categoryId;
  final int subcategoryId;
  final String category;
  final String subcategory;

  const Category({
    required this.categoryId,
    required this.subcategoryId,
    required this.category,
    required this.subcategory,
  });
  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(
        categoryId:  json['CategoryId'],
        subcategoryId: json['SubcategoryId'],
        category: json['Category'],
        subcategory: json['Subcategory'],
      );


}

class UserApi {
  static Future<List<Category>> getUserSuggestions(String query) async {

    final String response = await rootBundle.rootBundle.loadString('assets/jsonFiles/Categories.json');
    Map<String, dynamic> map = json.decode(response);
    List<dynamic> data = map["Cities"];

    return data.map((json) => Category.fromJson(json)).where((city) {
      final nameLower = city.category.toLowerCase();
      final queryLower = query.toLowerCase();

      return nameLower.contains(queryLower);
    }).toList();

  }
}