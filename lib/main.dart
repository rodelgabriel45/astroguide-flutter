import 'package:astrology_app/core/theme/app_theme.dart';
import 'package:astrology_app/features/cosmic_energy/providers/cosmic_energy_provider.dart';
import 'package:astrology_app/features/cosmic_energy/repositories/cosmic_energy_repository.dart';
import 'package:astrology_app/features/cosmic_energy/services/cosmic_energy_service.dart';
import 'package:astrology_app/features/screens/home_screen.dart';
import 'package:astrology_app/providers/favorite_sign_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // ChangeNotifierProvider(
    //   create: (_) {
    //     final provider = FavoriteSignProvider();

    //     provider.loadFavoriteSign();

    //     return provider;
    //   },
    //   child: const MyApp(),
    // ),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final provider = FavoriteSignProvider();

            provider.loadFavoriteSign();

            return provider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => CosmicEnergyProvider(
            CosmicEnergyRepository(CosmicEnergyService()),
          )..loadCosmicEnergy(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AstroGuide",
      home: HomeScreen(),
      theme: AppTheme.darkTheme,
    );
  }
}
