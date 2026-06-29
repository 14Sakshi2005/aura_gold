import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/heavy_pipeline_entity.dart';

/// State definition for HeavyPipeline presentation layer
class HeavyPipelineState {
  final bool isLoading;
  final HeavyPipelineEntity? data;
  final String? errorMessage;

  const HeavyPipelineState({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  HeavyPipelineState copyWith({
    bool? isLoading,
    HeavyPipelineEntity? data,
    String? errorMessage,
  }) {
    return HeavyPipelineState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Riverpod StateNotifier managing the HeavyPipeline view state
class HeavyPipelineNotifier extends StateNotifier<HeavyPipelineState> {
  HeavyPipelineNotifier() : super(const HeavyPipelineState());

  void loadData() {
    state = state.copyWith(isLoading: true);
    // Offline simulation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        data: HeavyPipelineEntity(id: 'mock_${DateTime.now().millisecondsSinceEpoch}'),
      );
    });
  }
}

/// Riverpod Provider for the HeavyPipelineNotifier
final heavyPipelineProvider = StateNotifierProvider<HeavyPipelineNotifier, HeavyPipelineState>((ref) {
  return HeavyPipelineNotifier();
});
