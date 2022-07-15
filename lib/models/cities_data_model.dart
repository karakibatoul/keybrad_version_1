import 'dart:ffi';

class CitiesDataModel{
  //data Type
  int? id;
  String? name;
  Double? latitude;
  Double? longitude;


// constructor
  CitiesDataModel(
      {
        this.id,
        this.name,
        this.latitude,
        this.longitude,

      }
      );

  //method that assign values to respective datatype vairables
  CitiesDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['Id'];
    name =json['Name'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];

  }
}