import 'package:flutter/material.dart';
class WeatherModel{

   String? nameCity;
   String? lastDate;
   double? temp;
   double? maxTemp;
   double? minTemp;
   String? weatherCondition;
   String? image;

   WeatherModel({required this.nameCity, required this.lastDate, required this.temp ,required this.maxTemp, required this.minTemp ,required this.weatherCondition, required this.image });

   factory WeatherModel.fromJson(json) {
     return WeatherModel(
       nameCity: json["location"]["name"],
       lastDate: json["location"]["localtime"],
       temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
       maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
       minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
       weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
       image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
     );
   }

}


