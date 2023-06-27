import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'city.dart';

// data : https://worldweather.wmo.int/en/json/234_en.json

// refer
// https://letyarch.blogspot.com/2019/09/flutter10.html
// https://velog.io/@513sojin/Flutter-API-KEY%EA%B0%80-%EC%9E%88%EB%8A%94-json%ED%8C%8C%EC%8B%B1
// https://codewithandrea.com/articles/parse-json-dart/
class JsonManager extends StatelessWidget {
  final String url = 'https://worldweather.wmo.int/en/json/234_en.json';

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  void onPressedFunction() async {
    dynamic data = await getData();
    City city = City.fromJson(data);
    print(city.cityName);
    print(city.forecast?.forecastDay?[0].forecastDate);
    print(city.climate?.climateMonth?[0].maxTemp);
    print(city.climate?.climateMonth?[0].meanTemp);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressedFunction, child: Text('get data button'));
  }
}
