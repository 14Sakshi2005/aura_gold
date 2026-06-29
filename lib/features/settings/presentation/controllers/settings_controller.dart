import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/settings_entity.dart';

/// State definition for Settings presentation layer
class SettingsState {
  final bool isLoading;
  final SettingsEntity? data;
  final String? errorMessage;

  const SettingsState({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  SettingsState copyWith({
    bool? isLoading,
    SettingsEntity? data,
    String? errorMessage,
  }) {
    return SettingsState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Riverpod StateNotifier managing the Settings view state
class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(const SettingsState());

  void loadData() {
    state = state.copyWith(isLoading: true);
    // Offline simulation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        data: SettingsEntity(id: 'mock_${DateTime.now().millisecondsSinceEpoch}'),
      );
    });
  }
}

/// Riverpod Provider for the SettingsNotifier
final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});
