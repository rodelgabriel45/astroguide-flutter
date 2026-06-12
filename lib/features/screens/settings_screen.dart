import 'package:astrology_app/providers/favorite_sign_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:astrology_app/features/widgets/favorite_sign_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteSign = context.watch<FavoriteSignProvider>().favoriteSign;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(alignment: Alignment.topLeft, child: BackButton()),

              const Text(
                'Settings',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 24),

              FavoriteSignCard(zodiac: favoriteSign),

              const SizedBox(height: 24),

              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Clear Favorite Sign'),
                onTap: () async {
                  final shouldClear = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Clear Favorite Sign'),
                        content: const Text(
                          'Are you sure you want to remove your favorite sign?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: const Text('Clear'),
                          ),
                        ],
                      );
                    },
                  );

                  if (shouldClear == true) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Favorite Sign Cleared')),
                      );

                      await context
                          .read<FavoriteSignProvider>()
                          .deleteFavoriteSign();
                    }
                  }
                },
              ),

              const SizedBox(height: 32),

              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Column(
                    children: const [
                      Text(
                        'ℹ About AstroGuide',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'AstroGuide is about making your daily horoscope accessible to you in just a few taps.',
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              const Text(
                'AstroGuide',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 4),

              const Text(
                'version 1.0.0',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
