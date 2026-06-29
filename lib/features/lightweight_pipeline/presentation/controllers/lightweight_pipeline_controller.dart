import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/lightweight_pipeline_entity.dart';

/// State definition for LightweightPipeline presentation layer
class LightweightPipelineState {
  final bool isLoading;
  final LightweightPipelineEntity? data;
  final String? errorMessage;

  const LightweightPipelineState({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  LightweightPipelineState copyWith({
    bool? isLoading,
    LightweightPipelineEntity? data,
    String? errorMessage,
  }) {
    return LightweightPipelineState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Riverpod StateNotifier managing the LightweightPipeline view state
class LightweightPipelineNotifier extends StateNotifier<LightweightPipelineState> {
  LightweightPipelineNotifier() : super(const LightweightPipelineState());

  void loadData() {
    state = state.copyWith(isLoading: true);
    // Offline simulation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      state = state.copyWith(
        isLoading: false,
        data: LightweightPipelineEntity(id: 'mock_${DateTime.now().millisecondsSinceEpoch}'),
      );
    });
  }
}

/// Riverpod Provider for the LightweightPipelineNotifier
final lightweightPipelineProvider = StateNotifierProvider<LightweightPipelineNotifier, LightweightPipelineState>((ref) {
  return LightweightPipelineNotifier();
});
