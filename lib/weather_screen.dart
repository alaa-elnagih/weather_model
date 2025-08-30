import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled10/models/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel? weatherModel;
bool isloading=true;

  Dio dio=Dio();
  @override
  void initState(){
    super.initState();
    getData();
  }

    getData() async {
      Response response=await dio.get("http://api.weatherapi.com/v1/forecast.json?key=8266d45416264d84a4b155455253008&q=sohag&days=1&aqi=no&alerts=no");
setState(() {
        weatherModel=WeatherModel.fromJson(response.data);
        isloading=false;
      });
print(weatherModel?.image);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body:isloading? Center(child: CircularProgressIndicator ()) :Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weatherModel?.nameCity}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              '${weatherModel?.lastDate}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "${weatherModel!.image}",
                  height: 100,
                ),
                Text(
                  '${weatherModel?.temp}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '${weatherModel!.maxTemp}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${weatherModel!.minTemp}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              '${weatherModel!.weatherCondition}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

