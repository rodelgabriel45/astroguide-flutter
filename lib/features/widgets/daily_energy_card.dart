import 'package:flutter/material.dart';

class DailyEnergyCard extends StatelessWidget {
  const DailyEnergyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF6A5AE0), Color(0xFF8E7BFF)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '✨ Cosmic Vibes',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text('🌙 Moon Phase: Waxing Crescent'),
          SizedBox(height: 8),
          Text('🔮 Lucky Number: 7'),
          SizedBox(height: 8),
          Text('💫 Energy Level: Positive'),
        ],
      ),
    );
  }
}
