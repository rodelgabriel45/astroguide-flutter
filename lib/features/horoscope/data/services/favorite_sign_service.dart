import 'package:shared_preferences/shared_preferences.dart';

class FavoriteSignService {
  static const _key = 'favorite_sign';

  Future<void> saveFavoriteSign(String sign) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_key, sign);
  }

  Future<void> clearFavoriteSign() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key);
  }

  Future<String?> getFavoriteSign() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_key);
  }
}
