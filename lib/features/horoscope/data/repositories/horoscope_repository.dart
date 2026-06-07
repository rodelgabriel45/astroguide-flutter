import 'package:astrology_app/features/horoscope/data/datasources/horoscope_remote_datasource.dart';
import 'package:astrology_app/features/horoscope/entities/horoscope.dart';

class HoroscopeRepository {
  final HoroscopeRemoteDatasource datasource;

  HoroscopeRepository(this.datasource);

  Future<Horoscope> getDailyHoroscope(String sign) {
    return datasource.getDailyHoroscope(sign);
  }
}
