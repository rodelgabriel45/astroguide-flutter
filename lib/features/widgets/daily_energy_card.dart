import 'package:astrology_app/core/constants/app_colors.dart';
import 'package:astrology_app/features/cosmic_energy/providers/cosmic_energy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyEnergyCard extends StatelessWidget {
  const DailyEnergyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cosmicEnergy = context.watch<CosmicEnergyProvider>().cosmicEnergy;

    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [AppColors.card, AppColors.primaryPurple],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '✨ Cosmic Vibes',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text('🌙 Moon Phase: ${cosmicEnergy?.moonPhase}'),
          SizedBox(height: 8),
          Text('🔮 Lucky Number: ${cosmicEnergy?.luckyNumber}'),
          SizedBox(height: 8),
          Text('💫 Energy Level: ${cosmicEnergy?.energyLevel}'),
          SizedBox(height: 16),
          Text('📜 Message'),
          SizedBox(height: 8),
          Text(cosmicEnergy!.dailyMessage),
        ],
      ),
    );
  }
}
