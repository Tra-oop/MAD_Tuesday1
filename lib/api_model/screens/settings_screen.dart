import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:num_rean_flutter/api_model/providers/color_provider.dart';

import '../providers/theme_provider.dart';
import '../providers/language_provider.dart'; // Import language provider

final List<Color> colorList = [
  Colors.yellow,
  Colors.orange,
  Colors.deepOrange,
  Colors.red,
  Colors.pink,
  Colors.lightBlue,
  Colors.blue,
  Colors.lime,
  Colors.lightGreen,
  Colors.green,
  Colors.purple,
  Colors.deepPurple,
];

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeNotifierProvider);
    final currentLang = ref.watch(
      languageProvider,
    ); // Watch ភាសាបច្ចុប្បន្ន ('en' ឬ 'km')
    final langNotifier = ref.read(languageProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(langNotifier.getText('title')),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView(
        children: [
          // 1. Language Switching Card (ថែមថ្មីសម្រាប់ Assignment នេះ)
          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(
                currentLang == 'en' ? 'Language / ភាសា' : 'ភាសា / Language',
              ),
              subtitle: Text(
                currentLang == 'en'
                    ? 'English (ភាសាអង់គ្លេស)'
                    : 'ភាសាខ្មែរ (Khmer)',
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  ref.read(languageProvider.notifier).toggleLanguage();
                },
                child: Text(currentLang == 'en' ? 'ខ្មែរ' : 'English'),
              ),
            ),
          ),

          // 2. Dark Mode Switch Card
          Card(
            child: SwitchListTile(
              title: const Text("Dark Mode"),
              subtitle: Text("Currently in ${isDark ? "dark" : "light"} mode"),
              value: isDark,
              onChanged: (value) {
                ref.read(themeNotifierProvider.notifier).toggleDark();
              },
            ),
          ),

          // 3. Color GridView Card
          Card(child: _buildColorGridView(context, ref, colorList)),
        ],
      ),
    );
  }

  Widget _buildColorGridView(
    BuildContext context,
    WidgetRef ref,
    List<Color> items,
  ) {
    final selectedIndex = ref.watch(colorNotifierProvider);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            ref.read(colorNotifierProvider.notifier).setColor(index);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(color: items[index]),
              ),
              if (selectedIndex == index)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(width: 30, height: 30, color: Colors.white),
                ),
            ],
          ),
        );
      },
    );
  }
}
