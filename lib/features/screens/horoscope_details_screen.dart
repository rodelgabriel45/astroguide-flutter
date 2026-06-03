import 'package:astrology_app/core/constants/app_colors.dart';
import 'package:astrology_app/features/horoscope/entities/horoscope.dart';
import 'package:astrology_app/features/widgets/horoscope_section_card.dart';
import 'package:flutter/material.dart';
import 'package:astrology_app/features/horoscope/entities/zodiac.dart';

// final horoscope = {
//   'love': 'A pleasant surprise awaits.',
//   'career': 'Stay focused on priorities.',
//   'health': 'Drink more water.',
//   'luckyNumber': '7',
// };

const horoscope = Horoscope(
  love: 'A pleasant surprise awaits.',
  career: 'Stay focused on priorities.',
  health: 'Drink more water.',
  luckyNumber: '7',
);

class HoroscopeDetailsScreen extends StatelessWidget {
  const HoroscopeDetailsScreen({super.key, required this.zodiac});

  final Zodiac zodiac;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ),
              // Header
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(zodiac.symbol, style: TextStyle(fontSize: 20)),
                        SizedBox(width: 8),
                        Text(
                          zodiac.name,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      zodiac.dateRange,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),

                    SizedBox(height: 64),

                    const Text(
                      "Today's Horoscope",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 64),

              HoroscopeSectionCard(title: 'Love ❤️', content: horoscope.love),

              SizedBox(height: 32),

              HoroscopeSectionCard(
                title: 'Career 💼',
                content: horoscope.career,
              ),

              SizedBox(height: 32),

              HoroscopeSectionCard(
                title: 'Health 🌱',
                content: horoscope.health,
              ),

              SizedBox(height: 32),

              HoroscopeSectionCard(
                title: 'Lucky Number',
                content: horoscope.luckyNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
