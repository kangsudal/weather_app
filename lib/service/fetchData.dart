import 'dart:convert' as convert;

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/service/get_base_date_time.dart';
import 'package:weather_app/service/get_xy.dart';

void fetchData() async {
  // 기상청_단기예보
  // https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15084084

  //현재 시간 가져오기
  Map<String,dynamic> baseDateAndTime = getBaseDateAndTime();
  String base_date = baseDateAndTime['base_date'];
  String base_time = baseDateAndTime['base_time'];

  //현재 위치를 기반으로 그리드값(nx,ny) 가져오기
  Position position = await getCurrentPosition();
  var position2 = getXY(position.latitude, position.longitude);
  String x = position2['x'].toString();
  String y = position2['y'].toString();

  var url = Uri.https(
    'apis.data.go.kr',
    '/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst',
    {
      'serviceKey':
          dotenv.env['APIKEY'],
      'pageNo': '1',
      'numOfRows': '1000',
      'dataType': 'json', //요청자료형식
      'base_date': '${base_date}',//'20220831', //2x년 x월 xx일 발표
      'base_time': '${base_time}',
      'nx': x, //예보지점의 x 좌표값
      'ny': y, //예보지점의 y 좌표값
    },
  );
  print(url);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body);
    var items = jsonResponse['response']['body']['items'];
    List itemArray = items['item'];
    // print(itemArray);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}




