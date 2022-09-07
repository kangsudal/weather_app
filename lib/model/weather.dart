import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Weather {
  String temp; //기온 T1H
  String pty; //강수형태 코드
  String
      description; //강수형태 코드값 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)
  String backgroundImg;

  Weather(
      {required this.temp,
      required this.pty,
      required this.description,
      required this.backgroundImg});

  factory Weather.fromJson(Map<String, dynamic> json) {
    String temp = json['response']['body']['items']['item'][3]['obsrValue'];
    String pty = json['response']['body']['items']['item'][0]['obsrValue'];
    String description = '';
    String backgroundImg = '';
    switch (pty) {
      case '0':
        description = '비 없음';
        backgroundImg = 'images/Clear.jpg';
        break;
      case '1':
        description = '비';
        backgroundImg = 'images/Rain.jpg';
        break;
      case '2':
      case '6':
        description = '진눈깨비';
        backgroundImg = 'images/Sleet.jpg';
        break;
      case '3':
      case '7':
        description = '눈';
        backgroundImg = 'images/Snow.jpg';
        break;
      case '5':
        description = '빗방울';
        backgroundImg = 'images/Drizzle.jpg';
        break;
    }
    return Weather(
        temp: temp,
        pty: pty,
        description: description,
        backgroundImg: backgroundImg);
  }

  // static List<Weather> fromJsonArray(String jsonString){
  //
  // }

  @override
  String toString() {
    return 'Weather{temp: $temp, pty: $pty, description: $description, backgroundImg: $backgroundImg}';
  }
}

class Forecast {
  String? fcstTime='';
  String? fcstValue=''; //강수형태 코드값 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)
  IconData? iconData=Icons.sunny; //강수형태 코드값에따른 아이콘
  String? temp='';

  Forecast(String fcstTime, String fcstValue, IconData iconData, String temp);




  List<Forecast> fromJsonArray(Map<String, dynamic> json) {
    List<Forecast>? forecastArray = [];
    Forecast f0;
    Forecast f1;
    Forecast f2;
    Forecast f3;
    Forecast f4;

    String fcstTime;
    String fcstValue;
    IconData iconData=Icons.sunny;
    String temp;

    for (int i = 0; i < 5; i++) {
      fcstTime = json['body']['items']['item'][6+i]['fcstTime'];
      fcstValue = json['body']['items']['item'][6+i]['fcstValue'];
      switch (fcstValue) {
        case '0': //없음(0)
          iconData = BoxedIcon(WeatherIcons.cloud) as IconData;
          break;
        case '1': //비(1)
          iconData = BoxedIcon(WeatherIcons.rain) as IconData;
          break;
        case '2': //비/눈(2
          iconData = BoxedIcon(WeatherIcons.rain_mix) as IconData;
          break;
        case '3': //눈(3)
          iconData = BoxedIcon(WeatherIcons.snow) as IconData;
          break;
        case '5': //빗방울(5)
          iconData = BoxedIcon(WeatherIcons.raindrop) as IconData;
          break;
        case '6': //빗방울눈날림(6)
          iconData = BoxedIcon(WeatherIcons.rain_wind) as IconData;
          break;
        case '7': //눈날림(7)
          iconData = BoxedIcon(WeatherIcons.snow_wind) as IconData;
          break;
      }
      temp = json['body']['items']['item'][25+i]['fcstValue'];

      forecastArray[i] = Forecast(fcstTime,  fcstValue,  iconData,  temp);
    }
    return forecastArray;
  }
}
