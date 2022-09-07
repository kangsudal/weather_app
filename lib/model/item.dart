// https://www.youtube.com/watch?v=WCPnJrDhCdI&t=170s
import 'package:flutter/material.dart';

class Item {
  String baseDate;
  String baseTime;
  String category;
  String fcstDate;
  String fcstTime;
  String fcstValue;
  int nx;
  int ny;

  Item(
      {required this.baseDate,
      required this.baseTime,
      required this.category,
      required this.fcstDate,
      required this.fcstTime,
      required this.fcstValue,
      required this.nx,
      required this.ny});

  factory Item.fromJson({required Map<String, dynamic> json}) {
    return Item(
      baseDate: json['baseDate'] as String,
      baseTime: json['baseTime'] as String,
      category: json['category'] as String,
      fcstDate: json['fcstDate'] as String,
      fcstTime: json['fcstTime'] as String,
      fcstValue: json['fcstValue'] as String,
      nx: json['nx'] as int,
      ny: json['ny'] as int,
    );
  }

  @override
  String toString() {
    return 'Item{baseDate: $baseDate, baseTime: $baseTime, category: $category, fcstDate: $fcstDate, fcstTime: $fcstTime, fcstValue: $fcstValue, nx: $nx, ny: $ny}';
  }
}
