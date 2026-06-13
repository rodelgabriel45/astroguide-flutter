import 'dart:math';

import 'package:astrology_app/features/cosmic_energy/entities/cosmic_energy.dart';
import 'package:astrology_app/core/constants/cosmic_energy_data.dart';
import 'package:astrology_app/features/cosmic_energy/services/cosmic_energy_service.dart';

class CosmicEnergyRepository {
  final CosmicEnergyService service;
  CosmicEnergyRepository(this.service);

  Future<CosmicEnergy> getCosmicEnergy() async {
    final today = DateTime.now().toIso8601String().split('T').first;

    final cached = await service.loadCosmicEnergy();

    if (cached != null && cached['date'] == today) {
      return CosmicEnergy(
        moonPhase: cached['moonPhase'],
        luckyNumber: cached['luckyNumber'],
        energyLevel: cached['energyLevel'],
        dailyMessage: cached['dailyMessage'],
      );
    }

    final random = Random();

    final moonPhase = moonPhases[random.nextInt(moonPhases.length)];

    final luckyNumber = random.nextInt(99) + 1;

    final energyLevel = energyLevels[random.nextInt(energyLevels.length)];

    final dailyMessage = dailyMessages[random.nextInt(dailyMessages.length)];

    await service.saveCosmicEnergy(
      date: today,
      moonPhase: moonPhase,
      luckyNumber: luckyNumber,
      energyLevel: energyLevel,
      dailyMessage: dailyMessage,
    );

    return CosmicEnergy(
      moonPhase: moonPhase,
      luckyNumber: luckyNumber,
      energyLevel: energyLevel,
      dailyMessage: dailyMessage,
    );
  }
}
