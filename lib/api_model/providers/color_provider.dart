import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorNotifier extends StateNotifier<int> {
  ColorNotifier() : super(0);

  void setColor(int index) {
    state = index;
  }
}

final colorNotifierProvider = StateNotifierProvider<ColorNotifier, int>((ref) {
  return ColorNotifier();
});
