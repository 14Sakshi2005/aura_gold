import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/onboarding_entity.dart';

/// State definition for Onboarding presentation layer
class OnboardingState {
  final bool isLoading;
  final OnboardingEntity? data;
  final String? errorMessage;

  const OnboardingState({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  OnboardingState copyWith({
    bool? isLoading,
    OnboardingEntity? data,
    String? errorMessage,
  }) {
    return OnboardingState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Riverpod StateNotifier managing the Onboarding view state
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(const OnboardingState());

  void loadData() {
    state = state.copyWith(isLoading: true);
    // Offline simulation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        data: OnboardingEntity(id: 'mock_${DateTime.now().millisecondsSinceEpoch}'),
      );
    });
  }
}

/// Riverpod Provider for the OnboardingNotifier
final onboardingProvider = StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  return OnboardingNotifier();
});
