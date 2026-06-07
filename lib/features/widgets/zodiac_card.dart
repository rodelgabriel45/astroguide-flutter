import 'package:astrology_app/core/constants/app_colors.dart';
import 'package:astrology_app/features/horoscope/entities/zodiac.dart';
import 'package:astrology_app/features/screens/horoscope_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:astrology_app/features/horoscope/data/services/favorite_sign_service.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
          child: Row(
            children: [
              Text(zodiac.symbol, style: const TextStyle(fontSize: 28)),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      zodiac.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Text(zodiac.dateRange, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),

              IconButton(
                onPressed: () async {
                  await FavoriteSignService().saveFavoriteSign(zodiac.name);

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${zodiac.name} saved as Favorite'),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.star_border, size: 20),
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
