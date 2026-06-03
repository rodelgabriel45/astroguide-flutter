import 'package:astrology_app/core/constants/app_colors.dart';
import 'package:astrology_app/features/horoscope/entities/zodiac.dart';
import 'package:astrology_app/features/screens/horoscope_details_screen.dart';
import 'package:flutter/material.dart';

class ZodiacCard extends StatelessWidget {
  const ZodiacCard({super.key, required this.zodiac});
  final Zodiac zodiac;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text(zodiac.symbol, style: const TextStyle(fontSize: 28)),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  children: [
                    Text(
                      zodiac.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(zodiac.dateRange, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HoroscopeDetailsScreen(zodiac: zodiac),
            ),
          );
        },
      ),
    );
  }
}
