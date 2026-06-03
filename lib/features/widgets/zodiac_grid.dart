import 'package:astrology_app/core/constants/zodiac_sign.dart';
import 'package:astrology_app/features/widgets/zodiac_card.dart';
import 'package:flutter/material.dart';

class ZodiacGrid extends StatelessWidget {
  const ZodiacGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: zodiacs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        return ZodiacCard(zodiac: zodiacs[index]);
      },
    );
  }
}
