


import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' as root_bundle;
import '../models/cities.dart';
class CityProvider with ChangeNotifier {
  CityProvider() {
    loadCountries().then((countries) {
      _countries = countries;
      notifyListeners();
    });
  }

  List<City> _countries = [];

  List<City> get countries => _countries;

  Future loadCountries() async {
    final String response = await root_bundle.rootBundle.loadString('assets/jsonFiles/Cities.json');
    Cities c = citiesFromJson(response);
    List<City> a = c.data;

    return a;








    ////////////////////////////
   /* final data = await rootBundle.loadString('assets/jsonFiles/Cities.json');
    final countriesJson = json.decode(data);
    print('countriesJson');
    print(countriesJson);
    Cities c = CitiesFromJson(data);
    print('cities');
    print(c);

    return countriesJson.map<City>((code) {
      final json = countriesJson[code];
      final newJson = json..addAll({'code': code.toLowerCase()});

      return City.fromJson(newJson);
    }).toList()
      ..sort(Utils.ascendingSort);

    */
  }}