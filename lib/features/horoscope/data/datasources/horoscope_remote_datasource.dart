import 'dart:convert';

import 'package:astrology_app/features/horoscope/data/models/horoscope_model.dart';
import 'package:http/http.dart' as http;

class HoroscopeRemoteDatasource {
  Future<HoroscopeModel> getDailyHoroscope(String sign) async {
    final response = await http.get(
      Uri.parse(
        'https://freehoroscopeapi.com/api/v1/get-horoscope/daily?sign=$sign',
      ),
    );

    final json = jsonDecode(response.body);

    return HoroscopeModel.fromJson(json);
  }
}
