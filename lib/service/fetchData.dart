import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

void fetchData() async {
  // 기상청_단기예보
  // https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15084084
  // 최근 1일 간의 자료만 제공

  DateTime now = DateTime.now();
  String today = DateFormat('yyyyMMdd').format(now);
  String hour;
  if(now.minute<40){
    //base_time이 매시각 40분 이후 호출되서, 14:24분이면 hour은 13이되어야한다.
    final anHourAgo = now.subtract(new Duration(minutes: Duration.minutesPerHour));
    hour = DateFormat('HH').format(anHourAgo);

    //만약 20220901 00:39분이라면? today는 20220831, hour은 23이 되어야한다.
    today = DateFormat('yyyyMMdd').format(anHourAgo);
  }else{
    hour = DateFormat('HH').format(now);
  }
  // print('$today,$hour');
  var url = Uri.https(
    'apis.data.go.kr',
    '/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst',
    {
      'serviceKey':
          dotenv.env['APIKEY'],
      'pageNo': '1',
      'numOfRows': '1000',
      'dataType': 'json', //요청자료형식
      'base_date': '$today',//'20220831', //2x년 x월 xx일 발표
      'base_time': '${hour}00',//'0000', //xx시 발표
      'nx': '61', //예보지점의 x 좌표값
      'ny': '127', //예보지점의 y 좌표값
    },
  );
  // print(url);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var items = jsonResponse['response']['body']['items'];
    List itemArray = items['item'];
    // print(itemArray);
    Map<String, dynamic> map = {};
    for (var item in itemArray){
      String category = item["category"];
      // print(category);
      String obsrValue = item["obsrValue"];
      // print(obsrValue);
      map[category]=obsrValue;
    }
    // print(map);
    CurrentWeather weather = CurrentWeather.fromJson(map);
    print(weather.toString());
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
