import 'package:astrology_app/features/horoscope/entities/zodiac.dart';
import 'package:flutter/material.dart';

class FavoriteSignCard extends StatelessWidget {
  const FavoriteSignCard({super.key, this.zodiac});
  final Zodiac? zodiac;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    '⭐ Favorite Sign',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 16),

                  if (zodiac == null)
                    Row(
                      children: [
                        Icon(Icons.star_border, size: 18),
                        const SizedBox(width: 8),
                        Text('There is no favorite sign yet'),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Text(zodiac!.symbol),
                        const SizedBox(width: 8),
                        Text(zodiac!.name),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
