import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final languageProvider = NotifierProvider<LanguageNotifier, String>(
  LanguageNotifier.new,
);

class LanguageNotifier extends Notifier<String> {
  static const _values = {
    'en': {
      'title': 'Language Switcher',
      'welcome': 'Welcome to our App!',
      'settings': 'Settings',
      'switch_lang': 'Switch to Khmer',
    },
    'km': {
      'title': 'កម្មវិធីប្ដូរភាសា',
      'welcome': 'សូមស្វាគមន៍មកកាន់កម្មវិធី!',
      'settings': 'ការកំណត់',
      'switch_lang': 'ប្ដូរទៅភាសាអង់គ្លេស',
    },
  };

  @override
  String build() {
    _loadFromCache(); // async: updates state after load
    return 'en';
  }

  String getText(String key) => _values[state]?[key] ?? key;

  Future<void> _loadFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString('language_code') ?? 'en';
  }

  Future<void> toggleLanguage() async {
    state = state == 'en' ? 'km' : 'en';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', state);
  }
}
