class CurrentWeather {
  String T1H;//기온
  String RN1;//1시간 강수량
  String UUU;//동서바람성분
  String VVV;//남북바람성분
  String REH;//습도
  String PTY;//강수형태
  String VEC;//풍향
  String WSD;//풍속

  CurrentWeather({
    required this.T1H,
    required this.RN1,
    required this.UUU,
    required this.VVV,
    required this.REH,
    required this.PTY,
    required this.VEC,
    required this.WSD,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      T1H: json['T1H'],
      RN1: json['RN1'],
      UUU: json['UUU'],
      VVV: json['VVV'],
      REH: json['REH'],
      PTY: json['PTY'],
      VEC: json['VEC'],
      WSD: json['WSD'],
    );
  }

  @override
  String toString() {
    return 'Weather{T1H: $T1H, RN1: $RN1, UUU: $UUU, VVV: $VVV, REH: $REH, PTY: $PTY, VEC: $VEC, WSD: $WSD}';
  }
}
class ForecastWeather {
  String T1H; //기온
  String RN1; //1시간 강수량
  String SKY; //하늘상태
  String UUU; //동서바람성분
  String VVV; //남북바람성분
  String REH; //습도
  String LGT; //낙뢰
  String PTY; //강수형태
  String VEC; //풍향
  String WSD; //풍속

  ForecastWeather({
    required this.T1H,
    required this.RN1,
    required this.SKY,
    required this.UUU,
    required this.VVV,
    required this.REH,
    required this.LGT,
    required this.PTY,
    required this.VEC,
    required this.WSD,
  });

  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    return ForecastWeather(
      T1H: json['T1H'],
      RN1: json['RN1'],
      SKY: json['SKY'],
      UUU: json['UUU'],
      VVV: json['VVV'],
      REH: json['REH'],
      LGT: json['LGT'],
      PTY: json['PTY'],
      VEC: json['VEC'],
      WSD: json['WSD'],
    );
  }

  @override
  String toString() {
    return 'Weather{T1H: $T1H, RN1: $RN1, SKY: $SKY, UUU: $UUU, VVV: $VVV, REH: $REH,LGT:$LGT, PTY: $PTY, VEC: $VEC, WSD: $WSD}';
  }
}
