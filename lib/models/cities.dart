import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;



Cities CitiesFromJson(String str) =>
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
  final String Id;
  final String Name;
  final String Latitude;
  final String Longtitude;

  const City({
    required this.Id,
    required this.Name,
    required this.Latitude,
    required this.Longtitude,
  });
  factory City.fromJson(Map<String, dynamic> json) =>
      City(
        Id: json['Id'],
        Name: json['Name'],
        Latitude: json['Latitude'],
        Longtitude: json['Longitude'],
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

    final String response = await rootBundle.rootBundle.loadString('assets/jsonFiles/Cities.json');
    Map<String, dynamic> map = json.decode(response);
    List<dynamic> data = map["Cities"];

      return data.map((json) => City.fromJson(json)).where((city) {
        final nameLower = city.Name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();

  }
}