import 'package:intl/intl.dart';

Map<String, dynamic> getBaseDateAndTime() {
  DateTime now = DateTime.now();
  String base_date = DateFormat('yyyyMMdd').format(now);
  String base_time;

  //base_time
  //15:00이면 1430 가능
  //15:29이면 1430 가능
  //15:30이면 1500 가능
  //15:45이면 1530 가능

  //23:00이면 2230 가능
  //23:29이면 2230 가능
  //23:30이면 2300 가능
  //23:45이면 2330 가능

  //24:00이면 2330 가능?
  //24:29이면 2330 가능?
  //24:30이면 2400 가능?
  //24:45이면 2430 가능?

  //https://min-wachya.tistory.com/163
  String result = '';
  //45분 전이면
  if (now.minute < 45) {
    //0시면 2330
    if (now.hour == 0) {
      result = '2330';
    }
    //아니면 1시간 전 날씨 정보 부르기
    else {
      int resultH = now.hour - 1;
      //1자리면 0 붙여서 2자리로 만들기
      if (resultH < 10) {
        result = '0${resultH}30';
      }
      //2자리면 그대로
      else {
        result = '${resultH}30';
      }
    }
  }
  //45분 이후면 바로 정보 받아오기
  else {
    result = '${now.hour}30';
  }

  base_time = result;
  //현재 시각이 00시고 45분 이하여서 baseTime이 2330이면 어제정보 받아오기(오늘의 23시가아닌)
  //만약 20220901 00:44분이라면? baseTime는 20220831이 되어야한다.
  if (result == '00' && base_time == '2330') {
    final anHourAgo =
        now.subtract(new Duration(minutes: Duration.minutesPerHour));
    base_date = DateFormat('yyyyMMdd').format(anHourAgo);
  }

  return {'base_date': base_date, 'base_time': base_time};
}
