import 'package:astrology_app/core/constants/zodiac_sign.dart';
import 'package:astrology_app/features/horoscope/data/services/favorite_sign_service.dart';
import 'package:astrology_app/features/horoscope/entities/zodiac.dart';
import 'package:flutter/material.dart';

class FavoriteSignProvider extends ChangeNotifier {
  Zodiac? _favoriteSign;

  Zodiac? get favoriteSign => _favoriteSign;

  Future<void> loadFavoriteSign() async {
    final signName = await FavoriteSignService().getFavoriteSign();

    if (signName == null) return;

    _favoriteSign = zodiacs.firstWhere((z) => z.name == signName);

    notifyListeners();
  }

  Future<void> deleteFavoriteSign() async {
    await FavoriteSignService().clearFavoriteSign();

    _favoriteSign = null;

    notifyListeners();
  }

  void setFavoriteSign(Zodiac zodiac) {
    _favoriteSign = zodiac;

    notifyListeners();
  }
}
