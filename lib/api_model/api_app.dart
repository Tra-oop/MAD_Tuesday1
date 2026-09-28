import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:num_rean_flutter/api_model/providers/color_provider.dart';

import 'screens/settings_screen.dart';
import 'providers/theme_provider.dart';
import 'providers/language_provider.dart';
import 'screens/main_screen.dart';

class ApiApp extends ConsumerWidget {
  const ApiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool dark = ref.watch(themeNotifierProvider);

    final index = ref.watch(colorNotifierProvider);
    final seedColor = colorList[index];

    // 2. Watch Language Provider (បើត្រូវការប្រើ Locale)
    final currentLang = ref.watch(languageProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      locale: Locale(currentLang), // កំណត់ Locale តាម State
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: (_) => MainScreen());
          case "/settings":
            return MaterialPageRoute(builder: (_) => SettingsScreen());
          default:
            return MaterialPageRoute(
              builder: (_) => const Center(child: Text("No Page Found")),
            );
        }
      },
    );
  }
}
