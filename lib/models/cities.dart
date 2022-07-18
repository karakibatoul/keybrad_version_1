import 'dart:convert';
import 'package:flutter/services.dart' as root_bundle;



Cities citiesFromJson(String str) =>
    Cities.fromJson(json.decode(str));



class Cities {
  Cities({

    required this.data,
  });


  List<City> data;

  factory Cities.fromJson(Map<String, dynamic> json) =>
      Cities(

        data: List<City>.from(json["Cities"].map((x) => City.fromJson(x))),
      );


}


class City {
  final String id;
  final String name;
  final String latitude;
  final String longtitude;

  const City({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longtitude,
  });
  factory City.fromJson(Map<String, dynamic> json) =>
      City(
        id: json['Id'],
        name: json['Name'],
        latitude: json['Latitude'],
        longtitude: json['Longitude'],
      );


 /* static City fromJson(Map<String, dynamic> json) {

    return
    City(
      Id: json['Id'],
      Name: json['Name'],
      Latitude: json['Latitude'],
      Longtitude: json['Longitude'],
    );
  }

  */
}

class UserApi {
  static Future<List<City>> getUserSuggestions(String query) async {

    final String response = await root_bundle.rootBundle.loadString('assets/jsonFiles/Cities.json');
    Map<String, dynamic> map = json.decode(response);
    List<dynamic> data = map["Cities"];

      return data.map((json) => City.fromJson(json)).where((city) {
        final nameLower = city.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();

  }
}