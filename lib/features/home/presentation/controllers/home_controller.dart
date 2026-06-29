import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/home_entity.dart';

/// State definition for Home presentation layer
class HomeState {
  final bool isLoading;
  final HomeEntity? data;
  final String? errorMessage;

  const HomeState({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  HomeState copyWith({
    bool? isLoading,
    HomeEntity? data,
    String? errorMessage,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Riverpod StateNotifier managing the Home view state
class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  void loadData() {
    state = state.copyWith(isLoading: true);
    // Offline simulation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        data: HomeEntity(id: 'mock_${DateTime.now().millisecondsSinceEpoch}'),
      );
    });
  }
}

/// Riverpod Provider for the HomeNotifier
final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
