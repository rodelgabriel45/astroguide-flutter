import 'package:shared_preferences/shared_preferences.dart';

class CosmicEnergyService {
  static const _dateKey = 'cosmic_energy_date';
  static const _moonPhaseKey = 'moon_phase';
  static const _luckyNumberKey = 'lucky_number';
  static const _energyLevelKey = 'energy_level';
  static const _dailyMessageKey = 'daily_message';

  Future<void> saveCosmicEnergy({
    required String date,
    required String moonPhase,
    required int luckyNumber,
    required String energyLevel,
    required String dailyMessage,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_dateKey, date);
    await prefs.setString(_moonPhaseKey, moonPhase);
    await prefs.setInt(_luckyNumberKey, luckyNumber);
    await prefs.setString(_energyLevelKey, energyLevel);
    await prefs.setString(_dailyMessageKey, dailyMessage);
  }

  Future<Map<String, dynamic>?> loadCosmicEnergy() async {
    final prefs = await SharedPreferences.getInstance();

    final date = prefs.getString(_dateKey);

    if (date == null) {
      return null;
    }

    return {
      'date': date,
      'moonPhase': prefs.getString(_moonPhaseKey),
      'luckyNumber': prefs.getInt(_luckyNumberKey),
      'energyLevel': prefs.getString(_energyLevelKey),
      'dailyMessage': prefs.getString(_dailyMessageKey),
    };
  }

  Future<SharedPreferences> get prefs async => SharedPreferences.getInstance();
}
