import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';

void fetchData() async {
  // 기상청_단기예보
  // https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15084084
  // 최근 1일 간의 자료만 제공

  var url = Uri.https(
    'apis.data.go.kr',
    '/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst',
    {
      'serviceKey':
          'H8gQIzFIaK7T2MX/TrcejjxsqtuRiY1vKQKqBFMHbQ0lKNx2WSjOCkswlWyhtS8kc3B6/zBJgVWkJals8Bt+oA==',
      'pageNo': '1',
      'numOfRows': '1000',
      'dataType': 'json', //요청자료형식
      'base_date': '20220831', //2x년 x월 xx일 발표
      'base_time': '0000', //21시 발표
      'nx': '61', //예보지점의 x 좌표값
      'ny': '127', //예보지점의 y 좌표값
    },
  );

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
    print(map);
    Weather weather = Weather.fromJson(map);
    print(weather.toString());
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
