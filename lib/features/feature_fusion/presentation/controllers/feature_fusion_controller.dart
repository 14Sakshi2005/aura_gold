import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/feature_fusion_entity.dart';

/// State definition for FeatureFusion presentation layer
class FeatureFusionState {
  final bool isLoading;
  final FeatureFusionEntity? data;
  final String? errorMessage;

  const FeatureFusionState({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  FeatureFusionState copyWith({
    bool? isLoading,
    FeatureFusionEntity? data,
    String? errorMessage,
  }) {
    return FeatureFusionState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Riverpod StateNotifier managing the FeatureFusion view state
class FeatureFusionNotifier extends StateNotifier<FeatureFusionState> {
  FeatureFusionNotifier() : super(const FeatureFusionState());

  void loadData() {
    state = state.copyWith(isLoading: true);
    // Offline simulation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        data: FeatureFusionEntity(id: 'mock_${DateTime.now().millisecondsSinceEpoch}'),
      );
    });
  }
}

/// Riverpod Provider for the FeatureFusionNotifier
final featureFusionProvider = StateNotifierProvider<FeatureFusionNotifier, FeatureFusionState>((ref) {
  return FeatureFusionNotifier();
});
