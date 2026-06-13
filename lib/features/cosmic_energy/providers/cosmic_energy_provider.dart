import 'package:astrology_app/features/cosmic_energy/entities/cosmic_energy.dart';
import 'package:astrology_app/features/cosmic_energy/repositories/cosmic_energy_repository.dart';
import 'package:flutter/material.dart';

class CosmicEnergyProvider extends ChangeNotifier {
  CosmicEnergyProvider(this.repository);

  final CosmicEnergyRepository repository;

  CosmicEnergy? _cosmicEnergy;

  CosmicEnergy? get cosmicEnergy => _cosmicEnergy;

  Future<void> loadCosmicEnergy() async {
    _cosmicEnergy = await repository.getCosmicEnergy();

    notifyListeners();
  }
}
