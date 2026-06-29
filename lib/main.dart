import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/database/database_service.dart';

void main() async {
  // Ensure Flutter engine and binding are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize sqlite database connection and run schema updates
  try {
    debugPrint('Initializing local offline SQLite database...');
    await DatabaseService.instance.database;
    debugPrint('Local database initialized successfully.');
  } catch (e) {
    debugPrint('Fatal error initializing local database: $e');
  }

  // Run application wrapped in ProviderScope for Riverpod state management
  runApp(
    const ProviderScope(
      child: AuraGoldApp(),
    ),
  );
}
