import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:num_rean_flutter/api_model/api_app.dart';

void main() {
  runApp(const ProviderScope(child: ApiApp()));
}
