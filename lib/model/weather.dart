class Weather {
  String temp; //기온 T1H
  String pty; //강수형태 코드
  String description; //강수형태 코드값 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4)
  String backgroundImg;

  Weather({required this.temp, required this.pty, required this.description, required this.backgroundImg});

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
        description = '진눈깨비';
        backgroundImg = 'images/Sleet.jpg';
        break;
      case '3':
        description = '눈';
        backgroundImg = 'images/Snow.jpg';
        break;
      case '4':
        description = '소나기';
        backgroundImg = 'images/Shower.jpg';
        break;
    }
    return Weather(temp: temp, pty: pty, description: description, backgroundImg: backgroundImg);
  }

  @override
  String toString() {
    return 'Weather{temp: $temp, pty: $pty, description: $description, backgroundImg: $backgroundImg}';
  }
}
