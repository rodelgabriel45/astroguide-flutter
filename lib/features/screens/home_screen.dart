import 'package:astrology_app/core/constants/app_colors.dart';
import 'package:astrology_app/features/widgets/daily_energy_card.dart';
import 'package:astrology_app/features/widgets/zodiac_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 10),

              Center(
                child: Text(
                  'AstroGuide',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: AppColors.gold,
                  ),
                ),
              ),

              SizedBox(height: 8),

              Center(child: Text('Discover Your Stars')),

              SizedBox(height: 32),

              Text(
                "Today's Cosmic Energy",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 16),

              DailyEnergyCard(),

              SizedBox(height: 32),

              Text(
                'Choose your sign',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 16),

              Expanded(child: ZodiacGrid()),
            ],
          ),
        ),
      ),
    );
  }
}
