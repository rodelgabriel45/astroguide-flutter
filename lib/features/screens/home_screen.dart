import 'package:astrology_app/core/constants/app_colors.dart';
import 'package:astrology_app/core/constants/zodiac_sign.dart';
import 'package:astrology_app/features/horoscope/data/services/favorite_sign_service.dart';
import 'package:astrology_app/features/horoscope/entities/zodiac.dart';
import 'package:astrology_app/features/widgets/daily_energy_card.dart';
import 'package:astrology_app/features/widgets/favorite_sign_card.dart';
import 'package:astrology_app/features/widgets/zodiac_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Zodiac? favoriteSign;

  @override
  Widget build(BuildContext context) {
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

              FutureBuilder<String?>(
                future: FavoriteSignService().getFavoriteSign(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }

                  final signName = snapshot.data;

                  final zodiac = zodiacs.firstWhere((z) => z.name == signName);

                  return FavoriteSignCard(zodiac: zodiac);
                },
              ),

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
