import 'package:astrology_app/features/horoscope/entities/horoscope.dart';

class HoroscopeModel extends Horoscope {
  HoroscopeModel({
    required super.date,
    required super.period,
    required super.sign,
    required super.horoscope,
  });

  factory HoroscopeModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return HoroscopeModel(
      date: data['date'],
      period: data['period'],
      sign: data['sign'],
      horoscope: data['horoscope'],
    );
  }
}
