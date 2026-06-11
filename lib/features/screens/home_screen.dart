import 'package:astrology_app/core/constants/app_colors.dart';
import 'package:astrology_app/features/widgets/daily_energy_card.dart';
import 'package:astrology_app/features/widgets/favorite_sign_card.dart';
import 'package:astrology_app/features/widgets/zodiac_grid.dart';
import 'package:astrology_app/providers/favorite_sign_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteSign = context.watch<FavoriteSignProvider>().favoriteSign;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              const SizedBox(height: 8),

              Center(child: Text('Discover Your Stars')),

              const SizedBox(height: 32),

              Text(
                "Today's Cosmic Energy",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 16),

              DailyEnergyCard(),

              if (favoriteSign != null) ...[
                const SizedBox(height: 24),

                FavoriteSignCard(zodiac: favoriteSign),
              ],

              const SizedBox(height: 32),

              Text(
                'Choose your sign',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 16),

              Expanded(child: ZodiacGrid()),
            ],
          ),
        ),
      ),
    );
  }
}
