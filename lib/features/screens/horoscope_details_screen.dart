import 'package:astrology_app/core/constants/app_colors.dart';
import 'package:astrology_app/features/horoscope/data/datasources/horoscope_remote_datasource.dart';
import 'package:astrology_app/features/horoscope/data/repositories/horoscope_repository.dart';
import 'package:astrology_app/features/horoscope/entities/horoscope.dart';
import 'package:astrology_app/features/widgets/horoscope_section_card.dart';
import 'package:flutter/material.dart';
import 'package:astrology_app/features/horoscope/entities/zodiac.dart';
import 'package:intl/intl.dart';

const horoscope = Horoscope(
  date: '2026-06-07',
  period: 'daily',
  sign: 'Aries',
  horoscope: 'A pleasant surprise awaits.',
);

class HoroscopeDetailsScreen extends StatelessWidget {
  const HoroscopeDetailsScreen({super.key, required this.zodiac});

  final Zodiac zodiac;

  @override
  Widget build(BuildContext context) {
    final repository = HoroscopeRepository(HoroscopeRemoteDatasource());

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

                    const SizedBox(height: 16),
                  ],
                ),
              ),

              SizedBox(height: 64),

              FutureBuilder(
                future: repository.getDailyHoroscope(zodiac.name.toLowerCase()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData) {
                    return const Text('No Horoscope Available.');
                  }

                  final horoscope = snapshot.data!;

                  final formattedDate = DateFormat(
                    'MMMM d, yyyy',
                  ).format(DateTime.parse(horoscope.date));

                  return Column(
                    children: [
                      Center(
                        child: Text(
                          formattedDate,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),

                      const SizedBox(height: 16),

                      HoroscopeSectionCard(
                        title: 'Daily Horoscope 🔮',
                        content: horoscope.horoscope,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
